<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,table.*,java.util.*" %>
<%int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	groupuser group=groupuserdao.getgroupbyid(Integer.parseInt(request.getParameter("groupuser_id")));
	request.setAttribute("eve",group);
%>
<h1>Edit Event</h1>
<form method="POST" action="groupuseredit.jsp">
	<input type="hidden" name="loginn_id" value="${eve.getloginn_id()}"/>
	<input type="hidden" name="group_id_fk" value="${eve.getgroup_id_fk()}">
	
	<table width="400px" align="center" border="2px">
	
		<tr>
			<th>Name</th>
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
			<td>
			<input type="hidden" name="groupuser_id" value="<%out.print(Integer.parseInt(request.getParameter("groupuser_id")));%>"/>
			<input type="submit" value="Submit"/></td>
		</tr>
	
	</table>
</form>
<a href="grouptable.jsp?login_id=<%out.print(sessionLogin_id);%>">Back to Groups</a>
</body>
</html>