<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,connect.*,dao.*,table.*" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/png" href="admin/assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Edit Employee Form</title>
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="admin/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="admin/assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="admin/assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="admin/assets/css/demo.css" rel="stylesheet" />

	<link rel="stylesheet" type="text/css" href="admin/assets/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="admin/assets/css/demo.css" />
	<link rel="stylesheet" type="text/css" href="admin/assets/css/component.css" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="admin/assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
</head>
<body>
<div class="wrapper">
    <div class="sidebar" data-color="purple" data-image="admin/assets/img/sidebar-5.jpg">

    <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://www.creative-tim.com" class="simple-text">
                    E-church Admin
                </a>
            </div>

            <ul class="nav">
	                <li>
	                    <a href="admin/dashboard.jsp">
	                        <i class="pe-7s-graph"></i>
	                        <p>Dashboard</p>
	                    </a>
	                </li>
	                <li class="active">
	                    <a href="admin/user.jsp">
	                        <i class="pe-7s-user"></i>
	                        <p>User Profile</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="admin/employee.jsp">
	                        <i class="pe-7s-note2"></i>
	                        <p>Employee List</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="admin/member.jsp">
	                        <i class="pe-7s-news-paper"></i>
	                        <p>Member List</p>
	                    </a>
	                </li>
	                <li>
	                	<a href="admin/events.jsp">
	                	<i class="pe-7s-bicycle"></i>
	                	<p>Events</p>
	                	</a>
	                </li>
	                 <li>
	                	<a href="admin/groups.jsp">
	                	<i class="pe-7s-global"></i>
	                	<p>Groups</p>
	                	</a>
	                </li>
	                <li>
	                    <a href="admin/attendance.jsp">
	                        <i class="pe-7s-stopwatch"></i>
	                        <p>Attendance</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="admin/transaction.jsp">
	                        <i class="pe-7s-shopbag"></i>
	                        <p>Church Transaction</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="admin/accounting.jsp">
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
	                    <a class="navbar-brand" href="#">Employee > Edit Profile > Picture</a>
	                </div>
	                <div class="collapse navbar-collapse">
	
	                    <ul class="nav navbar-nav navbar-right">
	                        <li>
	                            <a href="../../webpages/logout.jsp">
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
      <form action="editemployeeadminImage" method="post" enctype="multipart/form-data">
                     <div class="col-md-8">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Image</h4>
                            <div class="content">
	<%
	employees ee=employeedao.getEmployeeByID(Integer.parseInt(request.getParameter("employee_id")));
	request.setAttribute("employees", ee);
	%>
	<form action="editemployeeadminImage" method="post" enctype="multipart/form-data">
	
	<input type="hidden" name="employee_id" value="<%=ee.getEmployee_id()%>">
	
	 <div class="row">
	 								<div class="col-md-2">
                                            <div class="form-group">
                                                <label>Employee Id</label>
                                                <input type="text" class="form-control" name="position" value="<%=ee.getEmployee_id()%>" disabled required>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Login Id</label>
                                                <input type="text" class="form-control" name="position" value="<%=ee.getLogin_id()%>" disabled required>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Position</label>
                                                <input type="text" class="form-control" name="position" value="<%=ee.getPosition()%>" required>
                                            </div>
                                        </div>
                                        
                                      </div>
		
		<div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>First Name</label>
                                                <input type="text" class="form-control" name="f_name" value="<%=ee.getF_name()%>" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Middle Name</label>
                                                <input type="text" class="form-control" name="m_name" value="<%=ee.getM_name()%>" required>
                                            </div>
                                        </div>
                                    </div>
                            <div class="row">
                                      <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Last Name</label>
                                                <input type="text" class="form-control" name="l_name" value="<%=ee.getL_name()%>" required><br/>
                                            </div>
                                        </div>
                                     </div>    
		
		 <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Birthdate</label>
                                                <input type="date" class="form-control" name="bdate" value="<%=ee.getBdate()%>" required><br/>
                                            </div>
                                        </div>
		
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>Contact Information</label>
                                                <input type="text" class="form-control" name="contact" placeholder="Number i.e. 09xxxxxxxxx" maxlength="11" value="<%=ee.getContact()%>"><br/>
                                            </div>
                                        </div>
                                    

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Age</label>
                                                <input type="number" class="form-control" name="age" placeholder="Years old" value="<%=ee.getAge()%>"><br/>
                                            </div>
                                        </div>
                                    </div>
		 <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Gender</label>
                                                <select class="form-control" name="gender">
                                             	<option value="Male"${ee.getGender()} == "Male" ? "selected" : "">Male</option>
												<option value="Female"${ee.getGender()} == "Female" ? "selected" : "">Female</option>
												</select>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Marital Status</label>
                                                <select class="form-control" name="maritalstatus">
                                             	<option value="Single"${ee.getMaritalstatus()} == "Single" ? "selected" : "">Single</option>
												<option value="Married"${ee.getTMaritalstatus()} == "Married" ? "selected" : "">Married</option>
												<option value="Divorced"${ee.getTMaritalstatus()} == "Divorced" ? "selected" : "">Divorced</option>
												<option value="Widowed"${ee.getTMaritalstatus()} == "Widowed" ? "selected" : "">Widowed</option>
												</select>
                                            </div>
                                        </div>
                                        
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Email</label>
                                               	<input class="form-control"  type="email" name="email" value="<%=ee.getEmail()%>" />
                                            </div>
                                        </div>
                                    </div>
                                    
                           <div class="row">
                           	 <div class="col-md-8">
                                            <div class="form-group">
                                                <label>City address</label>
                                               	<input class="form-control"  type="text" name="provinceaddress" value="<%=ee.getCityaddress()%>"/>
                                            </div>
                                         </div>
                                       </div>
                                 <div class="row">
                                     <div class="col-md-8">       
                                             <div class="form-group">
                                                <label>Province Address</label>
                                               	<input class="form-control"  type="text" name="provinceaddress" value="<%=ee.getProvinceaddress()%>"/>
                                            </div>
                                  </div>
                                 </div>
                           <button type="submit" class="btn btn-info btn-fill pull-right">Update Profile</button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <div class="clearfix"></div>
                         </form>
                           </div>
                        </div>
						 
