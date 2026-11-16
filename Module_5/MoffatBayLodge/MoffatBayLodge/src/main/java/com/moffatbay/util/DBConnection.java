
package com.moffatbay.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("MYSQL DRIVER LOADED");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MYSQL DRIVER NOT FOUND", e);
        }
    }
    // MySQL database connection
    private static final String URL =
            "jdbc:mysql://localhost:3306/moffatbay"
            + "?useSSL=false"
            + "&allowPublicKeyRetrieval=true"
            + "&serverTimezone=UTC";

    // MySQL username
    private static final String USER = "root";

    // MySQL password
    private static final String PASSWORD = "Oculus24!";

    // Private constructor
    private DBConnection() {
    }

    // Establish database connection
    public static Connection getConnection()
            throws SQLException {

        return DriverManager.getConnection(
                URL,
                USER,
                PASSWORD
        );
    }
}
