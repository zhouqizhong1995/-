<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>
<%
String UserID=request.getParameter("UserID");
String RegID=request.getParameter("RegID");
%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">


</HEAD>
<BODY class="SC">
<h3 align=center>锁定用户 </h3>

<%

	Connection con=null;
	ResultSet rs=null,rs1=null;
	Statement stmt=null,stmt1=null;
	int res=0,result=0;

	try{

			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();

			String Query = "Update userprofile set MemberType='Blocked' where UserID='"+UserID+"' and RegID='"+RegID+"'";
			System.out.println(Query);
			result = stmt.executeUpdate(Query);


			if( result > 0)	{


			%><P align=center><h3 align=center>用户已成功锁定</h3></P>
				<P align=center><A HREF="ViewMembers.jsp">Back</A></P>

				<%
			}
			else{
				%><P align=center><h3 align=center>更新时出错，请重试</h3></P>
 				 <P align=center><A HREF="ViewMembers.jsp">返回</A></P>
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
