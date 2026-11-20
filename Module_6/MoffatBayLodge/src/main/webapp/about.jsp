
<%--
    Moffat Bay Lodge
    CSD-460 Team Project
    About Us Page
    Description: Displays information about the lodge,
    its accommodations, amenities, and attractions.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Moffat Bay Lodge</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/about.css">
</head>
<body>

    <header>
        <nav class="navbar">
            <h1>Moffat Bay Lodge</h1>
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
                <a href="${pageContext.request.contextPath}/about">About Us</a>
                <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
                <a href="${pageContext.request.contextPath}/register.jsp">Register</a>
            </div>
        </nav>
    </header>

    <main>
        <section class="hero">
            <h2>Welcome to Moffat Bay Lodge</h2>
            <p>Relax, explore, and enjoy a peaceful island getaway.</p>
        </section>

        <section class="content">
            <h2>About Our Lodge</h2>
        <c:choose>
        <c:when test="${not empty aboutDescription}">
            <p><c:out value="${aboutDescription}" /></p>
        </c:when>
        <c:otherwise>
            <p>Lodge information is currently unavailable.</p>
        </c:otherwise>
    </c:choose>

            <h2>Our Accommodations</h2>
            <p>
                We offer different room types to meet our guests'
                needs, including Double Full Beds, Queen,
                Double Queen Beds, and King rooms.
            </p>

            <h2>Activities and Attractions</h2>
            <p>
                Guests can enjoy outdoor activities such as hiking,
                kayaking, whale watching, and scuba diving.
            </p>

            <h2>Our Mission</h2>
            <p>
                Our mission is to provide comfortable accommodations,
                friendly service, and a welcoming environment
                for every guest.
            </p>
        </section>
    </main>

    <footer>
        <p>&copy; 2026 Moffat Bay Lodge. All rights reserved.</p>
    </footer>

</body>
</html>
