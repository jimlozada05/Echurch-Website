<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="table.*,connect.*,dao.*" %>
<%
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String type=request.getParameter("type");
	

	users u=new users();
	u.setUsername(username);
	u.setPassword(password);
	u.setType(type);
	int status=userdao.insertUser(u);
	if(status>0){
		response.sendRedirect("usertable.jsp");
	}


%>