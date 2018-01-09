<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class="SC">
<h3 align=center>用户注册</h3>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String UserID = request.getParameter("UserID");
	session.setAttribute("UserID",UserID);
	String Password = request.getParameter("upassword");
	int auth = 1;
    String RegID = "";
	MyFunctions MF = new MyFunctions();
	RegID = MF.genNextID("userprofile","RegID","M00");
    String FirstName = request.getParameter("FirstName");
	String LastName = request.getParameter("LastName");
	String Age = request.getParameter("Age");
	String EmailAddress = request.getParameter("EmailAddress");
	String Address = request.getParameter("Address");
	String ContactNumber = request.getParameter("ContactNumber");
	String Occupation = request.getParameter("Occupation");
	String MemberType = request.getParameter("MemberType");
	String AmountDeposited = request.getParameter("AmountDeposited");
	int app=1;
	session.setAttribute("MemberType",MemberType);

	try{

			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			con.setAutoCommit(false);
			String Query = "Insert into Login values('"+UserID+"','"+Password+"',"+auth+")";
			String Query1 = "Insert into userprofile values('"+RegID+"','"+UserID+"','"+FirstName+"','"+LastName+"','"+Age+"','"+EmailAddress+"','"+Address+"','"+ContactNumber+"','"+Occupation+"','"+MemberType+"','"+AmountDeposited+"',"+app+")";
			System.out.println("-->"+Query);
			System.out.println("-->"+Query1);
			stmt.addBatch(Query);
			stmt.addBatch(Query1);

			int[] result = stmt.executeBatch();
			boolean successFlag = false;
			for(int i=0;i<result.length;i++){
				if(result[i]<1)
				{
					System.out.println("result[i]-->"+result[i]);
					successFlag = false;
					break;
				}else{
					successFlag = true;
				}
			}
			if( successFlag == true)
			{
				con.commit();

				%>
				 <!--
				 <script>

				   alert("尊敬的用户，您可能会在下个月5日收到您的账单");
				</script>-->
				<P align=center><FONT SIZE="5" COLOR="#AA2504" face='monotype corsiva'>
注册成功<BR></Font></P>

				<P align=center><a href="GuestMenu1.jsp">点击</a> 继续</P>

				<%
			}
			else{
				con.rollback();
				%><h6 align=center>更新时出错，请重试</h6><%
			}

		stmt.close();
			con.close();
		}catch(Exception e){
			stmt.close();
			con.close();
			%><%=e%><%
		}

%>
</BODY>
