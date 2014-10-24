<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Logged in as TA</title>
<style>
#header {
	background-color: black;
	color: white;
	text-align: center;
	padding-top: 20px;
    padding-right: 50px;
    padding-bottom: 20px;
    padding-left: 50px;
}

#footer {
	background-color: black;
	color: white;
	clear: both;
	text-align: center;
	padding: 5px;
}
</style>

<script>
	function f() {
		alert("To Yiyang and DD: we can do more here after clicking button, like redirecting maybe, and like this alert windows~");
	}
	
	function g() {
		//alert("Using javascript, we can dynamically change the content of html, like the title, like whatever you want.");
		document.getElementById("myHead").innerHTML = "Course Options for Professor";	
	}
</script>
</head>

<body style="font-family: sans-serif; font-weight:lighter ">

	<!-- Here we use this java code to get params from server and display ^_^ -->
	<title><%=request.getAttribute("title") %></title> 

	<div id="header">
		<%--<button style="float: left" onclick="g();">Click Me!!!</button>--%>
		<font size="5">Logged in as TA</font>
	</div>

	<form action="<%=request.getContextPath()+"/rest/login" %>" method="post">
		<div align=center>
			<font color="midnightblue" size="5"><br>Select Course<br></font> 
			<a href="http://localhost:8080/Gradiance/jsp/optTA.jsp"><font color="blue" size="3"><br>CSC540</font></a>
			&nbsp;
			<font color="black" size="3"> Database Management Systems</font>
		</div>
	</form>

</body>
</html>
