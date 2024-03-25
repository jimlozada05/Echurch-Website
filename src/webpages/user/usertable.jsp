<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page import="dao.*,table.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../utility/bootstrap-4.0.0-dist/css/bootstrap.min.css" type="text/css">
<title>Users</title>
</head>
<body style="margin:10px;">
	<form>
	<%
	List<users> list1=userdao.getARecord(Integer.parseInt(request.getParameter("login_id")));
	request.setAttribute("list",list1);
	%>	

	<table border="1" class="table table-hover table-dark" size="90%">
	<thead>
	<tr>
		<th>Login ID</th>
		<th>Username</th>
		<th>Password</th>
		<th>Type</th>
		<th>Action</th>
	</tr>
	</thead>
		<c:forEach items="${list}" var="u">
		<tbody>
			<tr>
				<td>${u.getLogin_id()}</td>
				<td>${u.getUsername()}</td>
				<td>${u.getPassword()}</td>
				<td>${u.getType()}</td>
				<td><a href="editform.jsp?login_id=${u.getLogin_id()}">Edit</a> | <a href="userdelete.jsp?login_id=${u.getLogin_id()}">Delete</a></td>	
			</tr>
		</c:forEach>
		</tbody>
		
	</table>
	</form>	
	<a class="btn btn-dark" href="addform.jsp">Add another</a>


</body>
</html>