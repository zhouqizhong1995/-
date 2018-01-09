<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=Grad>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt4=null;
	String UserID = (String)session.getAttribute("UserID");
	System.out.println("-->"+UserID);
	String LocationImage = request.getParameter("LocationImage");
	try{

			con = com.eResorts.ConnectionPool.getConnection();
			stmt4=con.createStatement();
			String Query4 = "Update accommodation set LocationImage = '"+LocationImage+"' where UserID='"+UserID+"'";
			System.out.println(Query4);
			int result=stmt4.executeUpdate(Query4);
     		System.out.println(Query4);
			if( result > 0)	{
				%>
					<P align=center><FONT COLOR="green" face="Times new roman">
						<!--<I>Your Photo has been updated successfully</I></FONT><BR>-->
						<script>
							alert("您的照片已成功更新");
							window.opener.location.reload();
							window.close();
						</script>
						<!--<INPUT TYPE="Button" class="Button" value="关闭" onclick="window.close()">-->
					</P>
				<%
			}else{
				%>
					<P align=center><FONT COLOR="green" face="Times new roman">
						<!--<I>错误：请重新上传</I></FONT><BR>-->
						<script>
							alert("错误：请重试");
							window.opener.location.reload();
							window.close();
						</script>
						<!--<INPUT TYPE="Button" class="Button" value="关闭" onclick="window.close()">-->
					</P>
				<%
			}
			stmt4.close();
			con.close();
		}catch(Exception e){
			stmt4.close();
			con.close();
			%><%=e%><%
		}

%>
</BODY>
