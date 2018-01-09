<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>

<HEAD>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY class="SC">
<h3 align=center>邀请游客</h3>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String From = request.getParameter("From");
	String To = request.getParameter("To");
	String Status="Invite";
	int Sno=0;
	try{

			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			con.setAutoCommit(false);
			String Query = "Insert into invites values("+Sno+",'"+From+"','"+To+"','"+Status+"')";
			System.out.println("-->"+Query);
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><P align=center><h6 align=center>游客邀请成功</h6>
				<%
			}
			else{
				%><P align=center><h6 align=center>更新时出错，请重试</h6>
 				 <A HREF="Invite0.jsp">返回</A></P>
				<%
			}
			stmt.close();
			con.close();
		}catch(Exception e){
			stmt.close();
			con.close();
			%><%=e%><%
		}

%>
</BODY>
