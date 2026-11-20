<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Search Available Rooms | Moffat Bay Lodge</title>

<style>

body{
    margin:0;
    font-family:Arial,sans-serif;
    background:#f4f6f9;
}

.container{
    width:90%;
    max-width:900px;
    margin:40px auto;
}

.search-card{
    background:white;
    padding:35px;
    border-radius:12px;
    box-shadow:0 2px 12px rgba(0,0,0,.1);
}

.page-title{
    text-align:center;
    color:#003366;
    margin-bottom:25px;
}

.form-row{
    display:flex;
    gap:20px;
    margin-bottom:20px;
}

.form-group{
    flex:1;
}

label{
    display:block;
    margin-bottom:8px;
    font-weight:bold;
    color:#333;
}

input,
select{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:5px;
    box-sizing:border-box;
}

.btn{
    width:100%;
    padding:15px;
    border:none;
    background:#006699;
    color:white;
    font-size:16px;
    border-radius:5px;
    cursor:pointer;
}

.btn:hover{
    background:#004466;
}

.error{
    background:#f8d7da;
    color:#721c24;
    padding:15px;
    border-radius:5px;
    margin-bottom:20px;
}

.info{
    background:#e7f3fe;
    color:#084298;
    padding:15px;
    border-radius:5px;
    margin-bottom:20px;
}

.back-link{
    text-align:center;
    margin-top:20px;
}

.back-link a{
    color:#006699;
    text-decoration:none;
}

.back-link a:hover{
    text-decoration:underline;
}

@media(max-width:768px){

    .form-row{
        flex-direction:column;
    }
}

</style>

</head>

<body>

<div class="container">

<div class="search-card">

<h1 class="page-title">
    Search Available Rooms
</h1>

<c:if test="${not empty errorMessage}">
    <div class="error">
        ${errorMessage}
    </div>
</c:if>

<div class="info">

    Search by your preferred dates and number of guests.

</div>

<form action="${pageContext.request.contextPath}/AvailabilityServlet"
      method="post">

    <div class="form-row">

        <div class="form-group">

            <label for="checkIn">
                Check-In Date
            </label>

            <input type="date"
                   id="checkIn"
                   name="checkIn"
                   required>

        </div>

        <div class="form-group">

            <label for="checkOut">
                Check-Out Date
            </label>

            <input type="date"
                   id="checkOut"
                   name="checkOut"
                   required>

        </div>

    </div>

    <div class="form-row">

        <div class="form-group">

            <label for="adults">
                Adults
            </label>

            <select id="adults"
                    name="adults">

                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>

            </select>

        </div>

        <div class="form-group">

            <label for="children">
                Children
            </label>

            <select id="children"
                    name="children">

                <option value="0">0</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>

            </select>

        </div>

    </div>

    <button type="submit"
            class="btn">

        Search Available Rooms

    </button>

</form>

<div class="back-link">

    <a href="${pageContext.request.contextPath}/RoomsServlet">

        ← Back to Rooms

    </a>

</div>

</div>

</div>

<script>

const today =
    new Date()
        .toISOString()
        .split("T")[0];

document.getElementById(
        "checkIn").min = today;

document.getElementById(
        "checkOut").min = today;

document.getElementById(
        "checkIn")
        .addEventListener(
            "change",
            function() {

    document.getElementById(
            "checkOut").min =
            this.value;
});

</script>

</body>
</html>