package com.moffatbay.servlet;

import com.moffatbay.bean.UserBean;
import com.moffatbay.dao.UserDAO;
import com.moffatbay.util.PasswordUtil;
import com.moffatbay.util.TokenGenerator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        String rememberMe =
                request.getParameter("rememberMe");

        // Validation
        if (email == null || email.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {

            response.sendRedirect(
                    "login.jsp?error=emptyfields");

            return;
        }

        // Find user
        UserBean user =
                userDAO.findByEmail(email);

        if (user == null) {

            response.sendRedirect(
                    "login.jsp?error=invalid");

            return;
        }

        // Verify BCrypt password
        boolean validPassword =
                PasswordUtil.verifyPassword(
                        password,
                        user.getPasswordHash());

        if (!validPassword) {

            response.sendRedirect(
                    "login.jsp?error=invalid");

            return;
        }

        // Create Session
        HttpSession session =
                request.getSession(true);

        session.setAttribute(
                "loggedInUser",
                user);

        session.setMaxInactiveInterval(
                30 * 60); // 30 minutes

        // Remember Me
        if (rememberMe != null) {

            String token =
                    TokenGenerator.generateToken();

            boolean saved =
                    userDAO.saveRememberToken(
                            email,
                            token);

            if (saved) {

                Cookie rememberCookie =
                        new Cookie(
                                "rememberToken",
                                token);

                rememberCookie.setHttpOnly(true);

                rememberCookie.setMaxAge(
                        60 * 60 * 24 * 30); // 30 days

                rememberCookie.setPath("/");

                response.addCookie(
                        rememberCookie);
            }
        }

        response.sendRedirect(
                "dashboard.jsp");
    }
}