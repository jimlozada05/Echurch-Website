<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,java.util.*,table.*,java.sql.*,connect.*"%>

<%
logined log = new logined();
int status = logineddao.deleteLogined(log);
session.invalidate();

if(status == 0) {
	response.sendRedirect("../loginform.jsp");
}

%>