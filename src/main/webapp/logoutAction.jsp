<!-- =================== -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<html>
<head>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="resources/css/bootstrap.css?after">
	<title>PROJECT DB 회원가입</title>
</head>
<body>
		<nav class="navbar sticky-top  navbar-dark bg-dark">
  		<a class="navbar-brand" href="main.jsp" >Project DB</a>
	</nav>
	<div class="container-fluid" style="height: 100vh;">
		<div class="row justify-content-center align-items-center">					
		<%
		 session.invalidate();
		%>
		<script>
		location.href = 'main.jsp';
		</script>
	</div>
	</div>
</body>

</html>