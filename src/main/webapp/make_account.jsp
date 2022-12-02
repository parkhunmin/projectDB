
<!-- =================== -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
   				<button type="button" class="btn btn-primary" onclick="location='login.jsp'"> 로그인</button>
   				<button type="button" class="btn btn-light" onclick="location='make_account.jsp'"> 회원가입</button>
   		</div>
	</nav>
	<br></br>
	<br></br>
	<div class="container-fluid" style="height: 100vh;">
		<div class="row justify-content-center align-items-center">					
		<form>		 
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">아이디</label>
		    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputPassword1" class="form-label">비밀번호</label>
		    <input type="password" class="form-control" id="exampleInputPassword1">
		  </div>
		  <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">닉네임</label>
		    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
		  </div>
		   <div class="mb-3">
		    <label for="exampleInputEmail1" class="form-label">이메일</label>
		    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
		  </div>
		  <button type="submit" class="btn btn-primary">회원가입</button>
		</form>
	</div>
	</div>
</body>
</html>