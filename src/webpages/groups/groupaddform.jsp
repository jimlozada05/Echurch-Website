<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,java.util.*,table.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");%>
<form method="GET" action="groupadd.jsp">
	<table width="400px" align="center" border="2px">
		<tr>
			<th>Group Name</th>
			<td><input type="text" name="gname" placeholder="Name of your group"/></td>
		</tr>
		<tr>
			<th>Schedule</th>
			<td><input type="text" name="sched" placeholder="Schedule of this group"/></td>
		</tr>
		<tr>
			<th>Venue</th>
			<td><input type="text" name="venue" placeholder="venue of the created group"/></td>
		</tr>
		<tr>
			<th>Group Founder</th>
			<td><input type="text" name="organizer" placeholder="name of the founder"/></td>
		</tr>
		<tr>
			<th>Contact Information</th>
			<td><input type="text" name="contact" placeholder="Ex:(+63)9876543210 " maxlength="16"/></td>
		</tr>
		
		<tr>
			<td>
			<input type="hidden" name="creator_id" value="<%out.print(sessionLogin_id);%>">
			<input type="submit" value="Submit"/></td>
		</tr>
	</table>
</form>
<a href="grouptable.jsp?login_id=<%out.print(sessionLogin_id);%>">Back to Group</a>
</body>
</html>