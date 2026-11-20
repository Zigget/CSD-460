<?php
$hotelName   = 'Moffat Bay Hotel';

// Image locations
$logoImage   = 'images/logo.jpg';
$heroImage   = 'images/main-image.jpg';

// Navigation ribbon links
$navRight = [
    'rooms.php' => 'Rooms',
    'attractions.php' => 'Attractions',
    'login.php'  => 'Login',
    'signup.php' => 'Sign Up',
];

function e(string $s): string {
    return htmlspecialchars($s, ENT_QUOTES, 'UTF-8');
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
</head>
<body>

// Navigation ribbon
<nav class="ribbon">
    <div class="ribbon-band">
        <ul class="brand" href="index.php">
            <span class="logo-slot">
                <?php if (file_exists(__DIR__ . '/' . $logoImage)): ?>
                    <img src="<?= e($logoImage) ?>">
                <?php else: ?>
                    <span class="placeholder">Logo<br>here</span>
                <?php endif; ?>
            </span>
            <span class="brand-text">
                <span class="brand-name"><?= e($hotelName) ?></span>
                <span class="brand-tag"><?= e("Dockside rooms. Open-water views.") ?></span>
            </span>
        </ul>
        <ul class="ribbon-links ribbon-right">
            <?php foreach ($navRight as $href => $label): ?>
                <li><a href="<?= e($href) ?>"><?= e($label) ?></a></li>
            <?php endforeach; ?>
        </ul>
    </div>
</nav>

// Main Image
<main>
    <section class="hero">
        <div class="hero-image">
            <?php if (file_exists(__DIR__ . '/' . $heroImage)): ?>
                <img src="<?= e($heroImage) ?>">
            <?php else: ?>
                <div class="placeholder hero-placeholder">
                    Main image goes here<br>
                    <small>Save it as <?= e($heroImage) ?> (1920 × 900 px or larger)</small>
                </div>
            <?php endif; ?>
        </div>
    </section>

    // Intro Text
    <section class="intro">
        <h2>Welcome aboard</h2>
        <p>
            Harborlight sits right on the waterfront, a short walk from the marina,
            the fish market and the ferry landing. Every room is finished in
            polished wood and brass, with windows that open to the sea breeze.
        </p>
    </section>

    // Ameneties Section
    <section class="Ameneties">
        <ul><div>
            <h3>Harbor-view rooms</h3>
            <p>Forty-two rooms and suites, most with a private balcony facing the marina.</p>
        </div></ul>
        <ul><div>
            <h3>Galley breakfast</h3>
            <p>Fresh bread, smoked fish and strong coffee served daily from 6:30 a.m.</p>
        </div></ul>
        <ul><div>
            <h3>Dockside lounge</h3>
            <p>Evening drinks on the pier with the lanterns lit and the tide coming in.</p>
        </div></ul>
    </section>

    // Rooms Section
    <section class="Room Previews">
    <div>
        <h3>Harbor-view rooms</h3>
        <p>Forty-two rooms and suites, most with a private balcony facing the marina.</p>
    </div>
    <div>
        <h3>Galley breakfast</h3>
        <p>Fresh bread, smoked fish and strong coffee served daily from 6:30 a.m.</p>
    </div>
    <div>
        <h3>Dockside lounge</h3>
        <p>Evening drinks on the pier with the lanterns lit and the tide coming in.</p>
    </div>
    </section>
</main>

<footer class="site-footer">
    <p>&copy; <?= date('Y') ?> <?= e($hotelName) ?>. All rights reserved.</p>
</footer>

</body>
</html>