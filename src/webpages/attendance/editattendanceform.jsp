<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,table.*,connect.*,dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../utility/css/rad.css">
<title>Edit attendance</title> 
</head>
<body>

	<%
	attendances at=attendancedao.getAttendanceByID(Integer.parseInt(request.getParameter("attendance_id")));
	request.setAttribute("attendances", at);
	%>
	<form method="GET" action="attendanceedit.jsp">
	<input type="hidden" name="attendance_id" value="<%=at.getAttendance_id()%>">
	<input type="hidden" name="login_id" value="<%=at.getLogin_id()%>">
	
		<label>Date: </label>
		<input type="date" name="date" value="<%=at.getDate()%>"><br/><br/>
		
		<label>Status</label>
		<input type="radio" name ="status" value="<%=at.getStatus()%>" checked hidden>
		<div class="toggle-radio">
		  <input type="radio" name="status" id="yes" value="Present">
		  <input type="radio" name="status" id="no" value="Absent">
		  <div class="switch">
		    <label for="yes">Present</label>
		    <label for="no">Absent</label>
		    <span></span>
		  </div>
		</div>
		<button type="submit">Edit</button>
		<button onclick="location.href='attendance.jsp'">Cancel</button>
	</form>
	
	
</body>
</html>