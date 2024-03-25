<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,table.*,java.util.*" %>
<%
int event_id=Integer.parseInt(request.getParameter("event_id"));

eventadd event=new eventadd();
event.setevent_Id(event_id);
int status=usereventadd.deleteevent(event);
if(status==0){
	response.sendRedirect("../events.jsp");
}
%>