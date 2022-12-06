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
	String skin_name=request.getParameter("skin_name");//�̰� �� �޾ƿ���
	//�ʿ��� ����: �̸�, ��Ų�̸�, �ڸ�Ʈ (������ ���?)
	String content=request.getParameter("commentText");
	String rating=request.getParameter("rating");
	%>
</head>
<body>
	<%
	String id = null;
	if (session.getAttribute("id") != null) {//��� ��
		id = (String)session.getAttribute("id");
	}
	System.out.println("id:"+id);
	System.out.println("skin_name:"+skin_name);
	System.out.println("content:"+content);
	%>
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
	//����ð� ���ϱ�
	LocalDate now = LocalDate.now();
	String date=String.format("%1$tY-%1$tm-%1$td", now);
	//String date=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	//����id���ϱ�
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
	//sql ����
	String query2="INSERT INTO COMMENTS VALUES(?, ?, ?, ?, ?)";//���̵�, �̸�, ����, �ð�, ��Ų�̸�
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
	pstmt.setString(5, skin_name);//���⼭ ���� �߻�
	
	rs=pstmt.executeQuery();
	System.out.println("��� �߰� �Ϸ�");
	String query3 = "INSERT INTO RATING VALUES(?, ?, ?)";
	
	pstmt = conn.prepareStatement(query3);//�� �κ� ������ �ذ��ϸ� ����. �߰��� ȸ������ ����ġ�� ��ư �����ߵ� �� ������
	//� ���� ���ε�
	pstmt.setString(1, id); //�̰� ������
	pstmt.setString(2, skin_name); //�α����� ������ ������ ����־����...
	pstmt.setInt(3, Integer.parseInt(rating));

	int r = pstmt.executeUpdate();
	conn.commit();
	System.out.println("������ ��ϵǾ����ϴ�.");
	
	rs.close();
	pstmt.close();	
	
	
%>

</body>
</html>