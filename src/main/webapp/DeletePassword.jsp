<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
    String errorMessage = null;

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/passwordgm", "root", "tiger");
        
        String query = "delete from passwords where pid = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, request.getParameter("pid"));
        int i = ps.executeUpdate();
        if(i>0){
        	response.sendRedirect("profile.jsp");
        }else{
        	errorMessage="Cound not delete";
        }
    } catch (Exception e) {
        errorMessage = "Database Error: " + e.getMessage();
    } finally {
        if (ps != null) ps.close();
        if (con != null) con.close();
    }

    if (errorMessage != null) {
        session.setAttribute("errorMessage", errorMessage);
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>