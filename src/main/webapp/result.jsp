<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="resources/css/bootstrap.css?after">
	<title>�˻� ���</title>
</head>
<body>
	<nav class="navbar sticky-top  navbar-dark bg-dark">
  		<a class="navbar-brand" href="main.jsp">Project DB</a>
  		<div style="display:inline-block">
   				<button type="button" class="btn btn-primary" onclick="location='login.jsp'"> �α���</button>
   				<button type="button" class="btn btn-light" onclick="location='make_account.jsp'"> ȸ������</button>
   		</div>
	</nav>
	<!-- ��� ���� ���� -->
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
	<!-- ���� �޾ƿ��� -->
	<%
		//��Ų, è�Ǿ�, ���Ϲ��� ����Ʈ ��� 
		String search_type=request.getParameter("search_type");
		String search_text=request.getParameter("search_text");
		System.out.println("serach_type:"+search_type);
		System.out.println("search_text:"+search_text);
		//�󼼰˻��� ���� ���
		if (search_type.equals("skin")){//��Ų ü������ �����ؼ� ������ �����ؾ���
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
		else if (search_type.equals("champion")){//������ �ִ� ��Ų�� ����ָ� ������. ������ �ϳ� ����..?
			String query="SELECT * "
					+"FROM CHAMPION "
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
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");//�ð� �߶󳻾��� ����ϸ� ������
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