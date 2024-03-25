<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*, table.*" %>
<%
	int id = Integer.parseInt(request.getParameter("login_id"));

	users u = new users();
	u.setLogin_id(id);
	
	int status = userdao.deleteUser(u);
	
	if(status == 0) {
		response.sendRedirect("usertable.jsp");
	}
%>