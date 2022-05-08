<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("id");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/happytailsdb";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>

<style>
.button {
  background-color:#002699; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  

}
.button2:hover {


  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
.viewtbl{
font-size:18px;
font-style:bold;
}

</style>

	<meta charset="ISO-8859-1">


	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/view.css">
	
 	<title>View All</title>

	<hr>
	
		<ul class="one" position=center>
		
			<li><lable style="font-size:40px;">Happy Tails</lable></li>
			<li><a href="Home.html">HOME</a></li>
			<li><a href="view.jsp">MEMBERS</a></li>
			<li><a href="viewPet.jsp">PETS</a></li>
			<li><a href="VictoryViewAll.jsp">VICTORY LOGS</a></li>
			<li><a href="stockview.jsp">STOCKS</a></li>
			<li><a href="About.html">ABOUT US</a></li>
	
			
		</ul>
		
		<hr>
 	
 </head>

<body class="vbody">
<h6 style = "text-align:center;font-size:40px;font-style:bold;color:red">MEMBER RECORDS</h6><br><br>
	
	<div class=search>
		<form action="Search" name="frm" method="post">
		<table align="center">
			<tr>
			<td colspan=2 style="font-size:12pt;" align="center">
			<td><label for="fname">Search data by Name</label></td>
			<td><input type="text" name="name" ></td>
			<td><input  type="submit" name="submit" value="Search"></td></tr>
		</table>
	</form>
	</div>	
	
	<center>
	<table border="2" class="viewtbl">
	
	<tr style="background-color: powderblue;;color:white;text-align:center;">

		<td><b>ID</b></td>
		<td><b>Name</b></td>
		<td><b>NIC</b></td>
		<td><b>Contact Number</b></td>
		<td><b>Address</b></td>
		<td><b>Gender</b></td>
		<td><b>Date of Registration</b></td>
		<td><b>Employment type</b></td>
		<td><b>Annual Fee(Rs.)</b></td>
		
		<td><b>Update</b></td>
		<td><b>Delete</b></td>
	</tr>
	

<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM member";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("nic") %></td>
<td><%=resultSet.getString("phone") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("gender") %></td>
<td><%=resultSet.getString("date") %></td>
<td><%=resultSet.getString("type") %></td>
<td><%=resultSet.getString("fee") %></td>


<td><a href="updatemember.jsp?id=<%=resultSet.getString("id")%>" onClick="alert(' Update option in progress!')">Update</a></td>
<td><a href="delete.jsp?id=<%=resultSet.getString("id")%>"onClick="alert(' Delete option in progress!')">Delete</a></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

<br><br>
</table><br>
<a href="memberinsert.jsp"><button class="button button2">Add Members</button></a>
</center><br>



	
<center>
<a href="report"><button class="btnget">Download records</button>	

<a href="reportsearch.jsp"><button class="btnget">Reports</button><br><br>	

</center>									


</body>

</html>