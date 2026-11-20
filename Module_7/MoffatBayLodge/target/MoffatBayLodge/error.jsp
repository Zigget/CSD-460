<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error - Moffat Bay Lodge</title>

<style>

body{
    font-family:Arial,sans-serif;
    background:#f4f6f9;
    margin:0;
}

.container{
    width:90%;
    max-width:700px;
    margin:50px auto;
}

.card{
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 2px 10px rgba(0,0,0,.1);
}

.error{
    color:#dc3545;
    font-size:24px;
    margin-bottom:20px;
}

.btn{
    display:inline-block;
    background:#006699;
    color:white;
    text-decoration:none;
    padding:12px 20px;
    border-radius:5px;
}

.btn:hover{
    background:#004466;
}

</style>
</head>

<body>

<div class="container">

<div class="card">

<h1 class="error">
Application Error
</h1>

<p>
${errorMessage}
</p>

<br>

<a href="${pageContext.request.contextPath}/RoomsServlet"
   class="btn">

    Return to Rooms

</a>

</div>

</div>

</body>
</html>