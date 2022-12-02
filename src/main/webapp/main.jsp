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
	//���� �ʿ���.
			$(function (){
				$("#detailed_search_button").click(function (){
					if($("#search_type option:selected").val()=="��Ų"){
						$("#detailed_search_skin").toggle();
						$("#detailed_search_champion").hide()
						$("#detailed_search_universe").hide()
					}
					else if($("#search_type option:selected").val()=="è�Ǿ�"){
						$("#detailed_search_champion").toggle();
						$("#detailed_search_skin").hide()
						$("#detailed_search_universe").hide()
					}
					else if($("#search_type option:selected").val()=="���Ϲ���"){
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
   				<button type="button" class="btn btn-primary" onclick="location='login.jsp'"> �α���</button>
   				<button type="button" class="btn btn-light"> ȸ������</button>
   		</div>
	</nav>
	<div class="container-fluid" style="height: 100vh;">
		<!-- logo -->
		<div>
			<img id="logo" src="./resources/img/project_db_logo.png">
		</div>
		<!-- �˻�â -->
		
	    <div class="container-fluid h-50 w-75">
	    
			<div class="row justify-content-center align-items-center">			
				<div class="col-1.5">
					<select id="search_type" class="form-control" onchange="selectBoxChange(this.value);">
					  	<option value="��Ų" selected>��Ų</option>
					  	<option value="è�Ǿ�">è�Ǿ�</option>
					  	<option value="���Ϲ���">���Ϲ���</option>
					</select>
				</div>
				<div class="col-10"><!-- ������ col-12��. ���� 12�� �ǵ��� �ؾߵż� 11�� ���� -->
					<form id="searchWindow" action="/noxikaGG/search" method="GET" onclick="clickShowing('log')">							
						<div class="embed-submit-field">													
							<input type="text" id="search_text" placeholder="ã�� ������ �˻��ϼ���!" name="title">
							<button type="submit">�˻�!</button>
						</div>
					</form>
				</div>
							
			</div>
			<div class="row justify-content-center align-items-center">			
				<div class="col-1.5">
					<button id="detailed_search_button" type="button" class="btn btn-light">�󼼰˻�</button>
					<!--  ��۽���ġ �ᵵ ������
					<div class="form-check form-switch">
					  <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
					  <label class="form-check-label" for="flexSwitchCheckDefault">Default switch checkbox input</label>
					</div>-->
				</div>
				<div class="col-10">
					<div class="row" id="detailed_search_skin" style="display: none">
						 <div class="col">
						 	��ÿ���
							<select id="release_year" class="form-control">
							  	<option value="��ü" selected>==��ü==</option>
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
							���
							<select id="search_type" class="form-control">
							  	<option value="��ü" selected>==��ü==</option>
							  	<option value="è�Ǿ�">����</option>
							  	<option value="���Ϲ���">���Ϲ���</option>
							</select>
						</div>
						<div class="col">
							ũ�θ�
							<select id="chroma" class="form-control">
							  	<option value="��ü" selected>==��ü==</option>
							  	<option value="TRUE">TRUE</option>
							  	<option value="FALSE">FALSE</option>
							</select>
						</div>
						<div class="col">
							����Ʈ
							<select id="chroma" class="form-control">
							  	<option value="��ü" selected>==��ü==</option>
							  	<option value="TRUE">TRUE</option>
							  	<option value="FALSE">FALSE</option>
							</select>
						</div>
						<div class="col">
							�ִϸ��̼�
							<select id="chroma" class="form-control">
							  	<option value="��ü" selected>==��ü==</option>
							  	<option value="TRUE">TRUE</option>
							  	<option value="FALSE">FALSE</option>
							</select>
						</div>
						<div class="col">
							����
							<select id="chroma" class="form-control">
							  	<option value="��ü" selected>==��ü==</option>
							  	<option value="TRUE">TRUE</option>
							  	<option value="FALSE">FALSE</option>
							</select>
						</div>
						
					</div>
					
					<div class="row" id="detailed_search_champion" style="display: none">
						 <div class="col">��ÿ���						 
							<select id="release_year" class="form-control">
							  	<option value="��ü" selected>==��ü==</option>
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
						<div class="col">Ŭ����
							<select class="form-control">
								<option value="��ü" selected>==��ü==</option>
							  	<option value="��Ų">Fighter</option>
							  	<option value="è�Ǿ�">Slayer</option>
							  	<option value="���Ϲ���">Controller</option>
							  	<option value="���Ϲ���">Tank</option>
							  	<option value="���Ϲ���">Mage</option>
							  	<option value="���Ϲ���">Marksman</option>
							  	<option value="���Ϲ���">Specialist</option>
							</select>
						</div>
						<div class="col">�Ҽ�
							<select class="form-control">
								<option value="��ü" selected>==��ü==</option>
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
							���Ϲ����� �󼼰˻��� �������� �ʽ��ϴ�
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
		
						
</body>
</html>