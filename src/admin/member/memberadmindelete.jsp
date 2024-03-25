<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*, table.*" %>
<%
	int id = Integer.parseInt(request.getParameter("member_id"));

	members m = new members();
	m.setMember_id(id);
	
	int status = memberdao.deleteMember(m);
	
	if(status == 0) {
		response.sendRedirect("membertable.jsp");
	}
%>