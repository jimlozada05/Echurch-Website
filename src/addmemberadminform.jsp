<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,connect.*,dao.*,table.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%	List<logined> log=logineddao.getAllRecords();
request.setAttribute("login", log);

%>
<form action="uploadmemberadminImage" method="post" enctype="multipart/form-data">
		<label>Login_id</label>
		<input type="text" name="login_id" required>
		
		<label>First Name:</label>
		<input type="text" name="f_name" required>
		
		<label>Middle Name:</label>
		<input type="text" name="m_name" required>
		
		<label>Last Name:</label>
		<input type="text" name="l_name" required><br/>
		
		<label>Occupation: </label>
		<input type="text" name="occupation" required><br/>
			
		<label>Birth Date: </label>
		<input type="date" name="bdate" required><br/>
		
		<label>Contact Information: </label>
		<input type="text" name="contact" placeholder="Number i.e. +63xxxxxxxxxx"><br/>
		
		<label>Age: </label>
		<input type="number" name="age" placeholder="Years old"><br/>
		
		<label>Gender: </label>
		<input type="radio" name="gender" value="Male" checked>Male
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="gender" value="Female">Female<br>
		
		<label>Marital Status: </label>
		<select name="maritalstatus" required>
			<option selected>Single</option>
			<option>Married</option>
			<option>Divorced</option>
			<option>Widdowed</option>
		</select><br/>
		
		<label>Email: </label>
		<input type="email" name="email" placeholder=" i.e. example@gmail.com"><br/>
		
		<label>Address: </label>
		<input type="text" name="cityaddress" placeholder="House#, Street, City" required><br/>
		
		<label>Province of: </label>
		<input type="text" name="provinceaddress" placeholder="i.e. Metro Manila" required>
		<br/>

		<label>Image</label>
		<input type="file" name="m_image" required="required"/><br/>
		
		<button type="submit">Add</button>
	</form>
</body>
</html>