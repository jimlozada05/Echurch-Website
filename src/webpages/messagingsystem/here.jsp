<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,java.util.*,java.text.SimpleDateFormat,table.*,java.sql.*,connect.*"%>
<%
	String username= (String) session.getAttribute("username");
	String	user=request.getParameter("user");
	String send_name=username;
	String receive_name=user;
	String message_text=request.getParameter("text");
	if(request.getParameter("text") !=""){
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		String date=df.format(new java.util.Date());
		%>
		<p><%out.print(send_name);%>
		<br><%out.print(receive_name);%>
		<br><%out.print(message_text);%>
		<br><%out.print(date);%></p>
		<%
		
	}


%>