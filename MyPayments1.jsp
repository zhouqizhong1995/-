<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random,com.eResorts.MyFunctions"%>
<%
String UserID = (String)session.getAttribute("UserID");
String StartDate = request.getParameter("StartDate");
String EndDate =  request.getParameter("EndDate");

float Amount=0;
%>
<HEAD>
		<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
		<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
		<script LANGUAGE="Javascript" SRC="Images/AjaxCall.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class='SC'>
<h3 align=center>支付详细信息</h3>
<table align=center>

<%

	Connection con=null;
	ResultSet rs=null,rs1=null;
	Statement stmt=null;

	try{

			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "select * from bookingsinfo where `From` between '"+StartDate+"' and '"+EndDate+"' and UserID='"+UserID+"' and BookingStatus!='Canceled' order by bookingstatus";
			System.out.println(Query);
			rs=stmt.executeQuery(Query);

			%>
			<table align="center" width="45%">
			<%
			int rCount=0;
			while(rs.next())
			{
			String BookingID=rs.getString(1);
			String ResortID=rs.getString(2);
			String RoomID=rs.getString(3);
			String LocationName=rs.getString(4);
			UserID=rs.getString(5);
			String MemberType=rs.getString(6);
			String RoomCharges=rs.getString(7);
			String From=rs.getString(8);
			String To=rs.getString(9);
			String BookingStatus=rs.getString(10);


		%><tr></tr><tr></tr><tr></tr><tr></tr>
			<tr class=row_odd>
			<td align="left" colspan=2 >预定状态:<td><font color=red><%=BookingStatus%></font></td></tr>

			<TR class= "row_even">
			<td align="left" colspan=2><B>预定ID: </B></td><td align="left" colspan=2><%=BookingID%></td></tr>
			<tr class= "row_even">
			<td align="left" colspan=2><B>房间ID: </B></td><td align="left" colspan=2><%=RoomID%></td></tr>

			<TR class= "row_even">
			<td align="left" colspan=2><B>支付日期: </B></td><td align="left" colspan=2><%=From%></td></tr>
			<TR class= "row_even">
			<td align="left" colspan=2><B>支付金额: </B></td>
			<td align="left" colspan=2> <FONT SIZE="2" COLOR="#A70C42"><B>Rs.<%=RoomCharges%></B></FONT></td></tr>





		<%
			rCount++;
			}
			if(rCount!=0)
		{

			String Query1 = "select sum(RoomCharges) from bookingsinfo where `From` between '"+StartDate+"' and '"+EndDate+"' and UserID='"+UserID+"' and BookingStatus!='Canceled'";
			System.out.println(Query1);
			rs1=stmt.executeQuery(Query1);
			while(rs1.next()){
			Amount=rs1.getFloat(1);

			}%><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
			<TR class= "row_odd">
			<td align="left" colspan=2><B><FONT SIZE="2" COLOR="#330000">总支付:</FONT> </B></td>
			<td align="left" colspan=2> <FONT SIZE="2" COLOR="#A70C42"><B>Rs.<%=Amount%></B></FONT></td></tr>
			<%
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
