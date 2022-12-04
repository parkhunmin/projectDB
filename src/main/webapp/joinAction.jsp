<!-- =================== -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.userDAO" %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="id"/>
<jsp:setProperty name="user" property="password"/>
<jsp:setProperty name="user" property="name"/>
<jsp:setProperty name="user" property="email"/>
<!DOCTYPE html>
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
		<form>
		<br><br><br><br><br>
		<h2>회원가입이 완료되었습니다</h2> <br>
		<div style=" text-align: center;">
		<button type="button" class="btn btn-primary" onClick="location.href='login.jsp'">로그인</button>
		</div>
		</form>
		<%
		if(user.getId() == null || user.getPassword() == null || user.getName() == null || user.getEmail() == null)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 되지 않은 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script");
		}
		else
		{
			userDAO userDAO = new userDAO();
			int result = userDAO.join(user);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 별명이나 아이디입니다.')");
				script.println("history.back()");
				script.println("</script");
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입이 완료되었습니다.')");
				script.println("loaction.href = 'main.jsp'");
				script.println("</script");
			}
		}
		
		%>
	</div>
	</div>
</body>

</html>