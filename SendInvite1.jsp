<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%
	String UserID=(String)session.getAttribute("UserID");
	String Sno=request.getParameter("Sno");

%>

<HEAD>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY class="SC">

<h3 align=center>发送邀请</h2>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
		try{

			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Update invites set Status ='Invited' where Sno='"+Sno+"'";
			System.out.println(Query);
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><P align=center><FONT SIZE="2" COLOR="#00549A"> 邀请成功</P>
				<%
			}
			else{
				%><P align=center><FONT SIZE="2" COLOR="#00549A">更新时出错，请重试</P>
				<A HREF="SendInvite0.jsp">Back</A></P>

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
