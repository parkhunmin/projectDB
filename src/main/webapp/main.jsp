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
				if($("#search_type option:selected").val()=="��Ų"){
					$("#detailed_search_skin").toggle();
				}
				if($("#search_type option:selected").val()=="è�Ǿ�"){
					$("#detailed_search_champion").toggle();
				}
				if($("#search_type option:selected").val()=="���Ϲ���"){
					$("#detailed_search_universe").toggle();
				}
		  	
		  });
		});	//����Ʈ �ɼ� ���� ���� div�� �ٸ��� �����ϸ� �ɵ��ϴ�?
	</script>
</head>
<body>
		<nav class="navbar sticky-top  navbar-dark bg-dark">
  		<a class="navbar-brand" href="main.jsp" >Project DB</a>
  		<div style="display:inline-block">
   				<button type="button" class="btn btn-primary" onClick="location.href='login.jsp'"> �α���</button>
   				<button type="button" class="btn btn-light" onClick="location.href='join.jsp'"> ȸ������</button>
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
							<select id="search_type" class="form-control">
							  	<option value="��Ų" selected>��Ų</option>
							  	<option value="è�Ǿ�">è�Ǿ�</option>
							  	<option value="���Ϲ���">���Ϲ���</option>
							</select>
						</div>
						<div class="col">
							<select id="search_type" class="form-control">
							  	<option value="��Ų" selected>��Ų</option>
							  	<option value="è�Ǿ�">è�Ǿ�</option>
							  	<option value="���Ϲ���">���Ϲ���</option>
							</select>
						</div>
						<div class="col">
							<select id="search_type" class="form-control">
							  	<option value="��Ų" selected>ũ�θ�</option>
							  	<option value="è�Ǿ�">è�Ǿ�</option>
							  	<option value="���Ϲ���">���Ϲ���</option>
							</select>
						</div>
						
					</div>
					
					<div class="row" id="detailed_search_champion" style="display: none">
						 <div class="col">
							<select id="search_type" class="form-control">
							  	<option value="��Ų" selected>�����</option>
							  	<option value="è�Ǿ�">è�Ǿ�</option>
							  	<option value="���Ϲ���">���Ϲ���</option>
							</select>
						</div>
						<div class="col">
							<select id="search_type" class="form-control">
							  	<option value="��Ų" selected>��Ų</option>
							  	<option value="è�Ǿ�">è�Ǿ�</option>
							  	<option value="���Ϲ���">���Ϲ���</option>
							</select>
						</div>
						<div class="col">
							<select id="search_type" class="form-control">
							  	<option value="��Ų" selected>��Ų</option>
							  	<option value="è�Ǿ�">è�Ǿ�</option>
							  	<option value="���Ϲ���">���Ϲ���</option>
							</select>
						</div>
						
					</div>
					
					<div class="row" id="detailed_search_universe" style="display: none">
						 <div class="col">
							<select id="search_type" class="form-control">
							  	<option value="��Ų" selected>�̸�</option>
							  	<option value="è�Ǿ�">è�Ǿ�</option>
							  	<option value="���Ϲ���">���Ϲ���</option>
							</select>
						</div>
						<div class="col">
							<select id="search_type" class="form-control">
							  	<option value="��Ų" selected>��Ų</option>
							  	<option value="è�Ǿ�">è�Ǿ�</option>
							  	<option value="���Ϲ���">���Ϲ���</option>
							</select>
						</div>
						<div class="col">
							<select id="search_type" class="form-control">
							  	<option value="��Ų" selected>��Ų</option>
							  	<option value="è�Ǿ�">è�Ǿ�</option>
							  	<option value="���Ϲ���">���Ϲ���</option>
							</select>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
		
						
</body>
</html>