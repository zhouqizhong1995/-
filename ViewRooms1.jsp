<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random,com.eResorts.MyFunctions"%>
<%
String ResortID = (String)request.getParameter("ResortID");
	session.setAttribute("ResortID",ResortID);
%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class='SC'>
<h3 align=center>房间详细信息</h3>
<table align=center>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;

	try{

			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "select * from roomsinfo where ResortID='"+ResortID+"'";
			System.out.println(Query);
			rs=stmt.executeQuery(Query);

			%>
			<table align="center" width="45%">
			<%
			int rCount=0;
			while(rs.next())
			{
				String RoomID=rs.getString(2);
			String LocationName=rs.getString(4);
			String RoomType=rs.getString(5);
			System.out.println("RoomType"+RoomType);
			String RoomArea=rs.getString(6);
			String DryKitchenette=rs.getString(7);
			String SofacumBed=rs.getString(8);
			String DoubleBeds=rs.getString(9);
			String Telephone=rs.getString(10);
			String Television=rs.getString(11);
			String RoomCharges=rs.getString(12);


		%><TR class= "row_odd">
			<th align="center"><Img src="Images/Photos/<%=RoomType%>.jpg"></th>

			<td align="left" colspan=1><B>设施:</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td colspan=2><%if(DryKitchenette.equals("Yes"))%><%
{%><B>DryKitchenette<br></B><%}else{%>
			<%}%>
			<%if(SofacumBed.equals("Yes"))%><%
{%><B>SofacumBed<br></B><%}else{%>
			<%}%>
			<%if(DoubleBeds.equals("Yes"))%><%
{%><B>DoubleBeds<br></B><%}else{%>
			<%}%>
			<%if(Telephone.equals("Yes"))%><%
{%><B>Telephone<br></B><%}else{%>
			<%}%>

<%if(Television.equals("Yes"))%><%
{%><B>Television<br></B><%}else{%>
			<%}%>
			<TR class= "row_even">
			<td align="left" colspan=2><B>区域名称: </B><%=LocationName%></td>


			<td align="left" colspan=2><B>房间ID: </B><%=RoomID%></td></tr>

			<TR class= "row_even">
			<td align="left" colspan=2><B>房间区域: </B><%=RoomArea%>sqft</td>
			<td align="left" colspan=2><B>房费: </B>Rs.<%=RoomCharges%></td></tr>




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