</div>
</div>
							<div class="col-md-4">
                        <div class="card card-user">
                            <div class="image">
                                <img src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&amp;fm=jpg&amp;h=300&amp;q=75&amp;w=400"	>
                            </div>
                            <div class="content">
                                <div class="author">
                                     <a href="#">
                                    <img class="avatar border-gray" src="admin/employee/getemployeeadminImage.jsp?employee_id=<%=ee.getEmployee_id()%>" alt="Profile Picture"/>

                                      <h4 class="title"><%=ee.getF_name()%>&nbsp;&nbsp;&nbsp;<%=ee.getL_name()%><br/>
                                      <%
                                      int i=ee.getLogin_id();
										users u=userdao.getUserByID((ee.getLogin_id()));
										request.setAttribute("users", u);
										%>
                                         <small><%=u.getUsername()%></small>
                                      </h4>
                                    </a>
                                </div>
                                
                            </div>
                            <hr>
                            <div class="text-center">
                                <div class="box">
									<input type="file" name="file-3[]" id="file-3" class="inputfile inputfile-3" data-multiple-caption="{count} files selected" style="display:none;"/>
									<label for="file-3"><i class="pe-7s-camera"></i> <span>Choose a file&hellip;</span></label>
								</div>

                            </div>
                        </div>
                    </div>
                    </form>
</div>
</div>
</div>
</div>
</div>
<script src="admin/assets/js/custom-file-input.js"></script>
</body>
 <!--   Core JS Files   -->
    <script src="admin/assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
	<script src="admin/assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="admin/assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="admin/assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="admin/assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script src="admin/assets/js/demo.js"></script>

</html>

