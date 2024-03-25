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
		String employee_id = request.getParameter("employee_id");
		%>
		<p align="center">
		<img src="employee/getemployeeImage.jsp?employee_id=<%=employee_id%>" style="max-width:500px;max-height:500px;" class="img-thumbnail"/>
		</p>
    </body>
</html>
