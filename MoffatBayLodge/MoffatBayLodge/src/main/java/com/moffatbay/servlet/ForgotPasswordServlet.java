package com.moffatbay.servlet;

import com.moffatbay.bean.UserBean;
import com.moffatbay.dao.UserDAO;
import com.moffatbay.util.TokenGenerator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email =
                request.getParameter("email");

        if (email == null || email.trim().isEmpty()) {

            response.sendRedirect(
                    "forgotPassword.jsp?error=emptyemail");
            return;
        }

        UserBean user =
                userDAO.findByEmail(email);

        if (user == null) {

            response.sendRedirect(
                    "forgotPassword.jsp?error=notfound");
            return;
        }

        // Generate secure reset token
        String resetToken =
                TokenGenerator.generateToken();

        boolean saved =
                userDAO.saveResetToken(
                        email,
                        resetToken);

        if (!saved) {

            response.sendRedirect(
                    "forgotPassword.jsp?error=failed");
            return;
        }

        /*
         * Future enhancement:
         * Send reset token by email.
         *
         * Example:
         * https://localhost:8080/MoffatBayLodge/
         * resetPassword.jsp?token=xyz
         */

        response.sendRedirect(
                "resetPassword.jsp?token="
                        + resetToken);
    }
}