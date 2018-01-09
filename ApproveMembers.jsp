
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class="SC">
<h4 align=center>批准用户</h4>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{

			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select userid,membertype from userprofile where approve = 0";
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="60%">
							<tr class=row_title>
							<th align="left">UserId</th><th align="left">Member Type</th><th align="center">点击</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<td align=center><%=rs.getString(1)%></td>
						<td align=center><%=rs.getString(2)%></td>
						<td align=center><a href="approving.jsp?id=<%=rs.getString(1)%>">详细信息</a></td>

					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><h3 align=center>抱歉没有找到记录</h3><% }
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
</BODY>

</PRE>
