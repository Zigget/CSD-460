package com.moffatbay.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Destroy the current session
        HttpSession session =
                request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        // Remove Remember Me cookie
        Cookie rememberCookie =
                new Cookie("rememberToken", "");

        rememberCookie.setMaxAge(0);
        rememberCookie.setPath("/");
        rememberCookie.setHttpOnly(true);

        response.addCookie(rememberCookie);

        // Redirect to login page
        response.sendRedirect(
                "login.jsp?logout=success");
    }
}