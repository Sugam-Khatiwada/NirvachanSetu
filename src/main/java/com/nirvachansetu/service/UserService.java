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

    public User findById(Integer id) {
        try { return userDAO.findById(id); }
        finally { userDAO.close(); }
    }

    public List<User> findAll() {
        try { return userDAO.findAll(); }
        finally { userDAO.close(); }
    }

    public List<User> findByRole(String role) {
        try { return userDAO.findByRole(role); }
        finally { userDAO.close(); }
    }

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

    public User updateProfile(User user) {
        try { return userDAO.update(user); }
        finally { userDAO.close(); }
    }

    public List<User> findAllWithPagination(int offset, int limit) {
        try { return userDAO.findAllWithPagination(offset, limit); }
        finally { userDAO.close(); }
    }

    public long countAll() {
        try { return userDAO.count(); }
        finally { userDAO.close(); }
    }

    public User findByEmail(String email) {
        try { return userDAO.findByEmail(email); }
        finally { userDAO.close(); }
    }

    public boolean isEmailExists(String email) {
        try { return userDAO.findByEmail(email) != null; }
        finally { userDAO.close(); }
    }

    public boolean isCitizenshipNumberExists(String citizenshipNumber) {
        try { return userDAO.findByCitizenshipNumber(citizenshipNumber) != null; }
        finally { userDAO.close(); }
    }

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

    public long countByStatus(String status) {
        try { return userDAO.countByStatus(status); }
        finally { userDAO.close(); }
    }
}
