<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random,com.eResorts.MyFunctions"%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class='SC'>
<h3 align=center>会员详细信息</h3>
<table align=center>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;

	try{

			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "select * from userprofile where MemberType='Blocked'";
			System.out.println(Query);
			rs=stmt.executeQuery(Query);

			%>
			<table align="center" width="45%">
			<%
			int rCount=0;
			while(rs.next())
			{
			String RegID=rs.getString(1);
			String UserID=rs.getString(2);
			String FirstName=rs.getString(3);
			String LastName=rs.getString(4);
			String EmailAddress=rs.getString(6);
			String MemberType=rs.getString(10);


		%>
			<TR class= "row_even">
			<td align="left" colspan=2><B>注册ID: </B><%=RegID%></td><td align="left" colspan=2><a href ="UnBlock.jsp?UserID=<%=UserID%>&RegID=<%=RegID%>"><IMG SRC="Images/UnBlock.jpg" WIDTH="130" HEIGHT="26" BORDER="0" ALT=""></a></td></tr>

			<TR class= "row_even">
			<td align="left" colspan=2><B>用户ID: </B><%=UserID%></td>
			<td align="left" colspan=2><B>会员类型:</B><%=MemberType%></td></tr>

			<TR class= "row_even">
			<td align="left" colspan=2><B>现用名: </B><%=FirstName%></td><td align="left" colspan=2><B>邮箱地址: </B><%=EmailAddress%></td></tr>

			<tr class=row_odd>
			<th align="left" colspan=4><hr color='#F3E1BC'></th></tr>



		<%
				rCount++;
			}

			if( rCount == 0)	{%><P align=center><h6 align=center>抱歉没有找到记录</h6><% }
			rs.close();
			stmt.close();
			con.close();
		}catch(Exception e){
			rs.close();
			stmt.close();
			con.close();
			%><%=e%><%
		}


%>
</table>
</BODY>
