package com.moffatbay.util;

import java.sql.Connection;

public class DatabaseTest {

    public static void main(String[] args) {

        try (
            Connection conn =
                DBConnection.getConnection()
        ) {

            System.out.println(
                "Database Connected Successfully!"
            );

        } catch (Exception e) {

            System.out.println(
                "Database Connection Failed!"
            );

            e.printStackTrace();
        }
    }
}