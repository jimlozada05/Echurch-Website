<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,java.util.*,table.*,java.sql.*,connect.*"%>

<%
try{
Connection conn=dbconnect.getConnection();
PreparedStatement ps= conn.prepareStatement("SELECT * FROM logined");
ResultSet rs=ps.executeQuery();
if(rs.next()){
	int login_id=rs.getInt("id");
	String username=rs.getString("username");
	String password=rs.getString("password");
	String type=rs.getString("type");
	
	if("Employee".equals(rs.getString("type"))){
		response.sendRedirect("index.jsp");
		session.setAttribute("login_id", login_id); //attributeName, attributeValue
		session.setAttribute("username", username); //attributeName, attributeValue
		session.setAttribute("type", type); //attributeName, attributeValue
	}
	if("Member".equals(rs.getString("type"))){
		response.sendRedirect("index.jsp");
		session.setAttribute("login_id", login_id); //attributeName, attributeValue
		session.setAttribute("username", username); //attributeName, attributeValue
		session.setAttribute("type", type); //attributeName, attributeValue
	}
	if("Admin".equals(rs.getString("type"))){
		response.sendRedirect("../admin/dashboard.jsp");
		session.setAttribute("login_id", login_id); //attributeName, attributeValue
		session.setAttribute("type", type); //attributeName, attributeValue
	}
}

else
	response.sendRedirect("../loginform.jsp");
}
catch (Exception e){
	e.printStackTrace();
}

%>