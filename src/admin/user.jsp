<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page import="dao.*,table.*,java.util.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
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
</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-5.jpg">

    <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://www.creative-tim.com" class="simple-text">
                    E-church Admin
                </a>
            </div>

            <ul class="nav">
	                <li>
	                    <a href="dashboard.jsp">
	                        <i class="pe-7s-graph"></i>
	                        <p>Dashboard</p>
	                    </a>
	                </li>
	                <li class="active">
	                    <a href="user.jsp">
	                        <i class="pe-7s-user"></i>
	                        <p>User Profile</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="employee.jsp">
	                        <i class="pe-7s-note2"></i>
	                        <p>Employee List</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="member.jsp">
	                        <i class="pe-7s-news-paper"></i>
	                        <p>Member List</p>
	                    </a>
	                </li>
	                <li>
	                	<a href="events.jsp">
	                	<i class="pe-7s-bicycle"></i>
	                	<p>Events</p>
	                	</a>
	                </li>
	                 <li>
	                	<a href="groups.jsp">
	                	<i class="pe-7s-global"></i>
	                	<p>Groups</p>
	                	</a>
	                </li>
	                <li>
	                    <a href="attendance.jsp">
	                        <i class="pe-7s-stopwatch"></i>
	                        <p>Attendance</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="transaction.jsp">
	                        <i class="pe-7s-shopbag"></i>
	                        <p>Church Transaction</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="accounting.jsp">
	                        <i class="pe-7s-credit"></i>
	                        <p>Accounting</p>
	                    </a>
	                </li>
	            </ul>
    	</div>
    </div>

    <div class="main-panel">
	        <nav class="navbar navbar-default navbar-fixed">
	            <div class="container-fluid">
	                <div class="navbar-header">
	                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
	                        <span class="sr-only">Toggle navigation</span>
	                        <span class="icon-bar"></span>
	                        <span class="icon-bar"></span>
	                        <span class="icon-bar"></span>
	                    </button>
	                    <a class="navbar-brand" href="#">User</a>
	                </div>
	                <div class="collapse navbar-collapse">
	
	                    <ul class="nav navbar-nav navbar-right">
	                        <li>
	                            <a href="../webpages/logout.jsp">
	                                <p>Log out</p>
	                            </a>
	                        </li>
							<li class="separator hidden-lg"></li>
	                    </ul>
	                </div>
	            </div>
	        </nav>
	


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
	<table class="table table-hover">
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
				<td><a style="cursor:pointer;" onclick="location.href='user/useadmineditform.jsp?login_id=${u.getLogin_id()}'">Edit</a> | <a style="cursor:pointer;" onclick="location.href='user/useadmindelete.jsp?login_id=${u.getLogin_id()}'">Delete</a></td>	
			</tr>
		</c:forEach>
		</tbody>
		
			</table>
			</div>
		</form>
		 	<div class="col-md-2">
                <button class="btn btn-default btn-block" onclick="location.href='user/useadminaddform.jsp'">Add User</button>
            </div>
		</div>
		</div>
		</div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <footer class="footer">
            <div class="container-fluid">
               
                <p class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script> <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web
                </p>
            </div>
        </footer>

    </div>
</div>


</body>

    <!--   Core JS Files   -->
    <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>

</html>
