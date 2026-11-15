<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Moffat Bay Lodge</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<header class="navbar">
    <div class="logo">
        <ul>
            <li>
                <img src="images/logo.jpg" alt="Moffat Bay Lodge" width="70" height="70">
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
                <a href="index.jsp">Home</a>
            </li>
            <li>
                <a href="#rooms">Rooms</a>
            </li>
            <li>
                <a href="#services">Attractions</a>
            </li>
            <li>
                <a href="#about">About Us</a>
            </li>
            <li>
                <a href="login.jsp">Login</a>
            </li>
            <li>
                <a href="register.jsp">Register</a>
            </li>
        </ul>
    </nav>
</header>

<!-- Hero Section -->
<section class="hero-section">
    <div class="hero-overlay">
        <div class="hero-content">
            <h1>Welcome to Moffat Bay Lodge</h1>
            <p>
                Experience breathtaking coastal views,
                luxurious accommodations,
                and unforgettable adventures.
            </p>
            <div class="hero-buttons">
                <a href="login.jsp" class="btn-primary">
                    Member Login
                </a>
                <a href="register.jsp" class="btn-secondary">
                    Create Account
                </a>
            </div>
        </div>
    </div>
</section>

<!-- About Section -->
<section id="about" class="content-section">
    <h2>About Moffat Bay Lodge</h2>
    <p>
        Located on the beautiful Pacific Northwest
        shoreline, Moffat Bay Lodge provides
        a relaxing retreat for families,
        vacationers, and outdoor enthusiasts.
    </p>
</section>

<!-- Rooms Section -->
<section id="rooms" class="content-section">
        <h2>Featured Accommodations</h2>
        <div class="service-grid">
            <div class="service-card">
                <img src="images/KingRoom.jpg" alt="King Bed">
                <h3>Ocean View Suite</h3>
                <p>
                    Enjoy stunning waterfront views
                    and premium comfort.
                </p>
            </div>
            <div class="service-card">
                <img src="images/QueenRoom.jpg" alt="Queen Bed">
                <h3>Family Cabin</h3>
                <p>
                    Spacious accommodations perfect
                    for family vacations.
                </p>
            </div>
            <div class="service-card">
                <img src="images/BusinessRoom.jpg" alt="Business Bed">
                <h3>Executive Retreat</h3>
                <p>
                    Luxury lodging for business and
                    executive travelers.
                </p>
            </div>
        </div>
    </section>

<!-- Services Section -->
<section id="services" class="content-section">
    <h2>Our Services</h2>
    <div class="service-grid">
        <div class="service-card">
            <h3>Luxury Rooms</h3>
            <p>
                Comfortable and modern rooms
                with ocean views.
            </p>
        </div>
        <div class="service-card">
            <h3>Adventure Packages</h3>
            <p>
                Hiking, fishing,
                kayaking, and sightseeing.
            </p>
        </div>
        <div class="service-card">
            <h3>Fine Dining</h3>
            <p>
                Fresh local cuisine
                prepared by experienced chefs.
            </p>
        </div>
    </div>

</section>

<!-- Featured Area -->

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

<!-- Footer -->
<footer class="footer">
    <p>
        © 2026 Moffat Bay Lodge | All Rights Reserved
    </p>
</footer>

</body>
</html>