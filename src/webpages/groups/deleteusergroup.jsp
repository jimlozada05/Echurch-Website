<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*,table.*,java.util.*"%>
<%int sessionLogin_id = (int) session.getAttribute("login_id");
String sessionName = (String) session.getAttribute("username");
String sessionType = (String) session.getAttribute("type");%>
<%
int groupuser_id=Integer.parseInt(request.getParameter("groupuser_id"));
groupuser groups=new groupuser();
groups.setgroupuser_id(groupuser_id);
int status=groupuserdao.delete(groups);
if(status==0){
	response.sendRedirect("grouptable.jsp?login_id="+sessionLogin_id+"");
}
%>