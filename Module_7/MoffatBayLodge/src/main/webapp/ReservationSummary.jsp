<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.moffatbay.bean.Reservation" %>

<%
Reservation reservation =
        (Reservation) session.getAttribute(
                "reservation");

Integer reservationId =
        (Integer) session.getAttribute(
                "reservationId");

String confirmationNumber =
        (String) session.getAttribute(
                "confirmationNumber");

if (reservation == null) {

    response.sendRedirect(
            request.getContextPath()
                    + "/RoomsServlet");

    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Reservation Summary</title>

<style>

body{
    font-family:Arial,sans-serif;
    background:#f4f6f9;
    margin:0;
}

.container{
    width:90%;
    max-width:900px;
    margin:40px auto;
}

.card{
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 2px 10px rgba(0,0,0,.1);
}

h1{
    color:#003366;
    text-align:center;
}

.summary-row{
    display:flex;
    justify-content:space-between;
    padding:12px 0;
    border-bottom:1px solid #ddd;
}

.label{
    font-weight:bold;
}

.confirmation{
    background:#e8f5e9;
    color:#2e7d32;
    padding:15px;
    border-radius:5px;
    text-align:center;
    margin-bottom:20px;
    font-size:20px;
    font-weight:bold;
}

.button-row{
    display:flex;
    gap:15px;
    justify-content:center;
    margin-top:25px;
}

.btn{
    padding:12px 24px;
    border:none;
    border-radius:5px;
    cursor:pointer;
    color:white;
    font-size:16px;
    text-decoration:none;
}

.btn-confirm{
    background:#28a745;
}

.btn-confirm:hover{
    background:#218838;
}

.btn-cancel{
    background:#dc3545;
}

.btn-cancel:hover{
    background:#c82333;
}

</style>

</head>

<body>

<div class="container">

<div class="card">

<h1>

Reservation Summary

</h1>

<div class="confirmation">

Confirmation Number:
<%= confirmationNumber %>

</div>

<div class="summary-row">

<span class="label">
Reservation ID
</span>

<span>

<%= reservationId %>

</span>

</div>

<div class="summary-row">

<span class="label">
Room ID
</span>

<span>

<%= reservation.getRoomId() %>

</span>

</div>

<div class="summary-row">

<span class="label">
Check-In Date
</span>

<span>

<%= reservation.getCheckInDate() %>

</span>

</div>

<div class="summary-row">

<span class="label">
Check-Out Date
</span>

<span>

<%= reservation.getCheckOutDate() %>

</span>

</div>

<div class="summary-row">

<span class="label">
Guest Count
</span>

<span>

<%= reservation.getGuestCount() %>

</span>

</div>

<div class="summary-row">

<span class="label">
Total Nights
</span>

<span>

<%= reservation.getTotalNights() %>

</span>

</div>

<div class="summary-row">

<span class="label">
Total Cost
</span>

<span>

$<%= reservation.getTotalCost() %>

</span>

</div>

<div class="summary-row">

<span class="label">
Special Requests
</span>

<span>

<%= reservation.getSpecialRequests() == null
        ? "None"
        : reservation.getSpecialRequests() %>

</span>

</div>

<div class="button-row">

<form action="<%=request.getContextPath()%>/Confirmation.jsp"
      method="get">

    <button type="submit"
            class="btn btn-confirm">

        Confirm Reservation

    </button>

</form>

<form action="<%=request.getContextPath()%>/CancelReservationServlet"
      method="post">

    <input type="hidden"
           name="reservationId"
           value="<%= reservationId %>">

    <button type="submit"
            class="btn btn-cancel"
            onclick="return confirm('Are you sure you want to cancel this reservation?');">

        Cancel Reservation

    </button>

</form>

</div>

</div>

</div>

</body>
</html>