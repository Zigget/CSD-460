package com.moffatbay.servlet;

import com.moffatbay.bean.UserBean;
import com.moffatbay.bean.Reservation;
import com.moffatbay.dao.ReservationDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/ReservationDetailsServlet")
public class ReservationDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ReservationDAO reservationDAO;

    @Override
    public void init() throws ServletException {
        reservationDAO = new ReservationDAO();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
                session.getAttribute("customer") == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp");
            return;
        }

        try {

            UserBean user =
                    (UserBean) session.getAttribute(
                            "customer");

            String reservationIdParam =
                    request.getParameter(
                            "reservationId");

            if (reservationIdParam == null ||
                    reservationIdParam.trim().isEmpty()) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/MyReservationsServlet");
                return;
            }

            int reservationId =
                    Integer.parseInt(
                            reservationIdParam);

            Reservation reservation =
                    reservationDAO.findReservationById(
                            reservationId);

            if (reservation == null) {

                request.setAttribute(
                        "errorMessage",
                        "Reservation not found.");

                request.getRequestDispatcher(
                        "/error.jsp")
                        .forward(
                                request,
                                response);

                return;
            }

            if (reservation.getCustomerId()
                    != user.getUserId()) {

                request.setAttribute(
                        "errorMessage",
                        "Access denied.");

                request.getRequestDispatcher(
                        "/error.jsp")
                        .forward(
                                request,
                                response);

                return;
            }

            request.setAttribute(
                    "reservation",
                    reservation);

            request.getRequestDispatcher(
                    "/reservation/ReservationDetails.jsp")
                    .forward(
                            request,
                            response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to load reservation details.");

            request.getRequestDispatcher(
                    "/error.jsp")
                    .forward(
                            request,
                            response);
        }
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}