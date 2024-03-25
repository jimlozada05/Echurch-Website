<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.*,table.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.hide{display:none;}
</style>
<link rel="stylesheet" href="../utility/bootstrap-4.0.0-dist/css/bootstrap.min.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");
%>
<table border="1" class="table table-hover table-dark" size="90%">
			<tr>	
				<th>ID</th>
				<th>PARTICIPANTS NAME</th>
				<th>CONTACT INFORMATION</tH>
				<th>ADDRESS</tH>
				<th class="hide"></th>
				<th class="hide"></th>
				<th colspan="2"></th>
				
			</tr>
	<%	
			ArrayList<events> eventlist=userevent.getsomeRecord(Integer.parseInt(request.getParameter("event_id")));
			request.setAttribute("eventlis",eventlist);
	%>
		<c:forEach items="${eventlis}" var="event">
			<tr>
				<td><c:out value="${event.getuserevent_Id() }"/></td>
				<td><c:out value="${event.getparticipants_name() }"/></td>
				<td><c:out value="${event.getContact() }"/></td>
				<td><c:out value="${event.getAddress() }"/></td>
				<td class="hide"><c:out value="${event.getevent_id_fk() }"/></td>
				<td class="hide"><c:out value="${event.getloginn_id() }"/></td>
		<c:choose>
			<c:when test='${login_id eq event.getloginn_id()}'>
			<td><a class="btn btn-dark" href="edituserjoineventform.jsp?userevent_id=${event.getuserevent_Id()}">Edit</a>
				| <a class="btn btn-dark" href="deleteuserjoinevent.jsp?userevent_id=${event.getuserevent_Id()}">Unjoin</a></td>
			</c:when>
			<c:otherwise>
				<td><a class="btn btn-dark">View Profile</a></td>
			</c:otherwise>
	 	</c:choose>
				
			</tr>
		</c:forEach>
</table>

<a href="eventtable.jsp?login_id=<%out.print(sessionLogin_id);%>">Back to Events</a>
</body>
</html>