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
	String uid=session.getAttribute("uid").toString();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/passwordgm", "root", "tiger");
        Statement st=con.createStatement();
        int i=st.executeUpdate("delete from passwords where uid="+uid);
        int j=st.executeUpdate("delete from users where uid="+uid);
        if(j>0&&i>=0){
%>
		<h1 align=center>Account deleted successfully</h1>
<%			
			response.sendRedirect("Home.html");
        }else{
        	errorMessage="Could not delete";
        }
    }catch (Exception e) {
        errorMessage = "Database Error: " + e.getMessage();
    } finally {
        if (rs != null) rs.close();
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