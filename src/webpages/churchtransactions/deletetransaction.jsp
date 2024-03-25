<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,table.*,java.util.*" %>
<%
int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");
%>
<%
int transaction_id=Integer.parseInt(request.getParameter("transaction_id"));

transactions trans=new transactions();
trans.setTransaction_id(transaction_id);
int status=transactiondao.deleteTransaction(trans);
if(status==0){
	response.sendRedirect("chhome.jsp");
}
%>