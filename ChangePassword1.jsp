<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%
String UserID=(String)session.getAttribute("UserID");
System.out.println("UserID"+UserID);
%>
<HEAD>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<body Class="SC">

<center>

<BR><BR><br>
<FONT FACE="Century Gothic">



<FONT size="2" color="blue" FACE="Century Gothic">

<FORM NAME="LOGIN" ACTION="ChangePassword.jsp" METHOD="POST" >


<TABLE Border=0 align=center>
<TR class=row_title ALIGN="center">
	   <TH COLSPAN="2"> 输入新密码</TH>
</TR>

<TR class=row_even>
	<TD>用户id</TD>
	<TD><input TYPE=text name=UserID size="8" value="<%=UserID%>" readonly></TD>
</TR>
<TR class=row_odd>
	<TD>旧密码</TD>
	<TD><input TYPE=password name=Password size="8"  maxlength="8"></TD>
</TR>
<TR class=row_even>
	<TD>新密码 </TD>
	<TD><input TYPE=password name=newPassword size="8"  maxlength="8"></TD>
</TR>
<TR class=row_odd>
	<TD><INPUT TYPE=submit name=submit value="确定">
</TD>
	<TD><INPUT TYPE=reset name=resett value="重置" >
</TD>
</TR>
</TABLE>
<br><br>
</FORM>

</BODY>
</HTML>
