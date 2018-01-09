<!--
	File : Report.jsp
	Purpose : This jsp displays the home page containing link to change user's password

-->

<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@page import="java.sql.*,java.io.*,java.util.Random"%>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
<Head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<jsp:include page="MultiLevelmenu.htm"/><br><br><br><br><br><br><BR><BR><BR>
<body Class=SC>

<Title>报告</Title>
<font face="Times New ROman" color=blue >
<center>




<!--Retreiving user id using Session-->

<% String Userid=(String)session.getAttribute("userr");%>

<h3 align=center><FONT COLOR="#330000">亲爱的</FONT> <u><FONT  COLOR="#669933"><%=Userid%></FONT></u><FONT  COLOR="#330000">,<BR><BR> 请浏览所提供的菜单或链接</FONT></h3><br>



</center>
</font>
<p align="right">
<A href="ChangePassword1.jsp">更改密码 </A><BR><BR>
</p>
</body>
</html>
