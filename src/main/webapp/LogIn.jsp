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
String email=request.getParameter("email");
String pass=request.getParameter("pass");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/passwordgm","root","tiger");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
	if(rs.next()){
		if (BCrypt.checkpw(pass, rs.getString("password"))) {
			session.setAttribute("uid",rs.getString("uid"));
			session.setAttribute("uname",rs.getString("uname"));
			session.setAttribute("email",rs.getString("email"));
			session.setAttribute("pass",pass);
			response.sendRedirect("pgm.jsp");
		}else{
			error="Invalid Password";
		}
	}else{
		error="Invalid email Please Register";
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