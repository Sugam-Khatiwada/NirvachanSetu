package com.nirvachansetu.service;

import com.nirvachansetu.dao.ConstituencyDAO;
import com.nirvachansetu.dao.ElectionDAO;
import com.nirvachansetu.model.Election;

import java.util.List;

/**
 * Service class for Election-related business operations.
 */
public class ElectionService {

    private final ElectionDAO electionDAO;
    private final ConstituencyDAO constituencyDAO;

    public ElectionService() {
        this.electionDAO = new ElectionDAO();
        this.constituencyDAO = new ConstituencyDAO();
    }

    /**
     * Creates a new election.
     *
     * @param election the election to create
     * @return the created election with generated ID
     */
    public Election createElection(Election election) {
        try {
            return electionDAO.save(election);
        } finally {
            electionDAO.close();
            constituencyDAO.close();
        }
    }

    /**
     * Updates an existing election.
     *
     * @param election the election with updated fields
     * @return the updated election
     */
    public Election updateElection(Election election) {
        try {
            return electionDAO.update(election);
        } finally {
            electionDAO.close();
            constituencyDAO.close();
        }
    }

    /**
     * Finds an election by ID.
     *
     * @param id the election ID
     * @return the election, or null if not found
     */
    public Election findById(Integer id) {
        try {
            return electionDAO.findById(id);
        } finally {
            electionDAO.close();
        }
    }

    /**
     * Returns all elections.
     *
     * @return a list of all elections
     */
    public List<Election> findAll() {
        try {
            return electionDAO.findAll();
        } finally {
            electionDAO.close();
        }
    }

    /**
     * Finds all elections with a specific status.
     *
     * @param status the status to filter by
     * @return a list of elections with the given status
     */
    public List<Election> findByStatus(String status) {
        try {
            return electionDAO.findByStatus(status);
        } finally {
            electionDAO.close();
        }
    }

    /**
     * Updates the status of an election (e.g., DRAFT -> REGISTRATION -> ACTIVE -> COMPLETED).
     *
     * @param electionId the election ID
     * @param status     the new status
     * @return the updated election, or null if election not found
     */
    public Election updateStatus(Integer electionId, String status) {
        try {
            Election election = electionDAO.findById(electionId);
            if (election != null) {
                election.setStatus(Election.ElectionStatus.valueOf(status));
                return electionDAO.update(election);
            }
            return null;
        } finally {
            electionDAO.close();
        }
    }

    /**
     * Returns all currently active elections.
     *
     * @return a list of active elections
     */
    public List<Election> getActiveElections() {
        try {
            return electionDAO.findByStatus(Election.ElectionStatus.ACTIVE.name());
        } finally {
            electionDAO.close();
        }
    }

    /**
     * Returns the total count of elections.
     *
     * @return the total number of elections
     */
    public long countAll() {
        try {
            return electionDAO.count();
        } finally {
            electionDAO.close();
        }
    }

    /**
     * Finds elections of a specific type.
     *
     * @param type the election type
     * @return a list of elections of the given type
     */
    public List<Election> findByType(String type) {
        try {
            return electionDAO.findByType(type);
        } finally {
            electionDAO.close();
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
            return electionDAO.findActiveElectionByConstituency(constituencyId);
        } finally {
            electionDAO.close();
        }
    }

    /**
     * Deletes an election by ID.
     *
     * @param electionId the election ID to delete
     */
    public void deleteElection(Integer electionId) {
        try {
            electionDAO.deleteById(electionId);
        } finally {
            electionDAO.close();
        }
    }
}
