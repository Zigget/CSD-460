package com.moffatbay.util;

import java.sql.Connection;
import java.sql.DatabaseMetaData;

public class DatabaseTest {

    public static void main(String[] args) {

        System.out.println("Testing database connection...");

        try (Connection conn =
                     DBConnection.getConnection()) {

            System.out.println();
            System.out.println("SUCCESS: Database connection established.");
            System.out.println();

            System.out.println(
                    "Database Name: "
                    + conn.getCatalog());

            DatabaseMetaData meta =
                    conn.getMetaData();

            System.out.println(
                    "Database Product: "
                    + meta.getDatabaseProductName());

            System.out.println(
                    "Database Version: "
                    + meta.getDatabaseProductVersion());

            System.out.println(
                    "JDBC Driver: "
                    + meta.getDriverName());

            System.out.println(
                    "JDBC Driver Version: "
                    + meta.getDriverVersion());

            System.out.println();
            System.out.println(
                    "Connection Test Completed Successfully.");

        } catch (Exception e) {

            System.out.println();
            System.out.println(
                    "FAILED: Unable to connect to database.");
            System.out.println();

            e.printStackTrace();
        }
    }
}