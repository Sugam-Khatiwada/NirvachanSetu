package com.nirvachansetu.dao;

import com.nirvachansetu.model.User;

import jakarta.persistence.TypedQuery;

import java.util.List;

/**
 * Data Access Object for User entity.
 */
public class UserDAO extends GenericDAO<User, Integer> {

    public UserDAO() {
        super(User.class);
    }

    /**
     * Finds a user by email address.
     *
     * @param email the email to search for
     * @return the User, or null if not found
     */
    public User findByEmail(String email) {
        try {
            TypedQuery<User> query = em.createQuery(
                    "SELECT u FROM User u WHERE u.email = :email", User.class);
            query.setParameter("email", email);
            List<User> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);
        } catch (Exception e) {
            throw new RuntimeException("Error finding user by email: " + email, e);
        }
    }

    /**
     * Finds a user by citizenship number.
     *
     * @param citizenshipNumber the citizenship number to search for
     * @return the User, or null if not found
     */
    public User findByCitizenshipNumber(String citizenshipNumber) {
        try {
            TypedQuery<User> query = em.createQuery(
                    "SELECT u FROM User u WHERE u.citizenshipNumber = :citizenshipNumber", User.class);
            query.setParameter("citizenshipNumber", citizenshipNumber);
            List<User> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);
        } catch (Exception e) {
            throw new RuntimeException("Error finding user by citizenship number: " + citizenshipNumber, e);
        }
    }

    /**
     * Finds all users with a specific role.
     *
     * @param role the role to filter by
     * @return a list of users with the given role
     */
    public List<User> findByRole(String role) {
        try {
            TypedQuery<User> query = em.createQuery(
                    "SELECT u FROM User u WHERE u.role = :role ORDER BY u.createdAt DESC", User.class);
            query.setParameter("role", User.Role.valueOf(role));
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding users by role: " + role, e);
        }
    }

    /**
     * Finds all users with a specific status.
     *
     * @param status the status to filter by
     * @return a list of users with the given status
     */
    public List<User> findByStatus(String status) {
        try {
            TypedQuery<User> query = em.createQuery(
                    "SELECT u FROM User u WHERE u.status = :status ORDER BY u.createdAt DESC", User.class);
            query.setParameter("status", User.UserStatus.valueOf(status));
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding users by status: " + status, e);
        }
    }

    /**
     * Finds all users belonging to a specific constituency.
     *
     * @param constituencyId the constituency ID
     * @return a list of users in the constituency
     */
    public List<User> findByConstituency(Integer constituencyId) {
        try {
            TypedQuery<User> query = em.createQuery(
                    "SELECT u FROM User u WHERE u.constituency.id = :constituencyId ORDER BY u.fullName",
                    User.class);
            query.setParameter("constituencyId", constituencyId);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding users by constituency: " + constituencyId, e);
        }
    }

    /**
     * Counts users with a specific role.
     *
     * @param role the role to count
     * @return the count of users with the given role
     */
    public long countByRole(String role) {
        try {
            TypedQuery<Long> query = em.createQuery(
                    "SELECT COUNT(u) FROM User u WHERE u.role = :role", Long.class);
            query.setParameter("role", User.Role.valueOf(role));
            return query.getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException("Error counting users by role: " + role, e);
        }
    }

    /**
     * Counts users with a specific status.
     *
     * @param status the status to count
     * @return the count of users with the given status
     */
    public long countByStatus(String status) {
        try {
            TypedQuery<Long> query = em.createQuery(
                    "SELECT COUNT(u) FROM User u WHERE u.status = :status", Long.class);
            query.setParameter("status", User.UserStatus.valueOf(status));
            return query.getSingleResult();
        } catch (Exception e) {
            throw new RuntimeException("Error counting users by status: " + status, e);
        }
    }

    /**
     * Finds users with pagination.
     *
     * @param offset the starting index
     * @param limit  the maximum number of results
     * @return a list of users
     */
    public List<User> findAllWithPagination(int offset, int limit) {
        try {
            TypedQuery<User> query = em.createQuery(
                    "SELECT u FROM User u ORDER BY u.createdAt DESC", User.class);
            query.setFirstResult(offset);
            query.setMaxResults(limit);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Error finding users with pagination", e);
        }
    }
}
