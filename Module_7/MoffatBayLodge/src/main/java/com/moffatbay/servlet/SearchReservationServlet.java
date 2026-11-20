package com.moffatbay.servlet;

import com.moffatbay.bean.Reservation;
import com.moffatbay.dao.ReservationDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/SearchReservationServlet")
public class SearchReservationServlet extends HttpServlet {

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

        request.getRequestDispatcher(
                "/reservation/SearchReservation.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String email =
                    request.getParameter("email");

            if (email == null ||
                    email.trim().isEmpty()) {

                request.setAttribute(
                        "errorMessage",
                        "Please enter an email address.");

                request.getRequestDispatcher(
                        "/reservation/SearchReservation.jsp")
                        .forward(
                                request,
                                response);

                return;
            }

            List<Reservation> reservations =
                    reservationDAO.findReservationsByEmail(
                            email.trim());

            request.setAttribute(
                    "email",
                    email);

            request.setAttribute(
                    "reservations",
                    reservations);

            request.getRequestDispatcher(
                    "SearchReservationResults.jsp")
                    .forward(
                            request,
                            response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to search reservations.");

            request.getRequestDispatcher(
                    "SearchReservation.jsp")
                    .forward(
                            request,
                            response);
        }
    }
}