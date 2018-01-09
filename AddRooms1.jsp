<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*,java.util.Vector,java.util.StringTokenizer" %>
<%String UserID=(String)session.getAttribute("UserID");
	String ResortID = (String)request.getParameter("ResortID");
	session.setAttribute("ResortID",ResortID);
String LocationName="";
%>
<HTML>
<head>
		<LINK href="styles.css" type="text/css" rel="stylesheet">
		<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
		<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
		<script LANGUAGE="Javascript" SRC="Images/AjaxCall.js"></script>

<script LANGUAGE="Javascript" SRC="">
		function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
			}
		function validate()
		{		var frm = document.forms(0);
			    if(ChkMandatoryField(frm.ResortID,'ResortID')==false) return false;
				if(ChkMandatoryField(frm.LocationName,'Location Name')==false) return false;
			   if(ChkMandatoryField(frm.RoomType,'RoomType')==false) return false;
			   if(ChkMandatoryField(frm.RoomArea,'RoomArea')==false) return false;
			   if(ChkMandatoryField(frm.DryKitchenette,'DryKitchenette')==false) return false;
			   if(ChkMandatoryField(frm.SofacumBed,'SofacumBed')==false) return false;
			    if(ChkMandatoryField(frm.DoubleBeds,'DoubleBeds')==false) return false;
			    if(ChkMandatoryField(frm.Telephone,'Telephone')==false) return false;
			    if(ChkMandatoryField(frm.Television,'Television')==false) return false;

			 if(ChkMandatoryField(frm.RoomCharges,'RoomCharges')==false) return false;
		}


</script>

<BODY  Class="SC">
<h3 align=center>添加新房间</h3>
<table align=right>
<TD><A HREF="ViewRooms0.jsp" target="RFrame"><img border="0" name="Rooms" src="Images/ViewRooms0.jpg" onmouseover="document['Rooms'].src='Images/ViewRooms01.jpg'" onmouseout="document['Rooms'].src='Images/ViewRooms0.jpg'" ></A></TD>
</table>

<FORM NAME="Resorts" ACTION="AddRooms2.jsp" OnSubmit="return validate()">

 <center>
 <TABLE width="40%" align=center>
		<TR class="row_title">
		  <TH align="center" colspan=2><FONT SIZE="4" COLOR="#AA2504" face='monotype corsiva'>添加新房间</FONT></TH>
		</TR>
		<Input type=hidden name=UserID value='<%=UserID%>'>
		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>度假村ID  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD ><Input type=text name='ResortID' value='<%=ResortID%>'></TD></tr>

		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>区域名称 </FONT><FONT COLOR="red">*</FONT></TD>
		  <%
	try{
			Connection con=null;
			ResultSet rs=null;
			Statement stmt=null;
			String Query1="";con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();

				System.out.println("in else");
				Query1 = "Select LocationName from resortsinfo where ResortID='"+ResortID+"' ";

			String str="";
			System.out.println(Query1);
			rs = stmt.executeQuery(Query1);
			System.out.println(rs);
			int rCount=0;if(rs!=null){
				while(rs.next()){
					LocationName = rs.getString(1);
				}}
		}catch(Exception e){%><%=e%><%}
%>
		  <TD><Input type=text name='LocationName' value='<%=LocationName%>'></TD></tr>


		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>房间类型 </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="RoomType">
				<option value="StudioApartment">单人公寓</option>
				<option value="SingleBedRoomApartment">单间</option>
				<option value="DoubleBedRoomApartment">双人间</option>
				</select></TD></tr>
				<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>房间区域  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD ><Input type=text name='RoomArea' value=''>sqft</TD></tr>

		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>厨房  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="DryKitchenette">
				<option value="Yes">有</option>
				<option value="No">无</option>
				</select></TD></tr>
		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>沙发和床  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="SofacumBed">
				<option value="Yes">有</option>
				<option value="No">无</option>
				</select></TD></tr>
		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>双人间  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="DoubleBeds">
				<option value="Yes">有</option>
				<option value="No">无</option>
				</select></TD></tr>
		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>电话  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="Telephone">
				<option value="Yes">有</option>
				<option value="No">无</option>
				</select></TD></tr>
		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>电视  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="Television">
				<option value="Yes">有</option>
				<option value="No">无</option>
				</select></TD></tr>
			<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>房费  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD ><Input type=text name='RoomCharges' value=''>Rs</TD></tr>

  		  <tr class=row_even>
		<TH  ><INPUT TYPE="submit" value='添加房间'></TH>
		<TH  ><INPUT TYPE="reset" value='清除' ></TH></TR>
		</TABLE>
</FORM>
</BODY>
</HEAD>
</HTML>
