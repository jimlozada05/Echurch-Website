<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*, table.*" %>
<%
	int id = Integer.parseInt(request.getParameter("employee_id"));

	employees ee = new employees();
	ee.setEmployee_id(id);
	
	int status = employeedao.deleteEmployee(ee);
	
	if(status == 0) {
		response.sendRedirect("employeetable.jsp");
	}
%>