<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dao.*,java.util.*,table.*,java.sql.*,connect.*"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html lang="en">
	<head>
		<meta charset="utf-8" />
		<link rel="icon" type="image/png" href="assets/img/favicon.ico">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
		<title>Admin</title>
	
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
	
	    <!--
	
	        Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
	        Tip 2: you can also add an image using data-image tag
	
	    -->
	
	    	<div class="sidebar-wrapper">
	            <div class="logo">
	                <a href="http://www.creative-tim.com" class="simple-text">
	                    E-church Admin
	                </a>
	            </div>
	
	            <ul class="nav">
	                <li class="active">
	                    <a href="dashboard.jsp">
	                        <i class="pe-7s-graph"></i>
	                        <p>Dashboard</p>
	                    </a>
	                </li>
	                <li>
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
	                    <a class="navbar-brand" href="#">Dashboard</a>
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
	                    <div class="col-md-4">
	                        <div class="card">
	
	                            <div class="header">
	                                <h4 class="title">User</h4>
	                                <p class="category">All the users</p>
	                            </div>
	                            <div class="content">
	                                <div align="center">
	                                <%try{
	                                	Connection con=dbconnect.getConnection();
	                                	PreparedStatement ps=con.prepareStatement("SELECT COUNT(*) from user");
	                                	ResultSet rs=ps.executeQuery();
	                                	while(rs.next()){
	                                		out.print(rs.getInt(1));
	                                	}
	                                } 
	                                catch(Exception e){}
	                                %>
	                                </div>
	                                
	                                    <hr>
	                                    <div class="stats" align="right">
	                                       <a href="user.jsp"><i class="pe-7s-next-2"></i>View user</a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                         <div class="col-md-4">
	                        <div class="card">
	
	                            <div class="header">
	                                <h4 class="title">Employee</h4>
	                                <p class="category">All the employee</p>
	                            </div>
	                            <div class="content">
	                                <div align="center">
	                                <%try{
	                                	Connection con=dbconnect.getConnection();
	                                	PreparedStatement ps=con.prepareStatement("SELECT COUNT(*) from employee");
	                                	ResultSet rs=ps.executeQuery();
	                                	while(rs.next()){
	                                		out.print(rs.getInt(1));
	                                	}
	                                } 
	                                catch(Exception e){}
	                                %>
	                                </div>
	                                
	                                    <hr>
	                                    <div class="stats" align="right">
	                                       <a href="employee.jsp"><i class="pe-7s-next-2"></i>View employee</a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-md-4">
	                        <div class="card">
	
	                            <div class="header">
	                                <h4 class="title">Member</h4>
	                                <p class="category">All the member</p>
	                            </div>
	                            <div class="content">
	                                <div align="center">
	                                <%try{
	                                	Connection con=dbconnect.getConnection();
	                                	PreparedStatement ps=con.prepareStatement("SELECT COUNT(*) from member");
	                                	ResultSet rs=ps.executeQuery();
	                                	while(rs.next()){
	                                		out.print(rs.getInt(1));
	                                	}
	                                } 
	                                catch(Exception e){}
	                                %>
	                                </div>
	                                
	                                    <hr>
	                                    <div class="stats" align="right">
	                                       <a href="member.jsp"><i class="pe-7s-next-2"></i>View member</a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	
	
	                <div class="row">
	                 <div class="col-md-4">
	                        <div class="card">
	
	                            <div class="header">
	                                <h4 class="title">Attendance</h4>
	                                <p class="category">all attendance</p>
	                            </div>
	                            <div class="content">
	                                <div align="center">
	                                <%try{
	                                	Connection con=dbconnect.getConnection();
	                                	PreparedStatement ps=con.prepareStatement("SELECT COUNT(*) from attendance");
	                                	ResultSet rs=ps.executeQuery();
	                                	while(rs.next()){
	                                		out.print(rs.getInt(1));
	                                	}
	                                } 
	                                catch(Exception e){}
	                                %>
	                                </div>
	                                
	                                    <hr>
	                                    <div class="stats" align="right">
	                                       <a href="attendance.jsp"><i class="pe-7s-next-2"></i>View attendance</a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                         <div class="col-md-4">
	                        <div class="card">
	
	                            <div class="header">
	                                <h4 class="title">Events</h4>
	                                <p class="category">All the event</p>
	                            </div>
	                            <div class="content">
	                                <div align="center">
	                                <%
	                                try{
	                                	Connection con=dbconnect.getConnection();
	                                	PreparedStatement ps=con.prepareStatement("SELECT COUNT(*) from eventtb");
	                                	ResultSet rs=ps.executeQuery();
	                                	while(rs.next()){
	                                		out.print(rs.getInt(1));
	                                	}
	                                } 
	                                catch(Exception e){}
	                                %>
	                                and
	                                <%
	                                try{
	                                	Connection con=dbconnect.getConnection();
	                                	PreparedStatement ps=con.prepareStatement("SELECT COUNT(*) from userparticipants");
	                                	ResultSet rs=ps.executeQuery();
	                                	while(rs.next()){
	                                		out.print(rs.getInt(1));
	                                	}
	                                } 
	                                catch(Exception e){}
	                                %>
	                                </div>
	                                
	                                    <hr>
	                                    <div class="stats" align="right">
	                                       <a href="events.jsp"><i class="pe-7s-next-2"></i>View event</a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-md-4">
	                        <div class="card">
	
	                            <div class="header">
	                                <h4 class="title">Group</h4>
	                                <p class="category">All the group </p>
	                            </div>
	                            <div class="content">
	                                <div align="center">
	                                <%
	                                try{
	                                	Connection con=dbconnect.getConnection();
	                                	PreparedStatement ps=con.prepareStatement("SELECT COUNT(*) from grouptb");
	                                	ResultSet rs=ps.executeQuery();
	                                	while(rs.next()){
	                                		out.print(rs.getInt(1));
	                                	}
	                                } 
	                                catch(Exception e){}
	                                %>
	                                and
	                                <%
	                                try{
	                                	Connection con=dbconnect.getConnection();
	                                	PreparedStatement ps=con.prepareStatement("SELECT COUNT(*) from groupusertb");
	                                	ResultSet rs=ps.executeQuery();
	                                	while(rs.next()){
	                                		out.print(rs.getInt(1));
	                                	}
	                                } 
	                                catch(Exception e){}
	                                %>
	                                </div>
	                                
	                                    <hr>
	                                    <div class="stats" align="right">
	                                       <a href="groups.jsp"><i class="pe-7s-next-2"></i>View group</a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        
	                    </div>
	                     <div class="row">
	                 <div class="col-md-4">
	                        <div class="card">
	
	                            <div class="header">
	                                <h4 class="title">Church Transaction</h4>
	                                <p class="category">all transaction</p>
	                            </div>
	                            <div class="content">
	                                <div align="center">#</div>
	                                
	                                    <hr>
	                                    <div class="stats" align="right">
	                                       <a href="transaction.jsp"><i class="pe-7s-next-2"></i>View transaction</a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                         <div class="col-md-4">
	                        <div class="card">
	
	                            <div class="header">
	                                <h4 class="title">Accounting</h4>
	                                <p class="category">all history</p>
	                            </div>
	                            <div class="content">
	                                <div align="center">#</div>
	                                
	                                    <hr>
	                                    <div class="stats" align="right">
	                                       <a href="accounting.jsp"><i class="pe-7s-next-2"></i>View accounting</a>
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
	
		<script type="text/javascript">
	    	$(document).ready(function(){
	
	        	demo.initChartist();
	
	        	$.notify({
	            	icon: 'pe-7s-gift',
	            	message: "Welcome to <b>Light Bootstrap Dashboard</b> - a beautiful freebie for every web developer."
	
	            },{
	                type: 'info',
	                timer: 4000
	            });
	
	    	});
		</script>
	
	</html>
