<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Moffat Bay Lodge | Reset Password</title>

    <link rel="stylesheet"
          href="css/style.css">

</head>

<body class="login-page">

<%
String error = request.getParameter("error");
String token = request.getParameter("token");

if(token == null){
    token = "";
}
%>

<div class="login-container">

    <div class="glass-card">

        <div class="brand">

            <h1>Moffat Bay Lodge</h1>

            <p>
                Create a New Password
            </p>

        </div>

        <!-- Error Messages -->

        <% if("empty".equals(error)) { %>

            <div class="error-message">
                Please complete all password fields.
            </div>

        <% } %>

        <% if("mismatch".equals(error)) { %>

            <div class="error-message">
                Passwords do not match.
            </div>

        <% } %>

        <% if("weak".equals(error)) { %>

            <div class="error-message">
                Password must be at least
                8 characters long.
            </div>

        <% } %>

        <% if("failed".equals(error)) { %>

            <div class="error-message">
                Unable to reset password.
                Please try again.
            </div>

        <% } %>

        <% if("invalidtoken".equals(error)) { %>

            <div class="error-message">
                Invalid reset token.
            </div>

        <% } %>

        <!-- Instructions -->

        <div class="form-info">

            <p>
                Enter a new password for
                your Moffat Bay Lodge account.
            </p>

        </div>

        <!-- Reset Form -->

        <form action="ResetPasswordServlet"
              method="post">

            <!-- Hidden Reset Token -->

            <input type="hidden"
                   name="token"
                   value="<%= token %>">

            <div class="form-group">

                <label for="password">

                    New Password

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
                        Minimum 8 characters
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

                Reset Password

            </button>

        </form>

        <!-- Login Link -->

        <div class="register-section">

            <p>

                Remembered your password?

                <a href="login.jsp">

                    Sign In

                </a>

            </p>

        </div>

        <!-- Home Link -->

        <div class="home-link">

            <a href="index.jsp">

                ← Return to Home

            </a>

        </div>

    </div>

</div>

</body>
</html>