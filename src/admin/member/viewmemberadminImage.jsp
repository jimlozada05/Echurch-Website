<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="webpages/utility/bootstrap-4.0.0-dist/css/bootstrap.min.css" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        
		<%
		String member_id = request.getParameter("member_id");
		%>
		<p align="center">
		<img src="getmemberadminImage.jsp?member_id=<%=member_id%>" style="border:dashed 5px;border-color:black;"/>
		</p>
		<button onclick="window.location.href='memadmintable.jsp'" class="btn btn-dark" style="padding:5px;">Exit Image</button>
    </body>
</html>
