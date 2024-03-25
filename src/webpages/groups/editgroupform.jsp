<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,table.*,java.util.*" %>
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
<%
	group gr=groupdao.getgroupbyid(Integer.parseInt(request.getParameter("group_id")));
	request.setAttribute("gr", gr);
%>
	<form method="POST" action="editgroup.jsp">
	<table width="400px" align="center" border="2px">
		
		<tr>
			<th>Group</tH>
			<td><input type="text" name="gname" value="${gr.getgname()}"/></td>
		</tr>
		<tr>
			<th>Schedule</th>
			<td><input type="text" name="sched" value="${gr.getsched()}"/></td>
		</tr>
		<tr>
			<th>Venue</th>
			<td><input type="text" name="venue" value="${gr.getvenue()}"/></td>
		</tr>
		<tr>
			<th>Organizer</th>
			<td><input type="text" name="organizer" value="${gr.getorganizer()}"/></td>
		</tr>
		<tr>
			<th>Contact Information</th>
			<td><input type="text" name="contact" value="${gr.getcontact()}"  maxlength="16"/></td>
		</tr>
		<tr>
			<td><input type="hidden" name="creator_id" value="<%out.print(sessionLogin_id);%>">
			<input type="hidden" name="group_id" value="${gr.getgroup_id()}"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="Submit"/></td>
		</tr>
	
	</table>
	</form>
<a href="grouptable.jsp?login_id=<%out.print(sessionLogin_id);%>">Back to Group</a>
</body>
</html>