<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Rooms & Suites | Moffat Bay Lodge</title>

<style>

body{
    font-family:Arial,sans-serif;
    margin:0;
    background:#f4f6f9;
}

.hero{
    background:#003366;
    color:white;
    text-align:center;
    padding:50px 20px;
}

.hero h1{
    margin:0;
    font-size:42px;
}

.hero p{
    font-size:18px;
    margin-top:15px;
}

.search-link{
    display:inline-block;
    margin-top:20px;
    padding:12px 20px;
    background:#28a745;
    color:white;
    text-decoration:none;
    border-radius:5px;
}

.search-link:hover{
    background:#218838;
}

.container{
    width:90%;
    max-width:1200px;
    margin:40px auto;
}

.section-title{
    text-align:center;
    color:#003366;
    margin-bottom:30px;
}

.room-card{
    display:flex;
    background:white;
    margin-bottom:25px;
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
    margin-top:0;
}

.features{
    list-style:none;
    padding:0;
}

.features li{
    margin-bottom:6px;
}

.price{
    font-size:28px;
    font-weight:bold;
    color:#006699;
    margin:15px 0;
}

.buttons{
    margin-top:20px;
}

.btn{
    display:inline-block;
    padding:12px 18px;
    border-radius:5px;
    text-decoration:none;
    color:white;
    margin-right:10px;
}

.btn-details{
    background:#006699;
}

.btn-details:hover{
    background:#004466;
}

.btn-book{
    background:#28a745;
}

.btn-book:hover{
    background:#218838;
}

.message{
    text-align:center;
    background:white;
    padding:30px;
    border-radius:10px;
}

.footer{
    text-align:center;
    padding:20px;
    background:#003366;
    color:white;
    margin-top:40px;
}

@media(max-width:900px){

    .room-card{
        flex-direction:column;
    }

    .room-image{
        width:100%;
        height:250px;
    }

    .buttons{
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

<div class="hero">

    <h1>
        Moffat Bay Lodge
    </h1>

    <p>
        Luxury waterfront accommodations designed for relaxation and comfort.
    </p>

    <h3>
        Find Your Perfect Stay
    </h3>

    <p>
        Search room availability and make a reservation.
    </p>

    <a href="${pageContext.request.contextPath}/SearchRooms.jsp"
       class="search-link">

        Search Available Rooms

    </a>

</div>

<div class="container">

    <h2 class="section-title">

        Rooms & Suites

    </h2>

    <c:choose>

        <c:when test="${empty rooms}">

            <div class="message">

                <h3>
                    No Rooms Available
                </h3>

                <p>
                    Please check back later.
                </p>

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
                                Guests:
                                ${room.maxGuests}
                            </li>

                            <li>
                                View:
                                ${room.viewType}
                            </li>

                            <li>
                                Room #:
                                ${room.roomNumber}
                            </li>

                            <li>
                                ✓ Complimentary Wi‑Fi
                            </li>

                            <li>
                                ✓ Smart TV
                            </li>

                            <li>
                                ✓ Premium Bedding
                            </li>

                            <li>
                                ✓ Coffee Maker
                            </li>

                            <li>
                                ✓ Air Conditioning
                            </li>

                            <li>
                                ✓ Mini Refrigerator
                            </li>

                        </ul>

                        <div class="price">

                            $${room.pricePerNight}

                            <small>
                                per night
                            </small>

                        </div>

                        <div class="buttons">

                            <a href="${pageContext.request.contextPath}/RoomDetailsServlet?roomId=${room.roomId}"
                               class="btn btn-details">

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

<footer class="footer">

    © 2026 Moffat Bay Lodge

</footer>

</body>
</html>