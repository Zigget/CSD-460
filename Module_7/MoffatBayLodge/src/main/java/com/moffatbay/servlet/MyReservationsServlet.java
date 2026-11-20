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
import java.util.List;

@WebServlet("/MyReservationsServlet")
public class MyReservationsServlet extends HttpServlet {

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
                session.getAttribute("loggedInUser") == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login.jsp");
            return;
        }

        try {

            UserBean user =
                    (UserBean) session.getAttribute(
                            "loggedInUser");

            List<Reservation> reservations =
                    reservationDAO.getReservationsByCustomer(
                            user.getUserId());

            request.setAttribute(
                    "reservations",
                    reservations);

            request.setAttribute(
                    "reservationCount",
                    reservations.size());

            request.getRequestDispatcher(
                    "/reservation/MyReservations.jsp")
                    .forward(
                            request,
                            response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to retrieve reservations.");

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