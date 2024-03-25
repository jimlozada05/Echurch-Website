<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*, java.util.*, table.*" %>
<%
int transaction_id=Integer.parseInt(request.getParameter("transaction_id"));
int login_id=Integer.parseInt(request.getParameter("login_id"));
String form=request.getParameter("form");
String name=request.getParameter("name");
double amount=Double.parseDouble(request.getParameter("amount"));


transactions trans=new transactions();
trans.setLogin_id(transaction_id);
trans.setLogin_id(login_id);
trans.setForm(form);
trans.setName(name);
trans.setAmount(amount);
int status=transactiondao.editTransaction(trans);
if(status>0){
	response.sendRedirect("chhome.jsp");
}


%>