
package com.moffatbay.servlet;

import com.moffatbay.bean.UserBean;
import com.moffatbay.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Moffat Bay Lodge
 * CSD-460 Team Project
 *
 * Reservation Summary Servlet
 * Retrieves reservation details for the logged-in customer.
 */
@WebServlet("/reservationSummary")
public class ReservationSummaryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Check whether the customer is logged in
        HttpSession session = request.getSession(false);

        if (session == null ||
            !(session.getAttribute("loggedInUser") instanceof UserBean)) {

            response.sendRedirect(
                request.getContextPath() + "/login.jsp");
            return;
        }

        // Get the logged-in customer's ID
        UserBean user =
            (UserBean) session.getAttribute("loggedInUser");

        int customerId = user.getUserId();

        // Get the requested reservation ID
        int reservationId;

        try {
            reservationId = Integer.parseInt(
                request.getParameter("reservationId"));

            if (reservationId <= 0) {
                throw new NumberFormatException();
            }

        } catch (NumberFormatException e) {
            request.setAttribute(
                "errorMessage", "Invalid reservation ID.");

            request.getRequestDispatcher(
                "/reservationSummary.jsp").forward(request, response);
            return;
        }

        // Retrieve reservation, room, and room type details
        String sql =
            "SELECT r.reservation_id, r.check_in_date, " +
            "r.check_out_date, r.guest_count, " +
            "r.total_nights, r.total_cost, " +
            "rm.room_number, rt.room_type_name " +
            "FROM reservation r " +
            "JOIN room rm ON r.room_id = rm.room_id " +
            "JOIN room_type rt " +
            "ON rm.room_type_id = rt.room_type_id " +
            "WHERE r.reservation_id = ? " +
            "AND r.customer_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt =
                 conn.prepareStatement(sql)) {

            stmt.setInt(1, reservationId);
            stmt.setInt(2, customerId);

            try (ResultSet rs = stmt.executeQuery()) {

                if (rs.next()) {

                    request.setAttribute(
                        "reservationId",
                        rs.getInt("reservation_id"));

                    request.setAttribute(
                        "roomNumber",
                        rs.getString("room_number"));

                    request.setAttribute(
                        "roomType",
                        rs.getString("room_type_name"));

                    request.setAttribute(
                        "checkInDate",
                        rs.getDate("check_in_date"));

                    request.setAttribute(
                        "checkOutDate",
                        rs.getDate("check_out_date"));

                    request.setAttribute(
                        "guestCount",
                        rs.getInt("guest_count"));

                    request.setAttribute(
                        "totalNights",
                        rs.getInt("total_nights"));

                    request.setAttribute(
                        "totalCost",
                        rs.getBigDecimal("total_cost"));

                } else {
                    request.setAttribute(
                        "errorMessage",
                        "Reservation not found.");
                }
            }

        } catch (SQLException e) {

            log("Error retrieving reservation summary", e);

            request.setAttribute(
                "errorMessage",
                "Unable to retrieve reservation details.");
        }

        // Forward the results to the JSP
        request.getRequestDispatcher(
            "/reservationSummary.jsp").forward(request, response);
    }
}
