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
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%
String error=null;
String uname=request.getParameter("uname");
String email=request.getParameter("email");
String pass1=request.getParameter("pass1");
String pass2=request.getParameter("pass2");
if(!pass1.equals(pass2)){
	session.setAttribute("errorMessage","Please Enter Correct Passwords");
	response.sendRedirect("error.jsp");
	return;
}
try{
	String hashPass = BCrypt.hashpw(pass1, BCrypt.gensalt());
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/passwordgm","root","tiger");
	PreparedStatement ps=con.prepareStatement("insert into users (uname,email,password) values (?,?,?)");
	ps.setString(1,uname);
	ps.setString(2,email);
	ps.setString(3,hashPass);
	int i=ps.executeUpdate();
	if(i>0){
		response.sendRedirect("Home.html");
	}else{
		error="Could Not Register";
	}
}catch(Exception e){
	error=e.getMessage();
}finally{
	if(error!=null){
		session.setAttribute("errorMessage",error);
		response.sendRedirect("error.jsp");
	}
}
%>
</body>
</html>