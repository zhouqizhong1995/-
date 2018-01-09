
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>用户登陆</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
    <LINK href="styles.css" type="text/css" rel="stylesheet">
    <script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
    <script LANGUAGE="Javascript" >
		function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
		function ChkNumField(F,T){
			var val = F.value;
			if(isNaN(val)==true||val==""){alert("Please enter numbers for "+T);return false;}
		}
		function ChkAlphaNumericField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z0-9]{1,250})$/;
			if(!(pattern.test(val)==true)){alert("Please enter alphabets or numbers for "+T);return false;}
		}
		function ChkAlphaField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z ]{1,250})$/;
			if(!(pattern.test(val)==true)){alert("Please enter text for "+T);return false;}
		}
		function ChkEmailField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z0-9\_\.]{4,25})$/;
			if(!(pattern.test(val)==true)){alert("Please enter valid email for "+T);return false;}
		}
		function ChkDateField(F,T)
		{
			var val = F.value;
		    var pattern = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
		    if(!(pattern.test(val)==true)){alert("Please enter valid date format (yyyy-mm-dd) for "+T);return false;}
		}
		function validate()
		{
			var frm = document.forms(0);
			if(ChkMandatoryField(frm.UserID,'UserID')==false) return false;
			if(ChkAlphaField(frm.UserID,'UserID')==false) return false;
			if(ChkMandatoryField(frm.Password,'Password')==false) return false;
			if(ChkAlphaNumericField(frm.Password,'Password')==false) return false;

		}
	</script>
  </head>
	<%! String ErrCode="0",LoginCode="A";%>
 	<Body Class='SC'>
	<BR><BR><BR><BR>
	<FORM ACTION="Validate.jsp" onsubmit="return validate()">
	<%
		ErrCode = request.getParameter("ErrCode");
		LoginCode = request.getParameter("LoginCode");
		if(ErrCode!=null){
			if(ErrCode.equals("1")){
			  %><script>alert("登录失败，请再次尝试");</script><%
			}
		}
	%>
	<fieldset style="padding: 3;width:'40%';" align=center>
	    <legend><FONT COLOR="" Face='verdana' size='2'><B>登陆</B></FONT></Legend>
		<TABLE align=center width="40%" class="notepad">
			<TR class="row_title">
			  <TH align="center" colspan=3><FONT SIZE="4" COLOR="#AA2504" face='monotype corsiva'>登陆</FONT></TH>
			</TR>
			<TR>
			  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>用户 ID</FONT><FONT COLOR="red">*</FONT></TD>
			  <TD><Input type=text name='UserID' value=''  size=8></TD></tr>
			  <TR><TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>密码<FONT COLOR="red">*</FONT></TD>
			  <TD><Input type=password name='Password' value='' size=8></TD>
			  <TR><TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>身份<FONT COLOR="red">*</FONT></TD>
			  <TD><select name=Auth value='0'><option value=0>管理员</option><option value=1>游客</option></select></TD>
			  <TD><INPUT TYPE="submit" value='Go'></TD></TR>
		</TABLE>
	</fieldset>
	<BR><BR>
	<fieldset style="padding: 3;width:'40%'"  align=center>
	   <legend><FONT COLOR="" Face='verdana' size='2'><B>注册</B></FONT></Legend>
		<P align=center><FONT SIZE="4" COLOR="#AA2504" face='monotype corsiva'>如果你不是注册用户<Font COLOR="#AE0000"><B>现在注册</B></Font></FONT></P>
		<Table align=center width='40%'>
		 <TR align=center>
		  <TD>
		   <A HREF="Register0.jsp" target="BodyFrame"><IMG SRC="Images/RegisterNow.jpg" WIDTH="137" HEIGHT="29" BORDER="0" ALT=""></A>
		  </TD>
		 </TR>
		</Table>

	</fieldset>
</FORM>
</BODY>
</html>
