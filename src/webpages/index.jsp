<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,java.util.*,table.*,java.sql.*,connect.*"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="utility/css/istyle.css">
<link rel="stylesheet" href="utility/Font-Awesome-Pro-5-master/fontawesome-pro-5.7.0-web/css/all.min.css">
<link rel="stylesheet" href="utility/fontawesome-free-5.6.3-web/css/fontawesome.min.css">
<link rel="stylesheet"
	href="utility/bootstrap-4.0.0-dist/css/bootstrap.min.css"
	type="text/css">
<script src="utility/jquery/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(window).on('scroll',function(){
		if ($(window).scrollTop()){
			$('header').addClass('gray');
		}
		else {
			$('header').removeClass('gray');
		}
	})
	
	function resizeIframe(iframe) {
    iframe.height = iframe.contentWindow.document.body.scrollHeight + "px";
  }
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E church</title>
</head>
<body>
<%if(session.getAttribute("username")!=null && session.getAttribute("login_id")!=null) {%>
<%int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");%>
	<%
	List<users> list1=userdao.getARecord(sessionLogin_id);
	request.setAttribute("list",list1);
	%>
	<c:forEach items="${list}" var="u">
	<div id="pop1">
			<span class="helper"></span>
			<div>
				<span onclick="document.getElementById('pop1').style.display='none'" class="popclose">X&nbsp;</span>
				<jsp:include page="user/editform.jsp?login_id=${u.getLogin_id()}"></jsp:include>
			</div>
		</div>
	</c:forEach>
	<header>
	<div class="logo">
		<img src="utility/pics/echurchlogo.png">
	</div>
	<ul>
	<c:forEach items="${list}" var="u">
		<li><a href="
		<%if("Employee".equals(sessionType)){%>
		indexprofileemployee.jsp?login_id=
		<%out.print(sessionLogin_id);%>"><i class="fal fa-user-circle" style="font-size:20px;"></i>&ensp;
		<%out.print(sessionName);%></a></li>
		<%}
		if("Member".equals(sessionType)){
		%>indexprofilemember.jsp?login_id=
		<%out.print(sessionLogin_id);%>"><i class="fal fa-user-circle" style="font-size:20px;"></i>&ensp;
		<%out.print(sessionName);%></a></li>
		<%} %>
		<li><div class="container" onclick="myFunction(this)">
				<div class="bar1"></div>	
				<div class="bar2"></div>
				<div class="bar3"></div>
			</div>
			
			<ul class="menu">
				<li><a href="#" class="menua" onclick="document.getElementById('pop1').style.display='block'"><i class="fal fa-cog"></i>User Settings</a></li>
				<li ><a href="logout.jsp" class="menua"><i class="fal fa-sign-out-alt"></i>Log Out</a></li>
			</ul>
		</li>
			<script type="text/javascript">
			$(function () {
				  $(".container").click(function () {
				    $(this).next(".menu").fadeToggle(400);
				  });
				});
			</script>
			<script>
				function myFunction(x) {
					x.classList.toggle("change");
					$(x).css("display","block");
				}
			</script>
			</c:forEach>
	</ul>
	</header>
	<div class="header2">
		<div class="wrapper">
			<div class="header2-text">
				<h2>E Church</h2>
				<p>Attend wherever and whenever	you want</p>
			</div>
		</div>
	</div>
	<section>
	<article>
		<nav>
			<div class="left-sticky">
				<ul>
					<li><a href="HOME.html?login_id=<%out.print(sessionLogin_id);%>" target="frameee">Home</a></li>
					<li><a href="photogallery/photogallery.jsp" target="frameee">Photo Gallery</a></li>
					<li><a href="<%if("Employee".equals(sessionType)){%>
		indexmessagesemployee.jsp?login_id=<%out.print(sessionLogin_id);%>
		<%}
		if("Member".equals(sessionType)){
		%>indexmessagesmember.jsp?login_id=<%out.print(sessionLogin_id);%>
		<%}%>" target="_self">Messenger</a></li>
					<li><a href="attendance/attendancetable.jsp?login_id=<%out.print(sessionLogin_id);%>" target="frameee">Attendance</a></li>
					<li><a href="events/eventtable.jsp?login_id=<%out.print(sessionLogin_id);%>" target="frameee">Events</a></li>
					<li><a href="groups/grouptable.jsp?login_id=<%out.print(sessionLogin_id);%>" target="frameee">Groups</a></li>
					<li><a href="churchtransactions/chhome.jsp?login_id=<%out.print(sessionLogin_id);%>" target="frameee">Transactions</a></li>
					<li><a href="accounting/accounting.jsp?login_id=<%out.print(sessionLogin_id);%>" target="frameee">Accounting</a></li>
					<li><a href="donations/donation.jsp?login_id=<%out.print(sessionLogin_id);%>" target="frameee">Donation</a></li>
					<li><a href="ABOUT.html?login_id=<%out.print(sessionLogin_id);%>" target="frameee">About</a></li>
				</ul>
				<script type="text/javascript">
				$(".left-sticky > ul > li").click(function(){
					$(".left-sticky > ul > li").css("background-color","");
					$(this).css("background-color","darkgray");
				});
				</script>
			</div>
		</nav>
		<div class="main-right">
		<p align="center">
		<br>
			<iframe id="frame" src="HOME.html" name="frameee" onload="resizeIframe(this)" width="100%" scrolling="no" frameborder="0"style="min-height:700px;"></iframe>
		</div>
	</article>
	</section>
	<%}
	else
	response.sendRedirect("../loginform.jsp");
	%>
</body>
</html>