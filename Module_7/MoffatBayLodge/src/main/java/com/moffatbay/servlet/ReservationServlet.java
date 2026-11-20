package com.moffatbay.servlet;

import com.moffatbay.bean.Reservation;
import com.moffatbay.bean.Room;
import com.moffatbay.bean.UserBean;
import com.moffatbay.dao.ReservationDAO;
import com.moffatbay.dao.RoomDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {

    private ReservationDAO reservationDAO;
    private RoomDAO roomDAO;

    @Override
    public void init() throws ServletException {

        reservationDAO = new ReservationDAO();
        roomDAO = new RoomDAO();
    }

    private void returnToReservationPage(
            HttpServletRequest request,
            HttpServletResponse response,
            int roomId,
            String errorMessage)
            throws Exception {

        Room room =
                roomDAO.getRoomById(roomId);

        request.setAttribute(
                "room",
                room);

        request.setAttribute(
                "errorMessage",
                errorMessage);

        request.getRequestDispatcher(
                "/Reservation.jsp")
                .forward(
                        request,
                        response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session =
                    request.getSession(false);

            if (session == null) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/login.jsp");

                return;
            }

            UserBean user =
                    (UserBean) session.getAttribute(
                            "loggedInUser");

            if (user == null) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/login.jsp");

                return;
            }

            int roomId =
                    Integer.parseInt(
                            request.getParameter(
                                    "roomId"));

            LocalDate checkIn =
                    LocalDate.parse(
                            request.getParameter(
                                    "checkIn"));

            LocalDate checkOut =
                    LocalDate.parse(
                            request.getParameter(
                                    "checkOut"));

            long nights =
                    ChronoUnit.DAYS.between(
                            checkIn,
                            checkOut);

            if (nights <= 0) {

                returnToReservationPage(
                        request,
                        response,
                        roomId,
                        "Check-out date must be after check-in date.");

                return;
            }

            Reservation reservation =
                    new Reservation();

            reservation.setCustomerId(
                    user.getUserId());

            reservation.setRoomId(
                    roomId);

            reservation.setStatusId(1);

            reservation.setCheckInDate(
                    checkIn);

            reservation.setCheckOutDate(
                    checkOut);

            reservation.setGuestCount(
                    Integer.parseInt(
                            request.getParameter(
                                    "guestCount")));

            reservation.setTotalNights(
                    (int) nights);

            reservation.setTotalCost(
                    Double.parseDouble(
                            request.getParameter(
                                    "totalCost")));

            reservation.setSpecialRequests(
                    request.getParameter(
                            "specialRequests"));

            int reservationId =
                    reservationDAO.createReservation(
                            reservation);

            reservation.setReservationId(
                    reservationId);

            session.setAttribute(
                    "reservation",
                    reservation);

            session.setAttribute(
                    "reservationId",
                    reservationId);

            session.setAttribute(
                    "confirmationNumber",
                    "MBL-"
                            + String.format(
                                    "%06d",
                                    reservationId));

            response.sendRedirect(
                    request.getContextPath()
                            + "/ReservationSummary.jsp");

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    e.getMessage());

            request.getRequestDispatcher(
                    "/error.jsp")
                    .forward(
                            request,
                            response);
        }
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(
                request.getContextPath()
                        + "/RoomsServlet");
    }
}