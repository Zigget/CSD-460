
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Moffat Bay Lodge | Register</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="login-page">
<%
    String error = request.getParameter("error");
%>

<div class="login-container">
    <div class="glass-card">

        <div class="brand">
            <h1>Moffat Bay Lodge</h1>
            <p>Create Your Guest Account</p>
        </div>

        <!-- Error Messages -->
        <% if ("emailExists".equals(error)) { %>
            <div class="error-message">
                An account with this email already exists.
            </div>
        <% } %>

        <% if ("passwordmismatch".equals(error)) { %>
            <div class="error-message">
                Passwords do not match.
            </div>
        <% } %>

        <% if ("weakpassword".equals(error)) { %>
            <div class="error-message">
                Password must be at least 8 characters long.
            </div>
        <% } %>

        <% if ("emptyfields".equals(error)) { %>
            <div class="error-message">
                Please complete all fields.
            </div>
        <% } %>

        <% if ("registrationfailed".equals(error)) { %>
            <div class="error-message">
                Registration failed. Please try again.
            </div>
        <% } %>

        <br>

        <!-- Registration Form -->
        <form action="RegisterServlet" method="post">

            <!-- First Name -->
            <div class="form-group">
                <label for="firstName">
                    First Name
                </label>
                <input
                    type="text"
                    id="firstName"
                    name="firstName"
                    maxlength="50"
                    autocomplete="given-name"
                    required>
            </div>

            <!-- Last Name -->
            <div class="form-group">
                <label for="lastName">
                    Last Name
                </label>
                <input
                    type="text"
                    id="lastName"
                    name="lastName"
                    maxlength="50"
                    autocomplete="family-name"
                    required>
            </div>

            <!-- Email Address -->
            <div class="form-group">
                <label for="email">
                    Email Address
                </label>
                <input
                    type="email"
                    id="email"
                    name="email"
                    maxlength="100"
                    autocomplete="email"
                    required>
            </div>

            <!-- Phone Number -->
            <div class="form-group">
                <label for="phoneNumber">
                    Phone Number
                </label>
                <input
                    type="tel"
                    id="phoneNumber"
                    name="phoneNumber"
                    placeholder="402-555-1234"
                    maxlength="25"
                    autocomplete="tel"
                    required>
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="password">
                    Password
                </label>
                <input
                    type="password"
                    id="password"
                    name="password"
                    minlength="8"
                    autocomplete="new-password"
                    required>
            </div>

            <!-- Confirm Password -->
            <div class="form-group">
                <label for="confirmPassword">
                    Confirm Password
                </label>
                <input
                    type="password"
                    id="confirmPassword"
                    name="confirmPassword"
                    minlength="8"
                    autocomplete="new-password"
                    required>
            </div>

            <!-- Password Requirements -->
            <div class="requirements">
                <h4>Password Requirements</h4>
                <ul>
                    <li>Minimum of 8 characters</li>
                    <li>Include uppercase letters</li>
                    <li>Include lowercase letters</li>
                    <li>Include numbers</li>
                </ul>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn-primary">
                Create Account
            </button>

        </form>

        <br>

        <!-- Sign In or Continue as Guest -->
        <div class="exit-register">
            <ul>
                <li>Already have an account?</li>
                <li>
                    <a href="login.jsp" class="btn-primary">
                        Sign In
                    </a>
                    Or
                    <a href="index.jsp" class="btn-primary">
                        Continue as Guest
                    </a>
                </li>
            </ul>
        </div>

    </div>
</div>

</body>
</html>
