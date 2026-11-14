<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Moffat Bay Lodge | Register</title>

    <link rel="stylesheet"
          href="css/style.css">

</head>

<body class="login-page">

<%
String error = request.getParameter("error");
%>

<div class="login-container">

    <div class="glass-card">

        <div class="brand">

            <h1>Moffat Bay Lodge</h1>

            <p>
                Create Your Guest Account
            </p>

        </div>

        <!-- Error Messages -->

        <% if("emailExists".equals(error)) { %>

            <div class="error-message">
                An account with this email
                already exists.
            </div>

        <% } %>

        <% if("passwordmismatch".equals(error)) { %>

            <div class="error-message">
                Passwords do not match.
            </div>

        <% } %>

        <% if("weakpassword".equals(error)) { %>

            <div class="error-message">
                Password must be at least
                8 characters long.
            </div>

        <% } %>

        <% if("emptyfields".equals(error)) { %>

            <div class="error-message">
                Please complete all fields.
            </div>

        <% } %>

        <% if("registrationfailed".equals(error)) { %>

            <div class="error-message">
                Registration failed.
                Please try again.
            </div>

        <% } %>

        <form action="RegisterServlet"
              method="post">

            <div class="form-group">

                <label for="firstName">

                    First Name

                </label>

                <input
                    type="text"
                    id="firstName"
                    name="firstName"
                    maxlength="50"
                    required>

            </div>

            <div class="form-group">

                <label for="lastName">

                    Last Name

                </label>

                <input
                    type="text"
                    id="lastName"
                    name="lastName"
                    maxlength="50"
                    required>

            </div>

            <div class="form-group">

                <label for="email">

                    Email Address

                </label>

                <input
                    type="email"
                    id="email"
                    name="email"
                    maxlength="100"
                    required>

            </div>

            <div class="form-group">

                <label for="password">

                    Password

                </label>

                <input
                    type="password"
                    id="password"
                    name="password"
                    minlength="8"
                    required>

            </div>

            <div class="form-group">

                <label for="confirmPassword">

                    Confirm Password

                </label>

                <input
                    type="password"
                    id="confirmPassword"
                    name="confirmPassword"
                    minlength="8"
                    required>

            </div>

            <div class="requirements">

                <h4>Password Requirements</h4>

                <ul>

                    <li>
                        Minimum of 8 characters
                    </li>

                    <li>
                        Include uppercase letters
                    </li>

                    <li>
                        Include lowercase letters
                    </li>

                    <li>
                        Include numbers
                    </li>

                </ul>

            </div>

            <button type="submit"
                    class="btn-primary">

                Create Account

            </button>

        </form>

        <div class="register-section">

            <p>

                Already have an account?

                <a href="login.jsp">

                    Sign In

                </a>

            </p>

        </div>

        <div class="guest-section">

            <a href="guest.jsp"
               class="btn-guest">

                Continue as Guest

            </a>

        </div>

        <div class="home-link">

            <a href="index.jsp">

                ← Return to Home

            </a>

        </div>

    </div>

</div>

</body>

</html>