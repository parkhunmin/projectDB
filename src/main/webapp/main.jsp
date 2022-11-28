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
   				<button type="button" class="btn btn-primary"> �α���</button>
   				<button type="button" class="btn btn-light"> ȸ������</button>
   		</div>
	</nav>
	<div class="container-fluid" style="height: 100vh;">
		<!-- logo -->
		<div>
			<img id="logo" src="./resources/img/project_db_logo.png">
		</div>
	    <div class="container-fluid h-50 w-75">
			<div class="row justify-content-center align-items-center">
				<div class="col-12">
					<form id="searchWindow" action="/noxikaGG/search" method="GET" onclick="clickShowing('log')">
						<div class="embed-submit-field">
							<input type="text" placeholder="��Ų�� �˻��ϼ���!" name="title">
							<button type="submit">�˻�!</button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
	
</body>
</html>