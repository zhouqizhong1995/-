<%@ page import="java.util.Properties,java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>

<%
String UserID=(String)session.getAttribute("UserID");
System.out.println("__________________");


%>
<html>
<head>
<title>会员反馈</title>
<LINK href="styles.css" type="text/css" rel="stylesheet">
<script language=javascript>
function goURL()
{
	Msg = document.FeedbackForm.message.value;

	From = document.FeedbackForm.From.value;
	if(From==""){
		alert("请提供您的邮件ID.");
		document.FeedbackForm.From.focus();
		return false;
	}
	if(Msg==""){
		alert("反馈是强制性的.");
		document.FeedbackForm.message.focus();
		return false;
	}
	if(Msg!="" && From!=""){
		url = "MemberSpeak0.jsp?message="+Msg+"&From="+From;
		//alert(url);
		var frm = document.FeedbackForm;
		frm.action = url;
	}else{
		return false;
	}
}
</script>
</head>
<body class="SC" >

<%


if(request.getMethod().equals("POST")  )
{
%>
	<h4>会员反馈</h4>
<%
  boolean status = false;
  //Updating database
  	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	int result=0;
	try
	{
		/*Getting the connection variable from session*/
		con = com.eResorts.ConnectionPool.getConnection();
		stmt =  con.createStatement();
		Date DateSubmitted = new Date(System.currentTimeMillis());
		String msg = request.getParameter("message");
		String From = request.getParameter("From");

		String Query = "Insert into Feedback(UserID,Feedback,DateSubmitted) values (\'"+From+"\',\'"+msg+"\',\'"+DateSubmitted+"\')";
		System.out.println(Query);
		result = stmt.executeUpdate(Query);
		System.out.println(result);
		if(result!=0){
			status=true;
		}else{
			status=false;
		}
	}
	catch(Exception e)
	{
		%><%=e%><%
	}


  if (status == true)
  {
     out.println("<P align=center><FONT COLOR='green' face='Georgia'>您的反馈已成功提交!<BR> 感谢您提供您的反馈.</FONT></P>");
	 %><center><A href="MemberSpeak0.jsp">&lt;&lt;返回</A></center><%
  }
}
else
{

%>

<h4 align=center>会员反馈</h4>
<P align=center><FONT SIZE="3" COLOR="#AA2504" face='monotype corsiva'>与我们分享你的回忆!<BR></FONT>
</P>
<form method="POST" name="FeedbackForm"  onsubmit="return goURL()">
<table align=center width="60%">
<tr class="row_title">

<TH align="center" colspan=2><FONT SIZE="4" COLOR="#AA2504" face='monotype corsiva'>会员评论</FONT></TH>
		</TR>
<tr class="row_odd">
    <td><B>用户 ID</B> <FONT COLOR="#FF0000">*</FONT></td>
    <td><B><INPUT TYPE="text" NAME="From" value='<%=UserID%>'size="50" readonly></B></td>
</tr>
<tr class="row_odd">
    <td><B>反馈</B> <FONT COLOR="#FF0000">*</FONT></td>
    <td><TEXTAREA name="message" ROWS = "5" COLS="50"></TEXTAREA></td>
</tr>
<tr class="row_odd">
    <td align=center><input type="reset"  name="Clear" Value="清除" class="WinButton"></td>
	<td align=center><input type="submit"  name="Command" Value="提交"  class="WinButton"></td>
</tr>
</table>
</form>

<%
}
%>

</body>
</html>
