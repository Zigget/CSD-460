<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Available Rooms - Moffat Bay Lodge</title>

<style>

body{
    font-family:Arial,sans-serif;
    margin:0;
    background:#f4f6f9;
}

.container{
    width:90%;
    max-width:1200px;
    margin:30px auto;
}

.header{
    text-align:center;
    margin-bottom:30px;
}

.header h1{
    color:#003366;
}

.search-summary{
    background:white;
    padding:20px;
    border-radius:10px;
    margin-bottom:25px;
    box-shadow:0 2px 10px rgba(0,0,0,.1);
}

.room-card{
    display:flex;
    margin-bottom:25px;
    background:white;
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 2px 10px rgba(0,0,0,.1);
}

.room-image{
    width:350px;
    height:250px;
    object-fit:cover;
}

.room-details{
    flex:1;
    padding:20px;
}

.room-title{
    color:#003366;
    margin-bottom:10px;
}

.price{
    font-size:24px;
    font-weight:bold;
    color:#006699;
    margin:15px 0;
}

.features{
    margin-top:15px;
    padding-left:20px;
}

.features li{
    margin-bottom:5px;
}

.btn{
    display:inline-block;
    background:#006699;
    color:white;
    text-decoration:none;
    padding:12px 20px;
    border-radius:5px;
    margin-top:15px;
    margin-right:10px;
}

.btn:hover{
    background:#004466;
}

.btn-book{
    background:#28a745;
}

.btn-book:hover{
    background:#218838;
}

.back-btn{
    background:#666;
}

.back-btn:hover{
    background:#444;
}

.no-results{
    background:white;
    padding:30px;
    text-align:center;
    border-radius:10px;
    box-shadow:0 2px 10px rgba(0,0,0,.1);
}

.button-group{
    margin-top:20px;
}

@media(max-width:900px){

    .room-card{
        flex-direction:column;
    }

    .room-image{
        width:100%;
        height:250px;
    }

    .button-group{
        display:flex;
        flex-direction:column;
        gap:10px;
    }

    .btn{
        text-align:center;
        margin-right:0;
    }
}

</style>

</head>

<body>

<div class="container">

    <div class="header">

        <h1>Available Rooms</h1>

    </div>

    <div class="search-summary">

        <h3>Your Search</h3>

        <p>
            <strong>Check-In:</strong>
            ${checkIn}
        </p>

        <p>
            <strong>Check-Out:</strong>
            ${checkOut}
        </p>

        <p>
            <strong>Guests:</strong>
            ${guestCount}
        </p>

        <p>
            <strong>Rooms Found:</strong>
            ${roomCount}
        </p>

    </div>

    <c:choose>

        <c:when test="${empty rooms}">

            <div class="no-results">

                <h2>No Rooms Available</h2>

                <p>
                    Sorry, no rooms are available for the selected dates.
                </p>

                <a href="${pageContext.request.contextPath}/SearchRooms.jsp"
                   class="btn back-btn">

                    Search Again

                </a>

                <a href="${pageContext.request.contextPath}/RoomsServlet"
                   class="btn">

                    View All Rooms

                </a>

            </div>

        </c:when>

        <c:otherwise>

            <c:forEach var="room"
                       items="${rooms}">

                <div class="room-card">

                    <img src="${pageContext.request.contextPath}/${room.imageUrl}"
                         alt="${room.roomTypeName}"
                         class="room-image">

                    <div class="room-details">

                        <h2 class="room-title">

                            ${room.roomTypeName}

                        </h2>

                        <p>

                            ${room.description}

                        </p>

                        <ul class="features">

                            <li>
                                Room Number:
                                ${room.roomNumber}
                            </li>

                            <li>
                                Maximum Guests:
                                ${room.maxGuests}
                            </li>

                            <li>
                                View:
                                ${room.viewType}
                            </li>

                            <li>Free Wi‑Fi</li>
                            <li>Smart TV</li>
                            <li>Coffee Maker</li>
                            <li>Mini Refrigerator</li>

                        </ul>

                        <div class="price">

                            $${room.pricePerNight}

                            <small>
                                per night
                            </small>

                        </div>

                        <div class="button-group">

                            <a href="${pageContext.request.contextPath}/RoomDetailsServlet?roomId=${room.roomId}"
                               class="btn">

                                View Details

                            </a>

                            <a href="${pageContext.request.contextPath}/ReservationPageServlet?roomId=${room.roomId}"
                               class="btn btn-book">

                                Reserve Now

                            </a>

                        </div>

                    </div>

                </div>

            </c:forEach>

        </c:otherwise>

    </c:choose>

</div>

</body>
</html>