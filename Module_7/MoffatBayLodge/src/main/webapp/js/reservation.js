/*
=========================================
Moffat Bay Lodge
Reservation Form Validation
=========================================
*/

document.addEventListener("DOMContentLoaded", function () {

    initializeDates();
    initializeGuestCounter();
    initializeValidation();
});

/*
=========================================
Set Minimum Dates
=========================================
*/
function initializeDates() {

    const checkIn =
            document.getElementById("checkIn");

    const checkOut =
            document.getElementById("checkOut");

    const today =
            new Date()
                    .toISOString()
                    .split("T")[0];

    if (checkIn) {
        checkIn.min = today;
    }

    if (checkOut) {
        checkOut.min = today;
    }

    if (checkIn && checkOut) {

        checkIn.addEventListener(
                "change",
                function () {

            checkOut.min = this.value;

            if (checkOut.value &&
                    checkOut.value <= this.value) {

                checkOut.value = "";
            }

            if (typeof calculateReservationTotal === "function") {
                calculateReservationTotal();
            }
        });
    }
}

/*
=========================================
Guest Counter
=========================================
*/
function initializeGuestCounter() {

    const adults =
            document.getElementById("adults");

    const children =
            document.getElementById("children");

    if (!adults || !children) {
        return;
    }

    adults.addEventListener(
            "change",
            updateGuestCount);

    children.addEventListener(
            "change",
            updateGuestCount);

    updateGuestCount();
}

function updateGuestCount() {

    const adults =
            parseInt(
                    document.getElementById(
                            "adults").value) || 0;

    const children =
            parseInt(
                    document.getElementById(
                            "children").value) || 0;

    const totalGuests =
            adults + children;

    const guestCountField =
            document.getElementById(
                    "guestCount");

    const guestDisplay =
            document.getElementById(
                    "guestDisplay");

    if (guestCountField) {

        guestCountField.value =
                totalGuests;
    }

    if (guestDisplay) {

        guestDisplay.textContent =
                totalGuests;
    }
}

/*
=========================================
Character Counter
=========================================
*/
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

/*
=========================================
Arrival Time Warning
=========================================
*/
function validateArrivalTime() {

    const arrivalTime =
            document.getElementById(
                    "arrivalTime");

    const warning =
            document.getElementById(
                    "arrivalWarning");

    if (!arrivalTime || !warning) {
        return;
    }

    if (arrivalTime.value === "After 9 PM") {

        warning.style.display =
                "block";

        warning.textContent =
                "Please notify the front desk if you expect to arrive after 9 PM.";

    } else {

        warning.style.display =
                "none";

        warning.textContent =
                "";
    }
}

/*
=========================================
Form Validation
=========================================
*/
function initializeValidation() {

    const form =
            document.getElementById(
                    "reservationForm");

    if (!form) {
        return;
    }

    form.addEventListener(
            "submit",
            function (e) {

        const checkIn =
                document.getElementById(
                        "checkIn").value;

        const checkOut =
                document.getElementById(
                        "checkOut").value;

        const totalCost =
                document.getElementById(
                        "totalCost").value;

        const totalNights =
                document.getElementById(
                        "totalNights").value;

        if (!checkIn || !checkOut) {

            alert(
                    "Please select check-in and check-out dates.");

            e.preventDefault();
            return;
        }

        if (!totalCost ||
                parseFloat(totalCost) <= 0) {

            alert(
                    "Please calculate your reservation total before continuing.");

            e.preventDefault();
            return;
        }

        if (!totalNights ||
                parseInt(totalNights) <= 0) {

            alert(
                    "Invalid number of nights.");

            e.preventDefault();
            return;
        }
    });
}