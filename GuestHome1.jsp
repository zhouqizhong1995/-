<HTML>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>

<%@ page session="true" %>
<%String UserID=(String)session.getAttribute("UserID");%>

<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<script LANGUAGE="Javascript" SRC="Images/AjaxCall.js"></script>

<head>
<body Class='SC'>
<br><br>
<Form name =UserProfile>
	<fieldset style="padding: 3; width=15;height=200">
 <legend><FONT COLOR="#800040" Face='verdana' size='2'><B>会员主页</B></FONT></Legend>

	<TABLE align=right>
		<tr><TD><A HREF="MyProfile.jsp" target="ResFrame"><FONT COLOR="#028BDC" Face='verdana' size='2'><B>个人资料</B></FONT></A></TD>
                </tr><td></td><td></td>
		<tr><TD><A HREF="MyBookings.jsp" target="ResFrame"><FONT COLOR="#028BDC" Face='verdana' size='2'><B>预定信息</B></FONT></A></TD>
                </tr><td></td><td></td>
		<tr><TD><A HREF="MyPayments.jsp" target="ResFrame"><FONT COLOR="#028BDC" Face='verdana' size='2'><B>支付方式</B></FONT></A></TD>
                </tr><td></td><td></td>
		<tr><TD><A HREF="DepositAmount.jsp" target="ResFrame"><FONT COLOR="#028BDC" Face='verdana' size='2'><B>存款金额</B></FONT></A></TD>
                </tr><td></td><td></td>
		<tr><TD><A HREF="Invite0.jsp" target="ResFrame"><FONT COLOR="#028BDC" Face='verdana' size='2'><B>邀请游客</B></FONT></A></TD>
                </tr><td></td><td></td>
		<tr><TD><A HREF="MemberSpeak0.jsp" target="ResFrame"><FONT COLOR="#028BDC" Face='verdana' size='2'><B>会员意见</B></FONT></A></TD>
		</tr><br><td></td><td></td>

		<tr><TD><A HREF="ChangePassword1.jsp" target="ResFrame"><FONT COLOR="#028BDC" Face='verdana' size='2'><B>更改密码</B></FONT></A></TD>
		</tr><br><td></td><td></td>
		<tr><TD><A HREF="Logout.jsp" target="BodyFrame"><FONT COLOR="#028BDC" Face='verdana' size='2'><B>登出</B></FONT></A></TD>
                </tr><td></td><td></td>

	</fieldSet>
	</TABLE>


</Form>
</BODY>
</HTML>
