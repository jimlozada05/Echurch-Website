<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,java.util.*,table.*,java.sql.*,connect.*"%>
<%
try{
Connection conn=dbconnect.getConnection();
PreparedStatement ps= conn.prepareStatement("SET @@global.time_zone='+08:00'");
ResultSet rs=ps.executeQuery();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="webpages/utility/css/llstyle.css">
<title>Login Form</title>
</head>
<body>
	<div class="loginbox">
	<img src="webpages/utility/pics/mask.png" class="avatar">
		<h1>Login</h1>	
		<form method="post" action="webpages/login.jsp">
				<p>Username</p>
					<input type="text" name="username" placeholder="Enter Username"> 
				<p>Password</p>
					<input type="password" name="password" placeholder="Enter Password">
				<button type="submit" name="submit" value="login" id="button">Login</button>	
			<p>Not a Member?Yet?<a href="webpages/RegistrationForm.jsp" id="reg">Sign up</a></p>			
		</form>
		</div>
</body>
</html>
<%
}

catch (Exception e){
	e.printStackTrace();
}
%>