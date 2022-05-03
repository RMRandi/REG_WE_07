<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="java.util.Date" %>




<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Annual Victory Logs Report</title>
	<link rel="stylesheet" type="text/css" href="victoryCss/styles.css">
	<link rel="stylesheet" type="text/css" href="victoryCss/header.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>

 
 <header>	
 
		<hr>
 </header>	
<ul class="one" position=fixed;>

<li><lable style="font-size:30px;">HAPPY TAILS</lable></li>
<li><a href="Home.html">HOME</a></li>
<li><a href="view.jsp">MEMBERS</a></li>
<li><a href="viewPet.jsp">PETS</a></li>
<li><a href="VictoryViewAll.jsp">VICTORY LOGS</a></li>
<li><a href="stockview.jsp">STOCKS</a></li>
<li><a href="About.html">ABOUT US</a></li>

</ul>
</head>
<body>

	<!-- <br><br>-->
<center>



<div id="list">
<!--  <img src ="koboImages/reportb.jpeg" width =620px height="200px" > -->
<hr>



<table border ="1"><br>
	
	<h1>Annual Victory Logs Report</h1>
	<cenetr><p style="width: 50%;margin:0% 5%">Today & Time:<%=new Date().toString()%> </p></cenetr>  
		<tr style="background-color:#e60000;color:white" >
		    
			<th><b>Coordinator Name</b></th>
			<th><b>Program Type</b></th>
			<th><b>City Name</b></th>
			<th><b>Location</b></th>
			<th><b>Conducted Date</b></th>
			<th><b>Budget (Rs.)</b></th>
			<th><b>VLID</b></th>
			 
			
		</tr>

<%

	try {
		String year=request.getParameter("Year");
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/happytailsdb","root","");
		String sql = "select *   from victory where date LIKE '"+year+"%'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(sql);
		Connection connection = null;
		while(rs.next()){

	%>
		<tr>
			
			<td><%=rs.getString("cname")%></td>
			<td><%=rs.getString("program")%></td>
			<td><%=rs.getString("city")%></td>
			<td><%=rs.getString("location")%></td>
			<td><%=rs.getString("date")%></td>
			<td><%=rs.getString("budget")%></td>
			<td><%=rs.getString("vlid")%></td>
			 
			
			
		</tr> 

	<%
		}

			String sql1 = "select SUM(budget) AS new_budget  from victory where date LIKE '"+year+"%'";
			rs = st.executeQuery(sql1);
			Float New_cost;	
					
				if(rs.next()){
					New_cost=rs.getFloat("new_budget");
 				}
%>
				<tr style="background-color:#ffcccc;color:black" >
				    <td><b>  Annual Budget (Rs.)</b> </td>
					<td><b><center>  <%=rs.getString("new_budget")%>/-</center></b></td>
				</tr>
				
<% 				
				
			String sql2 = "select COUNT(vlid) AS new_count  from victory where date LIKE '"+year+"%'";
			rs = st.executeQuery(sql2);
			Float new_count;	
					
				if(rs.next()){
					New_cost=rs.getFloat("new_count");
 				}
%>
				<tr style="background-color:#ffcccc;color:black" >
				    <td><b>  No. of Annual Logs</b> </td>
					<td><b><center>   <%=rs.getString("new_count")%></center></b></td>
				</tr>
				
				

	<%
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
	%>

</table><br><br>
<center>...................................<br>Signature</center>

</center>


  </div> 
 
<br>		

<center><button style= "background-color:red; COLOR:WHITE;" onclick="print()" >Download  Report</button></center>
<br><br><br>


<br><br>
<a href="VictoryViewAll.jsp"><button style= "background-color:red; COLOR:WHITE;">Back</button></a>
		<p>Copyright©2022 Happy Tails</p>

<hr>	
	
	<script >
	
	function print(){
	var element = document.getElementById("list");
	var opt = {
	  margin:       1,
	  filename:     'Annual Victory Logs Report.pdf',
	  image:        { type: 'jpeg', quality: 0.98 },
	  html2canvas:  { scale: 2 },
	  jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
	};
	 
	// New Promise-based usage:
	html2pdf().from(element).set(opt).save();
	
	}

	</script>

</body>

</html>
