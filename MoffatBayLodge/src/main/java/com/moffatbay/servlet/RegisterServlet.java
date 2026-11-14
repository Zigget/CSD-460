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

        String firstName =
                request.getParameter("firstName");

        String lastName =
                request.getParameter("lastName");

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        String confirmPassword =
                request.getParameter("confirmPassword");

        // Basic validation
        if (firstName == null || firstName.trim().isEmpty()
                || lastName == null || lastName.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || password == null || password.trim().isEmpty()
                || confirmPassword == null || confirmPassword.trim().isEmpty()) {

            response.sendRedirect(
                    "register.jsp?error=emptyfields");

            return;
        }

        // Password match validation
        if (!password.equals(confirmPassword)) {

            response.sendRedirect(
                    "register.jsp?error=passwordmismatch");

            return;
        }

        // Password strength validation
        if (password.length() < 8) {

            response.sendRedirect(
                    "register.jsp?error=weakpassword");

            return;
        }

        // Check duplicate email
        if (userDAO.emailExists(email)) {

            response.sendRedirect(
                    "register.jsp?error=emailExists");

            return;
        }

        // Hash password
        String passwordHash =
                PasswordUtil.hashPassword(password);

        // Create UserBean
        UserBean user = new UserBean();

        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPasswordHash(passwordHash);

        boolean registered =
                userDAO.registerUser(user);

        if (registered) {

            response.sendRedirect(
                    "login.jsp?registration=success");

        } else {

            response.sendRedirect(
                    "register.jsp?error=registrationfailed");
        }
    }
}