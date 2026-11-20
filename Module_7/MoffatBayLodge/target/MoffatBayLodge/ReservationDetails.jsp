<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Details | Moffat Bay Lodge</title>

<style>

body{
    font-family:Arial,sans-serif;
    background:#f4f6f9;
    margin:0;
}

.container{
    width:90%;
    max-width:1000px;
    margin:30px auto;
}

.card{
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 2px 10px rgba(0,0,0,.1);
}

.page-title{
    text-align:center;
    color:#003366;
    margin-bottom:30px;
}

.detail-row{
    display:flex;
    justify-content:space-between;
    padding:12px 0;
    border-bottom:1px solid #eee;
}

.label{
    font-weight:bold;
    color:#555;
}

.value{
    color:#222;
}

.confirmation{
    font-size:24px;
    color:#006699;
    font-weight:bold;
}

.status{
    padding:6px 12px;
    border-radius:20px;
    color:white;
    font-weight:bold;
}

.confirmed{
    background:#28a745;
}

.pending{
    background:#ffc107;
    color:black;
}

.cancelled{
    background:#dc3545;
}

.checkedin{
    background:#17a2b8;
}

.checkedout{
    background:#6c757d;
}

.button-area{
    margin-top:30px;
    display:flex;
    gap:15px;
}

.btn{
    text-decoration:none;
    padding:12px 20px;
    border-radius:5px;
    color:white;
    text-align:center;
}

.btn-primary{
    background:#006699;
}

.btn-primary:hover{
    background:#004466;
}

.btn-danger{
    background:#dc3545;
}

.btn-danger:hover{
    background:#b02a37;
}

.btn-secondary{
    background:#6c757d;
}

.btn-secondary:hover{
    background:#555;
}

.special-request{
    background:#f8f9fa;
    padding:15px;
    border-radius:5px;
    margin-top:10px;
}

</style>

</head>

<body>

<div class="container">

<div class="card">

<h1 class="page-title">
Reservation Details
</h1>

<div class="detail-row">

<span class="label">
Confirmation Number
</span>

<span class="confirmation">
MBL-${reservation.reservationId}
</span>

</div>

<div class="detail-row">

<span class="label">
Reservation ID
</span>

<span class="value">
${reservation.reservationId}
</span>

</div>

<div class="detail-row">

<span class="label">
Customer ID
</span>

<span class="value">
${reservation.customerId}
</span>

</div>

<div class="detail-row">

<span class="label">
Room ID
</span>

<span class="value">
${reservation.roomId}
</span>

</div>

<div class="detail-row">

<span class="label">
Check-In Date
</span>

<span class="value">
${reservation.checkInDate}
</span>

</div>

<div class="detail-row">

<span class="label">
Check-Out Date
</span>

<span class="value">
${reservation.checkOutDate}
</span>

</div>

<div class="detail-row">

<span class="label">
Number of Guests
</span>

<span class="value">
${reservation.guestCount}
</span>

</div>

<div class="detail-row">

<span class="label">
Number of Nights
</span>

<span class="value">
${reservation.totalNights}
</span>

</div>

<div class="detail-row">

<span class="label">
Reservation Status
</span>

<span>

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
<span class="status checkedin">
Checked In
</span>
</c:when>

<c:when test="${reservation.statusId == 4}">
<span class="status checkedout">
Checked Out
</span>
</c:when>

<c:when test="${reservation.statusId == 5}">
<span class="status cancelled">
Cancelled
</span>
</c:when>

<c:otherwise>
<span class="status confirmed">
Active
</span>
</c:otherwise>

</c:choose>

</span>

</div>

<div class="detail-row">

<span class="label">
Total Cost
</span>

<span class="value">
$${reservation.totalCost}
</span>

</div>

<h3>
Special Requests
</h3>

<div class="special-request">

<c:choose>

<c:when test="${empty reservation.specialRequests}">
No special requests submitted.
</c:when>

<c:otherwise>
${reservation.specialRequests}
</c:otherwise>

</c:choose>

</div>

<div class="button-area">

<a href="${pageContext.request.contextPath}/MyReservationsServlet"
   class="btn btn-secondary">

Back To Reservations

</a>

<c:if test="${reservation.statusId != 5}">

<a href="${pageContext.request.contextPath}/CancelReservationServlet?reservationId=${reservation.reservationId}"
   class="btn btn-danger"
   onclick="return confirm('Are you sure you want to cancel this reservation?');">

Cancel Reservation

</a>

</c:if>

</div>

</div>

</div>

</body>
</html>