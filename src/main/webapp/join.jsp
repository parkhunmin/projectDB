<!-- =================== -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*,java.util.regex.*" %> 
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
  		<div style="display:inline-block">
   				<button type="button" class="btn btn-primary" onClick="location.href='login.jsp'"> 로그인</button>
   				<button type="button" class="btn btn-light">회원가입</button>
   		</div>
	</nav>
	<div class="container-fluid" style="height: 100vh;">
		<div class="row justify-content-center align-items-center">					
		<form method="post" action="joinAction.jsp">
		<h2>회원가입</h2> <br>
		  <div class="mb-3">
		    <label for="InputId" class="form-label">아이디</label>
		    <input type="text" name = "id" class="form-control" id="InputId" aria-describedby="IdlHelp">
		  </div>
		  <div class="mb-3">
		    <label for="InputEmail" class="form-label">이메일</label>
		    <input type="email" name = "email" class="form-control" id="InputEmail">
		    </div>
		  <div class="mb-3">
		    <label for="InputPassword" class="form-label">비밀번호</label>
		    <input type="password" name = "password" class="form-control" id="InputPassword">
		  </div>
		  <div class="mb-3">
		    <label for="Inputname" class="form-label">별명</label>
		    <input type="text" name = "name" class="form-control" id="Inputname">
		  </div>
		  <button type="submit" class="btn btn-primary">제출</button>
		</form>
	</div>
	</div>
</body>

</html>