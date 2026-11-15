package com.moffatbay.util;

public class PasswordTest {

    public static void main(String[] args) {

        String password = "Password123";

        String hash =
                PasswordUtil.hashPassword(password);

        System.out.println("Hash:");
        System.out.println(hash);

        boolean valid =
                PasswordUtil.verifyPassword(
                        password,
                        hash
                );

        System.out.println("Valid: " + valid);
    }
}