<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,table.*,java.util.*"%>

<%
String username=request.getParameter("username");
String password=request.getParameter("password");
String confirmpassword=request.getParameter("confirmpassword");
String type=request.getParameter("type");

users u=new users();
u.setUsername(username);
u.setPassword(password);
u.setType(type);

int status=userdao.register(u);

 if(status >0){
 response.sendRedirect("../loginform.jsp");
 }
 %>