<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pay</title>
</head>
<body>
<form method="POST" action="paying.jsp">

<label>Accounting ID</label><br>
<input type="text" name="accounting_id" value="<%out.print(request.getParameter("accounting_id"));%>" readonly><br><br>

<label>Transaction ID</label><br>
<input type="text" name="transaction_id" value="<%out.print(request.getParameter("transaction_id"));%>" readonly><br><br>

<label>Login ID</label><br>
<input type="text" name="login_id" value="<%out.print(request.getParameter("login_id"));%>" readonly><br><br>

<label>Card Number</label><br>
<input type="text" name="card_number"><br><br>


<label>Amount</label><br>
<input type="text" name="amount" value="<%out.print(request.getParameter("amount"));%>"><br><br>


<label>Expire Month</label><br>
<input type="text" name="expire_month"><br><br>


<label>Expire Year</label><br>
<input type="text" name="expire_year"><br><br>


<label>Pin</label><br>
<input type="text" name="pin"><br><br>

<input type="submit">
</form>
<button onclick="window.location.href='accounting.jsp'">Cancel</button>
</body>
</html>