<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,table.*,java.sql.*,java.util.*,connect.*"%>
<%
try{
	Connection con=dbconnect.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SET @@global.time_zone='+08:00'");
}
catch(Exception e){
	e.printStackTrace();
}
String un=request.getParameter("username");
String pw=request.getParameter("password");
%>
<%
try{
Connection conn=dbconnect.getConnection();
PreparedStatement ps= conn.prepareStatement("SELECT * FROM user Where username=? and password=?");
ps.setString(1, un);
ps.setString(2, pw);
ResultSet rs=ps.executeQuery();
if(rs.next()==true){
	int login_id=rs.getInt("login_id");
	String username=rs.getString("username");
	String password=rs.getString("password");
	String type=rs.getString("type");
	//establish session
		if("Admin".equals(rs.getString("type"))){
			response.sendRedirect("../admin/dashboard.jsp");
			session.setAttribute("login_id", login_id); //attributeName, attributeValue
			session.setAttribute("username", username); //attributeName, attributeValue
			session.setAttribute("password", password); //attributeName, attributeValue
			session.setAttribute("type", type); //attributeName, attributeValue
			
		}
		if("Employee".equals(rs.getString("type"))){
			response.sendRedirect("index.jsp");
			session.setAttribute("login_id", login_id); //attributeName, attributeValue
			session.setAttribute("username", username); //attributeName, attributeValue
			session.setAttribute("password", password); //attributeName, attributeValue
			session.setAttribute("type", type); //attributeName, attributeValue
			
		}
		if("Userassistant".equals(rs.getString("type"))){
			response.sendRedirect("index.jsp");
			session.setAttribute("login_id", login_id); //attributeName, attributeValue
			session.setAttribute("username", username); //attributeName, attributeValue
			session.setAttribute("password", password); //attributeName, attributeValue
			session.setAttribute("type", type); //attributeName, attributeValue
			
		}
		else{
			response.sendRedirect("../loginform.jsp");
		}
	}
	else
		response.sendRedirect("../loginform.jsp");
}
catch (Exception e){
	e.printStackTrace();
}

%>