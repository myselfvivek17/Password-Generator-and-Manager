<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style.css" />
    <title>Password Generator</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
  </head>
  <body>
    <nav class="navbar">
      <div class="navbar-left">
        <h1>Password Generator</h1>
      </div>
      <div class="navbar-right">
        <div class="user-dropdown">
          <span class="username"
            ><%=session.getAttribute("uname") %> <i class="fas fa-chevron-down"></i>
          </span>
          <div class="dropdown-content">
            <a href="profile.jsp">Profile</a>
            <a href="Home.html">Logout</a>
          </div>
        </div>
      </div>
    </nav>
    <div class="form">
      <div class="input-container">
        <input type="text" id="pass" />
        <button id="copyButton">Copy</button>
      </div>
      <div>
        <input type="checkbox" name="caps" id="capitals" /><label for="capitals"
          >Should have Upper Case</label
        >
      </div>
      <div>
        <input type="checkbox" name="low" id="lowercase" /><label
          for="lowercase"
          >Should have Lower Case</label
        >
      </div>
      <div>
        <input type="checkbox" name="num" id="numbers" /><label for="numbers"
          >Should have numbers</label
        >
      </div>
      <div>
        <input type="checkbox" name="sym" id="symbols" /><label for="symbols"
          >Should have Special symbols</label
        >
      </div>
      <div>
        <input type="checkbox" name="length" id="length" /><label for="length"
          >Should have length</label
        >
        <br /><input
          type="number"
          name="len"
          id="len"
          value="8"
          min="5"
          max="25"
        />
      </div>
      <div class="buttons">
        <button onclick="save()">Save</button>
        <button id="generate">Generate</button>
      </div>
    </div>
    <form
      class="saver input-container form"
      action="SavePass.jsp"
      method="post"
    >
      <p>Password</p>
      <input type="text" name="p" id="sp" />
      <br />
      <p>Company Name</p>
      <input type="text" name="cmp" id="" />
      <div>
        <button type="submit">Save</button>
        <a class="close" onclick="clocepopup()">Close</a>
      </div>
    </form>

    <script>
      function save() {
        document.querySelector(".saver").style.display = "flex";
        document.querySelector(".form").style.display = "none";
        document.querySelector("#sp").value =
          document.querySelector("#pass").value;
      }
      function clocepopup() {
        document.querySelector(".saver").style.display = "none";
        document.querySelector(".form").style.display = "inline";
      }
      document.addEventListener("DOMContentLoaded", function () {
        const generateButton = document.querySelector("#generate");
        const passwordInput = document.querySelector("#pass");
        const lengthCheckbox = document.querySelector("#length");
        const lengthInput = document.querySelector("#len");

        lengthInput.style.display = "none";

        lengthCheckbox.addEventListener("change", function () {
          lengthInput.style.display = lengthCheckbox.checked ? "block" : "none";
        });

        generateButton.addEventListener("click", function () {
          const password = generatePassword();
          passwordInput.value = password;
        });

        function generatePassword() {
          const includeUpperCase = document.querySelector("#capitals").checked;
          const includeLowerCase = document.querySelector("#lowercase").checked;
          const includeNumbers = document.querySelector("#numbers").checked;
          const includeSymbols = document.querySelector("#symbols").checked;

          if (
            !includeUpperCase &&
            !includeLowerCase &&
            !includeNumbers &&
            !includeSymbols
          ) {
            alert("Please select at least one option.");
            return "";
          }

          let length;
          if (lengthCheckbox.checked) {
            length = parseInt(lengthInput.value);
            if (length < 5) {
              alert("Please enter a length greater than 5");
              return "";
            }
          } else {
            length = getRandomInt(5, 25);
          }

          let requiredChars = "";

          if (includeUpperCase) requiredChars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
          if (includeLowerCase) requiredChars += "abcdefghijklmnopqrstuvwxyz";
          if (includeNumbers) requiredChars += "0123456789";
          if (includeSymbols) requiredChars += '!@#$%^&*()_+{}|:"<>?-=[];,./';

          if (requiredChars.length === 0) {
            alert("Please select at least one character type.");
            return "";
          }

          let password = "";

          // Fill the password with random characters
          for (let i = 0; i < length; i++) {
            password += pickRandomCharacter(requiredChars);
          }

          return password;
        }

        function pickRandomCharacter(characters) {
          return characters.charAt(
            Math.floor(Math.random() * characters.length)
          );
        }

        function shuffleString(string) {
          let array = string.split("");
          for (let i = array.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]];
          }
          return array.join("");
        }

        function getRandomInt(min, max) {
          return Math.floor(Math.random() * (max - min + 1)) + min;
        }
      });
      document
        .getElementById("copyButton")
        .addEventListener("click", function () {
          var inputField = document.getElementById("pass");
          inputField.select();
          document.execCommand("copy");
          alert("Copied the text: " + inputField.value);
        });
    </script>
  </body>
</html>
