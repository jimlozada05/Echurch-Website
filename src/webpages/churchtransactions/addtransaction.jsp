<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*, java.util.*, table.*" %>
<% 
int login_id=Integer.parseInt(request.getParameter("login_id"));
String form=request.getParameter("form");
String name=request.getParameter("name");
double amount=Double.parseDouble(request.getParameter("amount"));
String status=request.getParameter("status");


transactions trans=new transactions();
trans.setLogin_id(login_id);
trans.setForm(form);
trans.setName(name);
trans.setAmount(amount);
trans.setStatus(status);
int statuss=transactiondao.insertTransaction(trans);
if(statuss>0){
	response.sendRedirect("chhome.jsp");
}


%>