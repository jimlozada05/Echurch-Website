<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.*,java.util.*,table.*,java.sql.*,connect.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../utility/css/nstyle.css">
<link rel="stylesheet" type="text/css" href="../utility/css/cardstyle.css">
<link rel="stylesheet" href="../utility/bootstrap-4.0.0-dist/css/bootstrap.min.css" type="text/css">
<title>E-church</title>
</head>
<body>
<%int sessionLogin_id=(int) session.getAttribute("login_id"); %>
<h1 style="text-align:center;">Request Forms</h1>
	<div class="row">
		<div class="col s12 m3">
            <div class="card">
              <div class="card-image">
              	<img src="../utility/pics/marriageform.png">
                <a href="addtransactionform.jsp?login_id=<%out.print(sessionLogin_id);%>&form=wedding_request_form&amount=250.00" class="btn-floating btn-large halfway-fab waves-effect waves-light red"><i class="material-icons">+</i></a>
              </div>
              <div class="card-content">
                <span class="card-title">Wedding Request Form</span>
                <p></p>
              </div>
            </div>
          </div>
         
         <div class="col s12 m3">
            <div class="card">
              <div class="card-image">
              	<img src="../utility/pics/massform.png">
                <a href="addtransactionform.jsp?login_id=<%out.print(sessionLogin_id);%>&form=mass_request_form&amount=200.00" class="btn-floating btn-large halfway-fab waves-effect waves-light red"><i class="material-icons">+</i></a>
              </div>
              <div class="card-content">
                <span class="card-title">Mass Request Form</span>
                <p></p>
              </div>
            </div>
          </div>

		<div class="col s12 m3">
            <div class="card">
              <div class="card-image">
              	<img src="../utility/pics/baptismform.png">
                <a href="addtransactionform.jsp?login_id=<%out.print(sessionLogin_id);%>&form=baptismal_request_form&amount=150.00" class="btn-floating btn-large halfway-fab waves-effect waves-light red"><i class="material-icons">+</i></a>
              </div>
              <div class="card-content">
                <span class="card-title">Baptism Request Form</span>
                <p></p>
              </div>
            </div>
          </div>
         
         <div class="col s12 m3">
            <div class="card">
              <div class="card-image">
              	<img src="../utility/pics/funeralform.png">
                <a href="addtransactionform.jsp?login_id=<%out.print(sessionLogin_id);%>&form=funeral_service_request_form&amount=200.00" class="btn-floating btn-large halfway-fab waves-effect waves-light red"><i class="material-icons">+</i></a>
              </div>
              <div class="card-content">
                <span class="card-title">Funeral Request Form</span>
                <p></p>
              </div>
            </div>
          </div>
    </div>
    <%
	List<transactions> list=transactiondao.getARecord(sessionLogin_id);
	request.setAttribute("list",list);
	%>
    <h2 align="center">Requests</h2>

<table border="1" class="table table-hover table-dark" size="90%">
	<tr>
		<th>Transaction No.</th>
		<th>Form </th>
		<th>Name</th>
		<th>Amount</th>
		<th>Status</th>
		<th>Date</th>
		<th colspan="2"></th>
	</tr>
	

	<c:forEach items="${list}" var="trans">
	<tr>
	<td><c:out value="${trans.getTransaction_id()}"/></td>
	<td><c:out value="${trans.getForm()}"/></td>
	<td><c:out value="${trans.getName()}"/></td>
	<td><c:out value="${trans.getAmount()}"/></td>
	<td><c:out value="${trans.getStatus()}"/></td>
	<td><c:out value="${trans.getDate()}"/></td>
	
	<td><a href="edittransactionform.jsp?transaction_id=${trans.getTransaction_id()}">Edit Transaction</a></td>
	<td><a href="deletetransaction.jsp?transaction_id=${trans.getTransaction_id()}">Cancel Transaction</a></td>
	
	</tr>
	</c:forEach>

</table>

</body>
</html>