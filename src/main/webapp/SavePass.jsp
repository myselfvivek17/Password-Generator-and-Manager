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
<%@ page import="p.PasswordEncryption" %>
<%
String error=null;
String uid=session.getAttribute("uid").toString();
String password=PasswordEncryption.encrypt(request.getParameter("p"),session.getAttribute("pass").toString());
String company=request.getParameter("cmp");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/passwordgm","root","tiger");
	PreparedStatement ps=con.prepareStatement("insert into passwords (uid,password,company) values (?,?,?)");
	ps.setString(1,uid);
	ps.setString(2,password);
	ps.setString(3,company);
	int i=ps.executeUpdate();
	if(i>0){
		response.sendRedirect("pgm.jsp");
	}else{
		error="Could Not Save";
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