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
		out.print("<option value='"+rs.getString("username")+"'>");
		}
	else{
		out.print("<option value='no user'>");
		}
	}
}
catch (Exception e){
	e.printStackTrace();
}
%>