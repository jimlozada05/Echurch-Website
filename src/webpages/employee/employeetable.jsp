<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="dao.*,java.util.*,table.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../utility/bootstrap-4.0.0-dist/css/bootstrap.min.css" type="text/css">
<title>Employees</title>
</head>
<body style="margin:10px;">	
<%int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");%>
	<%
	List<employees> list1=employeedao.getaRecord(sessionLogin_id);
	request.setAttribute("list",list1);
	%>	

	<table border="1" class="table table-hover table-dark" size="90%">
	<thead>
	<tr>
		<th>Employee ID</th>
		<th>Login ID</th>
		<th>Position</th>
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
		<c:forEach items="${list}" var="ee">
	<tr>
		<td>${ee.getEmployee_id()}</td>
		<td>${ee.getLogin_id()}</td>
		<td>${ee.getPosition()}</td>
		<td><img src="${ee.getEe_image()}" width="30px" height="30px"/>&nbsp;&nbsp;<a href="viewemployeeImage.jsp?employee_id=${ee.getEmployee_id()}">View Image</a></td>
		<td>${ee.getF_name()}</td>
		<td>${ee.getM_name()}</td>
		<td>${ee.getL_name()}</td>
		<td>${ee.getBdate()}</td>
		<td>${ee.getContact()}</td>
		<td>${ee.getAge()}</td>
		<td>${ee.getGender()}</td>
		<td>${ee.getMaritalstatus()}</td>
		<td>${ee.getEmail()}</td>
		<td>${ee.getCityaddress()}</td>
		<td>${ee.getProvinceaddress()}</td>
		<td><a href="../../editemployeeform.jsp?employee_id=${ee.getEmployee_id()}">Edit</a> | <a href="../../editemployeeimageform.jsp?employee_id=${ee.getEmployee_id()}">Edit Image</a></td> 
		<td><a href="employeedelete.jsp?employee_id=${ee.getEmployee_id()}">Delete</a></td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	<a class="btn btn-dark" href="../../addemployeeform.jsp">Add another</a>
</body>
</html>