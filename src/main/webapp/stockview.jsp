<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("id");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/happytaildb";
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
	<meta charset="ISO-8859-1">


	<link rel="stylesheet" type="text/css" href="stockcss/styles.css">
	<link rel="stylesheet" type="text/css" href="stockcss/header.css">
	<link rel="stylesheet" type="text/css" href="stockcss/footer.css">
	<link rel="stylesheet" type="text/css" href="stockcss/view.css">
	
 	<title>View All</title>

 

	<hr>
	
		<ul class="one" position=fixed;>
		
			<li><lable style="font-size:40px;">Happy Tail</lable></li>
			<li><a href="#">Home</a></li>
			<li><a href="#">Members</a></li>
			<li><a href="#">Pets</a></li>
			<li><a href="#">Victory Logs</a></li>
			<li><a href="stockview.jsp">Stock</a></li>
			<li><a href="#">About Us</a></li>
			
		</ul>
		
		
 	
 </head>

<body style="background-image:url('file:///C:/Users/Fujitsu/eclipse-workspace/Happy/src/main/webapp/images/downl1.jpg');
	background-repeat:no-repeat;
	background-size: cover;">
<br><br>
	<div id="btn">
		<a href="stockinsert.jsp"><button class="btnback" align="right">Add stock</button></a>
	</div>
	
	<h1 align="center"><font><strong>Stock Record</strong></font></h1>

	<div class=search>
		<form action="Search" name="frm" method="post">
		<table align="center">
			<tr>
			<td colspan=2 style="font-size:12pt;" align="center">
			<td><label for="fname">Search data by Item Name</label></td>
			<td><input type="text" name="name" ></td>
			<td><input  type="submit" name="submit" value="Search"></td></tr>
		</table>
	</form>
	</div>
	
	
	
	
	
	<table align="center" border="2" class="tbody">
	<tr></tr>

		<td><b>Item ID</b></td>
		<td><b>Item Name</b></td>
		<td><b>Concerned Animal</b></td>
		<td><b>Item Size</b></td>
		<td><b>Unit Price(Rs.)</b></td>
		<td><b>Quantity</b></td>
		<td><b>Total Amount</b></td>
		<td><b>Coordinator ID</b></td>
		<td><b>Update</b></td>
		<td><b>Delete</b></td>
	</tr>
	

<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM stocks";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("animal") %></td>
<td><%=resultSet.getString("size") %></td>
<td><%=resultSet.getString("uprice") %></td>
<td><%=resultSet.getString("quantity") %></td>
<td><%=resultSet.getString("amount") %></td>
<td><%=resultSet.getString("coordinator") %></td>

<td><a href="stockupdate.jsp?id=<%=resultSet.getString("id")%>" onclick="alert('Update Option Selected!')">Update</a></td>
<td><a href="stockdelete.jsp?id=<%=resultSet.getString("id")%>" onclick="alert('Delete Option Selected!')">Delete</a></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

<br><br>
</table>


<br><br>
<a href="report"><button class="btnget">Download records</button>	
<a href="reportsearch.jsp"><button class="btnget">Reports</button>											


</body>

</html>