<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*, java.util.*, table.*" %>
<%
int accounting_id=Integer.parseInt(request.getParameter("accounting_id"));
int transaction_id=Integer.parseInt(request.getParameter("transaction_id"));
int login_id=Integer.parseInt(request.getParameter("login_id"));
int card_number=Integer.parseInt(request.getParameter("card_number"));
double amount=Double.parseDouble(request.getParameter("amount"));
int expire_month=Integer.parseInt(request.getParameter("expire_month"));
int expire_year=Integer.parseInt(request.getParameter("expire_year"));
int pin = Integer.parseInt(request.getParameter("pin"));
String status=request.getParameter("status");


payments pay=new payments();
pay.setAccounting_id(accounting_id);
pay.setTransaction_id(transaction_id);
pay.setLogin_id(login_id);
pay.setCard_number(card_number);
pay.setAmount(amount);
pay.setExpire_month(expire_month);
pay.setExpire_year(expire_year);
pay.setPin(pin);
int statuss=accountingdao.payAccounting(pay);
if(statuss>0){
	response.sendRedirect("accounting.jsp");
}


%>