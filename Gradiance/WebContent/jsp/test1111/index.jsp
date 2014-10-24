<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#header {
    background-color:black;
    color:white;
    text-align:center;
    padding:5px;
}
#footer {
    background-color:black;
    color:white;
    clear:both;
    text-align:center;
   padding:5px;	 	 
}
</style>

<script>
	function f() {
		alert("To Yiyang and DD: we can do more here after clicking button, like redirecting maybe, and like this alert windows~");
	}
	
	function g() {
		alert("Using javascript, we can dynamically change the content of html, like the title, like whatever you want.");
		document.getElementById("myHead").innerHTML = "I changed the title!";	
	}
</script>
</head>

<body>

<!-- Here we use this java code to get params from server and display ^_^ -->
<title><%=request.getAttribute("title") %></title>

<div id="header"><button style="float:left" onclick="g();">Click Me!!!</button>
	<h1 id="myHead"><%=request.getAttribute("it") %></h1>
	
</div>

<form action="<%=request.getContextPath()+"/rest/login" %>" method="post">
        <div>
          <label for="user">UserID:<br></label>
          <input type="text" name="uid" placeholder="Enter userID" required>
        </div>
        <div class="form-group">
          <label for="pwd">Password:<br></label>
          <input type="password" name="upass" placeholder="Enter password" required>
        </div>
        <button type="submit" onclick="f()">Login</button>
	<input type="button" value="Exit" onclick="self.close()">
      </form>
	
 <a href="createUser.html">create user</a>

<div id="footer">
Copyright @YY,YY,YY,DD
</div>

</body>
</html>
