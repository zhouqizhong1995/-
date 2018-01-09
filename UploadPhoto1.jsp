<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>
<%@ page import="java.util.*" %>
<%
String UserID = (String)session.getAttribute("UserID");
%>
<HEAD>
<TITLE>上传照片</TITLE>
<LINK href="styles.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript">
<!--
	function validate(){
		var V = document.forms(0).FilePath.value;
		if(V=="" || V==null){
			alert("请选择一个文件上传");
			return false;
		}else{
			//alert(window.opener.document.forms(0).PhotoPath.value+"--");
			window.opener.document.forms(0).PhotoPath.value = V;
			window.opener.document.getElementById('infodiv').innerHTML = "上传成功";
			window.opener.document.forms(0).FUBtn.disabled=true;
			return true;

		}

	}

//-->
</SCRIPT>
</head>
<BODY CLASS=Grad >
<BR>
<Form action="UploadPhoto2.jsp?UserID=<%=UserID%>" ENCTYPE="multipart/form-data" method=POST name="frmUpload" onsubmit="return validate();">

<TABLE>
	<TR class=row_title>
		<TH align=center colspan=2>上传图片</TH>

	</TR>
	<TR class=row_odd>
		<TH align=left>图片<FONT COLOR="red">*</FONT></TH>
		<TD><Input type=file name='FilePath' ><INPUT class= "UploadButton" TYPE="submit" value='上传' class="UploadButton"></TD>
	</TR>
</TABLE>
</FORM>
</body>
</html>
