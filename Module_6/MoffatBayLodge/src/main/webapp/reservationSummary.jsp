
<%--
    Moffat Bay Lodge
    CSD-460 Team Project
    Reservation Summary Page

    Description: Displays reservation details
    retrieved by the Reservation Summary Servlet.
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Reservation Summary | Moffat Bay Lodge</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/reservationSummary.css">
</head>

<body>

<header>
    <nav class="navbar">
        <h1>Moffat Bay Lodge</h1>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
            <a href="${pageContext.request.contextPath}/about">About Us</a>
            <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
        </div>
    </nav>
</header>

<main>
    <section class="hero">
        <h2>Reservation Summary</h2>
        <p>Review your reservation details below.</p>
    </section>

    <section class="summary-container">

        <h2>Your Reservation Details</h2>

        <c:choose>
            <c:when test="${not empty reservationId}">

                <table>
                    <tr>
                        <th>Reservation ID</th>
                        <td><c:out value="${reservationId}" /></td>
                    </tr>

                    <tr>
                        <th>Room Number</th>
                        <td><c:out value="${roomNumber}" /></td>
                    </tr>

                    <tr>
                        <th>Room Type</th>
                        <td><c:out value="${roomType}" /></td>
                    </tr>

                    <tr>
                        <th>Check-In Date</th>
                        <td><c:out value="${checkInDate}" /></td>
                    </tr>

                    <tr>
                        <th>Check-Out Date</th>
                        <td><c:out value="${checkOutDate}" /></td>
                    </tr>

                    <tr>
                        <th>Number of Guests</th>
                        <td><c:out value="${guestCount}" /></td>
                    </tr>

                    <tr>
                        <th>Total Nights</th>
                        <td><c:out value="${totalNights}" /></td>
                    </tr>

                    <tr>
                        <th>Total Cost</th>
                        <td>$<c:out value="${totalCost}" /></td>
                    </tr>
                </table>

            </c:when>

            <c:otherwise>
                <p class="message">
                    No reservation details are available.
                </p>
            </c:otherwise>
        </c:choose>

        <div class="buttons">
            <a class="home-button"
               href="${pageContext.request.contextPath}/index.jsp">
                Back to Home
            </a>
        </div>

    </section>
</main>

<footer>
    <p>&copy; 2026 Moffat Bay Lodge. All rights reserved.</p>
</footer>

</body>
</html>
