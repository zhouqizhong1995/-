<!--
	File : Logout.jsp


-->
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@page import="java.sql.*,java.io.*,java.util.Random"%>
<%
	session.removeAttribute("UserID");
	session.removeAttribute("connection");
	session.removeAttribute("auth");
	session.invalidate();
	System.out.println("After Lout-->");

%>
<Head>
<LINK href="styles.css" type="text/css" rel="stylesheet">
<body Class="SC">
<script>
	alert("登出成功");

</script>
<br><br>
<P align=center><FONT SIZE="5" COLOR="#AA2504" face='monotype corsiva'>
感谢光临</Font></P>
<P align=center><a href="Login.jsp">点击这里</a>再次登陆</P>
</body>
</html>
