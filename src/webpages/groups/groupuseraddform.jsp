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
		int group_id=Integer.parseInt(request.getParameter("group_id"));
	%>
<h1>Join Group</h1>
<form method="GET" action="groupuseradd.jsp">
	<input type="hidden" name="login_id" value="<%out.print(sessionLogin_id);%>"/>
	<input type="hidden" name="group_id" value="<%=group_id %>"/>
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
<a href="grouptable.jsp?login_id=<%out.print(sessionLogin_id);%>">Back to Group</a>

</body>
</html>