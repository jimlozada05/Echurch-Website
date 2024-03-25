<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="atheader.jsp"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../utility/css/nstyle.css">
<link rel="stylesheet" href="../utility/css/clockstyle.css" type="text/css">
<script type="text/javascript" src="../utility/js/scripts.js"></script>
<title>E-church</title>
</head>
<body bgcolor="#DCDCDC" onLoad="renderTime();">
<jsp:include page="atnav.jsp"></jsp:include>
<p align="center">
<iframe src="attendancetable.jsp" width="75%" height="530 px" scrolling="yes" frameborder="0" style="background-color:white;"></iframe></p>
</body>
</html>