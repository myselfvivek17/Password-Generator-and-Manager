<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <title>Profile</title>
    <style>
      body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-image: url(yuriy-kovalev-nN1HSDtKdlw-unsplash.jpg);
        background-size: cover;
        background-position: center;
        height: 100vh;
      }
      i {
        margin-right: 5px; /* Adjust margin as needed */
        background-color: #f0f0f0; /* Default background color */
        color: #333; /* Default text color */
        padding: 8px; /* Adjust padding as needed */
        border-radius: 50%;
        display: inline-flex; 
        justify-content: center;
        align-items: center;
      }
      .card-body{
      border-radius: 0 0 10px 10px;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-3">
          <div class="card p-3 mb-3">
            <img
              src="istockphoto-1130884625-612x612-removebg-preview.png"
              class="card-img-top"
            />
            <div class="card-body">
              <h5 class="card-title"><%=session.getAttribute("uname") %></h5>
              <p class="card-text">Email: <%=session.getAttribute("email") %></p>
              <form action="DeleteAccount.jsp" method="post" class="flex justify-content-evenly">
              	  <a href="pgm.jsp" class="btn btn-primary">Home</a>
                  <button type="submit" class="btn btn-danger">Delete Account</button>
              </form>
            </div>
          </div>
        </div>
        <div class="col-md-8">
          <div class="card mb-3">
            <div class="card-body rounded-bottom">
              <h1 class="card-title pt-5 pb-5">Passwords</h1>
            </div>
            <ul class="list-group list-group-flush">
<%@ page import="java.sql.*" %>
<%@ page import="p.PasswordEncryption" %>
<%
    String errorMessage = null;

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/passwordgm", "root", "tiger");
        
        String query = "SELECT * FROM passwords WHERE uid = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, session.getAttribute("uid").toString());
        rs = ps.executeQuery();
        while(rs.next()){
        	String s= session.getAttribute("pass").toString();
        	String passw=PasswordEncryption.decrypt(rs.getString("password"), s);
%>
			<li class="list-group-item">
                <div class="d-flex justify-content-between align-items-center">
                  <h5 class="text-center"><i class="fa-brands fa-<%= rs.getString("company").toLowerCase() %>" style="margin-right: 5px"></i><%= rs.getString("company") %></h5>
                  <div class="input-group" style="width: 40%">
                 
                    <input type="password" class="form-control" value="<%=passw%>"/>
                    <span
                      class="input-group-text show-password"
                      style="cursor: pointer"
                      >Show</span
                    >
                    <span
                      class="input-group-text copy-password"
                      style="cursor: pointer"
                      >Copy  </span
                    >
                  <form action="DeletePassword.jsp" method="post">
                  <input type="hidden" value="<%= rs.getString("pid") %>"  name="pid">
                  <button type="submit" class="btn btn-danger" style="margin-left:10px">Delete</button>
                  </form>
                  </div>
                  
                </div>
              </li>

<%       	
        }
    } catch (Exception e) {
        errorMessage = e.getMessage();
    } finally {
    if (errorMessage != null) {
        session.setAttribute("errorMessage", errorMessage);
        response.sendRedirect("error.jsp");
    }
    }
%>
              
            </ul>
          </div>
        </div>
      </div>
    </div>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const showPasswordButtons = document.querySelectorAll(".show-password");
        const copyPasswordButtons = document.querySelectorAll(".copy-password");

        // Function to toggle password visibility
        showPasswordButtons.forEach(function (button) {
          button.addEventListener("click", function () {
            const inputField = button.parentNode.querySelector("input");
            if (inputField.type === "password") {
              inputField.type = "text";
              button.textContent = "Hide";
            } else {
              inputField.type = "password";
              button.textContent = "Show";
            }
          });
        });

        // Function to copy password to clipboard
       copyPasswordButtons.forEach(function(button) {
            button.addEventListener('click', function() {
                const inputField = button.parentNode.querySelector('input');
                const passwordToCopy = inputField.value;

                navigator.clipboard.writeText(passwordToCopy)
                    .then(function() {
                        // Provide feedback to the user that the password has been copied
                        alert('Password copied to clipboard!');
                    })
                    .catch(function(error) {
                        console.error('Unable to copy password: ', error);
                    });
            });
        });
      });
    </script>
  </body>
</html>
