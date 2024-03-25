<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dao.*,java.util.*,table.*,java.sql.*,connect.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="utility/css/ipstyle.css">
<link rel="stylesheet" href="utility/Font-Awesome-Pro-5-master/fontawesome-pro-5.7.0-web/css/all.min.css">
<link rel="stylesheet" href="utility/fontawesome-free-5.6.3-web/css/fontawesome.min.css">
<link rel="stylesheet"
	href="utility/bootstrap-4.0.0-dist/css/bootstrap.min.css"
	type="text/css">
<script src="utility/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript">
$('.nav-toggle').click(function(e) {
	  
	  e.preventDefault();
	  $("html").toggleClass("openNav");
	  $(".nav-toggle").toggleClass("active");

	});
	
function openPage(pageName, elmnt, color) {
	  // Hide all elements with class="tabcontent" by default */
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }

	  // Remove the background color of all tablinks/buttons
	  tablinks = document.getElementsByClassName("tablink");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].style.backgroundColor = "";
	  }

	  // Show the specific tab content
	  document.getElementById(pageName).style.display = "block";

	  // Add the specific color to the button used to open the tab content
	  elmnt.style.backgroundColor = color;
	}

	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click(); 
</script>

<title>Profile</title>
</head>
<body>
<%if(session.getAttribute("username")!=null && session.getAttribute("login_id")!=null) {%>
<%int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");%>
	<%
	List<employees> list1=employeedao.getaRecord(sessionLogin_id);
	request.setAttribute("list",list1);
	%>
	<%
	List<users> list2=userdao.getARecord(sessionLogin_id);
	request.setAttribute("list2",list2);
	%>
	<%
	List<members> list3=memberdao.getaRecord(sessionLogin_id);
	request.setAttribute("list3",list3);
	%>	
						<c:forEach items="${list3}" var="m">
		<div id="pop1">
			<span class="helper"></span>
			<div>
				<span onclick="document.getElementById('pop1').style.display='none'" class="popclose">X&nbsp;</span>
				<jsp:include page="members/viewmemberImage.jsp?member_id=${m.getMember_id()}"></jsp:include>
				<p style="background:gray;border-radius:3px;padding:2px 0px 2px 0px;" onclick="document.getElementById('pop1').style.display='none',document.getElementById('pop2').style.display='block'"><i class="far fa-camera-retro">&ensp;Change profile picture</i></p>
			</div>
		</div>
		<div id="pop2">
			<span class="helper"></span>
			<div>
				<span onclick="document.getElementById('pop2').style.display='none'" class="popclose">X&nbsp;</span>
				<jsp:include page="../editmemberimageform.jsp?member_id=${m.getMember_id()}"></jsp:include>
			</div>
		</div>
		<div id="pop3">
			<span class="helper"></span>
			<div>
				<span onclick="document.getElementById('pop3').style.display='none'" class="popclose">X&nbsp;</span>
				<jsp:include page="../editmemberform.jsp?member_id=${m.getMember_id()}"></jsp:include>
			</div>
		</div>
	</c:forEach>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#" class="tablink" onclick="openPage('profilecon', this, 'white')"><i class="far fa-user">&nbsp;Profile</i></a>
  <a href="indexmessagesmember.jsp?login_id=<%out.print(sessionLogin_id);%>" class="tablink" onclick="openPage('messengercon', this, 'white')"><i class="far fa-comments">&nbsp;Messages</i></a>
  <a href="index.jsp" target="_self"><i class="far fa-home-lg-alt">&nbsp;Home</i></a>
  <a href="logout.jsp"><i class="fal fa-sign-out-alt"></i>Log-out</a>
</div>
<nav>
	<span style="font-size:30px;cursor:pointer;padding-left:20px;" onclick="openNav()">&#9776;</span>
	<ul>
		<li><i class="far fa-user"></i></li>
		<li><i class="far fa-comments"></i></li>
		<li><i class="far fa-home-lg-alt"></i></li>
		<li><i class="fal fa-sign-out-alt"></i></li>
		
	
	</ul>
</nav>

<div id="profilecon" class="tabcontent">
<section>
	<header>
	<div class="logo">
		<img src="utility/pics/echurchlogo.png">
	</div>
	<ul>
	<c:forEach items="${list2}" var="u">
		<li><p><i class="fal fa-user-circle" style="font-size:20px;"></i>&ensp;${u.getUsername()}</p></li>
		<li><p><i class="fal fa-address-card"></i>&ensp;${u.getType()}</p></li>
	</c:forEach>
	</ul>
	</header>
	<div id="main">
		<div id="content">
			<main>
				<c:forEach items="${list3}" var="m">
				<span id="profilepic">
				<img src="members/getmemberImage.jsp?member_id=${m.getMember_id()}" height="150px" width="150px" style="border-radius:80px;" onclick="document.getElementById('pop1').style.display='block'"/>
				<br>
				<p></p>
				<p style="font-size:20px;">${m.getL_name()}&nbsp;&comma;${m.getF_name()}&nbsp;
				<%
					try{
					Connection conn=dbconnect.getConnection();
					PreparedStatement ps= conn.prepareStatement("SELECT m_name FROM member where login_id="+sessionLogin_id+"");
					ResultSet rs=ps.executeQuery();
					if(rs.next()==true){
						if(("N/A".equals(rs.getString("m_name")))||("n/a".equals(rs.getString("m_name")))||("-".equals(rs.getString("m_name")))||("none".equals(rs.getString("m_name")))||("null".equals(rs.getString("m_name")))){
				%>
					</p>
				<%
						}
						else{
				%>
							${m.getM_name()}</p>
				<%
						}
					}
					
					else
						response.sendRedirect("../loginform.jsp");
					}
					catch (Exception e){
						e.printStackTrace();
					}
					
				%>
				<p style="color:gray;font-size:12px;">${m.getCityaddress()}&comma;${m.getProvinceaddress()}</p>
				</span>
				<hr>
				<ul class="list-groupnb">
				  <li class="list-group-itemnb"><label>Email: </label> <br>&emsp;<label>${m.getEmail()}</label></li>			
				  <li class="list-group-itemnb"><label>Birth day: </label> <br>&emsp;<label>${m.getBdate()}</label></li>
				  <li class="list-group-itemnb"><label>Age: </label> <br>&emsp;<label>${m.getAge()}</label></li>
				  <li class="list-group-itemnb"><label>Gender: </label> <br>&emsp;<label>${m.getGender()}</label></li>
				  <li class="list-group-itemnb"><label>Marital status: </label> <br>&emsp;<label>${m.getMaritalstatus()}</label></li>
				  <li class="list-group-itemnb"><label>Occupation: </label> <br>&emsp;<label>${m.getOccupation()}</label></li>
				  <li class="list-group-itemnb"><label>Contact information: </label> <br>&emsp;<label>${m.getContact()}</label></li>
				  
				</ul>
				<br>
				<button onclick="document.getElementById('pop3').style.display='block'" class="btn btn-dark">Edit Profile</button>	
				</c:forEach>
			</main>
	  	</div>
	</div>
	
</section>
</div>
<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
}

</script>
	<%}
	else
	response.sendRedirect("../loginform.jsp");
	%>
</body>
</html>