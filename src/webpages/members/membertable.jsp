<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="dao.*,java.util.*,table.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../utility/bootstrap-4.0.0-dist/css/bootstrap.min.css" type="text/css">
<title>Members</title>
</head>
<body style="margin:10px;">	
<%int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");%>
	<%
	List<members> list1=memberdao.getaRecord(sessionLogin_id);
	request.setAttribute("list",list1);
	%>	

	<table border="1" class="table table-hover table-dark" size="90%">
	<thead>
	<tr>
		<th>Member ID</th>
		<th>Login ID</th>
		<th>Occupation</th>
		<th>Image</th>
		<th>First Name</th>
		<th>Middle Name</th>
		<th>Last Name</th>
		<th>Birth Date</th>
		<th>Contact Information</th>
		<th>Age</th>
		<th>Gender</th>
		<th>Marital Status</th>
		<th>Email</th>
		<th>City Address</th>
		<th>Provincial Address</th>		
		<th colspan="2">Action</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="m">
	<tr>
		<td>${m.getMember_id()}</td>
		<td>${m.getLogin_id()}</td>
		<td>${m.getOccupation()}</td>
		<td><img src="${m.getM_image()}" width="30px" height="30px"/>&nbsp;&nbsp;<a href="viewmemberImage.jsp?member_id=${m.getMember_id()}">View Image</a></td>
		<td>${m.getF_name()}</td>
		<td>${m.getM_name()}</td>
		<td>${m.getL_name()}</td>
		<td>${m.getBdate()}</td>
		<td>${m.getContact()}</td>
		<td>${m.getAge()}</td>
		<td>${m.getGender()}</td>
		<td>${m.getMaritalstatus()}</td>
		<td>${m.getEmail()}</td>
		<td>${m.getCityaddress()}</td>
		<td>${m.getProvinceaddress()}</td>
		<td><a href="../../editmemberform.jsp?member_id=${m.getMember_id()}">Edit</a> | <a href="../../editmemberimageform.jsp?member_id=${m.getMember_id()}">Edit Image</a></td> 
		<td><a href="memberdelete.jsp?member_id=${m.getMember_id()}">Delete</a></td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	<a class="btn btn-dark" href="../../addmemberform.jsp">Add another</a>
</body>
</html>