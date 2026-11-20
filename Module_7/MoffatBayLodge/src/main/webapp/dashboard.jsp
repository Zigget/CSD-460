<%@ page language="java" %>
<%@ page import="com.moffatbay.bean.UserBean" %>

<%
UserBean user =
        (UserBean) session.getAttribute(
                "loggedInUser");

if (user == null) {

    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Moffat Bay Lodge | Guest Dashboard</title>

    <link rel="stylesheet"
          href="css/style.css">

</head>

<body>

<header class="navbar">

    <div class="logo">

        <ul>

            <li>

                <img src="images/logo.jpg"
                     alt="Moffat Bay Lodge"
                     width="70"
                     height="70">

            </li>

            <li>

                <h2>Moffat Bay Lodge</h2>

                <p>Welcome to the Bay</p>

            </li>

        </ul>

    </div>

    <nav>

        <ul>

            <li>

                <a href="MyReservationsServlet">
                    My Reservations
                </a>

            </li>

            <li>

                <a href="RoomsServlet">
                    Book a Room
                </a>

            </li>

            <li>

                <a href="SearchRooms.jsp">
                    Search Rooms
                </a>

            </li>

            <li>

                <a href="#services">
                    Adventure Packages
                </a>

            </li>

            <li>

                <a href="LogoutServlet">
                    Logout
                </a>

            </li>

        </ul>

    </nav>

</header>

<section class="hero-section">

    <div class="hero-overlay">

        <div class="hero-content">

            <h1>

                Welcome Back,
                <%= user.getFirstName() %>!

            </h1>

            <p>

                Experience breathtaking coastal views,
                luxurious accommodations,
                and unforgettable adventures.

            </p>

            <br>

            <a href="RoomsServlet"
               class="btn-primary">

                Make a Reservation

            </a>

        </div>

    </div>

</section>

<section class="content-section">

    <h2>Your Account</h2>

    <div class="service-grid">

        <div class="service-card">

            <h3>Guest Profile</h3>

            <p>

                <strong>Name:</strong>

                <%= user.getFirstName() %>
                <%= user.getLastName() %>

            </p>

            <p>

                <strong>Email:</strong>

                <%= user.getEmail() %>

            </p>

            <p>

                <strong>Phone:</strong>

                <%= user.getPhoneNumber() %>

            </p>

        </div>

        <div class="service-card">

            <h3>Reservations</h3>

            <p>

                View and manage your
                current reservations.

            </p>

            <a href="MyReservationsServlet"
               class="btn-primary">

                View Reservations

            </a>

        </div>

    </div>

</section>

<section id="rooms"
         class="content-section">

    <h2>Featured Accommodations</h2>

    <div class="service-grid">

        <div class="service-card">

            <img src="images/KingRoom.jpg"
                 alt="King Room">

            <h3>Ocean View Suite</h3>

            <p>

                Enjoy stunning waterfront views
                and premium comfort.

            </p>

        </div>

        <div class="service-card">

            <img src="images/QueenRoom.jpg"
                 alt="Queen Room">

            <h3>Family Cabin</h3>

            <p>

                Spacious accommodations
                perfect for family vacations.

            </p>

        </div>

        <div class="service-card">

            <img src="images/BusinessRoom.jpg"
                 alt="Business Room">

            <h3>Executive Retreat</h3>

            <p>

                Luxury lodging for business
                and executive travelers.

            </p>

        </div>

    </div>

    <br>

    <a href="RoomsServlet"
       class="btn-primary">

        Browse Available Rooms

    </a>

</section>

<section id="services"
         class="content-section">

    <h2>Our Services</h2>

    <div class="service-grid">

        <div class="service-card">

            <h3>Luxury Rooms</h3>

            <p>

                Comfortable and modern rooms
                with scenic views.

            </p>

        </div>

        <div class="service-card">

            <h3>Adventure Packages</h3>

            <p>

                Hiking, fishing,
                kayaking and sightseeing.

            </p>

        </div>

        <div class="service-card">

            <h3>Fine Dining</h3>

            <p>

                Fresh local cuisine
                prepared daily.

            </p>

        </div>

    </div>

</section>

<section class="content-section">

    <h2>Why Choose Us?</h2>

    <ul class="feature-list">

        <li>Oceanfront accommodations</li>
        <li>Professional hospitality services</li>
        <li>Family-friendly environment</li>
        <li>Secure online reservations</li>
        <li>Exclusive member promotions</li>

    </ul>

</section>

<footer class="footer">

    <p>

        © 2026 Moffat Bay Lodge |
        All Rights Reserved

    </p>

</footer>

</body>
</html>