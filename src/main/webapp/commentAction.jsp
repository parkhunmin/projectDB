<!-- =================== -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="resources/css/bootstrap.css?after">
	
	<title>PROJECT DB</title>
	<%
	String skin_name=request.getParameter("skin_name");
	
	%>
</head>
<body>
<%
String id = null;
if (session.getAttribute("id") != null) {
	id = (String)session.getAttribute("id");
}
System.out.println(id);
System.out.println(skin_name);

%>
		
</body>
</html>