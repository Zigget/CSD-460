package com.moffatbay.util;

public class TokenTest {

    public static void main(String[] args) {

        for(int i = 1; i <= 5; i++) {

            System.out.println(
                    TokenGenerator.generateToken()
            );

        }
    }
}