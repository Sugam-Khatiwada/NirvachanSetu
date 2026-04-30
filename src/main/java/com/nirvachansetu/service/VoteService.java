package com.nirvachansetu.service;

import com.nirvachansetu.dao.CandidateDAO;
import com.nirvachansetu.dao.ElectionDAO;
import com.nirvachansetu.dao.VoteDAO;
import com.nirvachansetu.model.Candidate;
import com.nirvachansetu.model.Election;
import com.nirvachansetu.model.Vote;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import com.nirvachansetu.config.EMFProvider;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.LinkedHashMap;

/**
 * Service class for Vote-related business operations.
 */
public class VoteService {

    private final VoteDAO voteDAO;
    private final CandidateDAO candidateDAO;
    private final ElectionDAO electionDAO;
    private EntityManager em;

    public VoteService() {
        this.voteDAO = new VoteDAO();
        this.candidateDAO = new CandidateDAO();
        this.electionDAO = new ElectionDAO();
        this.em = EMFProvider.getEntityManagerFactory().createEntityManager();
    }

    /**
     * Casts a vote for a candidate in an election.
     * Validates that the election is active, the voter hasn't already voted,
     * and the candidate is valid for the election.
     *
     * @param electionId   the election ID
     * @param candidateId  the candidate ID
     * @param constituencyId the constituency ID
     * @param voterId      the voter (user) ID
     * @return the cast vote
     * @throws RuntimeException if voting is not allowed
     */
    public Vote castVote(Integer electionId, Integer candidateId, Integer constituencyId, Integer voterId) {
        EntityTransaction tx = null;
        try {
            // Check if election is active
            Election election = electionDAO.findById(electionId);
            if (election == null || election.getStatus() != Election.ElectionStatus.ACTIVE) {
                throw new RuntimeException("Voting is not currently active for this election.");
            }

            // Check if voter has already voted
            if (voteDAO.hasVoted(electionId, voterId)) {
                throw new RuntimeException("You have already voted in this election.");
            }

            // Handle NOTA (None of the Above)
            if (candidateId == -1) {
                // For NOTA, create a vote with null candidate reference
                // We still record that the voter participated but chose no candidate
                Vote vote = new Vote();
                vote.setElection(election);
                vote.setConstituency(em.getReference(com.nirvachansetu.model.Constituency.class, constituencyId));
                vote.setVoter(em.getReference(com.nirvachansetu.model.User.class, voterId));
                vote = voteDAO.save(vote);
                return vote;
            }

            // Validate candidate is in this election and constituency
            Candidate candidate = candidateDAO.findById(candidateId);
            if (candidate == null || !candidate.getElection().getId().equals(electionId)) {
                throw new RuntimeException("Invalid candidate for this election.");
            }
            if (candidate.getStatus() != Candidate.CandidateStatus.ACTIVE) {
                throw new RuntimeException("This candidate is no longer active.");
            }

            // Create and save the vote
            Vote vote = new Vote();
            vote.setElection(election);
            vote.setCandidate(candidate);
            vote.setConstituency(candidate.getConstituency());
            vote.setVoter(em.getReference(com.nirvachansetu.model.User.class, voterId));

            vote = voteDAO.save(vote);

            // Update candidate's total vote count (within same transaction would be ideal,
            // but using separate update since save creates its own transaction)
            tx = em.getTransaction();
            tx.begin();
            candidate.setTotalVotes(candidate.getTotalVotes() + 1);
            em.merge(candidate);
            tx.commit();

            return vote;
        } catch (Exception e) {
            EntityTransaction tx2 = em.getTransaction();
            if (tx2 != null && tx2.isActive()) {
                tx2.rollback();
            }
            throw new RuntimeException("Error casting vote: " + e.getMessage(), e);
        } finally {
            voteDAO.close();
            candidateDAO.close();
            electionDAO.close();
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    /**
     * Checks if a voter has already voted in a specific election.
     *
     * @param electionId the election ID
     * @param voterId    the voter (user) ID
     * @return true if the voter has already voted, false otherwise
     */
    public boolean hasVoted(Integer electionId, Integer voterId) {
        try {
            return voteDAO.hasVoted(electionId, voterId);
        } finally {
            voteDAO.close();
        }
    }

    /**
     * Gets the total vote count for an election.
     *
     * @param electionId the election ID
     * @return the total number of votes cast
     */
    public long getVoteCount(Integer electionId) {
        try {
            return voteDAO.countByElection(electionId);
        } finally {
            voteDAO.close();
        }
    }

    /**
     * Gets the vote count for a specific candidate.
     *
     * @param candidateId the candidate ID
     * @return the number of votes for the candidate
     */
    public long getVoteCountForCandidate(Integer candidateId) {
        try {
            return voteDAO.countByCandidate(candidateId);
        } finally {
            voteDAO.close();
        }
    }

    /**
     * Gets election results - a list of candidates with their vote counts,
     * sorted by total votes descending.
     *
     * @param electionId the election ID
     * @return a list of candidates sorted by votes (highest first)
     */
    public List<Candidate> getElectionResults(Integer electionId) {
        try {
            return candidateDAO.findByElection(electionId);
        } finally {
            candidateDAO.close();
        }
    }

    /**
     * Gets election results for a specific constituency.
     *
     * @param electionId     the election ID
     * @param constituencyId the constituency ID
     * @return a list of candidates in the constituency sorted by votes (highest first)
     */
    public List<Candidate> getResultsByConstituency(Integer electionId, Integer constituencyId) {
        try {
            return candidateDAO.findByElectionAndConstituency(electionId, constituencyId);
        } finally {
            candidateDAO.close();
        }
    }

    /**
     * Gets a summary of election results as a map of candidate names to vote counts.
     *
     * @param electionId the election ID
     * @return a map of candidate full names to their vote counts
     */
    public Map<String, Integer> getElectionResultsSummary(Integer electionId) {
        try {
            List<Candidate> candidates = candidateDAO.findByElection(electionId);
            Map<String, Integer> results = new LinkedHashMap<>();
            for (Candidate candidate : candidates) {
                String name = candidate.getUser().getFullName();
                if (candidate.getPartyName() != null && !candidate.getPartyName().isEmpty()) {
                    name += " (" + candidate.getPartyName() + ")";
                }
                results.put(name, candidate.getTotalVotes());
            }
            return results;
        } finally {
            candidateDAO.close();
        }
    }

    /**
     * Gets the winning candidate for an election.
     *
     * @param electionId the election ID
     * @return the winning candidate (most votes), or null if no votes
     */
    public Candidate getWinner(Integer electionId) {
        try {
            List<Candidate> candidates = candidateDAO.findByElection(electionId);
            if (candidates.isEmpty() || candidates.get(0).getTotalVotes() == 0) {
                return null;
            }
            return candidates.get(0); // Already sorted by totalVotes DESC
        } finally {
            candidateDAO.close();
        }
    }

    /**
     * Calculates the voter turnout percentage for an election.
     *
     * @param electionId the election ID
     * @return the turnout percentage, or 0 if no registered voters
     */
    public double getVoterTurnout(Integer electionId) {
        try {
            long totalVotes = voteDAO.countByElection(electionId);

            // Get total eligible voters from candidates' constituency
            TypedQuery<Long> query = em.createQuery(
                    "SELECT DISTINCT c.constituency.totalVoters FROM Candidate c WHERE c.election.id = :electionId",
                    Long.class);
            query.setParameter("electionId", electionId);
            List<Long> results = query.getResultList();

            long totalEligible = 0;
            for (Long v : results) {
                totalEligible += v;
            }

            if (totalEligible == 0) {
                return 0.0;
            }
            return (double) totalVotes / totalEligible * 100.0;
        } finally {
            voteDAO.close();
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}
