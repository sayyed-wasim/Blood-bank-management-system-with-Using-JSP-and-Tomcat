<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="email"], select,input[type="number"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	padding:15px;
	width:60%;	
	border-radius: 25px;
	margin-left:20%;
}
h2,h1
{	
	margin-left:20%;
}
hr
{
width:60%;	
}
</style>
</head>
<body>
<%
String id=request.getParameter("id");

try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from donor where id='"+id+"'");
	
	while(rs.next())
	{
%>
<div class="container">
<form action="updateDonorAction.jsp" method="post">
<input type="hidden" name="id" value="<%out.println(id);%>">
<h2>Name</h2>
<input type="text" name="name" value="<%=rs.getString(2)%>">
<hr>
<h2> Father Name</h2>
<input type="text" name="father" value="<%=rs.getString(3)%>">
<hr>
<h2> Mother Name</h2>
<input type="text" name="mother" value="<%=rs.getString(4)%>">
<hr>
<h2>Mobile Number</h2>
<input type="number" name="mobilenumber" value="<%=rs.getString(5)%>">
<hr>
<h2>Email</h2>
<input type="email" name="email" value="<%=rs.getString(7)%>">
<hr>
<h2>Address</h2>
<input type="text" name="address" value="<%=rs.getString(9)%>">
<br>
<center><button type="submit" class="button">Save</button></center>
</form>
</div>
<%
	}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
<br>
<br>
<br>
<br>
<h3><center>All Right Reserved @SmartSystem.Inc :: 2021  </center></h3>

</body>
</html>