<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="webpages/utility/bootstrap-4.0.0-dist/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="webpages/utility/css/admin.css">
<title>Admin</title>
</head>
<body>
<nav class="navbar" style="box-shadow: 0 5px 10px #efefef;">
<div class="container">
<div class="navbar-header" style="font-size:20px;">
<p>Echurch Admin</p>
</div>
<ul class="nav navbar-nav navbar-right">
<li><a href="webpages/logout.jsp" class="navbar-right">Logout</a></li>
</ul>
</div>
</nav>
<section>
<br>
<ul>
<li><div class="box1">
<h3>Users</h3>
<hr>
<p align="right"><a class="btn btn-first" href="webpages/user/useadminhome.jsp">View</a></p>
</div></li>

<li><div class="box2">
<h3>Employee</h3>
<hr>
<p align="right"><a class="btn btn-first" href="webpages/employee/employeeadminhome.jsp">View</a></p>
</div></li>

<li><div class="box3">
<h3>Members</h3>
<hr>
<p align="right"><a class="btn btn-first" href="webpages/members/memberadminhome.jsp">View</a></p>
</div></li>

<li><div class="box4">
<h3>Attendances</h3>
<hr>
<p align="right"><a class="btn btn-first" href="webpages/attendance/attendanceadminhome.jsp">View</a></p>
</div></li>
</ul>
</section>
</body>
</html>