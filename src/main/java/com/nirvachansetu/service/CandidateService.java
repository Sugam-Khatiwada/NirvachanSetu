package com.nirvachansetu.service;

import com.nirvachansetu.dao.CandidateApplicationDAO;
import com.nirvachansetu.dao.CandidateDAO;
import com.nirvachansetu.dao.ElectionDAO;
import com.nirvachansetu.dao.UserDAO;
import com.nirvachansetu.model.Candidate;
import com.nirvachansetu.model.CandidateApplication;
import com.nirvachansetu.model.Election;
import com.nirvachansetu.model.User;

import java.util.List;

/**
 * Service class for Candidate and CandidateApplication-related business operations.
 */
public class CandidateService {

    private final CandidateApplicationDAO applicationDAO;
    private final CandidateDAO candidateDAO;
    private final ElectionDAO electionDAO;
    private final UserDAO userDAO;

    public CandidateService() {
        this.applicationDAO = new CandidateApplicationDAO();
        this.candidateDAO = new CandidateDAO();
        this.electionDAO = new ElectionDAO();
        this.userDAO = new UserDAO();
    }

    /**
     * Submits a new candidate application for an election.
     * Checks for duplicate applications and verifies the user is approved.
     *
     * @param application the candidate application to submit
     * @return the saved application
     * @throws RuntimeException if the user has already applied or is not eligible
     */
    public CandidateApplication applyForElection(CandidateApplication application) {
        try {
            // Check if user already has an application for this election
            CandidateApplication existing = applicationDAO.findByUserAndElection(
                    application.getUser().getId(), application.getElection().getId());
            if (existing != null) {
                throw new RuntimeException("You have already submitted an application for this election.");
            }

            // Verify user status is APPROVED
            User user = userDAO.findById(application.getUser().getId());
            if (user == null || user.getStatus() != User.UserStatus.APPROVED) {
                throw new RuntimeException("Only approved users can apply as candidates.");
            }

            // Verify election is in REGISTRATION status
            Election election = electionDAO.findById(application.getElection().getId());
            if (election == null || election.getStatus() != Election.ElectionStatus.REGISTRATION) {
                throw new RuntimeException("Applications are only accepted during the registration period.");
            }

            application.setStatus(CandidateApplication.ApplicationStatus.PENDING);
            return applicationDAO.save(application);
        } finally {
            applicationDAO.close();
            candidateDAO.close();
            electionDAO.close();
            userDAO.close();
        }
    }

    /**
     * Approves a candidate application and creates a Candidate record.
     *
     * @param applicationId the application ID to approve
     * @return the created Candidate
     * @throws RuntimeException if application not found or already processed
     */
    public Candidate approveApplication(Integer applicationId) {
        try {
            CandidateApplication application = applicationDAO.findById(applicationId);
            if (application == null) {
                throw new RuntimeException("Application not found.");
            }
            if (application.getStatus() != CandidateApplication.ApplicationStatus.PENDING) {
                throw new RuntimeException("This application has already been processed.");
            }

            // Update application status
            application.setStatus(CandidateApplication.ApplicationStatus.APPROVED);
            applicationDAO.update(application);

            // Create Candidate record
            Candidate candidate = new Candidate();
            candidate.setUser(application.getUser());
            candidate.setApplication(application);
            candidate.setElection(application.getElection());
            candidate.setConstituency(application.getConstituency());
            candidate.setPartyName(application.getPartyName());
            candidate.setPartyType(application.getPartyType());
            candidate.setManifesto(application.getManifesto());
            candidate.setSymbol(application.getSymbol());
            candidate.setTotalVotes(0);
            candidate.setStatus(Candidate.CandidateStatus.ACTIVE);

            Candidate savedCandidate = candidateDAO.save(candidate);

            // Update user role to CANDIDATE
            User user = userDAO.findById(application.getUser().getId());
            if (user != null) {
                user.setRole(User.Role.CANDIDATE);
                userDAO.update(user);
            }

            return savedCandidate;
        } finally {
            applicationDAO.close();
            candidateDAO.close();
            electionDAO.close();
            userDAO.close();
        }
    }

    /**
     * Rejects a candidate application.
     *
     * @param applicationId the application ID to reject
     * @return the updated application
     * @throws RuntimeException if application not found or already processed
     */
    public CandidateApplication rejectApplication(Integer applicationId) {
        try {
            CandidateApplication application = applicationDAO.findById(applicationId);
            if (application == null) {
                throw new RuntimeException("Application not found.");
            }
            if (application.getStatus() != CandidateApplication.ApplicationStatus.PENDING) {
                throw new RuntimeException("This application has already been processed.");
            }

            application.setStatus(CandidateApplication.ApplicationStatus.REJECTED);
            return applicationDAO.update(application);
        } finally {
            applicationDAO.close();
            candidateDAO.close();
        }
    }

    /**
     * Finds all candidates for a specific election.
     *
     * @param electionId the election ID
     * @return a list of candidates in the election
     */
    public List<Candidate> findByElection(Integer electionId) {
        try {
            return candidateDAO.findByElection(electionId);
        } finally {
            candidateDAO.close();
        }
    }

