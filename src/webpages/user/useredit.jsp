<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*, java.util.*, table.*" %>
<%int sessionLogin_id = (int) session.getAttribute("login_id"); %>
<%
	int login_id=Integer.parseInt(request.getParameter("login_id"));
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String type=request.getParameter("type");
	
	users u=new users();
	u.setLogin_id(login_id);
	u.setUsername(username);
	u.setPassword(password);
	u.setType(type);
	int status = userdao.editUser(u);
	if(status > 0) {
		session.setAttribute("username", username);
		session.setAttribute("password", password);
		session.setAttribute("type", type);
		response.sendRedirect("../index.jsp");
	}
%>