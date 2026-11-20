package com.moffatbay.dao;

import com.moffatbay.bean.Room;
import com.moffatbay.util.DBConnection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

public class RoomDAO {

    /**
     * Get all rooms
     */
    public List<Room> getAllRooms()
            throws Exception {

        List<Room> rooms =
                new ArrayList<>();

        String sql = """
                SELECT
                    r.room_id,
                    r.room_number,
                    r.view_type,
                    r.room_status_id,
                    rt.room_type_id,
                    rt.room_type_name,
                    rt.description,
                    rt.price_per_night,
                    rt.max_guests,
                    rt.bed_count
                FROM room r
                INNER JOIN room_type rt
                    ON r.room_type_id = rt.room_type_id
                ORDER BY rt.price_per_night
                """;

        try (Connection conn =
                     DBConnection.getConnection();

             PreparedStatement ps =
                     conn.prepareStatement(sql);

             ResultSet rs =
                     ps.executeQuery()) {

            while (rs.next()) {

                rooms.add(
                        mapRoom(rs));
            }
        }

        return rooms;
    }

    /**
     * Get room by ID
     */
    public Room getRoomById(int roomId)
            throws Exception {

        String sql = """
                SELECT
                    r.room_id,
                    r.room_number,
                    r.view_type,
                    r.room_status_id,
                    rt.room_type_id,
                    rt.room_type_name,
                    rt.description,
                    rt.price_per_night,
                    rt.max_guests,
                    rt.bed_count
                FROM room r
                INNER JOIN room_type rt
                    ON r.room_type_id = rt.room_type_id
                WHERE r.room_id = ?
                """;

        try (Connection conn =
                     DBConnection.getConnection();

             PreparedStatement ps =
                     conn.prepareStatement(sql)) {

            ps.setInt(
                    1,
                    roomId);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                return mapRoom(rs);
            }
        }

