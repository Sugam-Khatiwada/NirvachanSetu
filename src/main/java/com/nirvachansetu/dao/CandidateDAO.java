package com.nirvachansetu.dao;

import com.nirvachansetu.model.Candidate;

import jakarta.persistence.TypedQuery;

import java.util.List;

/**
 * Data Access Object for Candidate entity.
 */
public class CandidateDAO extends GenericDAO<Candidate, Integer> {

    public CandidateDAO() {
        super(Candidate.class);
    }

    /**
     * Finds a candidate by user ID.
     *
     * @param userId the user ID
     * @return the Candidate, or null if not found
     */
    public Candidate findByUser(Integer userId) {
        try {
            TypedQuery<Candidate> query = em.createQuery(
                    "SELECT c FROM Candidate c WHERE c.user.id = :userId", Candidate.class);
            query.setParameter("userId", userId);
            List<Candidate> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);
        } catch (Exception e) {
            throw new RuntimeException("Error finding candidate by user: " + userId, e);
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
            TypedQuery<Candidate> query = em.createQuery(
                    "SELECT c FROM Candidate c WHERE c.election.id = :electionId ORDER BY c.totalVotes DESC",
                    Candidate.class);
            query.setParameter("electionId", electionId);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding candidates by election: " + electionId, e);
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
            TypedQuery<Candidate> query = em.createQuery(
                    "SELECT c FROM Candidate c WHERE c.constituency.id = :constituencyId ORDER BY c.totalVotes DESC",
                    Candidate.class);
            query.setParameter("constituencyId", constituencyId);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding candidates by constituency: " + constituencyId, e);
        }
    }

    /**
     * Finds all candidates for a specific election in a specific constituency.
     *
     * @param electionId     the election ID
     * @param constituencyId the constituency ID
     * @return a list of candidates in the election and constituency
     */
    public List<Candidate> findByElectionAndConstituency(Integer electionId, Integer constituencyId) {
        try {
            TypedQuery<Candidate> query = em.createQuery(
                    "SELECT c FROM Candidate c WHERE c.election.id = :electionId AND c.constituency.id = :constituencyId ORDER BY c.totalVotes DESC",
                    Candidate.class);
            query.setParameter("electionId", electionId);
            query.setParameter("constituencyId", constituencyId);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding candidates by election " + electionId
                    + " and constituency " + constituencyId, e);
        }
    }

    /**
     * Finds all active candidates for a specific election (used for role revert).
     *
     * @param electionId the election ID
     * @return a list of active candidates in the election
     */
    public List<Candidate> findActiveByElection(Integer electionId) {
        try {
            TypedQuery<Candidate> query = em.createQuery(
                    "SELECT c FROM Candidate c WHERE c.election.id = :electionId AND c.status = :status",
                    Candidate.class);
            query.setParameter("electionId", electionId);
            query.setParameter("status", com.nirvachansetu.model.Candidate.CandidateStatus.ACTIVE);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding active candidates by election: " + electionId, e);
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
            TypedQuery<Long> query = em.createQuery(
                    "SELECT COUNT(c) FROM Candidate c WHERE c.election.id = :electionId",
                    Long.class);
            query.setParameter("electionId", electionId);
            return query.getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException("Error counting candidates by election: " + electionId, e);
        }
    }
}
