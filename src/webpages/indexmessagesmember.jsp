<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,java.util.*,java.text.SimpleDateFormat,table.*,java.sql.*,connect.*"%> 
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
	List<members> list1=memberdao.getaRecord(sessionLogin_id);
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
  <a href="indexprofilemember.jsp" onclick="openPage('profilecon', this, 'white')"><i class="far fa-user">&nbsp;Profile</i></a>
  <a href="#" onclick="openPage('messengercon', this, 'white')"><i class="far fa-comments">&nbsp;Messages</i></a>
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
<div id="messengercon" class="tabcontent">
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
		<div id="new-message">
	<p class="m-header">New Message</p>
		<div class="m-body">
		<form align="center" method="post" id="pop-message-form">
			<input type="text" id="pop-user" onkeyup="check_in_db()" class="message-input"
			 placeholder="username" name="username"/><br><br>
			<datalist id="user"></datalist>
			<textarea class="message-input" id="pop-message_text" name="message" placeholder="Write your message"></textarea><br>
			<input type="submit" id="send" value="send" name="send" align="center"/>
			<input type="button" value="Cancel" onclick="document.getElementById('new-message').style.display='none'"/>
		</form>
		<script>
						//now if the form is submitted
						$("#pop-message-form").submit(function(event){
							//take the data from text area
								var message_text = $("#pop-message_text").val();
								var toReceive = $("#pop-user").val();
								//send the data to sending_process
								$.ajax({
									url: 'messagingsystem/sending_process.jsp',
									type: 'POST',
									data: {
										'user': toReceive, 
										'text': message_text
									},
									success: function(data) {
										$('#pop-message_text').val('');
										top.location.href ="indexmessagesmember.jsp?user="+ $("#pop-user").val() + "&login_id=${param.login_id}";
									}
								});
						});
						//if any button is clicked inside
						//right-col-container
						$("#right-col-container").keypress(function(e){
							//as we will submit the form with enter button so
							if(e.keyCode == 13 && !e.shiftKey){
								//it means enter is clicked without shift key
								//so submit the form
								$("#message-form").submit();
					
							}
						});
					</script>
		</div>
	<p class="m-footer">Click to Send</p>
</div>
<script src="utility/jquery/jquery-3.3.1.js"></script>
<script>
	
