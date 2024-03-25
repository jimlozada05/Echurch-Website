<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,table.*,java.util.*"%>
<%
int userevent_id=Integer.parseInt(request.getParameter("userevent_id"));
int event_id_fk=Integer.parseInt(request.getParameter("event_id_fk"));
int loginn_id=Integer.parseInt(request.getParameter("loginn_id"));
String participants_name=request.getParameter("participants_name");
String contact=request.getParameter("contact");
String address=request.getParameter("address");

events event=new events();
event.setuserevent_Id(userevent_id);
event.setparticipants_name(participants_name);
event.setContact(contact);
event.setAddress(address);
event.setevent_id_fk(event_id_fk);
event.setloginn_id(loginn_id);
int status=userevent.edit(event);
if(status>0)
{
	response.sendRedirect("../events.jsp");
}
%>