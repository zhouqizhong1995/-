<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*,java.util.Vector,java.util.StringTokenizer" %>
<%String UserID=(String)session.getAttribute("UserID");
	String LocationName = (String)request.getParameter("LocationName");
	session.setAttribute("LocationName",LocationName);

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
			    if(ChkMandatoryField(frm.LocationName,'Location Name')==false) return false;
			    if(ChkMandatoryField(frm.ResortImage,'Resort Image')==false) return false;
			   if(ChkMandatoryField(frm.NoOfRooms,'NoOfRooms')==false) return false;
			   if(ChkMandatoryField(frm.NoOfRoomsAvailable,'NoOfRoomsAvailable')==false) return false;
			   if(ChkMandatoryField(frm.Restaurant,'Restaurant')==false) return false;
			   if(ChkMandatoryField(frm.Swimmingpool,'Swimmingpool')==false) return false;
			    if(ChkMandatoryField(frm.GamesRoom,'GamesRoom')==false) return false;
			    if(ChkMandatoryField(frm.Casino,'Casino')==false) return false;
			    if(ChkMandatoryField(frm.YogaandMeditation,'Yoga&Meditation')==false) return false;
			    if(ChkMandatoryField(frm.SteamBath,'SteamBath')==false) return false;
			    if(ChkMandatoryField(frm.GymandHealthCenter,'Gym&HealthCenter')==false) return false;



		}
		function fnUpload()
	{
		var userid = document.forms(0).userid;
		fnEmpPopUp('UploadPhoto1.jsp?userid='+userid,80,400);
	}

</script>

<BODY  Class="SC">
<h3 align=center>添加新度假村</h3>
<table align=right>
<table align=right>
<TD><A HREF="ViewResorts0.jsp" target="RFrame"><img border="0" name="ViewResorts" src="Images/ResortsDetails0.jpg" onmouseover="document['ViewResorts'].src='Images/ResortsDetails1.jpg'" onmouseout="document['ViewResorts'].src='Images/ResortsDetails0.jpg'" ></A></TD>
</table>

<FORM NAME="Resorts" ACTION="AddResorts2.jsp" OnSubmit="return validate()">

 <center>
 <TABLE width="40%" align=center>
		<TR class="row_title">
		  <TH align="center" colspan=2><FONT SIZE="4" COLOR="#AA2504" face='monotype corsiva'>添加新度假村</FONT></TH>
		</TR>
		<Input type=hidden name=UserID value='<%=UserID%>'>
		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>区域名称 </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><Input type=text name='LocationName' value='<%=LocationName%>'></TD></tr>
		  <tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>度假村名称 </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD >
		<div id="infodiv"></div><Input type="text" name='PhotoPath' ><INPUT id="FUBtn" name="FUBtn" class= "UploadButton" TYPE="Button" value='Attach Photo' onclick="fnUpload()" class="UploadButton"><br>
		</TR>
		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>NO  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD ><Input type=text name='NoOfRooms' value=''></TD></tr>
		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>餐厅 </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="Restaurant">
				<option value="Yes">有</option>
				<option value="No">无</option>
				</select></TD></tr>
		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>游泳池  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="Swimmingpool">
				<option value="Yes">有</option>
				<option value="No">无</option>
				</select></TD></tr>
		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>游戏室  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="GamesRoom">
				<option value="Yes">有</option>
				<option value="No">无</option>
				</select></TD></tr>
		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>棋牌室  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="Casino">
				<option value="Yes">有</option>
				<option value="No">无</option>
				</select></TD></tr>
		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>瑜伽室  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="YogaandMeditation">
				<option value="Yes">有</option>
				<option value="No">无</option>
				</select></TD></tr>
		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>桑拿  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="SteamBath">
				<option value="Yes">有</option>
				<option value="No">无</option>
				</select></TD></tr>
		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>健身房  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="GymandHealthCenter">
				<option value="Yes">有</option>
				<option value="No">无</option>
				</select></TD></tr>



  		  <tr class=row_even>
		<TH  ><INPUT TYPE="submit" value='添加'></TH>
		<TH  ><INPUT TYPE="reset" value='清除' ></TH></TR>
		</TABLE>
</FORM>
</BODY>
</HEAD>
</HTML>