function check_in_db(){
	var username = document.getElementById("username").value;
	//send this username to another file check_in_db.jsp
	$.post("messagingsystem/check_in_db.jsp",
		{
			user:username	
		},
	//receive this data from check_in_db.jsp
	function(data,status){
		//alert(data);
		if(data == "<option value='no user'>"){
			document.getElementById("send").disabled = true;
		}else
			document.getElementById("send").disabled = false;
	}
	);
}
</script>
		<div id="container">
			<div id="left-col">
				<div id="left-col-container">
				<div style="cursor:pointer;
				" onclick="document.getElementById('new-message').style.display='block'" class="white-back">
				<p align="center">New Message</p>
				</div>
				<%
				String send_name = (String) session.getAttribute("username");
				String receive_name = request.getParameter("user");
				try{
					Connection conn=dbconnect.getConnection();
					PreparedStatement ps=conn.prepareStatement("SELECT DISTINCT receiver_name, sender_name FROM messages where sender_name=? or receiver_name=? ORDER BY date_time DESC");
					ps.setString(1, send_name);
					ps.setString(2, send_name);
					ResultSet rs= ps.executeQuery();
					int counter=0;
					ArrayList added_user = new ArrayList();
					while(rs.next()){
						String sender_name=rs.getString(1);
						String receiver_name=rs.getString(2);
						if(send_name.equals(sender_name)){
						//add the receiver once
						if(added_user.contains(receiver_name)){
							
						}
						else{
							%>
						<div class="gray-back">
						<img src="utility/pics/messenger.png" class="image">
						<%out.print("<a href='indexmessagesmember.jsp?user="+receiver_name+"&login_id="+sessionLogin_id+"'>"+receiver_name+"</a>");%>
						</div>
							<%
							added_user.add(receiver_name);
							counter++;
						}
						
						}else if(send_name.equals(receiver_name)){
							//add the receiver once
							if(added_user.contains(sender_name)){
								
							}
							else{
								%>
							<div class="gray-back">
							<img src="utility/pics/messenger.png" class="image">
							<%out.print("<a href='indexmessagesmember.jsp?user="+sender_name+"&login_id="+sessionLogin_id+"'>"+sender_name+"</a>");%>
							</div>
								<%
								added_user.add(sender_name);
								counter++;
							}
							
						}
					}
				}
				catch(Exception e){
				}
				%>
			</div>
	
			</div>
			<div id="right-col">
			<div id="right-col-container">
					<div id="messages-container">
					<%
					String user=request.getParameter("user");
					if(user==null){
					try{
						Connection conn=dbconnect.getConnection();
						PreparedStatement ps=conn.prepareStatement("SELECT sender_name, receiver_name FROM messages WHERE sender_name=? OR receiver_name=? ORDER BY date_time DESC LIMIT 1");
						ps.setString(1, send_name);
						ps.setString(2, send_name);
						ResultSet rs= ps.executeQuery();
					
						while(rs.next()){
							String sender_name=rs.getString("sender_name");
							String receiver_name=rs.getString("receiver_name");
							
							if(send_name.equals(sender_name)){
								response.sendRedirect("indexmessagesmember.jsp?user="+receiver_name+"&login_id="+sessionLogin_id+"");
							}
							else
								response.sendRedirect("indexmessagesmember.jsp?user="+sender_name+"&login_id="+sessionLogin_id+"");
							}
					}
					catch(Exception e){
					}
					}
					%>
					<%
					try{
						
						Connection conn=dbconnect.getConnection();
						PreparedStatement ps=conn.prepareStatement("SELECT * FROM messages WHERE sender_name=? and receiver_name=? OR sender_name=? and receiver_name=?");
						ps.setString(1, send_name);
						ps.setString(2, user);
						ps.setString(3, user);
						ps.setString(4, send_name);
						ResultSet rs= ps.executeQuery();
					
								while(rs.next()) {
								String message_id=rs.getString("message_id");
								String sender_name=rs.getString("sender_name");
								String receiver_name=rs.getString("receiver_name");
								String message_text=rs.getString("message_text");
								String date_time=rs.getString("date_time");
								
								if(sender_name.equals(send_name)){
				%>
							<div class="gray-message">
							<a href="#">Me</a>
							<p><%out.print(""+message_text+""); %></p>
							</div>
							<%}
							else{
								%>
								<div class="white-message">
								<a href="#"><%out.print(sender_name); %></a>
								<p><%out.print(""+message_text+""); %></p>
								</div>
								<%
							}
						}
						
				
					}catch(Exception e){e.printStackTrace();}
					%>
			</div>
				<form method="post" id="message-form">
					<textarea class="textarea" id="message_text" placeholder="Write your message"></textarea>
					
				</form>
					
					<script>
						//now if the form is submitted
						$("#message-form").submit(function(event){
							event.preventDefault();
							//take the data from text area
								var message_text = $("#message_text").val();
								//send the data to sending_process
								$.ajax({
									url: 'messagingsystem/sending_process.jsp',
									type: 'POST',
									data: {
										'user': '${param.user}',
										'text': message_text
									},
									success: function(data) {
										$('#message_text').val('');
										$('#messages-container').html($('#messages-container').html() + data);
									}
								});
						});
						//if any button is clicked inside
						//right-col-container
						$("#right-col-container").keypress(function(e){
							//as we will submit the form with enter button so
							if(e.keyCode == 13 && !e.shiftKey){
								//it means enter is clicked without shift key
								//so submit the form
								$("#message-form").submit();
					
							}
						});
					</script>
		</div>
		</div>
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