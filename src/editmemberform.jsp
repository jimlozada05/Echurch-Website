<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,connect.*,dao.*,table.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Member Form</title>
<style>
#bye{
display:none;}
</style>
</head>
<body>

	<%
	members m=memberdao.getMemberByID(Integer.parseInt(request.getParameter("member_id")));
	request.setAttribute("members", m);
	%>
	<form action="../editmemberImage" method="post" enctype="multipart/form-data">
	<input type="hidden" name="member_id" value="<%=m.getMember_id()%>">
	<input type="hidden" name="login_id" value="<%=m.getLogin_id()%>">
	
		<label>Occupation: </label>
		<input type="text" name="occupation" value="<%=m.getOccupation()%>"><br/><br/>

		<label>First Name</label>
		<input type="text" name="f_name" value="<%=m.getF_name()%>" required>
		
		<label>Middle Name</label>
		<input type="text" name="m_name" value="<%=m.getM_name()%>" required>
		
		<label>Last Name</label>
		<input type="text" name="l_name" value="<%=m.getL_name()%>" required><br/>
			
		
		<label>Birth Date: </label>
		<input type="date" name="bdate" value="<%=m.getBdate()%>" required><br/>
		
		<label>Contact Information: </label>
		<input type="text" name="contact" placeholder="Number i.e. 09xxxxxxxxx" maxlength="11" value="<%=m.getContact()%>"><br/>
		
		<label>Age: </label>
		<input type="number" name="age" placeholder="Years old" value="<%=m.getAge()%>"><br/>
		
		<label>Gender: </label>
		<input type="radio" name ="gender" value="<%=m.getGender()%>" checked hidden>
		<input type="radio" name="gender" value="Male" >Male
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="gender" value="Female" >Female<br>
		
		<label>Marital Status: </label>
		<select name="maritalstatus">
			<option value="<%=m.getMaritalstatus()%>"selected><%=m.getMaritalstatus()%></option>
			<option>Singe</option>
			<option>Married</option>
			<option>Divorced</option>
			<option>Widdowed</option>
		</select><br/>
		
		<label>Email: </label>
		<input type="email" name="email" placeholder=" i.e. example@gmail.com" value="<%=m.getEmail()%>"><br/>
		
		<label>Address: </label>
		<input type="text" name="cityaddress" placeholder="House#, Street, City" value="<%=m.getCityaddress()%>" required><br/>
		
		<label>Province of: </label>
		<input type="text" name="provinceaddress" placeholder="i.e. Metro Manila" value="<%=m.getProvinceaddress()%>" required><br/>
		

		<%
		String member_id = request.getParameter("member_id");
		%>
		<span id="bye">
		<label>Image</label>
		<img src="members/getmemberImage.jsp?member_id=<%=member_id%>" style="border:dashed 5px;border-color:black;height:100px;width:100px;"/><br/><br/>
		</span>
		
		<button type="submit">Edit</button>
	</form>
</body>
</html>