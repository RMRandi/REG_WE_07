<%@ page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="stockcss/styles.css">
	<link rel="stylesheet" type="text/css" href="stockcss/header.css">
	<link rel="stylesheet" type="text/css" href="stockcss/footer.css">
<title>Happy tail</title>
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
 <hr>
    </head>
    <body>
    
    	<h1>Stock search result</h1>
    	<a href="stockview.jsp"><button class="btnback" align="right">Back</button></a>
        <table border="2">
           
            <tr>
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
                int count = 0;
                String color = "#F9EBB3";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al.toString());
                    
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((count % 2) == 0) {
                            color = "#eeffee";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
                        
            %>
            <tr style="background-color:<%=color%>;">
                <td><%=pList.get(0)%></td>
                <td><%=pList.get(1)%></td>
                <td><%=pList.get(2)%></td>
                <td><%=pList.get(3)%></td>
                <td><%=pList.get(4)%></td>
                <td><%=pList.get(5)%></td>
                <td><%=pList.get(6)%></td>
                <td><%=pList.get(7)%></td>
                <td><%=pList.get(8)%></td>
                <td><%=pList.get(9)%></td>
               
              
                
            </tr>
            <%
                    }
                }
                
            %>
            <%
            if (count == 0) {
            %>
            <tr>
                <td colspan=8 align="center"
                    style="background-color:#eeffee"><b>No Record Found..</b></td>
            </tr>
            <%            
            	}
            %>
        </table>
    </body>
</html>