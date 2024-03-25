<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.*,java.util.*,table.*,java.sql.*,connect.*"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Edit Transaction Form</title>
</head>
<body>
<%int sessionLogin_id = (int) session.getAttribute("login_id");%>
<%
transactions trans=transactiondao.getTransactionsByID(Integer.parseInt(request.getParameter("transaction_id")));
request.setAttribute("transaction", trans);
%>
	<form method="post" action="edittransaction.jsp">
		<input type="hidden" name="transaction_id" value="<%=trans.getTransaction_id()%>">
		<input type="hidden" name="login_id" value="<%out.print(sessionLogin_id);%>">
		
		<label>Form</label><br>
		<input type="text" name="form" readonly value="<%=trans.getForm()%>"><br><br>
		
		<label>Name</label><br>
		<input type="text" name="name" value="<%=trans.getName()%>"><br><br>
		
		<label>Amount</label><br>
		<input type="text" name="amount" readonly value="<%=trans.getAmount()%>"><br><br>

		
		<button type="submit">Continue</button>
	</form>

</body>
</html>