    /**
     * Finds all candidates in a specific constituency.
     *
     * @param constituencyId the constituency ID
     * @return a list of candidates in the constituency
     */
    public List<Candidate> findByConstituency(Integer constituencyId) {
        try {
            return candidateDAO.findByConstituency(constituencyId);
        } finally {
            candidateDAO.close();
        }
    }

    /**
     * Finds the candidate record for a specific user.
     *
     * @param userId the user ID
     * @return the Candidate, or null if not found
     */
    public Candidate findByUser(Integer userId) {
        try {
            return candidateDAO.findByUser(userId);
        } finally {
            candidateDAO.close();
        }
    }

    /**
     * Gets all candidates competing in a specific election and constituency.
     *
     * @param electionId     the election ID
     * @param constituencyId the constituency ID
     * @return a list of competing candidates
     */
    public List<Candidate> getCompetingCandidates(Integer electionId, Integer constituencyId) {
        try {
            return candidateDAO.findByElectionAndConstituency(electionId, constituencyId);
        } finally {
            candidateDAO.close();
        }
    }

    /**
     * Updates the manifesto of a candidate.
     *
     * @param candidateId the candidate ID
     * @param manifesto   the new manifesto text
     * @return the updated candidate, or null if not found
     */
    public Candidate updateManifesto(Integer candidateId, String manifesto) {
        try {
            Candidate candidate = candidateDAO.findById(candidateId);
            if (candidate != null) {
                candidate.setManifesto(manifesto);
                return candidateDAO.update(candidate);
            }
            return null;
        } finally {
            candidateDAO.close();
        }
    }

    /**
     * Returns all pending candidate applications.
     *
     * @return a list of pending applications
     */
    public List<CandidateApplication> getPendingApplications() {
        try {
            return applicationDAO.findByStatus(CandidateApplication.ApplicationStatus.PENDING.name());
        } finally {
            applicationDAO.close();
        }
    }

    /**
     * Returns all applications for a specific user.
     *
     * @param userId the user ID
     * @return a list of applications by the user
     */
    public List<CandidateApplication> getApplicationsByUser(Integer userId) {
        try {
            return applicationDAO.findByUser(userId);
        } finally {
            applicationDAO.close();
        }
    }

    /**
     * Returns all applications for a specific election.
     *
     * @param electionId the election ID
     * @return a list of applications for the election
     */
    public List<CandidateApplication> getApplicationsByElection(Integer electionId) {
        try {
            return applicationDAO.findByElection(electionId);
        } finally {
            applicationDAO.close();
        }
    }

    /**
     * Withdraws a candidate from an election.
     *
     * @param candidateId the candidate ID
     * @return the updated candidate
     */
    public Candidate withdrawCandidate(Integer candidateId) {
        try {
            Candidate candidate = candidateDAO.findById(candidateId);
            if (candidate != null) {
                candidate.setStatus(Candidate.CandidateStatus.WITHDRAWN);

                // Also update the application status
                CandidateApplication application = applicationDAO.findById(candidate.getApplication().getId());
                if (application != null) {
                    application.setStatus(CandidateApplication.ApplicationStatus.WITHDRAWN);
                    applicationDAO.update(application);
                }

                return candidateDAO.update(candidate);
            }
            return null;
        } finally {
            applicationDAO.close();
            candidateDAO.close();
        }
    }

    /**
     * Disqualifies a candidate from an election.
     *
     * @param candidateId the candidate ID
     * @return the updated candidate
     */
    public Candidate disqualifyCandidate(Integer candidateId) {
        try {
            Candidate candidate = candidateDAO.findById(candidateId);
            if (candidate != null) {
                candidate.setStatus(Candidate.CandidateStatus.DISQUALIFIED);
                return candidateDAO.update(candidate);
            }
            return null;
        } finally {
            candidateDAO.close();
        }
    }

    /**
     * Counts the number of candidates in a specific election.
     *
     * @param electionId the election ID
     * @return the count of candidates
     */
    public long countByElection(Integer electionId) {
        try {
            return candidateDAO.countByElection(electionId);
        } finally {
            candidateDAO.close();
        }
    }

    /**
     * Returns the total count of all candidates.
     *
     * @return the total number of candidates
     */
    public long countAllCandidates() {
        try {
            return candidateDAO.count();
        } finally {
            candidateDAO.close();
        }
    }

    /**
     * Reverts all active candidates of a specific election back to VOTER role.
     * Called when an election status changes to ACTIVE (voting starts).
     * The Candidate record is preserved (for vote tracking), only the User role changes.
     *
     * @param electionId the election ID
     */
    public void revertCandidatesToVoters(Integer electionId) {
        try {
            List<Candidate> candidates = candidateDAO.findActiveByElection(electionId);
            for (Candidate candidate : candidates) {
                User user = userDAO.findById(candidate.getUser().getId());
                if (user != null && user.getRole() == User.Role.CANDIDATE) {
                    user.setRole(User.Role.VOTER);
                    userDAO.update(user);
                }
            }
        } finally {
            candidateDAO.close();
            userDAO.close();
        }
    }
}
