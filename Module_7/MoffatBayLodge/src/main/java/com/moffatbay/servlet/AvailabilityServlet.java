package com.moffatbay.servlet;

import com.moffatbay.bean.Room;
import com.moffatbay.dao.RoomDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/AvailabilityServlet")
public class AvailabilityServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private RoomDAO roomDAO;

    @Override
    public void init() throws ServletException {
        roomDAO = new RoomDAO();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(
                request.getContextPath()
                        + "/SearchRooms.jsp");
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String checkInStr =
                    request.getParameter("checkIn");

            String checkOutStr =
                    request.getParameter("checkOut");

            String adultsStr =
                    request.getParameter("adults");

            String childrenStr =
                    request.getParameter("children");

            LocalDate checkIn =
                    LocalDate.parse(checkInStr);

            LocalDate checkOut =
                    LocalDate.parse(checkOutStr);

            int adults =
                    Integer.parseInt(adultsStr);

            int children =
                    Integer.parseInt(childrenStr);

            int guestCount =
                    adults + children;

            if (checkIn.isBefore(LocalDate.now())) {

                request.setAttribute(
                        "errorMessage",
                        "Check-in date cannot be in the past.");

                request.getRequestDispatcher(
                        "/SearchRooms.jsp")
                        .forward(
                                request,
                                response);

                return;
            }

            if (!checkOut.isAfter(checkIn)) {

                request.setAttribute(
                        "errorMessage",
                        "Check-out date must be after check-in date.");

                request.getRequestDispatcher(
                        "/SearchRooms.jsp")
                        .forward(
                                request,
                                response);

                return;
            }

            List<Room> rooms =
                    roomDAO.findAvailableRooms(
                            checkIn,
                            checkOut,
                            guestCount);

            request.setAttribute(
                    "rooms",
                    rooms);

            request.setAttribute(
                    "checkIn",
                    checkIn);

            request.setAttribute(
                    "checkOut",
                    checkOut);

            request.setAttribute(
                    "adults",
                    adults);

            request.setAttribute(
                    "children",
                    children);

            request.setAttribute(
                    "guestCount",
                    guestCount);

            request.setAttribute(
                    "roomCount",
                    rooms.size());

            request.getRequestDispatcher(
                    "/AvailableRooms.jsp")
                    .forward(
                            request,
                            response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to search for available rooms.");

            request.getRequestDispatcher(
                    "/SearchRooms.jsp")
                    .forward(
                            request,
                            response);
        }
    }
}