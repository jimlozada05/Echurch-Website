<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,table.*,java.util.*"%>
<%int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");%>
<%
int groupuser_id=Integer.parseInt(request.getParameter("groupuser_id"));
int group_id_fk=Integer.parseInt(request.getParameter("group_id_fk"));
int loginn_id=Integer.parseInt(request.getParameter("loginn_id"));
String participants_name=request.getParameter("participants_name");
String contact=request.getParameter("contact");
String address=request.getParameter("address");



groupuser group=new groupuser();
group.setgroupuser_id(groupuser_id);
group.setparticipants_name(participants_name);
group.setContact(contact);
group.setAddress(address);
group.setgroup_id_fk(group_id_fk);
group.setloginn_id(loginn_id);
int status=groupuserdao.edit(group);
if(status>0)
{
	response.sendRedirect("grouptable.jsp?login_id="+sessionLogin_id+"");
}
%>