<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*,java.util.Vector,java.util.StringTokenizer" %>
<%String UserID=(String)session.getAttribute("UserID");
String MemberType=(String)session.getAttribute("MemberType");
String RoomID=request.getParameter("RoomID");
String LocationName=request.getParameter("LocationName");
int RoomCharges=Integer.parseInt(request.getParameter("RoomCharges").toString());
String ResortID=request.getParameter("ResortID");
double ActCharges=RoomCharges*1.12;

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

		{
				//calcRent();
				var frm = document.forms(0);

			   if(ChkMandatoryField(frm.RoomID,'RoomID')==false) return false;
   			   if(ChkMandatoryField(frm.MemberType,'MemberType')==false) return false;
			   if(ChkMandatoryField(frm.From,'From')==false) return false;
			   if(ChkMandatoryField(frm.To,'To')==false) return false;


		}
	function calcRent(){
	//	alert('ddd');
			frm = document.forms(0);
			T= frm.MemberType.value;
			//alert(T);
			P = parseInt(frm.ActualCharge.value);
			//alert(P);
			if(T=="Silver"){
			D=10;

			}else if(T=="Gold"){

			D=15;
			}else if(T=="Platinum"){

			D=20;
			}
			Discount = P*(D/100);
			Rent=P-Discount;
			Rent=Rent*1.12;
			//alert(Rent);
			frm.RoomRent.value =Rent;

		}
function Val()
	{//alert("abcd");
		var frm = document.forms(0);
		var To = frm.To;
		var From = frm.From;
		var rval = validatePeriod(From,To);
		if(rval==false) {
			alert("终止日期必须超过开始日期");
			frm.To.value="";
			return rval;
		}

  var sd=From.value;
  var yy=sd.substr(0,4);
  var mm=sd.substr(5,2);
  var dd=sd.substr(8,2);
  var sdobj = new Date(yy,mm-1,dd);

  var ed=To.value;
  var yy=ed.substr(0,4);
  var mm=ed.substr(5,2);
  var dd=ed.substr(8,2);
  var edobj = new Date(yy,mm-1,dd);
//alert(edobj);
//alert(sdobj);
 var now   = new Date();
// alert(now);
//alert(sdobj<now);
  if(sdobj<now)
	{
	  alert("选择有效的起始日期");
	  frm.To.value="";
	  frm.From.value="";
	  frm.To.focus();
	  return false;
	}

return false;
}

</script>

<BODY  Class="SC" onload="calcRent()">
<h3 align=center>预定</h3>

<FORM NAME="BookNow"  OnSubmit="return validate()" ACTION="BookNow1.jsp" >

 <center>
 <TABLE width="35%">
		<TR class="row_title">
		  <TH align="center" colspan=3><FONT SIZE="4" COLOR="#AA2504" face='monotype corsiva'>预定</FONT></TH>
		</TR>
		<Input type=hidden name='ResortID' value='<%=ResortID%>' readonly>
		<Input type=hidden name='LocationName' value='<%=LocationName%>' readonly>
		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>房间ID </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD colspan=2><Input type=text name='RoomID' value='<%=RoomID%>' readonly></TD></tr>

		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>用户ID </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD colspan=2><Input type=text name='UserID' value='<%=UserID%>' readonly></TD></tr>
		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>会员类型 </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD colspan=2>		  <Input type=text name='MemberType' value='<%=MemberType%>' readonly>
</td></tr>
		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>实际收费  </FONT><FONT COLOR="red">*</FONT></TD>

		<TD colspan=2><Input type=text name='ActualCharge' value='<%=RoomCharges%>' readonly>Rs</td></tr>
		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>房费  </FONT><FONT COLOR="red">*(incl VAT and with discount)</FONT></TD>

		<TD colspan=2><Input type=text name='RoomRent' value='' readonly ></td></tr>

		<TR class=row_even>
				<TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>入住日</Font><FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='From' value='' readonly><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this);" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
		<TR class=row_odd>
				<TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>退房日</Font><FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='To' value='' readonly><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this);Val()" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>


  		  <tr class=row_even>
		<TH  colspan=2><INPUT TYPE="submit" value='预定'></TH>
		</TABLE>
</FORM>
</BODY>
</HEAD>
</HTML>
