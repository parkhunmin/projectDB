<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="resources/css/bootstrap.css?after">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<%@ page language="java" import="java.text.*, java.sql.*" %>
	
	<title>PROJECT DB ��Ų������</title>
	<% //��� ����
		String serverIP="localhost";
		String strSID="orcl";
		String portNum="1521";
		String user="lol";
		String pass="lol";
		String url="jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
				
		Connection conn=null;
		PreparedStatement pstmt;
		ResultSet rs;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection(url,user,pass);
	%>
	<% 
		//��Ų �̸� �޾ƿ;���
		//String skin_name="Dark Cosmic Jhin";
		String skin_name=request.getParameter("skin_name");
		String price=request.getParameter("price");
		String launch_date=request.getParameter("launch_date");
		String chroma=request.getParameter("chroma");
		String kind=request.getParameter("kind");
		String champ_name=request.getParameter("champ_name");
		String uni_name=request.getParameter("uni_name");
		String effect=request.getParameter("effect");
		String animation=request.getParameter("animation");
		//String score=request.getParameter("score");
		String score=null;
	%>
	<%//���ھ� ��� ���� ����
	 String query="SELECT round(avg(score),2) "
				+"FROM RATING "
				+"WHERE Skin_name =? ";
		pstmt=conn.prepareStatement(query);
		pstmt.setString(1, skin_name);
		rs=pstmt.executeQuery();
		ResultSetMetaData rsmd=rs.getMetaData();

		while(rs.next()){
			score=rs.getString(1);			
		}

	%>
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

	<br></br>
	<br></br>
	<div class="container-fluid" style="height: 100vh;">
		<div class="row">
		<!-- 		<div style="display: inline-block">
		 -->
		 <div class="col" style=margin-right:100px>
		 <br></br>
		<% 
			out.println("<img src=\"./resources/img/"+skin_name+".jpg\" width=\"700\"></img>");
			//���� ���̺� �߰�
			//�Ʒ��� �ڸ�Ʈ �� ���� ���
			
		%>
		</div>
		 <div class="col" >
		<h2><%=skin_name %></h2>
		<table class="table">
			<tr>
			<td>price</td>
			<td><%=price%></td>
			</tr>
			<tr>
			<td>launch_date</td>
			<td><%=launch_date%></td>
			</tr>
			<tr>
			<td>chroma</td>
			<td><%=chroma%></td>
			</tr>
			<tr>
			<td>kind</td>
			<td><%=kind%></td>
			</tr>
			<tr>
			<td>champ_name</td>
			<td><%=champ_name%></td>
			</tr>
			<tr>
			<td>uni_name</td>
			<td><%=uni_name%></td>
			</tr>
			<tr>
			<td>effect</td>
			<td><%=effect%></td>
			</tr>
			<tr>
			<td>animation</td>
			<td><%=animation%></td>
			</tr>
			<tr>
			<td>score</td>
			<td><%=score%></td>
			</tr>
		</table>
		</div>
		</div>
		
		<div class="row justify-content-center align-items-center">		
		<!-- ���� �ȿ��� ���� ���� �ڸ�Ʈ ���� ������ �ɵ� -->
			<div>
			<br></br>
			<br></br>

			 <% 
		    
				    String query2="SELECT USER_NAME, CONTENT, CREATED_DATE "
							+"FROM COMMENTS "
							+"WHERE Skin_name =? "
							+" ORDER BY Created_Date DESC";
					pstmt=conn.prepareStatement(query2);
					pstmt.setString(1, skin_name);
					rs=pstmt.executeQuery();
					out.println("<table class=\"table\">");
					ResultSetMetaData rsmd2=rs.getMetaData();
					int cnt=rsmd2.getColumnCount();
					
					for(int i=1;i<=cnt;i++){
						out.println("<th>"+rsmd2.getColumnName(i)+"</th>");
					}
					
					while(rs.next()){
						out.println("<tr>");
						out.println("<td><b><font color='teal'>"+rs.getString(1)+"</font></b></td>");
						out.println("<td>"+rs.getString(2)+"</td>");
						out.println("<td>"+rs.getString(3)+"</td>");
						out.println("</tr>");				
					}
					out.println("</table>");
					rs.close();
					pstmt.close();
			 %>
			</div>
	
		<!-- ��Ų�̸��� �޾ƿ��� �� �������� ������ ������ -->		
		<form>
			<!-- ���� -->
			<!-- �ڸ�Ʈ -->
			
		</form>
		</div>
	</div>
</body>
</html>