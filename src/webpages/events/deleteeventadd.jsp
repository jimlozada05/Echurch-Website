<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,table.*,java.util.*" %>
<%
int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");
%>
<%
int event_id=Integer.parseInt(request.getParameter("event_id"));

eventadd event=new eventadd();
event.setevent_Id(event_id);
int status=usereventadd.deleteevent(event);
if(status==0){
	response.sendRedirect("eventtable.jsp?login_id="+sessionLogin_id+"");
}
%>