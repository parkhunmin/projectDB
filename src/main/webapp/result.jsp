<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="resources/css/bootstrap.css?after">
	<title>검색 결과</title>
</head>
<body>
	<nav class="navbar sticky-top  navbar-dark bg-dark">
  		<a class="navbar-brand" href="main.jsp">Project DB</a>
  		<div style="display:inline-block">
   				<button type="button" class="btn btn-primary" onclick="location='login.jsp'"> 로그인</button>
   				<button type="button" class="btn btn-light" onclick="location='make_account.jsp'"> 회원가입</button>
   		</div>
	</nav>
	<!-- 디비 연결 시작 -->
	<%
	String serverIP="localhost";
	String strSID="orcl";
	String portNum="1521";
	String user="PROJECTDB";
	String pass="PROJECTDB";
	String url="jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	
	Connection conn=null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(url,user,pass);
	%>
	<!-- 정보 받아오기 -->
	<%
		//스킨, 챔피언, 유니버스 셀렉트 결과 
		String search_type=request.getParameter("search_type");
		String search_text=request.getParameter("search_text");
		System.out.println("serach_type:"+search_type);
		System.out.println("search_text:"+search_text);
		//상세검색이 없는 경우
		if (search_type.equals("skin")){//스킨 체인지도 조인해서 띄울건지 생각해야함
			String query="SELECT * "
					+"FROM SKIN S "
					+"WHERE SKIN_NAME LIKE ? " 
					+"ORDER BY SKIN_NAME";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, "%"+search_text+"%");
			rs=pstmt.executeQuery();
			out.println("<table border=\"1\">");
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
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");
				out.println("<td>"+rs.getString(6)+"</td>");
				out.println("<td>"+rs.getString(7)+"</td>");
				out.println("</tr>");				
			}
			out.println("</table>");
			rs.close();
			pstmt.close();
		}
		else if (search_type.equals("champion")){//가지고 있는 스킨도 띄워주면 좋을듯. 페이지 하나 만들어서..?
			//상세검색이 아닌경우(all all all) release_year, class, region
			String release_year=request.getParameter("release_year");
			System.out.println(release_year);
			String class_type=request.getParameter("class");
			String region=request.getParameter("region");
			//상세검색의 경우
			String query="SELECT * "
					+"FROM CHAMPION ";
			if (search_text!=null){//null이 아닐때
				query=query+"WHERE NAME LIKE '%"+search_text+"%' ";			
			}
			if (!release_year.equals("all")){
				query=query+"AND '"+release_year+"' = TO_CHAR(RELEASE_DATE, 'YYYY') ";//년도로만 비교
				//WHERE '20201010' < TO_CHAR(LAUNCH_DATE, , 'YYYYMMDD');			
			}
			if (!class_type.equals("all")){
				query=query+"AND CLASS="+"'"+class_type+"' ";
			}
			if (!region.equals("all")){
				query=query+"AND region="+"'"+region+"' ";
			}
			query=query+"ORDER BY NAME";
			//
			pstmt=conn.prepareStatement(query);
			//pstmt.setString(1, "%"+search_text+"%");
			rs=pstmt.executeQuery();
			out.println("<table border=\"1\">");
			ResultSetMetaData rsmd=rs.getMetaData();
			int cnt=rsmd.getColumnCount();
			for(int i=1;i<=cnt;i++){
				out.println("<th>"+rsmd.getColumnName(i)+"</th>");
			}
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");//시간 잘라내야함 년월일만 남도록
				out.println("</tr>");				
			}
			out.println("</table>");
			rs.close();
			pstmt.close();
		}
		else if (search_type.equals("universe")){
			String query="SELECT * "
					+"FROM SKIN_UNIVERSE "
					+"WHERE NAME LIKE ? " 
					+"ORDER BY NAME";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, "%"+search_text+"%");
			rs=pstmt.executeQuery();
			out.println("<table border=\"1\">");
			ResultSetMetaData rsmd=rs.getMetaData();
			int cnt=rsmd.getColumnCount();
			for(int i=1;i<=cnt;i++){
				out.println("<th>"+rsmd.getColumnName(i)+"</th>");
			}
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("</tr>");				
			}
			out.println("</table>");
			rs.close();
			pstmt.close();
		}
		
		
	%>
</body>
</html>