<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,java.util.*,table.*,java.sql.*,connect.*"%>
<%
try{
Connection conn=dbconnect.getConnection();
String username=request.getParameter("user");
if(username!=null){
	PreparedStatement ps =conn.prepareStatement("SELECT `username` from user where username=?");
	ps.setString(1, username);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		out.print("<p style='color:red;'>User already taken</p>");
		}
	else{
		out.print("<p style='color:green;'>The user can be used</p>");
		}
	}
}
catch (Exception e){
	e.printStackTrace();
}
%>