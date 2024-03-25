<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*, java.util.*, table.*" %>
<%
	int attendance_id=Integer.parseInt(request.getParameter("attendance_id"));
	int login_id=Integer.parseInt(request.getParameter("login_id"));	
	String date=request.getParameter("date");
	String status=request.getParameter("status");
	
	attendances at=new attendances();
	at.setLogin_id(login_id);
	at.setDate(date);
	at.setStatus(status);
	at.setAttendance_id(attendance_id);
	int state = attendancedao.editAttendance(at);
	if(state>0) {
		response.sendRedirect("attendance.jsp"+login_id+"");
	}
%>