<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="dao.*,table.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.details{
	height:200px;
	width:500px;
	margin-left:415px;
	margin-bottom:40px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");
%>
<%
	eventadd event=usereventadd.getEventbyid(Integer.parseInt(request.getParameter("event_id")));
	request.setAttribute("events", event);
%>
	<form method="POST" action="adminaddeventedit.jsp">
	<table width="400px" align="center" border="2px">
		<tr>
			<th>ID</tH>
			<td><input type="text" name="event_id" value="${events.getevent_Id()}"/></td>
		</tr>
		<tr>
			<th>Event</tH>
			<td><input type="text" name="event" value="${events.getEvent()}"/></td>
		</tr>
		<tr>
			<th>Sched</th>
			<td><input type="text" name="sched" value="${events.getSched()}"/></td>
		</tr>
		<tr>
			<th>Venue</th>
			<td><input type="text" name="venue" value="${events.getVenue()}"/></td>
		</tr>
		<tr>
			<th>Organizer</th>
			<td><input type="text" name="organizer" value="${events.getOrganizer()}"/></td>
		</tr>
		<tr>
			<th>Contact Information</th>
			<td><input type="text" name="contact" value="${events.getContact()}"  maxlength="16"/></td>
		</tr>
		<tr>
			<th style="text-align:center;">Details</th>
			<td><input  class="details" name="event_details" value="${events.getevent_details()}"></input></td>
		</tr>
		<tr>
			<td><input type="hidden" name="creator_id" value="<%out.print(sessionLogin_id);%>"></td>
			<td><input type="submit" value="Submit"/></td>
		</tr>
	
	</table>
	</form>
<a href="events.jsp">Back to Events</a>
</body>
</html>