package com.moffatbay.util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

    /**
     * Hash a plain text password.
     *
     * @param password User entered password
     * @return BCrypt hashed password
     */
    public static String hashPassword(String password) {

        return BCrypt.hashpw(
                password,
                BCrypt.gensalt(12)
        );
    }

    /**
     * Verify entered password against stored hash.
     *
     * @param plainPassword User entered password
     * @param hashedPassword Password stored in database
     * @return true if passwords match
     */
    public static boolean verifyPassword(
            String plainPassword,
            String hashedPassword) {

        if (plainPassword == null ||
            hashedPassword == null) {

            return false;
        }

        return BCrypt.checkpw(
                plainPassword,
                hashedPassword
        );
    }
}