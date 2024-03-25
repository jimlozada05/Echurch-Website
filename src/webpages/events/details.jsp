<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.*,table.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

<table width="400px" align="center" border="2px">
	<th>Details</th>
<%
		ArrayList<eventadd> eventlist=usereventadd.getsomeRecord(Integer.parseInt(request.getParameter("event_id")));
		request.setAttribute("eventlis",eventlist);
	%>
	<c:forEach items="${eventlis}" var="event">
	<tr>
	<td><textarea width="400px" height="300px"><c:out value="${event.getevent_details()}"/></textarea></td>
	</tr>
	</c:forEach>
</table>
<a class="btn btn-dark" href="eventtable.jsp?login_id=<%out.print(sessionLogin_id);%>">Back to Events</a>
</body>
</html>