package com.nirvachansetu.dao;

import com.nirvachansetu.model.Election;

import jakarta.persistence.TypedQuery;

import java.util.List;

/**
 * Data Access Object for Election entity.
 */
public class ElectionDAO extends GenericDAO<Election, Integer> {

    public ElectionDAO() {
        super(Election.class);
    }

    /**
     * Finds all elections with a specific status.
     *
     * @param status the election status
     * @return a list of elections with the given status
     */
    public List<Election> findByStatus(String status) {
        try {
            TypedQuery<Election> query = em.createQuery(
                    "SELECT e FROM Election e WHERE e.status = :status ORDER BY e.startDate DESC",
                    Election.class);
            query.setParameter("status", Election.ElectionStatus.valueOf(status));
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding elections by status: " + status, e);
        }
    }

    /**
     * Finds all elections of a specific type.
     *
     * @param type the election type
     * @return a list of elections of the given type
     */
    public List<Election> findByType(String type) {
        try {
            TypedQuery<Election> query = em.createQuery(
                    "SELECT e FROM Election e WHERE e.electionType = :type ORDER BY e.startDate DESC",
                    Election.class);
            query.setParameter("type", Election.ElectionType.valueOf(type));
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding elections by type: " + type, e);
        }
    }

    /**
     * Finds the active election for a specific constituency.
     *
     * @param constituencyId the constituency ID
     * @return the active election, or null if not found
     */
    public Election findActiveElectionByConstituency(Integer constituencyId) {
        try {
            TypedQuery<Election> query = em.createQuery(
                    "SELECT e FROM Election e WHERE e.status = :status AND e.constituency.id = :constituencyId",
                    Election.class);
            query.setParameter("status", Election.ElectionStatus.ACTIVE);
            query.setParameter("constituencyId", constituencyId);
            List<Election> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);
        } catch (Exception e) {
            throw new RuntimeException("Error finding active election by constituency: " + constituencyId, e);
        }
    }
}
