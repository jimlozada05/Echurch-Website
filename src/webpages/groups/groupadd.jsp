<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,table.*,java.util.*" %>
<%int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");%>
<%
String gname=request.getParameter("gname");
String sched=request.getParameter("sched");
String venue=request.getParameter("venue");
String organizer=request.getParameter("organizer");
String contact=request.getParameter("contact");
int creator_id=Integer.parseInt(request.getParameter("creator_id"));

group groups= new group();
groups.setgname(gname);
groups.setsched(sched);
groups.setvenue(venue);
groups.setorganizer(organizer);
groups.setcontact(contact);
groups.setcreator_id(creator_id);
int status=groupdao.addgroup(groups);
if(status>0){
	response.sendRedirect("grouptable.jsp?login_id="+sessionLogin_id+"");
}

%>