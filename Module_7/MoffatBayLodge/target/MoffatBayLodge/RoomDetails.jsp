<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Room Details | Moffat Bay Lodge</title>

<style>

body{
    margin:0;
    font-family:Arial,sans-serif;
    background:#f4f6f9;
}

.container{
    width:90%;
    max-width:1200px;
    margin:30px auto;
}

.room-card{
    background:white;
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 2px 12px rgba(0,0,0,.1);
}

.room-image{
    width:100%;
    height:450px;
    object-fit:cover;
}

.content{
    padding:30px;
}

h1{
    color:#003366;
    margin-top:0;
}

.description{
    color:#555;
    line-height:1.7;
    margin-bottom:20px;
}

.info-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:15px;
    margin-bottom:25px;
}

.info-box{
    background:#f8f9fa;
    padding:15px;
    border-radius:8px;
}

.label{
    font-weight:bold;
    color:#003366;
    margin-bottom:5px;
}

.price{
    font-size:30px;
    color:#006699;
    font-weight:bold;
}

.section-title{
    color:#003366;
    margin-top:30px;
}

.amenities{
    padding-left:20px;
}

.amenities li{
    margin-bottom:8px;
}

.actions{
    margin-top:30px;
}

.btn{
    display:inline-block;
    padding:12px 24px;
    border-radius:5px;
    text-decoration:none;
    color:white;
    margin-right:10px;
    margin-bottom:10px;
}

.btn-search{
    background:#6c757d;
}

.btn-search:hover{
    background:#545b62;
}

.btn-book{
    background:#28a745;
}

.btn-book:hover{
    background:#218838;
}

.btn-rooms{
    background:#006699;
}

.btn-rooms:hover{
    background:#004466;
}

.error{
    background:#f8d7da;
    color:#721c24;
    padding:20px;
    border-radius:8px;
}

@media(max-width:768px){

    .container{
        width:95%;
    }

    .room-image{
        height:250px;
    }

    .content{
        padding:20px;
    }

    .info-grid{
        grid-template-columns:1fr;
    }

    .actions{
        display:flex;
        flex-direction:column;
    }

    .btn{
        text-align:center;
        margin-right:0;
    }

    .price{
        font-size:24px;
    }
}

</style>

</head>

<body>

<div class="container">

<c:choose>

    <c:when test="${empty room}">

        <div class="error">

            <h2>Room Not Found</h2>

            <p>
                The requested room could not be located.
            </p>

            <a href="${pageContext.request.contextPath}/RoomsServlet"
               class="btn btn-rooms">

                Back to Rooms

            </a>

        </div>

    </c:when>

    <c:otherwise>

        <div class="room-card">

            <img src="${pageContext.request.contextPath}/${room.imageUrl}"
                 alt="${room.roomTypeName}"
                 class="room-image">

            <div class="content">

                <h1>
                    ${room.roomTypeName}
                </h1>

                <p class="description">
                    ${room.description}
                </p>

                <div class="info-grid">

                    <div class="info-box">

                        <div class="label">
                            Room Number
                        </div>

                        <div>
                            ${room.roomNumber}
                        </div>

                    </div>

                    <div class="info-box">

                        <div class="label">
                            View
                        </div>

                        <div>
                            ${room.viewType}
                        </div>

                    </div>

                    <div class="info-box">

                        <div class="label">
                            Maximum Guests
                        </div>

                        <div>
                            ${room.maxGuests}
                        </div>

                    </div>

                    <div class="info-box">

                        <div class="label">
                            Rate Per Night
                        </div>

                        <div class="price">
                            $${room.pricePerNight}
                        </div>

                    </div>

                </div>

                <h2 class="section-title">
                    Room Amenities
                </h2>

                <ul class="amenities">

                    <c:choose>

                        <c:when test="${not empty amenities}">

                            <c:forEach var="amenity"
                                       items="${amenities}">

                                <li>${amenity}</li>

                            </c:forEach>

                        </c:when>

                        <c:otherwise>

                            <li>Complimentary Wi‑Fi</li>
                            <li>Smart TV</li>
                            <li>Coffee Maker</li>
                            <li>Mini Refrigerator</li>
                            <li>Air Conditioning</li>

                        </c:otherwise>

                    </c:choose>

                </ul>

                <div class="actions">

                    <a href="${pageContext.request.contextPath}/SearchRooms.jsp"
                       class="btn btn-search">

                        Search Rooms

                    </a>

                    <a href="${pageContext.request.contextPath}/RoomsServlet"
                       class="btn btn-rooms">

                        View All Rooms

                    </a>

                    <a href="${pageContext.request.contextPath}/ReservationPageServlet?roomId=${room.roomId}"
                       class="btn btn-book">

                        Reserve This Room

                    </a>

                </div>

            </div>

        </div>

    </c:otherwise>

</c:choose>

</div>

</body>
</html>