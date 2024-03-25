<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.*,java.util.*,table.*,java.sql.*,connect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../utility/css/nstyle.css">
<link rel="stylesheet" href="../utility/bootstrap-4.0.0-dist/css/bootstrap.min.css" type="text/css">
<title>E-church</title>
</head>
<body>

 	<%
 	int sessionLogin_id = (int) session.getAttribute("login_id");
	List<accountings> list=accountingdao.getARecord(sessionLogin_id);
	String sessionType = (String) session.getAttribute("type"); 
	request.setAttribute("list",list);
	%>
    <h2 align="center">Pending Requests</h2>
    <div class="content table-responsive table-full-width">
<table border="1" class="table table-hover table-dark">
	<tr>
		<th>Accounting No.</th>
		<th>Transaction No.</th>
		<th>Form </th>
		<th>Name</th>
		<th>Amount</th>
		<th>Status</th>
		<th>Process</th>
		<th>Date</th>
		<th>Employee Incharge No</th>
		<th>Employee Incharge Name</th>
		<th colspan="2"></th>
	</tr>
	
	<c:forEach items="${list}" var="acc">
	<tr>
	<td><c:out value="${acc.getAccounting_id()}"/></td>
	<td><c:out value="${acc.getTransaction_id()}"/></td>
	<td><c:out value="${acc.getForm()}"/></td>
	<td><c:out value="${acc.getName()}"/></td>
	<td><c:out value="${acc.getAmount()}"/></td>
	<td><c:out value="${acc.getStatus()}"/></td>
	<td><c:out value="${acc.getProcess()}"/></td>
	<td><c:out value="${acc.getDate()}"/></td>
	<td><c:out value="${acc.getIncharge_id()}"/></td>
	<td><c:out value="${acc.getIncharge_name()}"/></td>
	
	<td><a href="paymethod.jsp?accounting_id=${acc.getAccounting_id()}&transaction_id=${acc.getTransaction_id()}&login_id=${acc.getLogin_id()}&amount=${acc.getAmount()}">Pay Transaction</a></td>
	<td><a href="deletetransaction.jsp?transaction_id=${acc.getTransaction_id()}">Cancel Transaction</a></td>
	
	</tr>
	</c:forEach>

</table>
</div>




	<c:choose>
		<c:when test='${type eq "Employee"}'>
		<%
		List<accountings> list2=accountingdao.getAllRecordsPaid();
		request.setAttribute("list2",list2);
		%>
			 <h2 align="center">All Request Availabe For Assistance</h2>
    <div class="content table-responsive table-full-width">
<table border="1" class="table table-hover table-dark">
	<tr>
		<th>Accounting No.</th>
		<th>Transaction No.</th>
		<th>Form </th>
		<th>Name</th>
		<th>Amount</th>
		<th>Status</th>
		<th>Process</th>
		<th>Date</th>
		<th>Employee Incharge No</th>
		<th>Employee Incharge Name</th>
		<th colspan="2"></th>
	</tr>
	
	<c:forEach items="${list}" var="acc">
	<tr>
	<td><c:out value="${acc.getAccounting_id()}"/></td>
	<td><c:out value="${acc.getTransaction_id()}"/></td>
	<td><c:out value="${acc.getForm()}"/></td>
	<td><c:out value="${acc.getName()}"/></td>
	<td><c:out value="${acc.getAmount()}"/></td>
	<td><c:out value="${acc.getStatus()}"/></td>
	<td><c:out value="${acc.getProcess()}"/></td>
	<td><c:out value="${acc.getDate()}"/></td>
	<td><c:out value="${acc.getIncharge_id()}"/></td>
	<td><c:out value="${acc.getIncharge_name()}"/></td>
	
	<td><a href="managetransactionform.jsp?transaction_id=${acc.getTransaction_id()}">Manage Request</a></td>
	
	</tr>
	</c:forEach>

</table>
</div>
		</c:when>
	</c:choose>
</body>
</html>