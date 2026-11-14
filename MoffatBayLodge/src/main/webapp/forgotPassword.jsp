<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Moffat Bay Lodge | Forgot Password</title>

    <link rel="stylesheet"
          href="css/style.css">

</head>

<body class="login-page">

<%
String error = request.getParameter("error");
String success = request.getParameter("success");
%>

<div class="login-container">

    <div class="glass-card">

        <div class="brand">

            <h1>Moffat Bay Lodge</h1>

            <p>
                Reset Your Password
            </p>

        </div>

        <!-- Success Messages -->

        <% if("emailsent".equals(success)) { %>

            <div class="success-message">
                Password reset instructions have been sent.
            </div>

        <% } %>

        <!-- Error Messages -->

        <% if("emptyemail".equals(error)) { %>

            <div class="error-message">
                Please enter your email address.
            </div>

        <% } %>

        <% if("notfound".equals(error)) { %>

            <div class="error-message">
                No account found with that email address.
            </div>

        <% } %>

        <% if("failed".equals(error)) { %>

            <div class="error-message">
                Unable to process your request.
                Please try again later.
            </div>

        <% } %>

        <% if("tokenexpired".equals(error)) { %>

            <div class="error-message">
                Reset link is invalid or expired.
            </div>

        <% } %>

        <!-- Instructions -->

        <div class="form-info">

            <p>
                Enter the email address associated
                with your account and we'll help
                you reset your password.
            </p>

        </div>

        <!-- Forgot Password Form -->

        <form action="ForgotPasswordServlet"
              method="post">

            <div class="form-group">

                <label for="email">

                    Email Address

                </label>

                <input
                    type="email"
                    id="email"
                    name="email"
                    placeholder="Enter your registered email"
                    maxlength="100"
                    required>

            </div>

            <button type="submit"
                    class="btn-primary">

                Send Reset Link

            </button>

        </form>

        <!-- Navigation Links -->

        <div class="register-section">

            <p>

                Remember your password?

                <a href="login.jsp">

                    Sign In

                </a>

            </p>

        </div>

        <div class="register-section">

            <p>

                Need an account?

                <a href="register.jsp">

                    Create Account

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