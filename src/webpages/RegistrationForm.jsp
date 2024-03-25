<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,java.util.*,table.*" %>
<?php require_once("../connection.php");?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="utility/css/lstyle.css">
<script src="utility/jquery/jquery-3.3.1.js"></script>
<title>Registration Form</title>
</head>
<body>
	<div class="loginbox">
	<img src="utility/pics/mask.png" class="avatar">
		<h1>Register</h1>
			<form method="POST" action="registration.jsp">
				<p>Username<br><span id="checking"></span></p>
					<input type="text" name="username" onkeyup="check_user()" id="username"> 
				
				<p>Password</p>
					<input type="password" name="password" onkeyup="check_user()" id="reg_pass">

				<p>Confirm Password</p>
					<input type="password" name="confirmpassword" onkeyup="check_user()" id="reg_confirm_pass">
					<div id="checkingpass"></div>
					
				<p>Type</p>
				<div id="dropmid">
				<div id="drop">
					<select name="type" placeholder="Select User Type">
					<option>Member</option>
					<option>Employee</option>
					</select>
				</div>
				</div>
				<button type="submit" name="register" id="register" class="register" disabled>Register</button>
			<p>Already have an account?<a href="../loginform.jsp" id="reg">Sign in</a></p>
			</form> 
		</div>
	<script>
	$("#reg_pass").keyup(function () {
		
	    var user_pass = $("#reg_pass").val();
	    var user_pass2 = $("#reg_confirm_pass").val();
	    if (user_pass == user_pass2){
	      $("#register").prop('disabled', false)//use prop()
	      document.getElementById("checkingpass").innerHTML ="";
	    } else {
	      $("#enter").prop('disabled', true)//use prop()
	      document.getElementById("checkingpass").innerHTML ="<p style='color:red;'>Your password doesn't match</p>";
	    }
	  });
	  $("#reg_confirm_pass").keyup(function () {
	    var user_pass = $("#reg_pass").val();
	    var user_pass2 = $("#reg_confirm_pass").val();
	    
	    if (user_pass == user_pass2) {
	      $("#register").prop('disabled', false)//use prop()
	      document.getElementById("checkingpass").innerHTML ="";
	    } else {
	      $("#register").prop('disabled', true)//use prop()
	      document.getElementById("checkingpass").innerHTML ="<p style='color:red;'>Your password doesn't match</p>";
	    }
	  });
	  
	  
	function check_user(){
		var username= document.getElementById("username").value;
		if(username!=''){
			$.post('usercheck.jsp',{user: username},
			function(data,status){
				document.getElementById("checking").innerHTML=data;
				if($data=="<p style='color:red;'>User already taken</p>"){
					document.getElementById("register").disabled=true;
				}
				else{
					document.getElementById("register").disabled=true;
				}
			});
		}
	}
	</script>
</body>
</html>