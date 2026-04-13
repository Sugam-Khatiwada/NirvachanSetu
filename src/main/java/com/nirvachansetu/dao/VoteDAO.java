package com.nirvachansetu.dao;

import com.nirvachansetu.model.Vote;

import jakarta.persistence.TypedQuery;

import java.util.List;

/**
 * Data Access Object for Vote entity.
 */
public class VoteDAO extends GenericDAO<Vote, Integer> {

    public VoteDAO() {
        super(Vote.class);
    }

    /**
     * Finds a vote by election and voter.
     *
     * @param electionId the election ID
     * @param voterId    the voter (user) ID
     * @return the Vote, or null if not found
     */
    public Vote findByElectionAndVoter(Integer electionId, Integer voterId) {
        try {
            TypedQuery<Vote> query = em.createQuery(
                    "SELECT v FROM Vote v WHERE v.election.id = :electionId AND v.voter.id = :voterId",
                    Vote.class);
            query.setParameter("electionId", electionId);
            query.setParameter("voterId", voterId);
            List<Vote> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);
        } catch (Exception e) {
            throw new RuntimeException("Error finding vote for election " + electionId
                    + " and voter " + voterId, e);
        }
    }

    /**
     * Counts the total votes in a specific election.
     *
     * @param electionId the election ID
     * @return the count of votes
     */
    public long countByElection(Integer electionId) {
        try {
            TypedQuery<Long> query = em.createQuery(
                    "SELECT COUNT(v) FROM Vote v WHERE v.election.id = :electionId",
                    Long.class);
            query.setParameter("electionId", electionId);
            return query.getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException("Error counting votes by election: " + electionId, e);
        }
    }

    /**
     * Counts the votes for a specific candidate.
     *
     * @param candidateId the candidate ID
     * @return the count of votes for the candidate
     */
    public long countByCandidate(Integer candidateId) {
        try {
            TypedQuery<Long> query = em.createQuery(
                    "SELECT COUNT(v) FROM Vote v WHERE v.candidate.id = :candidateId",
                    Long.class);
            query.setParameter("candidateId", candidateId);
            return query.getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException("Error counting votes by candidate: " + candidateId, e);
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
            TypedQuery<Long> query = em.createQuery(
                    "SELECT COUNT(v) FROM Vote v WHERE v.election.id = :electionId AND v.voter.id = :voterId",
                    Long.class);
            query.setParameter("electionId", electionId);
            query.setParameter("voterId", voterId);
            return query.getSingleResult() > 0;
        } catch (Exception e) {
            throw new RuntimeException("Error checking if voter " + voterId
                    + " has voted in election " + electionId, e);
        }
    }

    /**
     * Finds all votes for a specific election.
     *
     * @param electionId the election ID
     * @return a list of votes for the election
     */
    public List<Vote> findVotesByElection(Integer electionId) {
        try {
            TypedQuery<Vote> query = em.createQuery(
                    "SELECT v FROM Vote v WHERE v.election.id = :electionId ORDER BY v.votedAt DESC",
                    Vote.class);
            query.setParameter("electionId", electionId);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding votes by election: " + electionId, e);
        }
    }

    /**
     * Finds all votes for a specific candidate in an election.
     *
     * @param candidateId the candidate ID
     * @return a list of votes for the candidate
     */
    public List<Vote> findVotesByCandidate(Integer candidateId) {
        try {
            TypedQuery<Vote> query = em.createQuery(
                    "SELECT v FROM Vote v WHERE v.candidate.id = :candidateId ORDER BY v.votedAt DESC",
                    Vote.class);
            query.setParameter("candidateId", candidateId);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding votes by candidate: " + candidateId, e);
        }
    }
}
