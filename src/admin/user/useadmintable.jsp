<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page import="dao.*,table.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../utility/bootstrap-4.0.0-dist/css/bootstrap.min.css" type="text/css">
<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Light Bootstrap Dashboard by Creative Tim</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
<title>Users</title>
</head>
<body style="margin:10px;">
	<div class="content">
            <div class="container-fluid">
                <div class="row">
                <div class="col-md-12">
                        <div class="card card-plain">
                            <div class="header">
                            <h4 class="title">User Table</h4>
                                <p class="category">all about them</p>
	<form>
	<%
	List<users> list1=userdao.getAllRecords();
	request.setAttribute("list",list1);
	%>	
  <div class="content table-responsive table-full-width">
	<table border="1" class="table table-hover" size="90%">
	<thead>
	<tr>
		<th>Login ID</th>
		<th>Username</th>
		<th>Password</th>
		<th>Type</th>
		<th>Action</th>
	</tr>
	</thead>
		<c:forEach items="${list}" var="u">
		<tbody>
			<tr>
				<td>${u.getLogin_id()}</td>
				<td>${u.getUsername()}</td>
				<td>${u.getPassword()}</td>
				<td>${u.getType()}</td>
				<td><a href="useadmineditform.jsp?login_id=${u.getLogin_id()}">Edit</a> | <a href="useadmindelete.jsp?login_id=${u.getLogin_id()}">Delete</a></td>	
			</tr>
		</c:forEach>
		</tbody>
		
			</table>
			</div>
		</form>
		</div>
		</div>
		</div>
	</div>
	</div>
	</div>	
	<a class="btn btn-dark" href="useadminaddform.jsp">Add another</a>


</body>
</html>