package com.nirvachansetu.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Utility class for password hashing and verification.
 * Uses SHA-256 with a fixed application salt.
 */
public class PasswordUtil {

    private static final String SALT = "NirvachanSetu2024";

    private PasswordUtil() {
        // Prevent instantiation
    }

    /**
     * Hashes a plain text password using SHA-256 with salt.
     *
     * @param plainText the plain text password
     * @return the hashed password as a hexadecimal string
     */
    public static String hashPassword(String plainText) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            String saltedPassword = plainText + SALT;
            byte[] hashBytes = digest.digest(saltedPassword.getBytes(StandardCharsets.UTF_8));
            return bytesToHex(hashBytes);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("SHA-256 algorithm not found", e);
        }
    }

    /**
     * Verifies a plain text password against a hashed password.
     *
     * @param plainText  the plain text password to verify
     * @param hashedPassword the stored hashed password
     * @return true if the password matches, false otherwise
     */
    public static boolean verifyPassword(String plainText, String hashedPassword) {
        String newHash = hashPassword(plainText);
        return newHash.equalsIgnoreCase(hashedPassword);
    }

    /**
     * Converts a byte array to a hexadecimal string.
     *
     * @param bytes the byte array
     * @return the hexadecimal string
     */
    private static String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }
}
