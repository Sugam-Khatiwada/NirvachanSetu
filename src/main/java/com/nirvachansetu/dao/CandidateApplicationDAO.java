package com.nirvachansetu.dao;

import com.nirvachansetu.model.CandidateApplication;

import jakarta.persistence.TypedQuery;

import java.util.List;

/**
 * Data Access Object for CandidateApplication entity.
 */
public class CandidateApplicationDAO extends GenericDAO<CandidateApplication, Integer> {

    public CandidateApplicationDAO() {
        super(CandidateApplication.class);
    }

    /**
     * Finds a candidate application by user and election.
     *
     * @param userId     the user ID
     * @param electionId the election ID
     * @return the CandidateApplication, or null if not found
     */
    public CandidateApplication findByUserAndElection(Integer userId, Integer electionId) {
        try {
            TypedQuery<CandidateApplication> query = em.createQuery(
                    "SELECT ca FROM CandidateApplication ca WHERE ca.user.id = :userId AND ca.election.id = :electionId",
                    CandidateApplication.class);
            query.setParameter("userId", userId);
            query.setParameter("electionId", electionId);
            List<CandidateApplication> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);
        } catch (Exception e) {
            throw new RuntimeException("Error finding application for user " + userId + " and election " + electionId, e);
        }
    }

    /**
     * Finds all candidate applications for a specific election.
     *
     * @param electionId the election ID
     * @return a list of candidate applications for the election
     */
    public List<CandidateApplication> findByElection(Integer electionId) {
        try {
            TypedQuery<CandidateApplication> query = em.createQuery(
                    "SELECT ca FROM CandidateApplication ca WHERE ca.election.id = :electionId ORDER BY ca.appliedAt DESC",
                    CandidateApplication.class);
            query.setParameter("electionId", electionId);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding applications by election: " + electionId, e);
        }
    }

    /**
     * Finds all candidate applications with a specific status.
     *
     * @param status the application status
     * @return a list of candidate applications with the given status
     */
    public List<CandidateApplication> findByStatus(String status) {
        try {
            TypedQuery<CandidateApplication> query = em.createQuery(
                    "SELECT ca FROM CandidateApplication ca WHERE ca.status = :status ORDER BY ca.appliedAt DESC",
                    CandidateApplication.class);
            query.setParameter("status", CandidateApplication.ApplicationStatus.valueOf(status));
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding applications by status: " + status, e);
        }
    }

    /**
     * Finds all candidate applications submitted by a specific user.
     *
     * @param userId the user ID
     * @return a list of candidate applications by the user
     */
    public List<CandidateApplication> findByUser(Integer userId) {
        try {
            TypedQuery<CandidateApplication> query = em.createQuery(
                    "SELECT ca FROM CandidateApplication ca WHERE ca.user.id = :userId ORDER BY ca.appliedAt DESC",
                    CandidateApplication.class);
            query.setParameter("userId", userId);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding applications by user: " + userId, e);
        }
    }
}
