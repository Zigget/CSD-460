<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Moffat Bay Lodge | Login</title>

    <link rel="stylesheet"
          href="css/style.css">

</head>

<body class="login-page">

<%
String error = request.getParameter("error");
String logout = request.getParameter("logout");
String registration = request.getParameter("registration");
String reset = request.getParameter("reset");
%>

<div class="login-container">

    <div class="glass-card">

        <!-- Logo Area -->

        <div class="brand">

            <h1>Moffat Bay Lodge</h1>

            <p>
                Your Coastal Escape Awaits
            </p>

        </div>

        <!-- Messages -->

        <% if ("success".equals(registration)) { %>

            <div class="success-message">
                Registration completed successfully.
                Please log in.
            </div>

        <% } %>

        <% if ("success".equals(reset)) { %>

            <div class="success-message">
                Password reset successful.
                Please log in.
            </div>

        <% } %>

        <% if ("success".equals(logout)) { %>

            <div class="success-message">
                You have successfully logged out.
            </div>

        <% } %>

        <% if ("invalid".equals(error)) { %>

            <div class="error-message">
                Invalid email or password.
            </div>

        <% } %>

        <% if ("emptyfields".equals(error)) { %>

            <div class="error-message">
                Please complete all fields.
            </div>

        <% } %>

        <!-- Login Form -->

        <form action="LoginServlet"
              method="post">

            <div class="form-group">

                <label for="email">

                    Email Address

                </label>

                <input
                    type="email"
                    id="email"
                    name="email"
                    placeholder="Enter your email address"
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
                    placeholder="Enter your password"
                    required>

            </div>

            <div class="form-options">

                <label class="remember-label">

                    <input
                        type="checkbox"
                        name="rememberMe">

                    Remember Me

                </label>

                <a href="forgotPassword.jsp"
                   class="forgot-link">

                    Forgot Password?

                </a>

            </div>

            <button type="submit"
                    class="btn-primary">

                Sign In

            </button>

        </form>

        <!-- Guest Access -->

        <div class="guest-section">

            <p>Just browsing?</p>

            <a href="guest.jsp"
               class="btn-guest">

                Continue as Guest

            </a>

        </div>

        <!-- Register Link -->

        <div class="register-section">

            <p>

                Don't have an account?

                <a href="register.jsp">

                    Create Account

                </a>

            </p>

        </div>

        <!-- Return Home -->

        <div class="home-link">

            <a href="index.jsp">

                ← Return to Home

            </a>

        </div>

    </div>

</div>

</body>

</html>