<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,table.*,java.util.*" %>
<%
int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");
%>
<%
String event=request.getParameter("event");
String sched=request.getParameter("sched");
String venue=request.getParameter("venue");
String organizer=request.getParameter("organizer");
String contact=request.getParameter("contact");
String event_details=request.getParameter("event_details");
int creator_id=Integer.parseInt(request.getParameter("creator_id"));

eventadd events= new eventadd();
events.setEvent(event);
events.setSched(sched);
events.setVenue(venue);
events.setOrganizer(organizer);
events.setContact(contact);
events.setevent_details(event_details);
events.setcreator_id(creator_id);
int status=usereventadd.addevent(events);
if(status>0){
	response.sendRedirect("eventtable.jsp?login_id="+sessionLogin_id+"");
}

%>