package com.moffatbay.dao;

import com.moffatbay.bean.Reservation;
import com.moffatbay.util.DBConnection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {

    /**
     * Create reservation
     */
    public int createReservation(
            Reservation reservation)
            throws Exception {

        String sql = """
                INSERT INTO reservation
                (
                    customer_id,
                    room_id,
                    status_id,
                    reservation_date,
                    check_in_date,
                    check_out_date,
                    guest_count,
                    total_nights,
                    total_cost,
                    special_requests
                )
                VALUES
                (
                    ?, ?, ?,
                    NOW(),
                    ?, ?, ?,
                    ?, ?, ?
                )
                """;

        try (Connection conn =
                     DBConnection.getConnection();

             PreparedStatement ps =
                     conn.prepareStatement(
                             sql,
                             Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(
                    1,
                    reservation.getCustomerId());

            ps.setInt(
                    2,
                    reservation.getRoomId());

            ps.setInt(
                    3,
                    reservation.getStatusId());

            ps.setDate(
                    4,
                    Date.valueOf(
                            reservation.getCheckInDate()));

            ps.setDate(
                    5,
                    Date.valueOf(
                            reservation.getCheckOutDate()));

            ps.setInt(
                    6,
                    reservation.getGuestCount());

            ps.setInt(
                    7,
                    reservation.getTotalNights());

            ps.setDouble(
                    8,
                    reservation.getTotalCost());

            ps.setString(
                    9,
                    reservation.getSpecialRequests());

            int rows =
                    ps.executeUpdate();

            if (rows > 0) {

                ResultSet keys =
                        ps.getGeneratedKeys();

                if (keys.next()) {

                    return keys.getInt(1);
                }
            }
        }

        return 0;
    }

    /**
     * Get reservation by ID
     */
    public Reservation getReservationById(
            int reservationId)
            throws Exception {

        String sql = """
                SELECT *
                FROM reservation
                WHERE reservation_id = ?
                """;

        try (Connection conn =
                     DBConnection.getConnection();

             PreparedStatement ps =
                     conn.prepareStatement(sql)) {

            ps.setInt(
                    1,
                    reservationId);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                return mapReservation(rs);
            }
        }

        return null;
    }

    /**
     * Compatibility method
     */
    public Reservation findReservationById(
            int reservationId)
            throws Exception {

        return getReservationById(
                reservationId);
    }

    /**
     * Customer reservations
     */
    public List<Reservation>
    getReservationsByCustomerId(
            int customerId)
            throws Exception {

        List<Reservation> reservations =
                new ArrayList<>();

        String sql = """
                SELECT *
                FROM reservation
                WHERE customer_id = ?
                ORDER BY reservation_id DESC
                """;

        try (Connection conn =
                     DBConnection.getConnection();

             PreparedStatement ps =
                     conn.prepareStatement(sql)) {

            ps.setInt(
                    1,
                    customerId);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                reservations.add(
                        mapReservation(rs));
            }
        }

        return reservations;
    }

    /**
     * Compatibility method
     */
    public List<Reservation>
    getReservationsByCustomer(
            int customerId)
            throws Exception {

        return getReservationsByCustomerId(
                customerId);
    }

    /**
     * Search reservations by email
     */
    public List<Reservation>
    findReservationsByEmail(
            String email)
            throws Exception {

        List<Reservation> reservations =
                new ArrayList<>();

        String sql = """
                SELECT r.*
                FROM reservation r
                INNER JOIN customer c
                    ON r.customer_id = c.customer_id
                WHERE c.email = ?
                ORDER BY r.reservation_id DESC
                """;

        try (Connection conn =
                     DBConnection.getConnection();

             PreparedStatement ps =
                     conn.prepareStatement(sql)) {

            ps.setString(
                    1,
                    email);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                reservations.add(
                        mapReservation(rs));
            }
        }

        return reservations;
    }

    /**
     * Cancel reservation
     */
    public boolean cancelReservation(
            int reservationId)
            throws Exception {

        String sql = """
                UPDATE reservation
                SET status_id = 3
                WHERE reservation_id = ?
                """;

        try (Connection conn =
                     DBConnection.getConnection();

             PreparedStatement ps =
                     conn.prepareStatement(sql)) {

            ps.setInt(
                    1,
                    reservationId);

            return ps.executeUpdate() > 0;
        }
    }

    /**
     * Update reservation status
     */
    public boolean updateReservationStatus(
            int reservationId,
            int statusId)
            throws Exception {

        String sql = """
                UPDATE reservation
                SET status_id = ?
                WHERE reservation_id = ?
                """;

        try (Connection conn =
                     DBConnection.getConnection();

             PreparedStatement ps =
                     conn.prepareStatement(sql)) {

            ps.setInt(
                    1,
                    statusId);

            ps.setInt(
                    2,
                    reservationId);

            return ps.executeUpdate() > 0;
        }
    }

    /**
     * Get all reservations
     */
    public List<Reservation>
    getAllReservations()
            throws Exception {

        List<Reservation> reservations =
                new ArrayList<>();

        String sql = """
                SELECT *
                FROM reservation
                ORDER BY reservation_id DESC
                """;

        try (Connection conn =
                     DBConnection.getConnection();

             PreparedStatement ps =
                     conn.prepareStatement(sql);

             ResultSet rs =
                     ps.executeQuery()) {

            while (rs.next()) {

                reservations.add(
                        mapReservation(rs));
            }
        }

        return reservations;
    }

    /**
     * Map ResultSet to Reservation
     */
    private Reservation mapReservation(
            ResultSet rs)
            throws Exception {

        Reservation reservation =
                new Reservation();

        reservation.setReservationId(
                rs.getInt(
                        "reservation_id"));

        reservation.setCustomerId(
                rs.getInt(
                        "customer_id"));

        reservation.setRoomId(
                rs.getInt(
                        "room_id"));

        reservation.setStatusId(
                rs.getInt(
                        "status_id"));

        reservation.setCheckInDate(
                rs.getDate(
                        "check_in_date")
                        .toLocalDate());

        reservation.setCheckOutDate(
                rs.getDate(
                        "check_out_date")
                        .toLocalDate());

        reservation.setGuestCount(
                rs.getInt(
                        "guest_count"));

        reservation.setTotalNights(
                rs.getInt(
                        "total_nights"));

        reservation.setTotalCost(
                rs.getDouble(
                        "total_cost"));

        reservation.setSpecialRequests(
                rs.getString(
                        "special_requests"));

        return reservation;
    }
}