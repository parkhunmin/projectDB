<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="resources/css/bootstrap.css?after">
	
	<title>PROJECT DB</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script type="text/javascript"> 
		$(function (){
			$("#detailed_search_button").click(function (){
				if($("#search_type option:selected").val()=="스킨"){
					$("#detailed_search_skin").toggle();
				}
				if($("#search_type option:selected").val()=="챔피언"){
					$("#detailed_search_champion").toggle();
				}
				if($("#search_type option:selected").val()=="유니버스"){
					$("#detailed_search_universe").toggle();
				}
		  	
		  });
		});	//셀렉트 옵션 마다 띄우는 div가 다르게 설정하면 될듯하다?
	</script>
</head>
<body>
		<nav class="navbar sticky-top  navbar-dark bg-dark">
  		<a class="navbar-brand" href="main.jsp" >Project DB</a>
  		<div style="display:inline-block">
   				<button type="button" class="btn btn-primary" onClick="location.href='login.jsp'"> 로그인</button>
   				<button type="button" class="btn btn-light" onClick="location.href='join.jsp'"> 회원가입</button>
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
					<select id="search_type" class="form-control" onchange="selectBoxChange(this.value);">
					  	<option value="스킨" selected>스킨</option>
					  	<option value="챔피언">챔피언</option>
					  	<option value="유니버스">유니버스</option>
					</select>
				</div>
				<div class="col-10"><!-- 원래는 col-12임. 합이 12가 되도록 해야돼서 11로 변경 -->
					<form id="searchWindow" action="/noxikaGG/search" method="GET" onclick="clickShowing('log')">							
						<div class="embed-submit-field">													
							<input type="text" id="search_text" placeholder="찾을 내용을 검색하세요!" name="title">
							<button type="submit">검색!</button>
						</div>
					</form>
				</div>
							
			</div>
			<div class="row justify-content-center align-items-center">			
				<div class="col-1.5">
					<button id="detailed_search_button" type="button" class="btn btn-light">상세검색</button>
					<!--  토글스위치 써도 좋을듯
					<div class="form-check form-switch">
					  <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
					  <label class="form-check-label" for="flexSwitchCheckDefault">Default switch checkbox input</label>
					</div>-->
				</div>
				<div class="col-10">
					<div class="row" id="detailed_search_skin" style="display: none">
						 <div class="col">
							<select id="search_type" class="form-control">
							  	<option value="스킨" selected>스킨</option>
							  	<option value="챔피언">챔피언</option>
							  	<option value="유니버스">유니버스</option>
							</select>
						</div>
						<div class="col">
							<select id="search_type" class="form-control">
							  	<option value="스킨" selected>스킨</option>
							  	<option value="챔피언">챔피언</option>
							  	<option value="유니버스">유니버스</option>
							</select>
						</div>
						<div class="col">
							<select id="search_type" class="form-control">
							  	<option value="스킨" selected>크로마</option>
							  	<option value="챔피언">챔피언</option>
							  	<option value="유니버스">유니버스</option>
							</select>
						</div>
						
					</div>
					
					<div class="row" id="detailed_search_champion" style="display: none">
						 <div class="col">
							<select id="search_type" class="form-control">
							  	<option value="스킨" selected>출시일</option>
							  	<option value="챔피언">챔피언</option>
							  	<option value="유니버스">유니버스</option>
							</select>
						</div>
						<div class="col">
							<select id="search_type" class="form-control">
							  	<option value="스킨" selected>스킨</option>
							  	<option value="챔피언">챔피언</option>
							  	<option value="유니버스">유니버스</option>
							</select>
						</div>
						<div class="col">
							<select id="search_type" class="form-control">
							  	<option value="스킨" selected>스킨</option>
							  	<option value="챔피언">챔피언</option>
							  	<option value="유니버스">유니버스</option>
							</select>
						</div>
						
					</div>
					
					<div class="row" id="detailed_search_universe" style="display: none">
						 <div class="col">
							<select id="search_type" class="form-control">
							  	<option value="스킨" selected>이름</option>
							  	<option value="챔피언">챔피언</option>
							  	<option value="유니버스">유니버스</option>
							</select>
						</div>
						<div class="col">
							<select id="search_type" class="form-control">
							  	<option value="스킨" selected>스킨</option>
							  	<option value="챔피언">챔피언</option>
							  	<option value="유니버스">유니버스</option>
							</select>
						</div>
						<div class="col">
							<select id="search_type" class="form-control">
							  	<option value="스킨" selected>스킨</option>
							  	<option value="챔피언">챔피언</option>
							  	<option value="유니버스">유니버스</option>
							</select>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
		
						
</body>
</html>