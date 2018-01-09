<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>
<%
String UserID=request.getParameter("UserID");
%>
<HEAD>
<HTML>
<HEAD>
<TITLE>欢迎</TITLE>
    <LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>

<BODY Class='SC'>
<P align=center><FONT SIZE="5" COLOR="#AA2504" face='monotype corsiva'>
抱歉! <%=UserID%> 您的帐户已被拒绝  </Font></P><br>
<P align=center><FONT SIZE="5" COLOR="#AA2504" face='monotype corsiva'>
  </Font></P>
<P align=center><U><FONT SIZE="5" COLOR="#AA2504" face='monotype corsiva'>
admin@admin.com </Font></U></P>
<P align=center><A href ="Login.jsp">返回</A></P>



</BODY>


</HTML>
