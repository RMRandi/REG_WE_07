<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 

<head>

	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/pti.css">
	
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
<link rel="stylesheet" type="text/css" href="css/stockinsert.css">
	<style>
	* {box-sizing: border-box}

/* Add padding to containers */
.container {
  padding: 16px;
  position: center;
  
	margin: auto;
}
form {
	
	display: inline-block; 
    margin-left: 0%;
    margin-right:30%;
    width: 100%;
}

table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
}


/* Full-width input fields */
input[type=text], input[type=DATE] {
  width: 50%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: flex;
  border: none;
  background: #f1f1f1;
  float: center;
  
   text-align: center;
}


/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;

}

/* Set a style for the submit/register button */
.submitbtn {
  background-color: red;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 50%;
  opacity: 0.9;

}

.submitbtn:hover {
  opacity:1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}


.w3-button {width:150px;}



	</style>
<meta charset="ISO-8859-1">
<title>Stock Information</title>
</head>
<body style="
	background-image:url(file:///C:/Users/Fujitsu/eclipse-workspace/Happy/src/main/webapp/images/toy3.jpg);
	background-repeat:no-repeat;
	background-postion:center;
	background-size:cover;
	margin:auto;
	max-width: 900px;
	padding: 0px;"
}>
	<br><br>
	<div id="btn">
		<a href="stockview.jsp"><button class="w3-button w3-red" align="right">View records</button></a>
		
		
	</div>
<form action="insert" method="post">
		
	
  <div class="form" >
    <h1>Add Stock</h1>
    <p>Please fill in this form to add a stock.</p>
   

    <label for="name"><b> Item Name</b></label>
    <input type="text" placeholder="Dog Belt" name="name" id="name" required="required" >

	<label for="animal" class="form-label">Concerned Animal</label> 
	<select name="animal" id="animals" class="form-control text-uppercase">
		<option value="dog">Dog</option>
		<option value="cat">Cat</option>
		<option value="birds">Birds</option>
		<option value="mouse">Mouse</option>
		<option value="bunny">Bunny</option>
	</select>
	
	<label for="size" class="form-label">Size</label><br> 
		<input type="radio" id="small" name="size" value="SMALL">
		<label for="small">SMALL</label>
		<input type="radio" id="medium" name="size" value="MEDIUM">
		<label for="medium">MEDIUM</label>
		<input type="radio" id="large" name="size" value="LARGE">
		<label for="large">LARGE</label><br>
										
    <label for="address"><b>Unit Price(Rs.)</b></label>
    <input type="text" placeholder="00.00" name="uprice" id="uprice" required="required" >
    
    <label for="phone"><b>Quantity</b></label>
    <input type="text" placeholder="00" name="quantity" id="qty" required="required">

    <label for="date"><b>Total Amount(Rs.)</b></label>
    <input type="text" placeholder="00.00" name="amount" id="amt" required="required" > 
    
    <label for="age"><b>Coordinator ID</b></label>
    <input type="text" placeholder="mr.smith" name="coordinator" id="coordinator" required="required">

    <button type="submit" class="submitbtn" >Submit</button>
  </div>


</form>
	
	


</body>
</html>