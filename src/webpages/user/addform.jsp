<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Form</title>
</head>
<body>
	<form method="GET" action="useradd.jsp">
		<label>Username</label>
		<input type="text" name="username" required>
		
		<label>Password</label>
		<input type="password" name="password" required>
		
		<label>Confirm Password</label>
		<input type="password" required>
		
		<label>Type</label>
		<select name="type">
		<option selected>Member</option>
		<option>Employee</option>
		</select>
		
		<button type="submit">Add</button>
	</form>
</body>
</html>