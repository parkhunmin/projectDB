<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="resources/css/bootstrap.css?after">
	<title>PROJECT DB</title>
</head>
<body>
		<nav class="navbar sticky-top  navbar-dark bg-dark">
  		<a class="navbar-brand" href="main.jsp" >Project DB</a>
  		<div style="display:inline-block">
   				<button type="button" class="btn btn-primary"> 로그인</button>
   				<button type="button" class="btn btn-light"> 회원가입</button>
   		</div>
	</nav>
	<div class="container-fluid" style="height: 100vh;">
		<!-- logo -->
		<div>
			<img id="logo" src="./resources/img/project_db_logo.png">
		</div>
		<!-- 검색창 -->
		
	    <div class="container-fluid h-50 w-75">
	    
			<div class="row justify-content-center align-items-center">			
				<div class="col-1.5">
					<select class="form-control">
					  	<option value="스킨" selected>스킨</option>
					  	<option value="챔피언">챔피언</option>
					  	<option value="유니버스">유니버스</option>
					</select>
				</div>
				<div class="col-10"><!-- 원래는 col-12임. 합이 12가 되도록 해야돼서 11로 변경 -->
					<form id="searchWindow" action="/noxikaGG/search" method="GET" onclick="clickShowing('log')">
							
						<div class="embed-submit-field">
													
							<input type="text" placeholder="스킨을 검색하세요!" name="title">
							<button type="submit">검색!</button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
	
</body>
</html>