<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>404 Page Design</title>
    <style>
      * {
        box-sizing: border-box;
      }

      body {
        background: #000;
        color: #fff;
        font-family: sans-serif;
      }

      .container {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 97vh;
        background: #000;
      }

      h1 {
        font-size: 6em;
        margin: 0;
        animation: pulse 2s ease-in-out infinite;
      }

      @keyframes pulse {
        0% {
          transform: scale(1);
        }
        50% {
          transform: scale(1.2);
        }
        100% {
          transform: scale(1);
        }
      }

      p {
        font-size: 1.5em;
        margin: 0;
        margin-top: 20px;
      }

      a {
        display: inline-block;
        padding: 10px 20px;
        background: white;
        color: black;
        text-decoration: none;
        margin-top: 20px;
        font-size: 1.2em;
        border-radius: 50px;
        animation: bounce 1s ease-in-out infinite;
      }

      @keyframes bounce {
        0%,
        20%,
        50%,
        80%,
        100% {
          transform: translateY(0);
        }
        40% {
          transform: translateY(-10px);
        }
        60% {
          transform: translateY(-5px);
        }
      }

      @media (max-width: 768px) {
        h1 {
          font-size: 4em;
        }
        p {
          font-size: 1em;
        }
      }

      @media (max-width: 576px) {
        h1 {
          font-size: 3em;
        }
        p {
          font-size: 0.8em;
        }
        a {
          font-size: 1em;
        }
      }
      img {
        height: 300px;
        filter: drop-shadow(0 0 50px yellow);
        border-radius: 5px;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <img src="1.png" alt="" />
      <h1>404</h1>
      <p>Oops! <%=session.getAttribute("errorMessage")%></p>
      <a href="Home.html">Go back to homepage</a>
    </div>
  </body>
</html>
