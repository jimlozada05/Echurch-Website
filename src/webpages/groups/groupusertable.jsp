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
<h2 align="center">Group Members</h2>
<table border="1" class="table table-hover table-dark" size="90%">
			<tr>	
				<th>ID</th>
				<th>NAME</th>
				<th>CONTACT INFORMATION</tH>
				<th>ADDRESS</tH>
				<th class="hide"></th>
				<th class="hide"></th>
				<th colspan="2"></th>
				
			</tr>
	<%	
			ArrayList<groupuser> grlist=groupuserdao.getsomeRecord(Integer.parseInt(request.getParameter("group_id")));
			request.setAttribute("grlis",grlist);
	%>
		<c:forEach items="${grlis}" var="gr">
			<tr>
				<td><c:out value="${gr.getgroupuser_id() }"/></td>
				<td><c:out value="${gr.getparticipants_name() }"/></td>
				<td><c:out value="${gr.getContact() }"/></td>
				<td><c:out value="${gr.getAddress() }"/></td>
				<td class="hide"><c:out value="${gr.getgroup_id_fk() }"/></td>
				<td class="hide"><c:out value="${gr.getloginn_id() }"/></td>
			<c:choose>
				<c:when test='${login_id eq gr.getloginn_id()}'>
				<td><a class="btn btn-dark" href="groupeditform.jsp?groupuser_id=${gr.getgroupuser_id()}">Edit</a>
				| <a class="btn btn-dark" href="deleteusergroup.jsp?groupuser_id=${gr.getgroupuser_id()}">Unjoin</a></td>
				</c:when>
				<c:otherwise>
				<td><a class="btn btn-dark">View Profile</a></td>
				</c:otherwise>
			</c:choose>
			</tr>
		</c:forEach>
</table>
<a href="grouptable.jsp">Back to Group</a>
</body>
</html>