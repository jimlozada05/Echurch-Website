<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="table.*,connect.*,dao.*" %>
<%
	String date=request.getParameter("date");
	int login_id=Integer.parseInt(request.getParameter("login_id"));
	String status=request.getParameter("status");
	

	attendances at=new attendances();
	at.setDate(date);
	at.setLogin_id(login_id);
	at.setStatus(status);
	int state=attendancedao.insertAttendance(at);
	if(state>0){
		response.sendRedirect("attendancetable.jsp?login_id="+login_id+"");
	}


%>