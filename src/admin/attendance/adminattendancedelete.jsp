<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*, table.*" %>
<%
	int attendance_id = Integer.parseInt(request.getParameter("attendance_id"));

	attendances at = new attendances();
	at.setAttendance_id(attendance_id);
	
	int status = attendancedao.deleteAttendance(at);
	
	if(status == 0) {
		response.sendRedirect("attendance.jsp");
	}
%>