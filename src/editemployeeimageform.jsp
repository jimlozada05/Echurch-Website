<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,connect.*,dao.*,table.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Image Form</title>
<style>
#bye{
display:none;
}
</style>
</head>
<body>

	<%
	employees ee=employeedao.getEmployeeByID(Integer.parseInt(request.getParameter("employee_id")));
	request.setAttribute("employees", ee);
	%>
	<form action="../editemployeeImage" method="post" enctype="multipart/form-data">
	<span id="bye">
	<input type="hidden" name="employee_id" value="<%=ee.getEmployee_id()%>">
	<input type="hidden" name="login_id" value="<%=ee.getLogin_id()%>">
	
		<label>Position: </label>
		<input type="text" name="position" value="<%=ee.getPosition()%>" style="background-color:gray;" readonly><br/><br/>
		
		<label>First Name</label>
		<input type="text" name="f_name" value="<%=ee.getF_name()%>" style="background-color:gray;" readonly>
		
		<label>Middle Name</label>
		<input type="text" name="m_name" value="<%=ee.getM_name()%>" style="background-color:gray;" readonly>
		
		<label>Last Name</label>
		<input type="text" name="l_name" value="<%=ee.getL_name()%>" style="background-color:gray;" readonly><br/>
			
		
		<label>Birth Date: </label>
		<input type="date" name="bdate" value="<%=ee.getBdate()%>" style="background-color:gray;" readonly><br/>
		
		<label>Contact Information: </label>
		<input type="text" name="contact" placeholder="Number i.e. 09xxxxxxxxx" maxlength="11" value="<%=ee.getContact()%>" style="background-color:gray;" readonly><br/>
		
		<label>Age: </label>
		<input type="number" name="age" placeholder="Years old" value="<%=ee.getAge()%>" style="background-color:gray;" readonly><br/>
		
		<label>Gender: </label>
		<input type="radio" name ="gender" value="<%=ee.getGender()%>" checked hidden>
		<input type="radio" name="gender" value="Male" disabled>Male
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="gender" value="Female" disabled>Female<br>
		
		<label>Marital Status: </label>
		<select name="maritalstatus">
			<option value="<%=ee.getMaritalstatus()%>"selected><%=ee.getMaritalstatus()%></option>
			<option>Singe</option>
			<option>Married</option>
			<option>Divorced</option>
			<option>Widdowed</option>
		</select><br/>
		
		<label>Email: </label>
		<input type="email" name="email" placeholder=" i.e. example@gmail.com" value="<%=ee.getEmail()%>" style="background-color:gray;" readonly><br/>
		
		<label>Address: </label>
		<input type="text" name="cityaddress" placeholder="House#, Street, City" value="<%=ee.getCityaddress()%>" style="background-color:gray;" readonly><br/>
		
		<label>Province of: </label>
		<input type="text" name="provinceaddress" placeholder="i.e. Metro Manila" value="<%=ee.getProvinceaddress()%>" style="background-color:gray;" readonly><br/>
		</span>
		<%
		String employee_id = request.getParameter("employee_id");
		%>
		<img src="employee/getemployeeImage.jsp?employee_id=<%=employee_id%>" style="border:dashed 5px;border-color:black;height:100px;width:100px;"/><br/><br/>
		<label>Image</label>
		<input type="file" name="ee_image" value="<%=ee.getEe_image()%>"/><br/><br/>
		
		<button type="submit">Edit</button>
	</form>
</body>
</html>