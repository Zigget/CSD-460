<%@ page language="java" %>

<%
String username=
(String)session.getAttribute("user");

if(username==null){

response.sendRedirect("login.jsp");

return;
}
%>

<html>

<head>
<title>Guest Dashboard</title>
</head>

<body>

<h1>

Welcome

<%=username%>

</h1>

<p>

Manage Reservations

</p>

<p>

View Available Rooms

</p>

<p>

Book Adventure Packages

</p>

<p>

View Special Promotions

</p>

<a href="logout.jsp">

Logout

</a>

</body>

</html>