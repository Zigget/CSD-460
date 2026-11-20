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

@WebServlet("/RoomDetailsServlet")
public class RoomDetailsServlet extends HttpServlet {

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

            String roomIdParam =
                    request.getParameter(
                            "roomId");

            if (roomIdParam == null
                    || roomIdParam.isBlank()) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/RoomsServlet");

                return;
            }

            int roomId =
                    Integer.parseInt(
                            roomIdParam);

            Room room =
                    roomDAO.getRoomById(
                            roomId);

            if (room == null) {

                request.setAttribute(
                        "errorMessage",
                        "The requested room could not be found.");

                request.getRequestDispatcher(
                        "/error.jsp")
                        .forward(
                                request,
                                response);

                return;
            }

            /*
             * Load amenities if RoomDAO supports it
             */
            try {

                List<String> amenities =
                        roomDAO.getRoomAmenities(
                                roomId);

                request.setAttribute(
                        "amenities",
                        amenities);

            } catch (Exception e) {

                /*
                 * Continue even if amenities
                 * are unavailable.
                 */
                e.printStackTrace();
            }

            request.setAttribute(
                    "room",
                    room);

            request.getRequestDispatcher(
                    "/RoomDetails.jsp")
                    .forward(
                            request,
                            response);

        } catch (NumberFormatException e) {

            request.setAttribute(
                    "errorMessage",
                    "Invalid room ID.");

            request.getRequestDispatcher(
                    "/error.jsp")
                    .forward(
                            request,
                            response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to load room details.");

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