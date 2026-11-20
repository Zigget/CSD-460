<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Room Reservation</title>

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

.card{
    background:white;
    padding:25px;
    border-radius:10px;
    box-shadow:0 2px 10px rgba(0,0,0,.10);
}

.page-title{
    text-align:center;
    color:#003366;
}

.room-summary{
    margin-bottom:25px;
}

.room-summary h2{
    color:#003366;
}

.form-group{
    margin-bottom:15px;
}

label{
    display:block;
    font-weight:bold;
    margin-bottom:5px;
}

input,
textarea,
select{
    width:100%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:5px;
    box-sizing:border-box;
}

.row{
    display:flex;
    gap:15px;
}

.col{
    flex:1;
}

.error-box{
    background:#ffebee;
    color:#c62828;
    padding:15px;
    border-radius:5px;
    margin-bottom:20px;
}

.btn{
    background:#006699;
    color:white;
    border:none;
    padding:14px 25px;
    border-radius:5px;
    cursor:pointer;
    font-size:16px;
}

.btn:hover{
    background:#004466;
}

.price{
    font-size:22px;
    font-weight:bold;
    color:#006699;
}

@media(max-width:768px){

    .row{
        flex-direction:column;
    }
}

</style>

</head>

<body>

<div class="container">

<c:choose>

<c:when test="${room == null}">

    <div class="card">

        <h2>
            Room Not Found
        </h2>

        <p>
            Reservation information could not be loaded.
        </p>

        <a href="${pageContext.request.contextPath}/RoomsServlet">

            Return to Rooms

        </a>

    </div>

</c:when>

<c:otherwise>

<h1 class="page-title">

    Complete Your Reservation

</h1>

<c:if test="${not empty errorMessage}">

    <div class="error-box">

        ${errorMessage}

    </div>

</c:if>

<div class="card room-summary">

    <h2>

        ${room.roomTypeName}

    </h2>

    <p>

        ${room.description}

    </p>

    <p>

        Room Number:
        ${room.roomNumber}

    </p>

    <p>

        View:
        ${room.viewType}

    </p>

    <p>

        Maximum Guests:
        ${room.maxGuests}

    </p>

    <div class="price">

        $${room.pricePerNight}
        per night

    </div>

</div>

<form action="${pageContext.request.contextPath}/ReservationServlet"
      method="post">

    <input type="hidden"
           name="roomId"
           value="${room.roomId}">

    <input type="hidden"
           name="guestCount"
           id="guestCount"
           value="1">

    <input type="hidden"
           name="totalCost"
           id="totalCost"
           value="${room.pricePerNight}">

    <div class="card">

        <h2>
            Reservation Details
        </h2>

        <div class="row">

            <div class="col">

                <label>
                    Check-In Date
                </label>

                <input type="date"
                       name="checkIn"
                       required>

            </div>

            <div class="col">

                <label>
                    Check-Out Date
                </label>

                <input type="date"
                       name="checkOut"
                       required>

            </div>

        </div>

        <div class="row">

            <div class="col">

                <label>
                    Adults
                </label>

                <select id="adultCount">

                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>

                </select>

            </div>

            <div class="col">

                <label>
                    Children
                </label>

                <select id="childCount">

                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>

                </select>

            </div>

        </div>

        <div class="form-group">

            <label>
                Special Requests
            </label>

            <textarea name="specialRequests"
                      rows="4"></textarea>

        </div>

        <button type="submit"
                class="btn">

            Continue to Reservation Summary

        </button>

    </div>

</form>

</c:otherwise>

</c:choose>

</div>

<script>

const adults =
        document.getElementById(
                "adultCount");

const children =
        document.getElementById(
                "childCount");

if(adults && children){

    function updateGuests(){

        let total =
                parseInt(adults.value)
                +
                parseInt(children.value);

        document.getElementById(
                "guestCount").value =
                total;
    }

    adults.addEventListener(
            "change",
            updateGuests);

    children.addEventListener(
            "change",
            updateGuests);
}

</script>

</body>
</html>