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
	//수정 필요함.
			$(function (){
				$("#detailed_search_button").click(function (){
					if($("#search_type option:selected").val()=="스킨"){
						$("#detailed_search_skin").toggle();
						$("#detailed_search_champion").hide()
						$("#detailed_search_universe").hide()
					}
					else if($("#search_type option:selected").val()=="챔피언"){
						$("#detailed_search_champion").toggle();
						$("#detailed_search_skin").hide()
						$("#detailed_search_universe").hide()
					}
					else if($("#search_type option:selected").val()=="유니버스"){
						$("#detailed_search_universe").toggle();
						$("#detailed_search_champion").hide()
						$("#detailed_search_skin").hide()
					}
			  	
			  });
		});
			
	</script>
</head>
<body>
		<nav class="navbar sticky-top  navbar-dark bg-dark">
  		<a class="navbar-brand" href="main.jsp" >Project DB</a>
  		<div style="display:inline-block">
   				<button type="button" class="btn btn-primary" onclick="location='login.jsp'"> 로그인</button>
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
						 	출시연도
							<select id="release_year" class="form-control">
							  	<option value="전체" selected>==전체==</option>
							  	<option value="2022">2022</option>
							  	<option value="2021">2021</option>
							  	<option value="2020">2020</option>
							  	<option value="2019">2019</option>
							  	<option value="2018">2018</option>
							  	<option value="2017">2017</option>
							  	<option value="2016">2016</option>
							  	<option value="2015">2015</option>
							  	<option value="2014">2014</option>
							  	<option value="2013">2013</option>
							  	<option value="2012">2012</option>
							  	<option value="2011">2011</option>
							  	<option value="2010">2010</option>
							  	<option value="2009">2009</option>
							</select>
						</div>
						<div class="col">
							등급
							<select id="search_type" class="form-control">
							  	<option value="전체" selected>==전체==</option>
							  	<option value="챔피언">전설</option>
							  	<option value="유니버스">유니버스</option>
							</select>
						</div>
						<div class="col">
							크로마
							<select id="chroma" class="form-control">
							  	<option value="전체" selected>==전체==</option>
							  	<option value="TRUE">TRUE</option>
							  	<option value="FALSE">FALSE</option>
							</select>
						</div>
						<div class="col">
							이펙트
							<select id="chroma" class="form-control">
							  	<option value="전체" selected>==전체==</option>
							  	<option value="TRUE">TRUE</option>
							  	<option value="FALSE">FALSE</option>
							</select>
						</div>
						<div class="col">
							애니메이션
							<select id="chroma" class="form-control">
							  	<option value="전체" selected>==전체==</option>
							  	<option value="TRUE">TRUE</option>
							  	<option value="FALSE">FALSE</option>
							</select>
						</div>
						<div class="col">
							평점
							<select id="chroma" class="form-control">
							  	<option value="전체" selected>==전체==</option>
							  	<option value="TRUE">TRUE</option>
							  	<option value="FALSE">FALSE</option>
							</select>
						</div>
						
					</div>
					
					<div class="row" id="detailed_search_champion" style="display: none">
						 <div class="col">출시연도						 
							<select id="release_year" class="form-control">
							  	<option value="전체" selected>==전체==</option>
							  	<option value="2022">2022</option>
							  	<option value="2021">2021</option>
							  	<option value="2020">2020</option>
							  	<option value="2019">2019</option>
							  	<option value="2018">2018</option>
							  	<option value="2017">2017</option>
							  	<option value="2016">2016</option>
							  	<option value="2015">2015</option>
							  	<option value="2014">2014</option>
							  	<option value="2013">2013</option>
							  	<option value="2012">2012</option>
							  	<option value="2011">2011</option>
							  	<option value="2010">2010</option>
							  	<option value="2009">2009</option>
							</select>
						</div>
						<div class="col">클래스
							<select class="form-control">
								<option value="전체" selected>==전체==</option>
							  	<option value="스킨">Fighter</option>
							  	<option value="챔피언">Slayer</option>
							  	<option value="유니버스">Controller</option>
							  	<option value="유니버스">Tank</option>
							  	<option value="유니버스">Mage</option>
							  	<option value="유니버스">Marksman</option>
							  	<option value="유니버스">Specialist</option>
							</select>
						</div>
						<div class="col">소속
							<select class="form-control">
								<option value="전체" selected>==전체==</option>
								<option value="Bilgewater" >Bilgewater</option>
							  	<option value="Demacia" >Demacia</option>
							  	<option value="Freljord">Freljord</option>
							  	<option value="Ionia">Ionia</option>	
							  	<option value="Noxus" >Noxus</option>						
							  	<option value="Piltover">Piltover</option>
							  	<option value="Targon" >Targon</option>
							  	<option value="The Void">The Void</option>
							  	<option value="Runeterra" >Runeterra</option>
							  	<option value="Shadow Isles">Shadow Isles</option>
							  	<option value="Shurima">Shurima</option>
							  	<option value="Zaun">Zaun</option>
							  	<option value="Shurima">Shurima</option>
							</select>
						</div>
						
					</div>
					
					<div class="row" id="detailed_search_universe" style="display: none">
						 <div class="col">
							유니버스는 상세검색을 지원하지 않습니다
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
		
						
</body>
</html>