        return null;
    }

    /**
     * Find available rooms
     */
    public List<Room> findAvailableRooms(
            java.time.LocalDate checkIn,
            java.time.LocalDate checkOut,
            int guests)
            throws Exception {

        List<Room> rooms =
                new ArrayList<>();

        String sql = """
                SELECT
                    r.room_id,
                    r.room_number,
                    r.view_type,
                    r.room_status_id,
                    rt.room_type_id,
                    rt.room_type_name,
                    rt.description,
                    rt.price_per_night,
                    rt.max_guests,
                    rt.bed_count
                FROM room r
                INNER JOIN room_type rt
                    ON r.room_type_id = rt.room_type_id
                WHERE rt.max_guests >= ?
                AND r.room_status_id = 1
                AND r.room_id NOT IN
                (
                    SELECT room_id
                    FROM reservation
                    WHERE status_id IN (1,2)
                    AND check_in_date < ?
                    AND check_out_date > ?
                )
                ORDER BY rt.price_per_night
                """;

        try (Connection conn =
                     DBConnection.getConnection();

             PreparedStatement ps =
                     conn.prepareStatement(sql)) {

            ps.setInt(
                    1,
                    guests);

            ps.setDate(
                    2,
                    Date.valueOf(checkOut));

            ps.setDate(
                    3,
                    Date.valueOf(checkIn));

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                rooms.add(
                        mapRoom(rs));
            }
        }

        return rooms;
    }

    /**
     * Get room amenities
     */
    public List<String> getRoomAmenities(
            int roomId)
            throws Exception {

        List<String> amenities =
                new ArrayList<>();

        String sql = """
                SELECT a.amenity_name
                FROM room_amenity ra
                INNER JOIN amenity a
                    ON ra.amenity_id = a.amenity_id
                WHERE ra.room_id = ?
                ORDER BY a.amenity_name
                """;

        try (Connection conn =
                     DBConnection.getConnection();

             PreparedStatement ps =
                     conn.prepareStatement(sql)) {

            ps.setInt(
                    1,
                    roomId);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                amenities.add(
                        rs.getString(
                                "amenity_name"));
            }
        }

        return amenities;
    }

    /**
     * Featured rooms
     */
    public List<Room> getFeaturedRooms()
            throws Exception {

        List<Room> rooms =
                new ArrayList<>();

        String sql = """
                SELECT
                    r.room_id,
                    r.room_number,
                    r.view_type,
                    r.room_status_id,
                    rt.room_type_id,
                    rt.room_type_name,
                    rt.description,
                    rt.price_per_night,
                    rt.max_guests,
                    rt.bed_count
                FROM room r
                INNER JOIN room_type rt
                    ON r.room_type_id = rt.room_type_id
                WHERE r.room_status_id = 1
                ORDER BY rt.price_per_night
                LIMIT 3
                """;

        try (Connection conn =
                     DBConnection.getConnection();

             PreparedStatement ps =
                     conn.prepareStatement(sql);

             ResultSet rs =
                     ps.executeQuery()) {

            while (rs.next()) {

                rooms.add(
                        mapRoom(rs));
            }
        }

        return rooms;
    }

    /**
     * Check room availability
     *
     * Active statuses:
     * 1 = Pending
     * 2 = Confirmed
     */
    public boolean isRoomAvailable(
            int roomId,
            java.time.LocalDate checkIn,
            java.time.LocalDate checkOut)
            throws Exception {

        String sql = """
                SELECT COUNT(*)
                FROM reservation
                WHERE room_id = ?
                AND status_id IN (1,2)
                AND check_in_date < ?
                AND check_out_date > ?
                """;

        try (Connection conn =
                     DBConnection.getConnection();

             PreparedStatement ps =
                     conn.prepareStatement(sql)) {

            ps.setInt(
                    1,
                    roomId);

            ps.setDate(
                    2,
                    Date.valueOf(checkOut));

            ps.setDate(
                    3,
                    Date.valueOf(checkIn));

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                return rs.getInt(1) == 0;
            }
        }

        return false;
    }

    /**
     * Count available rooms
     */
    public int getAvailableRoomCount()
            throws Exception {

        String sql = """
                SELECT COUNT(*)
                FROM room
                WHERE room_status_id = 1
                """;

        try (Connection conn =
                     DBConnection.getConnection();

             PreparedStatement ps =
                     conn.prepareStatement(sql);

             ResultSet rs =
                     ps.executeQuery()) {

            if (rs.next()) {

                return rs.getInt(1);
            }
        }

        return 0;
    }

    /**
     * Map result set to Room bean
     */
    private Room mapRoom(ResultSet rs)
            throws Exception {

        Room room =
                new Room();

        room.setRoomId(
                rs.getInt(
                        "room_id"));

        room.setRoomNumber(
                rs.getString(
                        "room_number"));

        room.setRoomTypeId(
                rs.getInt(
                        "room_type_id"));

        room.setRoomTypeName(
                rs.getString(
                        "room_type_name"));

        room.setRoomStatusId(
                rs.getInt(
                        "room_status_id"));

        room.setViewType(
                rs.getString(
                        "view_type"));

        room.setDescription(
                rs.getString(
                        "description"));

        room.setPricePerNight(
                rs.getDouble(
                        "price_per_night"));

        room.setMaxGuests(
                rs.getInt(
                        "max_guests"));

        room.setImageUrl(
                getImageByRoomType(
                        rs.getInt(
                                "room_type_id")));

        return room;
    }

    /**
     * Room images
     */
    private String getImageByRoomType(
            int roomTypeId) {

        return switch (roomTypeId) {

            case 1 ->
                    "images/rooms/double-full.jpg";

            case 2 ->
                    "images/rooms/queen.jpg";

            case 3 ->
                    "images/rooms/double-queen.jpg";

            case 4 ->
                    "images/rooms/king.jpg";

            default ->
                    "images/rooms/default-room.jpg";
        };
    }
}