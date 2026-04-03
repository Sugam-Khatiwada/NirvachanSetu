package com.nirvachansetu.nirvachansetu.dao;

public class UserDao {
    // Basic mock implementation for the servlets to compile and work
    
    public boolean validateUser(String username, String password) {
        // TODO: Implement actual database validation
        return "admin".equals(username) && "password123".equals(password);
    }
    
    public boolean createUser(String username, String password) {
        // TODO: Implement actual database insertion
        return username != null && !username.isEmpty(); // Mocked success
    }
}
