<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<% String UserID = request.getParameter("UserID");
	System.out.println("UserID---"+UserID);
%>
<HEAD>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY class=Grad>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String myUsr="";
	try{
			con = com.eResorts.ConnectionPool.getConnection();
			System.out.println("connection"+con);
			stmt =  con.createStatement();
			String Query = "Select * from Login where UserID='"+UserID+"'";
			rs = stmt.executeQuery(Query);
			int rCount=0;
			while(rs.next())
			{
				myUsr=rs.getString(1);
				rCount++;
			}
			if(rCount>0){
				%><FONT COLOR="#FF3333" face='Times new roman'><I><B>用户名不可用。 请选择另一个</B></I></FONT><%
			}else{
				%><FONT COLOR="#B1B1B1" face='Times new roman'><B>用户名不可用。</B></FONT><%
			}
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
