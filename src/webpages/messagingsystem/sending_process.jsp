<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,java.util.*,java.text.SimpleDateFormat,table.*,java.sql.*,connect.*"%>
<%
if(session.getAttribute("username")!=null && request.getParameter("user")!=null){
	if(request.getParameter("text")!=null){
	if(request.getParameter("text") !=""){
		String sender_name=(String) session.getAttribute("username");
		String receiver_name=request.getParameter("user");
		String message_text=request.getParameter("text");
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		String date=df.format(new java.util.Date());
		int status=0;
		try{  
	    	Connection con=dbconnect.getConnection(); 
	    	PreparedStatement ps=con.prepareStatement("INSERT INTO messages(sender_name,receiver_name, message_text, date_time) VALUES(?,?,?,?)");
			ps.setString(1, sender_name);
			ps.setString(2, receiver_name);
			ps.setString(3, message_text);
			ps.setString(4, date);
			status=ps.executeUpdate();
			ps.close();
			con.close();
			
			if(status>0){
				%>
				<div class="gray-message">
				<a href="#">Me</a>
				<p><%out.print(""+request.getParameter("text")+""); %></p>
				</div>
				<%
			}
			else{
				out.print("Message not sent");
			}
		}
			catch(Exception e){
				e.printStackTrace();
		}
		}
	}
	else{
		out.print("alert('no messages retrieved');");
	}
	
}
else{
	out.print("alert('No data');");
}
%>