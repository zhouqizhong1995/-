<HTML>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>

<%@ page session="true" %>
<%String UserID=(String)session.getAttribute("UserID");%>
<%String PhotoPath = (String)session.getAttribute("PhotoPath");

		%>
<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<script LANGUAGE="Javascript" SRC="Images/AjaxCall.js"></script>

<SCRIPT LANGUAGE="JavaScript">
<!--
	function setAction(URL,Obj){
		var f = document.forms(0);
		var ParamsList = "?";
		Obj.target='ResultFrame';
		Obj.href=URL+ParamsList;
	}
	function fnUpload()
	{
		var userid = document.forms(0).userid.value;
		fnEmpPopUp('UploadPhoto1.jsp?UserID='+userid,80,400);
	}
//-->
</SCRIPT>
<head>
<body Class='Grad'>

		<table width="85%">
		<tr><td><FONT SIZE="4" COLOR="#AA2504" face='Arial'> Hi&nbsp;<Font COLOR="#AE0000" SIZE="5" face='Arial'><I><%=UserID%></I></Font></td></tr>
		<tr><td><Img name="Photo" src="Images/Photos/<%=PhotoPath%>" onclick="fnUpload()" ></A></tr>
		<tr><td><FONT SIZE="3" COLOR="#AA2504" face='monotype corsiva'><I>点击图片更新 </I></Font></td></tr></table>

	<Form name =UserProfile>
	<fieldset style="padding: 3; width=15;height=200">
 <legend><FONT COLOR="" Face='verdana' size='2'><B></B></FONT></Legend>

	<TABLE align=right>
	<Input type=hidden name="userid" value=<%=UserID%>>
		<tr><TD><A HREF="MySettings0.jsp" target="ResFrame"><FONT COLOR="#00549A" Face='verdana' size='2'><B>个人设置</B></FONT></A></TD>
                </tr><td></td><td></td>
		<tr><TD><A HREF="MyProfile.jsp" target="ResFrame"><FONT COLOR="#00549A" Face='verdana' size='2'><B>个人资料</B></FONT></A></TD>
                </tr><td></td><td></td>
		<tr><TD><A HREF="MyFriends.jsp" target="ResFrame"><FONT COLOR="#00549A" Face='verdana' size='2'><B>我的朋友</B></FONT></A></TD>
                </tr><td></td><td></td>
		<tr><TD><A HREF="Scrap.jsp" target="ResFrame"><FONT COLOR="#00549A" Face='verdana' size='2'><B>剪贴簿</B></FONT></A></TD>
                </tr><td></td><td></td>
		<tr><TD><A HREF="Invite0.jsp" target="ResFrame"><FONT COLOR="#00549A" Face='verdana' size='2'><B>邀请朋友</B></FONT></A></TD>
                </tr><td></td><td></td>
		<tr><TD><A HREF="ChangePassword1.jsp" target="ResFrame"><FONT COLOR="#00549A" Face='verdana' size='2'><B>更改密码</B></FONT></A></TD>
		</tr><br><td></td><td></td>
		<tr><TD><A HREF="Logout.jsp" target="HomeFrame"><FONT COLOR="#00549A" Face='verdana' size='2'><B>登出</B></FONT></A></TD></tr>

	</fieldSet>
	</TABLE>


</Form>
</BODY>
</HTML>
