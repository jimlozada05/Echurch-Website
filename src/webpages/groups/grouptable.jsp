<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.*,connect.*,table.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../utility/bootstrap-4.0.0-dist/css/bootstrap.min.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="margin:10px;">
<body>
<%int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");%>
<h2 align="center">Groups</h2>
<table border="1" class="table table-hover table-dark" size="90%">
	<tr>
		<th>Group</th>
		<th>Schedule</th>
		<th>Venue</th>
		<th>Organizer</th>
		<th>Contact Information</th>
		<th colspan="4"></th>
	</tr>
<%
	ArrayList<group> grouplist=groupdao.getgrouplist();
	request.setAttribute("grouplis",grouplist);
%>
	<c:forEach items="${grouplis }" var="gr">
		<tr>
			<td><c:out value="${gr.getgname() }"/></td>
			<td><c:out value="${gr.getsched() }"/></td>
			<td><c:out value="${gr.getvenue() }"/></td>
			<td><c:out value="${gr.getorganizer() }"/></td>
			<td><c:out value="${gr.getcontact() }"/></td>
		<c:choose>
			<c:when test='${login_id eq gr.getcreator_id() }'>
			<td><a class="btn btn-dark" href="groupusertable.jsp?group_id=${gr.getgroup_id() }">View</a>
			| <a class="btn btn-dark" href="groupuseraddform.jsp?login_id=<%out.print(sessionLogin_id); %>&group_id=${gr.getgroup_id()}">Join Group</a>
			| <a class="btn btn-dark" href="editgroupform.jsp?group_id=${gr.getgroup_id()}">Edit</a>
			| <a class="btn btn-dark" href="deletegroup.jsp?group_id=${gr.getgroup_id()}">Disband</a></td>
			</c:when>
			<c:otherwise>
			<td><a class="btn btn-dark" href="groupusertable.jsp?group_id=${gr.getgroup_id() }">View</a>
			| <a class="btn btn-dark" href="groupuseraddform.jsp?login_id=<%out.print(sessionLogin_id); %>&group_id=${gr.getgroup_id()}">Join Group</a></td>
			</c:otherwise>
		</c:choose>
		
		</tr>
	</c:forEach>
</table>	
<a class="btn btn-dark" href="groupaddform.jsp?creator_id=<%out.print(sessionLogin_id);%>">Add Group</a>
</body>
</html>