<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="dao.*,java.util.*,table.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../utility/bootstrap-4.0.0-dist/css/bootstrap.min.css" type="text/css">
<title>Attendance of Members</title>
</head>
<body>
<jsp:include page="dateclock.jsp"></jsp:include>
	<form>
	<%int sessionLogin_id = (int) session.getAttribute("login_id");
	String sessionName = (String) session.getAttribute("username");
	String sessionType = (String) session.getAttribute("type");%>
	<%
		List<attendances> list1= attendancedao.getARecord(Integer.parseInt(request.getParameter("login_id")));
		request.setAttribute("list", list1);
	%>	

	<table border="1" class="table table-hover table-dark" size="90%">
	<thead>
	<tr>
		<th>Attendance ID</th>
		<th>Login ID</th>
		<th>Date</th>
		<th>Status</th>
		<th>Action</th>
	</tr>
	</thead>
		<c:forEach items="${list}" var="at">
		<tbody>
			<tr>
				<td>${at.getAttendance_id()}</td>
				<td>${at.getLogin_id()}</td>
				<td>${at.getDate()}</td>
				<td>${at.getStatus()}</td>
				<td><a href="editattendanceform.jsp?attendance_id=${at.getAttendance_id()}">Edit</a> | <a href="attendancedelete.jsp?attendance_id=${at.getAttendance_id()}">Delete</a></td>	
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</form>	
	<a class="btn btn-dark" href="addattendanceform.jsp?login_id=<%out.print(sessionLogin_id);%>">Add another</a>



</body>
</html>