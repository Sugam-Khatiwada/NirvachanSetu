package com.nirvachansetu.service;

import com.nirvachansetu.dao.UserDAO;
import com.nirvachansetu.model.User;
import com.nirvachansetu.util.PasswordUtil;

import java.util.List;

/**
 * Service class for User-related business operations.
 */
public class UserService {

    private final UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    /**
     * Registers a new user. Hashes the password before saving.
     * Default role is VOTER and status is PENDING.
     *
     * @param user the user to register (password should be plain text)
     * @return the registered user with generated ID
     */
    public User register(User user) {
        // Only hash if password is not already hashed (SHA-256 hex = 64 chars)
        String pwd = user.getPassword();
        if (pwd != null && pwd.length() != 64) {
            user.setPassword(PasswordUtil.hashPassword(pwd));
        }
        return userDAO.save(user);
    }

    /**
     * Authenticates a user by email and password.
     *
     * @param email    the user's email
     * @param password the plain text password
     * @return the authenticated user, or null if credentials are invalid
     */
    public User login(String email, String password) {
        try {
            User user = userDAO.findByEmail(email);
            if (user != null && PasswordUtil.verifyPassword(password, user.getPassword())) {
                return user;
            }
            return null;
        } finally {
            userDAO.close();
        }
    }

    /**
     * Finds a user by their unique ID.
     * 
     * @param id the user ID
     * @return the user, or null if not found
     */
    public User findById(Integer id) {
        try { return userDAO.findById(id); }
        finally { userDAO.close(); }
    }

    /**
     * Returns all registered users.
     * 
     * @return a list of all users
     */
    public List<User> findAll() {
        try { return userDAO.findAll(); }
        finally { userDAO.close(); }
    }

    /**
     * Finds all users with a specific role.
     * 
     * @param role the role to filter by
     * @return a list of users with the given role
     */
    public List<User> findByRole(String role) {
        try { return userDAO.findByRole(role); }
        finally { userDAO.close(); }
    }

    /**
     * Updates the status of a user.
     * 
     * @param userId the user ID
     * @param status the new status
     * @return the updated user, or null if user not found
     */
    public User updateStatus(Integer userId, String status) {
        try {
            User user = userDAO.findById(userId);
            if (user != null) {
                user.setStatus(User.UserStatus.valueOf(status));
                return userDAO.update(user);
            }
            return null;
        } finally { userDAO.close(); }
    }

    /**
     * Updates the full profile of a user.
     * 
     * @param user the user with updated fields
     * @return the updated user
     */
    public User updateProfile(User user) {
        try { return userDAO.update(user); }
        finally { userDAO.close(); }
    }

    /**
     * Returns a paginated list of users.
     * 
     * @param offset the starting index
     * @param limit the maximum number of records to return
     * @return a list of users for the current page
     */
    public List<User> findAllWithPagination(int offset, int limit) {
        try { return userDAO.findAllWithPagination(offset, limit); }
        finally { userDAO.close(); }
    }

    /**
     * Returns the total count of users.
     * 
     * @return the total number of users
     */
    public long countAll() {
        try { return userDAO.count(); }
        finally { userDAO.close(); }
    }

    /**
     * Finds a user by their email address.
     * 
     * @param email the email address
     * @return the user, or null if not found
     */
    public User findByEmail(String email) {
        try { return userDAO.findByEmail(email); }
        finally { userDAO.close(); }
    }

    /**
     * Checks if an email is already associated with an existing user.
     * 
     * @param email the email to check
     * @return true if the email exists, false otherwise
     */
    public boolean isEmailExists(String email) {
        try { return userDAO.findByEmail(email) != null; }
        finally { userDAO.close(); }
    }

    /**
     * Checks if a citizenship number is already in use.
     * 
     * @param citizenshipNumber the citizenship number to check
     * @return true if it exists, false otherwise
     */
    public boolean isCitizenshipNumberExists(String citizenshipNumber) {
        try { return userDAO.findByCitizenshipNumber(citizenshipNumber) != null; }
        finally { userDAO.close(); }
    }

    /**
     * Updates the role of a user.
     * 
     * @param userId the user ID
     * @param role the new role
     * @return the updated user, or null if user not found
     */
    public User updateRole(Integer userId, String role) {
        try {
            User user = userDAO.findById(userId);
            if (user != null) {
                user.setRole(User.Role.valueOf(role));
                return userDAO.update(user);
            }
            return null;
        } finally { userDAO.close(); }
    }

    /**
     * Gets the count of users having a specific status.
     * 
     * @param status the status to filter by
     * @return the count of such users
     */
    public long countByStatus(String status) {
        try { return userDAO.countByStatus(status); }
        finally { userDAO.close(); }
    }
}
