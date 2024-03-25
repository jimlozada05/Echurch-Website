<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,java.util.*,table.*" %>
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
<form style="margin:50px;" method="GET" action="adminaddeventadd.jsp">
	<table width="400px" align="center" border="2px">
		<tr>
			<th>Event Name</th>
			<td><input type="text" name="event" placeholder="Name of your Event"/></td>
		</tr>
		<tr>
			<th>Schedule</th>
			<td><input type="text" name="sched" placeholder="Schedule of this event"/></td>
		</tr>
		<tr>
			<th>Venue</th>
			<td><input type="text" name="venue" placeholder="venue of the created event"/></td>
		</tr>
		<tr>
			<th>Organizer</th>
			<td><input type="text" name="organizer" placeholder="name of the organizer"/></td>
		</tr>
		<tr>
			<th>Contact Information</th>
			<td><input type="text" name="contact" placeholder="Ex:(+63)9876543210 " maxlength="16"/></td>
		</tr>
		<tr>
			<th style="text-align:center;">Details</th>
			<td><textarea  class="details" name="event_details"></textarea></td>
		</tr>
		<tr>
			<td><input type="hidden" name="creator_id" value="<%out.print('1');%>"></td>
			<td><input type="submit" value="Submit"/></td>
		</tr>
	
	</table>
</form>
<a style="text-align:left;" href="../events.jsp">Back to Events</a>


</body>
</html>