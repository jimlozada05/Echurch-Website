<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,table.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Join Event</title>
</head>
<body>
<%
	events event=userevent.getEventbyid(Integer.parseInt(request.getParameter("userevent_id")));
	request.setAttribute("eve",event);
%>
<h1>Edit Event</h1>
<form method="POST" action="adminedituserjoinevent.jsp">
	<input type="hidden" name="loginn_id" value="${eve.getloginn_id()}"/>
	<input type="hidden" name="event_id_fk" value="${eve.getevent_id_fk()}"/>
	
	<table width="400px" align="center" border="2px">
	
		<tr>
			<th>participants_name</th>
			<td><input type="text" name="participants_name" value="${eve.getparticipants_name()}"/></td>
		</tr>
		<tr>
			<th>Contact Information</th>
			<td><input type="text" name="contact" value="${eve.getContact()}" /></td>
		</tr>
		<tr>
			<th>Address</th>
			<td><input type="text" name="address" value="${eve.getAddress()}" /></td>
		</tr>
		<tr>
			<td><input type="hidden" name="userevent_id" value="${eve.getuserevent_Id()}" />
			
			<input type="submit" value="Submit"/></td>
		</tr>
	
	</table>
</form>
<a href="../events.jsp?">Back to Events</a>
</body>
</html>