<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>
<%			String Condition = "LocationName";
%>

<HTML>
<HEAD>
<TITLE>添加度假村</TITLE>
    <LINK href="styles.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript">
	<!--
		function validate(){
			var frm = document.forms(0);
			var LocationName = frm.LocationName.value;
			if(LocationName!=""){
				return true;
			}else{
				alert("请选择区域名称继续");
				return false;
			}
		}
	//-->
	</SCRIPT>
</HEAD>

<BODY Class='SC'>
<HR><br>
<table align=right>
<TD><A HREF="ViewResorts0.jsp" target="RFrame"><img border="0" name="Resorts" src="Images/ResortsDetails0.jpg" onmouseover="document['Resorts'].src='Images/ResortsDetails1.jpg'" onmouseout="document['Resorts'].src='Images/ResortsDetails0.jpg'" ></A></TD>
</table>
<FORM Name='Resorts' Id="Resort" method="Post" onsubmit="return validate();" action="AddResorts1.jsp" >
		<TABLE align=center width="30%">
		<TR class="row_title">
			<TD colspan=2 align=center><B><CENTER>选择区域</CENTER></B></TD>
				<TR class="row_even">
			<TH>区域名称</TH>
			<TD><INPUT TYPE="hidden" NAME="LName" value=""><SELECT NAME="LocationName">
			<OPTION Value="">选择</OPTION>

<%
	try{
			Connection con=null;
			ResultSet rs=null;
			Statement stmt=null;
			String[] ConValues = new String[2000];
			int ConCount=0,i=0;
			String Query1="";con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			if(Condition.trim().equalsIgnoreCase("undefined")){
				System.out.println("in if");
				Query1 = "Select * from accommodation";
			}
			else{
				System.out.println("in else");
				Query1 = "Select "+Condition+" from accommodation";
			}
			String str="";
			System.out.println(Query1);
			rs = stmt.executeQuery(Query1);
			System.out.println(rs);
			int rCount=0;
				while(rs.next()){
					String x = rs.getString(1);
					ConValues[i]=x;
					%><OPTION Value=<%=ConValues[i]%>><%=ConValues[i]%></OPTION><%
					i++;
				}
		}catch(Exception e){%><%=e%><%}
%>
		<TR><TH align=center colspan=2><INPUT TYPE="submit" value='添加度假村'></TH></TR>
	</TABLE>
	</FORM>
	</BODY>

</HTML>
