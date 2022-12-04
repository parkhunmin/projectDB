<!-- =================== -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*,java.util.regex.*" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="resources/css/bootstrap.css?after">
	<title>PROJECT DB 로그인</title>
</head>
<body>
		<nav class="navbar sticky-top  navbar-dark bg-dark">
  		<a class="navbar-brand" href="main.jsp" >Project DB</a>
  		<div style="display:inline-block">
   				<button type="button" class="btn btn-primary"> 로그인</button>
   				<button type="button" class="btn btn-light" onClick="location.href='join.jsp'"> 회원가입</button>
   		</div>
	</nav>
	<div class="container-fluid" style="height: 100vh;">
		<div class="row justify-content-center align-items-center">					
		<form method="post" action="loginAction.jsp">
		  <div class="mb-3">
		    <label for="InputId" class="form-label">아이디</label>
		    <input type="text" name = "id" class="form-control" id="InputId">
		  </div>
		  <div class="mb-3">
		    <label for="InputPassword" class="form-label">비밀번호</label>
		    <input type="password" name = "password" class="form-control" id="InputPassword">
		  </div>
		  <button type="submit" class="btn btn-primary">로그인</button>
		  
		</form>
	</div>
	</div>
</body>
</html>