<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="resources/css/bootstrap.css?after">
	
	<title>PROJECT DB</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script type="text/javascript"> 
	$(function (){
		$("#search_type").change(function(){
			$("#detailed_search_skin").hide();
			$("#detailed_search_champion").hide();
			$("#detailed_search_universe").hide();
		});
		
		$("#detailed_search_button").click(function (){
			if($("#search_type option:selected").val()=="skin"){
				$("#detailed_search_skin").toggle();
			}
			else if($("#search_type option:selected").val()=="champion"){
				$("#detailed_search_champion").toggle();
			}
			else if($("#search_type option:selected").val()=="universe"){
				$("#detailed_search_universe").toggle();
			}
	  	
	  });
});
	</script>
</head>
<body>
<%
String id = null;
if (session.getAttribute("id") != null) {
	id = (String)session.getAttribute("id");
}

%>
		<nav class="navbar sticky-top  navbar-dark bg-dark">
  		<a class="navbar-brand" href="main.jsp" >Project DB</a>
  		
  		<%
  		if(id == null) {
  		%>
  		
  		<div style="display:inline-block">
   				<button type="button" class="btn btn-primary" onClick="location.href='login.jsp'"> �α���</button>
   				<button type="button" class="btn btn-light" onClick="location.href='join.jsp'"> ȸ������</button>
   		</div>
	</nav>
  		
  		<%
  		} else {
  			 
  		%>
  		<div style="display:inline-block">
   				<button type="button" class="btn btn-light" onClick="location.href='user.jsp'">ȸ������</button>
   				<button type="button" class="btn btn-light" onClick="location.href='logoutAction.jsp'">�α׾ƿ�</button>
   		</div>
	</nav> 
  		
  		<%
  			
  			}
  		%>
  		
	<div class="container-fluid" style="height: 100vh;">
		<!-- logo -->
		<div>
			<img id="logo" src="./resources/img/project_db_logo.png">
		</div>
		<!-- �˻�â -->
<form action="result.jsp" method="get">
	    <div class="container-fluid h-50 w-75">
	    
			<div class="row justify-content-center align-items-center">			
				<div class="col-1.5">
					<select name="search_type" id="search_type" class="form-control" onchange="selectBoxChange(this.value);">
					  	<option value="skin" selected>��Ų</option>
					  	<option value="champion">è�Ǿ�</option>
					  	<option value="universe">���Ϲ���</option>
					</select>
				</div>
				<div class="col-10"><!-- ������ col-12��. ���� 12�� �ǵ��� �ؾߵż� 11�� ���� -->										
						<div class="embed-submit-field">													
							<input type="text" name="search_text" id="search_text" placeholder="ã�� ������ �˻��ϼ���!" name="title">
							<button type="submit">�˻�!</button>
						</div>
					
				</div>
							
			</div>
			<div class="row justify-content-center align-items-center">			
				<div class="col-1.5">
					<button id="detailed_search_button" type="button" class="btn btn-light">�󼼰˻�</button>
					<!--  ��۽���ġ �ᵵ ������ �ϴ� ���� css���Ϸδ� �ȵ�
					<div class="form-check form-switch">
					  <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
					  <label class="form-check-label" for="flexSwitchCheckDefault">Default switch checkbox input</label>
					</div>-->

				</div>
				<br></br>
				<br></br>
				<div class="col-10">				
					<div class="row" id="detailed_search_skin" style="display: none">
						 <div class="col">
						 	��ÿ���
							<select name="release_date" id="release_date" class="form-control">
							  	<option value="all" selected>==��ü==</option>
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
							<select name="skin_type" id="skin_type" class="form-control">
							  	<option value="all" selected>==��ü==</option>
							  	<option value="Regular">Regular</option>
							  	<option value="Epic">Epic</option>
							  	<option value="Epic">Epic</option>
							  	<option value="Mythic">Mythic</option>
							  	<option value="Legendary">Legendary</option>
							</select>
						</div>
						<div class="col">
							ũ�θ�
							<select name="chroma" id="chroma" class="form-control">
							  	<option value="all" selected>==��ü==</option>
							  	<option value="True">TRUE</option>
							  	<option value="False">FALSE</option>
							</select>
						</div>
						<div class="col">
							����Ʈ
							<select name="effect" id="effect" class="form-control">
							  	<option value="all" selected>==��ü==</option>
							  	<option value="True">TRUE</option>
							  	<option value="False">FALSE</option>
							</select>
						</div>
						<div class="col">
							�ִϸ��̼�
							<select name="animation" id="animation" class="form-control">
							  	<option value="all" selected>==��ü==</option>
							  	<option value="True">TRUE</option>
							  	<option value="False">FALSE</option>
							</select>
						</div>
						<div class="col">
							����
							<select name="rating" id="rating" class="form-control">
							  	<option value="all" selected>==��ü==</option>
							  	<option value="5">�ڡڡڡڡ�</option>
							  	<option value="4">�ڡڡڡ�</option>
							  	<option value="3">�ڡڡ�</option>
							  	<option value="2">�ڡ�</option>
							  	<option value="1">��</option>
							</select>
						</div>
						
					</div>
					
					<div class="row" id="detailed_search_champion" style="display: none">
						 <div class="col">��ÿ���						 
							<select name="release_year" id="release_year" class="form-control">
							  	<option value="all" selected>==��ü==</option>
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
							<select name="class" id="class" class="form-control">
								<option value="all" selected>==��ü==</option>
							  	<option value="Fighter">Fighter</option>
							  	<option value="Slayer">Slayer</option>
							  	<option value="Controller">Controller</option>
							  	<option value="Tank">Tank</option>
							  	<option value="Mage">Mage</option>
							  	<option value="Marksman">Marksman</option>
							  	<option value="Specialist">Specialist</option>
							</select>
						</div>
						<div class="col">�Ҽ�
							<select name="region" id="region" class="form-control">
								<option value="all" selected>==��ü==</option>
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
	</form>
	</div>
	
		
						
</body>
</html>