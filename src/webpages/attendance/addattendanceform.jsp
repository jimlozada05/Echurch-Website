<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../utility/css/rad.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Attendance Form</title>
</head>
<body>
	<form method="GET" action="attendanceadd.jsp">
	<label>Date</label>
	<input id="today" type="date" name="date" readonly>
		<script>
		let today = new Date().toISOString().substr(0, 10);
		document.querySelector("#today").value = today;
		</script>
		<br>
		<input type="hidden" name="login_id" value="<%out.print(Integer.parseInt(request.getParameter("login_id")));%>"/>
		<div class="toggle-radio">
		  <input type="radio" name="status" id="yes" value="Present">
		  <input type="radio" name="status" id="no" value="Absent" checked>
		  <div class="switch">
		    <label for="yes">Present</label>
		    <label for="no">Absent</label>
		    <span></span>
		  </div>
		</div>
		<br>
		<button type="submit">Add</button>
	</form>
</body>
</html>