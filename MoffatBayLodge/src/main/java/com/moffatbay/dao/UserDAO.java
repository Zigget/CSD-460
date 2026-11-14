package com.moffatbay.dao;

import com.moffatbay.bean.UserBean;
import com.moffatbay.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    /**
     * Register a new user.
     */
    public boolean registerUser(UserBean user) {

        String sql = """
            INSERT INTO users
            (
                first_name,
                last_name,
                email,
                password_hash
            )
            VALUES
            (
                ?,
                ?,
                ?,
                ?
            )
            """;

        try (
                Connection conn =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        conn.prepareStatement(sql)
        ) {

            ps.setString(
                    1,
                    user.getFirstName());

            ps.setString(
                    2,
                    user.getLastName());

            ps.setString(
                    3,
                    user.getEmail());

            ps.setString(
                    4,
                    user.getPasswordHash());

            int rows =
                    ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    /**
     * Find user by email.
     */
    public UserBean findByEmail(String email) {

        String sql =
                "SELECT * FROM users WHERE email = ?";

        try (
                Connection conn =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        conn.prepareStatement(sql)
        ) {

            ps.setString(1, email);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                UserBean user =
                        new UserBean();

                user.setUserId(
                        rs.getInt("user_id"));

                user.setFirstName(
                        rs.getString("first_name"));

                user.setLastName(
                        rs.getString("last_name"));

                user.setEmail(
                        rs.getString("email"));

                user.setPasswordHash(
                        rs.getString("password_hash"));

                user.setRememberToken(
                        rs.getString("remember_token"));

                user.setResetToken(
                        rs.getString("reset_token"));

                user.setCreatedAt(
                        rs.getTimestamp("created_at"));

                return user;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }

    /**
     * Check if email exists.
     */
    public boolean emailExists(String email) {

        String sql =
                "SELECT user_id FROM users WHERE email=?";

        try (
                Connection conn =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        conn.prepareStatement(sql)
        ) {

            ps.setString(1, email);

            ResultSet rs =
                    ps.executeQuery();

            return rs.next();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    /**
     * Save Remember Me token.
     */
    public boolean saveRememberToken(
            String email,
            String token) {

        String sql =
                """
                UPDATE users
                SET remember_token = ?
                WHERE email = ?
                """;

        try (
                Connection conn =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        conn.prepareStatement(sql)
        ) {

            ps.setString(1, token);
            ps.setString(2, email);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    /**
     * Get user from Remember Me token.
     */
    public UserBean getUserByRememberToken(
            String token) {

        String sql =
                """
                SELECT *
                FROM users
                WHERE remember_token = ?
                """;

        try (
                Connection conn =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        conn.prepareStatement(sql)
        ) {

            ps.setString(1, token);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                UserBean user =
                        new UserBean();

                user.setUserId(
                        rs.getInt("user_id"));

                user.setFirstName(
                        rs.getString("first_name"));

                user.setLastName(
                        rs.getString("last_name"));

                user.setEmail(
                        rs.getString("email"));

                user.setPasswordHash(
                        rs.getString("password_hash"));

                return user;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }

    /**
     * Save Reset Password Token.
     */
    public boolean saveResetToken(
            String email,
            String resetToken) {

        String sql =
                """
                UPDATE users
                SET reset_token = ?
                WHERE email = ?
                """;

        try (
                Connection conn =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        conn.prepareStatement(sql)
        ) {

            ps.setString(
                    1,
                    resetToken);

            ps.setString(
                    2,
                    email);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    /**
     * Find user by reset token.
     */
    public UserBean getUserByResetToken(
            String token) {

        String sql =
                """
                SELECT *
                FROM users
                WHERE reset_token = ?
                """;

        try (
                Connection conn =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        conn.prepareStatement(sql)
        ) {

            ps.setString(1, token);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                UserBean user =
                        new UserBean();

                user.setUserId(
                        rs.getInt("user_id"));

                user.setFirstName(
                        rs.getString("first_name"));

                user.setLastName(
                        rs.getString("last_name"));

                user.setEmail(
                        rs.getString("email"));

                user.setPasswordHash(
                        rs.getString("password_hash"));

                user.setResetToken(
                        rs.getString("reset_token"));

                return user;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }

    /**
     * Update password after reset.
     */
    public boolean updatePassword(
            int userId,
            String passwordHash) {

        String sql =
                """
                UPDATE users
                SET password_hash = ?,
                    reset_token = NULL
                WHERE user_id = ?
                """;

        try (
                Connection conn =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        conn.prepareStatement(sql)
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