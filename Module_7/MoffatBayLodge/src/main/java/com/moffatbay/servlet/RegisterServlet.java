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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get registration form values
        String firstName =
                request.getParameter("firstName");

        String lastName =
                request.getParameter("lastName");

        String email =
                request.getParameter("email");

        // Get phone number
        String phoneNumber =
                request.getParameter("phoneNumber");

        String password =
                request.getParameter("password");

        String confirmPassword =
                request.getParameter("confirmPassword");

        // Validate required fields
        if (firstName == null || firstName.trim().isEmpty()
                || lastName == null || lastName.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || phoneNumber == null || phoneNumber.trim().isEmpty()
                || password == null || password.trim().isEmpty()
                || confirmPassword == null || confirmPassword.trim().isEmpty()) {

            response.sendRedirect(
                    "register.jsp?error=emptyfields");

            return;
        }

        // Check that passwords match
        if (!password.equals(confirmPassword)) {

            response.sendRedirect(
                    "register.jsp?error=passwordmismatch");

            return;
        }

        // Check password length
        if (password.length() < 8) {

            response.sendRedirect(
                    "register.jsp?error=weakpassword");

            return;
        }

        // Check if email already exists
        if (userDAO.emailExists(email)) {

            response.sendRedirect(
                    "register.jsp?error=emailExists");

            return;
        }

        // Hash password before saving
        String passwordHash =
                PasswordUtil.hashPassword(password);

        // Create UserBean
        UserBean user = new UserBean();

        user.setFirstName(firstName.trim());
        user.setLastName(lastName.trim());
        user.setEmail(email.trim());
        user.setPhoneNumber(phoneNumber.trim());
        user.setPasswordHash(passwordHash);

        // Save customer to database
        boolean registered =
                userDAO.registerUser(user);

        if (registered) {

            // Registration successful
            response.sendRedirect(
                    "login.jsp?registration=success");

        } else {

            // Registration failed
            response.sendRedirect(
                    "register.jsp?error=registrionfailed");
        }
    }
}
