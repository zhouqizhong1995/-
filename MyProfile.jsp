<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <%
String UserID=(String)session.getAttribute("UserID");
UserID = (session.getAttribute("UserID")==null) ? "Null" : (String)session.getAttribute("UserID");

if(UserID.equals("Null"))
{
	session.invalidate();
	%>
	<!--<H5 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">Session time out...Please login again</H5>-->
	<script language=javascript>
		location.replace('sessiontimeout.html');
	</script>
	<%
}
else{
%>
<HEAD>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class="SC">

<h3 align=center>详细信息 <%=UserID%></h2>
<FORM Name="UserDetails">
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from userprofile where UserID='"+UserID+"'";
			System.out.println(Query);
			rs = stmt.executeQuery(Query);
			System.out.println(Query);


			}
			catch(Exception e){
			%><%=e%><%
		}



if(rs!=null)
{
			%>
	<!--Displaying the table header-->

	<br>
<!--	<DIV STYLE="overflow:scroll;width:650px; height:400px;">-->


<%
int DisRow1=0;
			while(rs.next())
			{	String RegID=rs.getString(1);
				String	FirstName=rs.getString(3);
				String	LastName=rs.getString(4);
				String Age=rs.getString(5);
				String	EmailAddress=rs.getString(6);
				String	Address=rs.getString(7);
				String  ContactNumber=rs.getString(8);
				String  Occupation=rs.getString(9);
				String MemberType=rs.getString(10);
				String AmountDeposited=rs.getString(11);
				DisRow1++;
				%>

		<table align=center border=0  width="60%">
		 <TR class="row_title">
		<Td align=left colspan=2><FONT COLOR="#00549A" size=3>个人资料</FONT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;<A onclick='fnEmpPopUp("EditUserProfile.jsp?UserID=<%=UserID%>",600,600)'><IMG SRC="Images/Update.jpg" WIDTH="104" HEIGHT="26" BORDER="0" ALT=""></A>
		</font></td>
		</TR>
		  <tr class=row_even><td align=Left style="background-color:#F4E6C4" width="50%"><b>现用名</b></td>
		 <td align=Left style="background-color:#F8EDD6"><font  color="black"><%=FirstName%></font></td></tr>
		 <tr class=row_even><td align=Left style="background-color:#F4E6C4" ><b>曾用名</b></td>
		 <td align=Left style="background-color:#F8EDD6"><font  color="black"><%=LastName%></font></td></tr>
		 <tr class=row_even><td align=Left style="background-color:#F4E6C4" ><b>年龄</b></td>
		 <td align=Left style="background-color:#F8EDD6"><font  color="black"><%=Age%></font></td></tr>
		 <tr class=row_even><td align=Left style="background-color:#F4E6C4"><b>邮箱地址</b></td>
		 <td align=Left style="background-color:#F8EDD6"><font  color="black"><%=EmailAddress%></font></td></tr>
		 <tr class=row_even><td align=Left style="background-color:#F4E6C4"><b>地址</b></td>
		 <td align=Left style="background-color:#F8EDD6"><font  color="black"><%=Address%></font></td></tr>
		 <tr class=row_even><td align=Left style="background-color:#F4E6C4"><b>联系电话</b></td>
		 <td align=Left style="background-color:#F8EDD6"><font  color="black"><%=ContactNumber%></font></td></tr>
		 <tr class=row_even><td align=Left style="background-color:#F4E6C4"><b>职业</b></td>
		 <td align=Left style="background-color:#F8EDD6"><font  color="black"><%=Occupation%></font></td></tr>
		 <tr class=row_even><td align=Left style="background-color:#F4E6C4"><b>会员类型</b></td>
		 <td align=Left style="background-color:#F8EDD6"><font  color="black"><P align=left><%=MemberType%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <% if(!MemberType.equals("Platinum")){%>
		 <A      onclick='fnEmpPopUp("UpgradeMemberType.jsp?UserID=<%=UserID%>&MemberType=<%=MemberType%>",600,600)'><IMG SRC="Images/Upgrade.jpg" WIDTH="106" HEIGHT="26" BORDER="0" ALT=""></A>
		 <%}%>
		</font></td></tr>
		 <tr class=row_even><td align=Left style="background-color:#F4E6C4"><b>余额</b></td>
		 <td align=Left style="background-color:#F8EDD6"><font  color="black"><%=AmountDeposited%></font></td></tr>

		</tr>
		</table>




	<%
	}
	rs.close();

	if(DisRow1==0)
{
	/*To write to the server if the resultset is null*/
	%>
		<CENTER>
			<tr><th colspan=6>无记录</th></tr>
		</CENTER>
	<%}

}%>

</table>

</FORM>
</BODY>
</HTML>
<%
}
%>
