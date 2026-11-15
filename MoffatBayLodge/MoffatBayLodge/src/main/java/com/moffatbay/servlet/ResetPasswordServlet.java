package com.moffatbay.servlet;

import com.moffatbay.bean.UserBean;
import com.moffatbay.dao.UserDAO;
import com.moffatbay.util.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String token =
                request.getParameter("token");

        String password =
                request.getParameter("password");

        String confirmPassword =
                request.getParameter("confirmPassword");

        // Validate token
        if (token == null || token.trim().isEmpty()) {

            response.sendRedirect(
                    "forgotPassword.jsp?error=invalidtoken");

            return;
        }

        // Validate passwords
        if (password == null || password.trim().isEmpty()
                || confirmPassword == null
                || confirmPassword.trim().isEmpty()) {

            response.sendRedirect(
                    "resetPassword.jsp?token="
                            + token
                            + "&error=empty");

            return;
        }

        // Check password match
        if (!password.equals(confirmPassword)) {

            response.sendRedirect(
                    "resetPassword.jsp?token="
                            + token
                            + "&error=mismatch");

            return;
        }

        // Password strength
        if (password.length() < 8) {

            response.sendRedirect(
                    "resetPassword.jsp?token="
                            + token
                            + "&error=weak");

            return;
        }

        // Find user by reset token
        UserBean user =
                userDAO.getUserByResetToken(token);

        if (user == null) {

            response.sendRedirect(
                    "forgotPassword.jsp?error=tokenexpired");

            return;
        }

        // Hash password
        String hashedPassword =
                PasswordUtil.hashPassword(password);

        // Update password
        boolean updated =
                userDAO.updatePassword(
                        user.getUserId(),
                        hashedPassword);

        if (updated) {

            response.sendRedirect(
                    "login.jsp?reset=success");

        } else {

            response.sendRedirect(
                    "resetPassword.jsp?token="
                            + token
                            + "&error=failed");
        }
    }
}
