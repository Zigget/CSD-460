<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    if (session.getAttribute("loggedInUser") == null) {

        response.sendRedirect(
                request.getContextPath()
                        + "/login.jsp");

        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>My Reservations - Moffat Bay Lodge</title>

<style>

body{
    font-family:Arial,sans-serif;
    background:#f4f6f9;
    margin:0;
}

.container{
    width:90%;
    max-width:1200px;
    margin:30px auto;
}

.page-header{
    text-align:center;
    margin-bottom:30px;
}

.page-header h1{
    color:#003366;
}

.message{
    padding:15px;
    border-radius:5px;
    margin-bottom:20px;
}

.success{
    background:#d4edda;
    color:#155724;
    border:1px solid #c3e6cb;
}

.error{
    background:#f8d7da;
    color:#721c24;
    border:1px solid #f5c6cb;
}

.reservation-card{
    background:white;
    padding:25px;
    margin-bottom:20px;
    border-radius:10px;
    box-shadow:0 2px 10px rgba(0,0,0,.1);
}

.reservation-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.confirmation{
    font-size:22px;
    font-weight:bold;
    color:#003366;
}

.status{
    padding:6px 12px;
    border-radius:20px;
    color:white;
    font-size:14px;
}

.pending{
    background:#ffc107;
    color:black;
}

.confirmed{
    background:#28a745;
}

.cancelled{
    background:#dc3545;
}

.completed{
    background:#17a2b8;
}

.details{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:15px;
    margin-top:15px;
}

.detail-item{
    padding:10px;
    background:#f8f9fa;
    border-radius:5px;
}

.label{
    font-weight:bold;
    color:#555;
    margin-bottom:5px;
}

.actions{
    margin-top:25px;
}

.btn{
    display:inline-block;
    padding:10px 18px;
    text-decoration:none;
    border-radius:5px;
    margin-right:10px;
    color:white;
}

.btn-view{
    background:#006699;
}

.btn-view:hover{
    background:#004466;
}

.btn-cancel{
    background:#dc3545;
}

.btn-cancel:hover{
    background:#b52a37;
}

.empty{
    background:white;
    text-align:center;
    padding:40px;
    border-radius:10px;
    box-shadow:0 2px 10px rgba(0,0,0,.1);
}

.empty a{
    margin-top:15px;
}

</style>

</head>

<body>

<div class="container">

<div class="page-header">

    <h1>My Reservations</h1>

</div>

<c:if test="${not empty sessionScope.successMessage}">

    <div class="message success">

        ${sessionScope.successMessage}

    </div>

    <c:remove var="successMessage"
              scope="session"/>

</c:if>

<c:if test="${not empty sessionScope.errorMessage}">

    <div class="message error">

        ${sessionScope.errorMessage}

    </div>

    <c:remove var="errorMessage"
              scope="session"/>

</c:if>

<c:choose>

    <c:when test="${empty reservations}">

        <div class="empty">

            <h2>No Reservations Found</h2>

            <p>
                You do not currently have any reservations.
            </p>

            <a href="${pageContext.request.contextPath}/RoomsServlet"
               class="btn btn-view">

                Browse Rooms

            </a>

        </div>

    </c:when>

    <c:otherwise>

        <c:forEach var="reservation"
                   items="${reservations}">

            <div class="reservation-card">

                <div class="reservation-header">

                    <div class="confirmation">

                        MBL-${reservation.reservationId}

                    </div>

                    <div>

                        <c:choose>

                            <c:when test="${reservation.statusId == 1}">
                                <span class="status pending">
                                    Pending
                                </span>
                            </c:when>

                            <c:when test="${reservation.statusId == 2}">
                                <span class="status confirmed">
                                    Confirmed
                                </span>
                            </c:when>

                            <c:when test="${reservation.statusId == 3}">
                                <span class="status cancelled">
                                    Cancelled
                                </span>
                            </c:when>

                            <c:when test="${reservation.statusId == 4}">
                                <span class="status completed">
                                    Completed
                                </span>
                            </c:when>

                            <c:when test="${reservation.statusId == 5}">
                                <span class="status confirmed">
                                    Checked In
                                </span>
                            </c:when>

                            <c:when test="${reservation.statusId == 6}">
                                <span class="status completed">
                                    Checked Out
                                </span>
                            </c:when>

                            <c:when test="${reservation.statusId == 7}">
                                <span class="status cancelled">
                                    No Show
                                </span>
                            </c:when>

                            <c:otherwise>
                                <span class="status confirmed">
                                    Active
                                </span>
                            </c:otherwise>

                        </c:choose>

                    </div>

                </div>

                <div class="details">

                    <div class="detail-item">

                        <div class="label">
                            Reservation ID
                        </div>

                        <div>
                            ${reservation.reservationId}
                        </div>

                    </div>

                    <div class="detail-item">

                        <div class="label">
                            Check-In Date
                        </div>

                        <div>
                            ${reservation.checkInDate}
                        </div>

                    </div>

                    <div class="detail-item">

                        <div class="label">
                            Check-Out Date
                        </div>

                        <div>
                            ${reservation.checkOutDate}
                        </div>

                    </div>

                    <div class="detail-item">

                        <div class="label">
                            Guests
                        </div>

                        <div>
                            ${reservation.guestCount}
                        </div>

                    </div>

                    <div class="detail-item">

                        <div class="label">
                            Total Nights
                        </div>

                        <div>
                            ${reservation.totalNights}
                        </div>

                    </div>

                    <div class="detail-item">

                        <div class="label">
                            Total Cost
                        </div>

                        <div>
                            $${reservation.totalCost}
                        </div>

                    </div>

                </div>

                <div class="actions">

                    <a href="${pageContext.request.contextPath}/ReservationDetailsServlet?reservationId=${reservation.reservationId}"
                       class="btn btn-view">

                        View Details

                    </a>

                    <c:if test="${reservation.statusId == 1 || reservation.statusId == 2}">

                        <a href="${pageContext.request.contextPath}/CancelReservationServlet?reservationId=${reservation.reservationId}"
                           class="btn btn-cancel"
                           onclick="return confirm('Are you sure you want to cancel this reservation?');">

                            Cancel Reservation

                        </a>

                    </c:if>

                </div>

            </div>

        </c:forEach>

    </c:otherwise>

</c:choose>

</div>

</body>
</html>