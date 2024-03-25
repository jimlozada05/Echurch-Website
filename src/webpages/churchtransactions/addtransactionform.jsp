<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transaction Form</title>
</head>
<body>
<%
int sessionLogin_id = (int) session.getAttribute("login_id");
%>
	<form method="post" action="addtransaction.jsp">
		<input type="hidden" name="login_id" value="<%out.print(sessionLogin_id);%>">
		<label>Form</label><br>
		<input type="text" name="form" readonly value="<%out.print(request.getParameter("form"));%>"><br><br>
		
		<label>Name</label><br>
		<input type="text" name="name"><br><br>
		
		<label>Amount</label><br>
		<input type="text" name="amount" readonly value="<%out.print(request.getParameter("amount"));%>"><br><br>
		<input type="hidden" name="status" value="pending">
		
		<button type="submit">Continue</button>
	</form>
</body>
</html>