<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
int transaction_id=Integer.parseInt(request.getParameter("transaction_id"));
int login_id=Integer.parseInt(request.getParameter("login_id"));
String form=request.getParameter("form");
String name=request.getParameter("name");
double amount=Double.parseDouble(request.getParameter("amount"));

%>
<p><%out.print(transaction_id);%></p>
<p><%out.print(login_id);%></p>
<p><%out.print(form);%></p>
<p><%out.print(name);%></p>
<p><%out.print(amount);%></p>