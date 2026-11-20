package com.moffatbay.servlet;

import com.moffatbay.bean.Room;
import com.moffatbay.dao.RoomDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/RoomsServlet")
public class RoomsServlet extends HttpServlet {

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

        try {

            List<Room> rooms =
                    roomDAO.getAllRooms();

            request.setAttribute(
                    "rooms",
                    rooms);

            request.setAttribute(
                    "roomCount",
                    rooms.size());

            if (rooms.isEmpty()) {

                request.setAttribute(
                        "message",
                        "No rooms are currently available.");
            }

            request.getRequestDispatcher(
                    "/Rooms.jsp")
                    .forward(
                            request,
                            response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to load rooms.");

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

        doGet(
                request,
                response);
    }
}