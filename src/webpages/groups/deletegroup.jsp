<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,table.*,java.util.*"%>
<%int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");%>
<%
int group_id=Integer.parseInt(request.getParameter("group_id"));
group groups=new group();
groups.setgroup_id(group_id);
int status=groupdao.deletegroup(groups);
if(status==0){
	response.sendRedirect("grouptable.jsp?login_id="+sessionLogin_id+"");
}
%>