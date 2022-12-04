<!-- =================== -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*,java.util.regex.*" %> 
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.userDAO" %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="id"/>
<jsp:setProperty name="user" property="password"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<link rel="stylesheet" href="resources/css/bootstrap.css?after">
	<title>PROJECT DB</title>
</head>
<body>
		<nav class="navbar sticky-top  navbar-dark bg-dark">
  		<a class="navbar-brand" href="main.jsp" >Project DB</a>
  		<div style="display:inline-block">
   				<button type="button" class="btn btn-primary"> �α���</button>
   				<button type="button" class="btn btn-light" onClick="location.href='signup.jsp'"> ȸ������</button>
   		</div>
	</nav>
	<div class="container-fluid" style="height: 100vh;">
		<div class="row justify-content-center align-items-center">					
	<%
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	if (id != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�̹� �α��� �Ǿ��ֽ��ϴ�.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script");
	}
	
	userDAO userDAO = new userDAO();
	int result = userDAO.login(user.getId(), user.getPassword());
	if (result == 1)
	{
		session.setAttribute("id", user.getId());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'main.jsp'");
		script.println("</script");
	}
	else if (result == 0)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('��й�ȣ�� Ʋ���ϴ�')");
		script.println("history.back()");
		script.println("</script");
	}
	else if (result == -1)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�������� �ʴ� ���̵��Դϴ�')");
		script.println("history.back()");
		script.println("</script");
	}
	else if (result == -2)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�����ͺ��̽� ���� �߻�')");
		script.println("history.back()");
		script.println("</script");
	}
	
	%>
	</div>
	</div>
</body>
</html>