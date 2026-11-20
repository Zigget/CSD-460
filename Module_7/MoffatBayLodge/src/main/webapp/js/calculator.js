/*
 * Moffat Bay Lodge
 * Reservation Cost Calculator
 */

const TAX_RATE = 0.12;
const RESORT_FEE_PER_NIGHT = 25.00;

function calculateReservationTotal() {

    const checkIn =
        document.getElementById("checkIn").value;

    const checkOut =
        document.getElementById("checkOut").value;

    const roomRate =
        parseFloat(
            document.getElementById(
                "pricePerNight").value);

    if (!checkIn || !checkOut || isNaN(roomRate)) {
        return;
    }

    const arrivalDate =
        new Date(checkIn);

    const departureDate =
        new Date(checkOut);

    const millisecondsPerDay =
        1000 * 60 * 60 * 24;

    const nights =
        Math.ceil(
            (departureDate - arrivalDate)
            / millisecondsPerDay);

    if (nights <= 0) {

        resetCalculator();

        alert(
            "Check-out date must be after check-in date.");

        return;
    }

    const subtotal =
        roomRate * nights;

    const tax =
        subtotal * TAX_RATE;

    const resortFee =
        nights * RESORT_FEE_PER_NIGHT;

    const total =
        subtotal + tax + resortFee;

    updateDisplay(
        nights,
        subtotal,
        tax,
        resortFee,
        total);
}

function updateDisplay(
        nights,
        subtotal,
        tax,
        resortFee,
        total) {

    document.getElementById(
            "nights").textContent =
            nights;

    document.getElementById(
            "subtotal").textContent =
            "$" + subtotal.toFixed(2);

    document.getElementById(
            "tax").textContent =
            "$" + tax.toFixed(2);

    document.getElementById(
            "resortFee").textContent =
            "$" + resortFee.toFixed(2);

    document.getElementById(
            "total").textContent =
            "$" + total.toFixed(2);

    const totalCostField =
            document.getElementById(
                    "totalCost");

    if (totalCostField) {

        totalCostField.value =
                total.toFixed(2);
    }

    const totalNightsField =
            document.getElementById(
                    "totalNights");

    if (totalNightsField) {

        totalNightsField.value =
                nights;
    }
}

function resetCalculator() {

    document.getElementById(
            "nights").textContent =
            "0";

    document.getElementById(
            "subtotal").textContent =
            "$0.00";

    document.getElementById(
            "tax").textContent =
            "$0.00";

    document.getElementById(
            "resortFee").textContent =
            "$0.00";

    document.getElementById(
            "total").textContent =
            "$0.00";

    const totalField =
            document.getElementById(
                    "totalCost");

    if (totalField) {

        totalField.value = "0";
    }

    const nightsField =
            document.getElementById(
                    "totalNights");

    if (nightsField) {

        nightsField.value = "0";
    }
}

function updateGuestCount() {

    const adults =
            parseInt(
                    document.getElementById(
                            "adults").value);

    const children =
            parseInt(
                    document.getElementById(
                            "children").value);

    const totalGuests =
            adults + children;

    document.getElementById(
            "guestDisplay").textContent =
            totalGuests;

    const guestCountField =
            document.getElementById(
                    "guestCount");

    if (guestCountField) {

        guestCountField.value =
                totalGuests;
    }
}

function validateArrivalTime() {

    const arrivalTime =
            document.getElementById(
                    "arrivalTime").value;

    const warning =
            document.getElementById(
                    "arrivalWarning");

    if (!warning) {
        return;
    }

    if (arrivalTime === "After 9 PM") {

        warning.style.display =
                "block";

        warning.textContent =
                "Please contact the front desk if you expect to arrive after 9 PM.";

    } else {

        warning.style.display =
                "none";

        warning.textContent =
                "";
    }
}

function countCharacters(textarea) {

    const counter =
            document.getElementById(
                    "requestCounter");

    if (!counter) {
        return;
    }

    counter.textContent =
            textarea.value.length +
            " / 500";
}

window.addEventListener(
        "load",
        function () {

    updateGuestCount();
    resetCalculator();
});