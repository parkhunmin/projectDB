<!-- =================== -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*,java.time.*, java.time.format.DateTimeFormatter"%>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="resources/css/bootstrap.css?after">
	
	<title>PROJECT DB</title>
	<%
	String skin_name=request.getParameter("skin_name");//이거 안 받아와짐
	//필요한 정보: 이름, 스킨이름, 코멘트 (평점은 어떡함?)
	String content=request.getParameter("commentText");
	String rating=request.getParameter("rating");
	%>
</head>
<body>
	<%
	String id = null;
	if (session.getAttribute("id") != null) {//얘는 됨
		id = (String)session.getAttribute("id");
	}
	System.out.println("id:"+id);
	System.out.println("skin_name:"+skin_name);
	System.out.println("content:"+content);
	%>
<% //디비 연결
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
	//현재시간 구하기
	LocalDate now = LocalDate.now();
	String date=String.format("%1$tY-%1$tm-%1$td", now);
	//String date=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	//유저id구하기
	 String query4="SELECT NAME "
			+"FROM USERS "
			+"WHERE ID =? ";
		pstmt=conn.prepareStatement(query4);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		ResultSetMetaData rsmd4=rs.getMetaData();
	String name=null;
	
	while(rs.next()){
		name=rs.getString(1);			
	}
	//sql 삽입
	String query2="INSERT INTO COMMENTS VALUES(?, ?, ?, ?, ?)";//아이디, 이름, 내용, 시간, 스킨이름
	pstmt=conn.prepareStatement(query2);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	//
	System.out.println("for id:"+id);
	System.out.println("for name:"+name);
	System.out.println("for skin_name:"+skin_name);
	System.out.println("for skin_name:"+date);
	//
	pstmt.setString(3, content);
	pstmt.setString(4, date);
	pstmt.setString(5, skin_name);//여기서 에러 발생
	
	rs=pstmt.executeQuery();
	System.out.println("댓글 추가 완료");
	String query3 = "INSERT INTO RATING VALUES(?, ?, ?)";
	
	pstmt = conn.prepareStatement(query3);//이 부분 에러만 해결하면 끝남. 중간에 회원가입 때려치는 버튼 만들어야될 것 같긴함
	//어떤 값이 널인데
	pstmt.setString(1, id); //이게 문제임
	pstmt.setString(2, skin_name); //로그인한 유저의 정보를 들고있어야함...
	pstmt.setInt(3, Integer.parseInt(rating));

	int r = pstmt.executeUpdate();
	conn.commit();
	System.out.println("평점이 등록되었습니다.");
	
	rs.close();
	pstmt.close();	
	
	
%>

</body>
</html>