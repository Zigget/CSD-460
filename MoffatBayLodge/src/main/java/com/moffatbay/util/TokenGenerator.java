package com.moffatbay.util;

import java.security.SecureRandom;
import java.util.Base64;

public class TokenGenerator {

    private static final SecureRandom SECURE_RANDOM =
            new SecureRandom();

    private static final Base64.Encoder BASE64_ENCODER =
            Base64.getUrlEncoder()
                  .withoutPadding();

    private TokenGenerator() {
        // Prevent instantiation
    }

    /**
     * Generates a secure random token.
     *
     * @return random token string
     */
    public static String generateToken() {

        byte[] randomBytes = new byte[32];

        SECURE_RANDOM.nextBytes(randomBytes);

        return BASE64_ENCODER.encodeToString(randomBytes);
    }
}