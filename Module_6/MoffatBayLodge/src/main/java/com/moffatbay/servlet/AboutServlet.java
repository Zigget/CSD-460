
package com.moffatbay.servlet;

import com.moffatbay.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Moffat Bay Lodge - About Us Servlet
 * CSD-460 Team Project
 *
 * Retrieves lodge information from the database
 * and forwards it to the About Us JSP page.
 */
@WebServlet("/about")
public class AboutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String sql = "SELECT lodge_name, about_description "
                   + "FROM lodge_info WHERE lodge_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, 1);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    request.setAttribute(
                        "lodgeName", rs.getString("lodge_name"));

                    request.setAttribute(
                        "aboutDescription",
                        rs.getString("about_description"));
                } else {
                    request.setAttribute(
                        "errorMessage",
                        "Lodge information is unavailable.");
                }
            }

        } catch (SQLException e) {
            log("Unable to load lodge information", e);
            request.setAttribute(
                "errorMessage",
                "Unable to load lodge information.");
        }

        request.getRequestDispatcher("/about.jsp")
               .forward(request, response);
    }
}
