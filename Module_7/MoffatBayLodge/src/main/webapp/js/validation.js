document.addEventListener("DOMContentLoaded", function () {

    const password =
            document.getElementById("password");

    const confirmPassword =
            document.getElementById("confirmPassword");

    const passwordMessage =
            document.getElementById("passwordMessage");

    const matchMessage =
            document.getElementById("matchMessage");

    if (password) {

        password.addEventListener("keyup", function () {

            const value = password.value;

            let errors = [];

            if (value.length < 8) {
                errors.push("Minimum 8 characters");
            }

            if (!/[A-Z]/.test(value)) {
                errors.push("At least one uppercase letter");
            }

            if (!/[a-z]/.test(value)) {
                errors.push("At least one lowercase letter");
            }

            if (!/[0-9]/.test(value)) {
                errors.push("At least one number");
            }

            if (errors.length === 0) {

                passwordMessage.innerHTML =
                        "✓ Strong Password";

                passwordMessage.style.color =
                        "lightgreen";
            }
            else {

                passwordMessage.innerHTML =
                        errors.join("<br>");

                passwordMessage.style.color =
                        "#ff8080";
            }
        });
    }

    if (confirmPassword) {

        confirmPassword.addEventListener("keyup", function () {

            if (password.value === confirmPassword.value) {

                matchMessage.innerHTML =
                        "✓ Passwords Match";

                matchMessage.style.color =
                        "lightgreen";
            }
            else {

                matchMessage.innerHTML =
                        "Passwords Do Not Match";

                matchMessage.style.color =
                        "#ff8080";
            }
        });
    }
});