<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.*,java.util.*,table.*,java.sql.*,connect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../utility/bootstrap-4.0.0-dist/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../utility/css/some.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="margin:10px;">
<body>
<%int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");%>
	<%
		ArrayList<eventadd> eventlist=usereventadd.getEventlist();
		request.setAttribute("eventlis",eventlist);
	%>
<script type="text/javascript"> {
    document.getElementById("table1").style.display="none";
   
}
</script>
<h2 align="center">Events</h2>
<c:forEach items="${eventlis}" var="event">
<table border="1" class="table table-hover table-dark" size="90%">
	<tr>
		<th>Event</th>
		<th>Schedule</th>
		<th>Venue</th>
		<th>Organizer</th>
		<th>Contact Info.</th>
		<th colspan="4"></th>
	</tr>
	

	
	<tr>
	<td><c:out value="${event.getEvent()}"/></td>
	<td><c:out value="${event.getSched()}"/></td>
	<td><c:out value="${event.getVenue()}"/></td>
	<td><c:out value="${event.getOrganizer()}"/></td>
	<td><c:out value="${event.getContact()}"/>
	</td>
	<c:choose>
		<c:when test='${login_id eq event.getcreator_id()}'>
		<td><a class="btn btn-dark" href="usereventtable.jsp?event_id=${event.getevent_Id() }">View</a>
		| <a class="btn btn-dark" href="details.jsp?login_id=<%out.print(sessionLogin_id); %>&event_id=${event.getevent_Id() }">Details</a>
		| <a class="btn btn-dark" href="userjoineventaddform.jsp?login_id=<%out.print(sessionLogin_id);%>&event_id=${event.getevent_Id()}"">Join</a>
		<br><a class="btn btn-dark" href="addeventeditform.jsp?event_id=${event.getevent_Id() }">Edit</a>
		| <a class="btn btn-dark" href="deleteeventadd.jsp?event_id=${event.getevent_Id() }">Delete Event</a></td>
		</c:when>
		<c:otherwise>
		<td><a class="btn btn-dark" href="usereventtable.jsp?event_id=${event.getevent_Id() }">View</a>
		| <a class="btn btn-dark" href="details.jsp?login_id=<%out.print(sessionLogin_id); %>&event_id=${event.getevent_Id() }">Details</a>
		| <a class="btn btn-dark" href="userjoineventaddform.jsp?login_id=<%out.print(sessionLogin_id);%>&event_id=${event.getevent_Id()}"">Join</a></td>	
		</c:otherwise>
	</c:choose>
	
	</tr>

</table>
</c:forEach>

<a class="btn btn-dark" href="addeventaddform.jsp?login_id=<%out.print(sessionLogin_id);%>">Add Events</a>
<button class="btn btn-dark" onclick="getElementById('table1').style.display='block'">View Joined Events</button>




</body>
</html>