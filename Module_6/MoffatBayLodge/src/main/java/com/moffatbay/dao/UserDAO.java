
package com.moffatbay.dao;

import com.moffatbay.bean.UserBean;
import com.moffatbay.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    /**
     * Register a new customer.
     */
    public boolean registerUser(UserBean user) {

        String sql = """
            INSERT INTO customer
            (
                first_name,
                last_name,
                email,
                phone_number,
                password_hash
            )
            VALUES (?, ?, ?, ?, ?)
            """;

        try (
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setString(5, user.getPasswordHash());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            System.err.println("REGISTRATION DATABASE ERROR:");
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Find customer by email.
     */
    public UserBean findByEmail(String email) {

        String sql =
                "SELECT * FROM customer WHERE email = ?";

        try (
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    UserBean user = new UserBean();

                    user.setUserId(
                            rs.getInt("customer_id"));

                    user.setFirstName(
                            rs.getString("first_name"));

                    user.setLastName(
                            rs.getString("last_name"));

                    user.setEmail(
                            rs.getString("email"));

                    user.setPhoneNumber(
                            rs.getString("phone_number"));

                    user.setPasswordHash(
                            rs.getString("password_hash"));

                    user.setCreatedAt(
                            rs.getTimestamp("registration_date"));

                    return user;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Check whether an email already exists.
     */
    public boolean emailExists(String email) {

        String sql =
                "SELECT customer_id FROM customer WHERE email = ?";

        try (
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Remember Me token.
     * Not supported by the current customer table.
     */
    public boolean saveRememberToken(
            String email,
            String token) {

        return false;
    }

    /**
     * Find customer by Remember Me token.
     * Not supported by the current customer table.
     */
    public UserBean getUserByRememberToken(
            String token) {

        return null;
    }

    /**
     * Reset password token.
     * Not supported by the current customer table.
     */
    public boolean saveResetToken(
            String email,
            String resetToken) {

        return false;
    }

    /**
     * Find customer by reset token.
     * Not supported by the current customer table.
     */
    public UserBean getUserByResetToken(
            String token) {

        return null;
    }

    /**
     * Update customer password.
     */
    public boolean updatePassword(
            int userId,
            String passwordHash) {

        String sql = """
            UPDATE customer
            SET password_hash = ?
            WHERE customer_id = ?
            """;

        try (
                Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setString(1, passwordHash);
            ps.setInt(2, userId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
