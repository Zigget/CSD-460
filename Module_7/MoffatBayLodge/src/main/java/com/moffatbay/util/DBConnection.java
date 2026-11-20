package com.moffatbay.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/moffatbay"
            + "?useSSL=false"
            + "&allowPublicKeyRetrieval=true"
            + "&serverTimezone=UTC";

    private static final String USER = "root";

    // Change if your MySQL root account has a password
    private static final String PASSWORD = "Oculus24!";

    static {

        try {

            Class.forName(
                    "com.mysql.cj.jdbc.Driver");

            System.out.println(
                    "MySQL JDBC Driver Loaded Successfully");

        } catch (ClassNotFoundException e) {

            throw new RuntimeException(
                    "Unable to load MySQL JDBC Driver",
                    e);
        }
    }

    private DBConnection() {
        // Prevent instantiation
    }

    public static Connection getConnection()
            throws SQLException {

        return DriverManager.getConnection(
                URL,
                USER,
                PASSWORD);
    }

    /**
     * Database connection test
     */
    public static void main(String[] args) {

        try (Connection conn =
                     DBConnection.getConnection()) {

            System.out.println(
                    "DATABASE CONNECTED SUCCESSFULLY");

            System.out.println(
                    "Database: "
                    + conn.getCatalog());

        } catch (SQLException e) {

            System.out.println(
                    "DATABASE CONNECTION FAILED");

            e.printStackTrace();
        }
    }
}