<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,table.*,connect.*,dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	users u=userdao.getUserByID(Integer.parseInt(request.getParameter("login_id")));
	request.setAttribute("users", u);
	%>
	<form method="GET" action="user/useredit.jsp">
	<input type="hidden" name="login_id" value="<%=u.getLogin_id()%>">
		<label>Username</label>
		<input type="text" name="username" value="<%=u.getUsername()%>" required>
		<br>
		<label>Password</label>
		<input type="text" name="password" value="<%=u.getPassword()%>" required>
		<br>
		<label>Type</label>
		<select name="type">
		 <option value="Member" ${users.getType() == "Member" ? "selected" : ""}>Member</option>
         <option value="Employee" ${users.getType() == "Employee" ? "selected" : ""}>Employee</option>
		</select>
		<br>
		<button type="submit">Edit</button>
		<button onclick="location.href='usertable.jsp'">Cancel</button>
	</form>
	
	
</body>
</html>