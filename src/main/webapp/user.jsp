<!-- =================== -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*,java.util.regex.*" %>  
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="resources/css/bootstrap.css?after">
	<title>PROJECT DB 댓글 목록</title>
</head>
<body>
		<nav class="navbar sticky-top  navbar-dark bg-dark">
  		<a class="navbar-brand" href="main.jsp" >Project DB</a>
  		<div style="display:inline-block">
   				<button type="button" class="btn btn-light" onClick="location.href='user.jsp'">회원관리</button>
   				<button type="button" class="btn btn-light" onClick="location.href='logoutAction.jsp'">로그아웃</button>
   		</div>
	</nav> 
	</nav>
	<%
	// id 가져오기
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	
	// DB 연결
	String serverIP="localhost";
	String strSID="orcl";
	String portNum="1521";
	String user="lol"; //PROJECTDB
	String pass="lol"; //PROJECTDB
	String url="jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	
	Connection conn=null;
	PreparedStatement ps;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,user,pass);
	%>
	<div class="row justify-content-center align-items-center">					
		<h2>평가한 스킨 목록</h2> <br><br><br>
	</div>
	<%
	String sql = "SELECT R.Skin_name, R.Score, C.Content\r\n" 
			+ "FROM USERS U, COMMENTS C, RATING R\r\n"
			+ "WHERE C.Skin_name=R.Skin_name\r\n"
			+ "AND C.ID=?\r\n"
			+ "AND C.ID=R.ID AND C.ID=U.ID\r\n"
			+ "ORDER BY U.Name";
	ps = conn.prepareStatement(sql);
	ps.setString(1, id);
	rs = ps.executeQuery();
	out.println("<table class=\"table\">");
	ResultSetMetaData rsmd=rs.getMetaData();
	int cnt=rsmd.getColumnCount();
	for(int i=1;i<=cnt;i++){
		out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	}
	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("<td>"+rs.getInt(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("</tr>");				
	}
	out.println("</table>");
	rs.close();
	ps.close();
	%>
	
	
</body>
</html>