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
	<%int sessionLogin_id = (int) session.getAttribute("login_id");
	String sessionName = (String) session.getAttribute("username");
	String sessionType = (String) session.getAttribute("type");%>
	<%
		users u=userdao.getUserByID(Integer.parseInt(request.getParameter("login_id")));
		request.setAttribute("users", u);
		int event_id=Integer.parseInt(request.getParameter("event_id"));
	%>
<h1>Join Event</h1>
<form method="GET" action="userjoineventadd.jsp">
	<input type="hidden" name="login_id" value="<%out.print(sessionLogin_id);%>"/>
	<input type="hidden" name="event_id" value="<%=event_id %>"/>
	<table width="400px" align="center" border="2px">
		<tr>
			<th>Name</th>
			<td><input type="text" name="participants_name" placeholder="Name"/></td>
		</tr>
		<tr>
			<th>Contact Information</th>
			<td><input type="text" name="contact" placeholder="Ex:(+63)9876543210 " maxlength="16"/></td>
		</tr>
		<tr>
			<th>Address</th>
			<td><input type="text" name="address" placeholder="Address"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="Submit"/></td>
		</tr>
	
	</table>
</form>
<a href="eventtable.jsp?login_id=<%out.print(sessionLogin_id);%>">Back to Events</a>
</body>
</html>