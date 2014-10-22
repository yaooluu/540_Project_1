<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>Select Homework</title>
	<div id="header"><h1>Attempt Homework</h1></div>
	<%
		List<String> l= (List<String>)request.getAttribute("homework");
		if(l!=null&&l.size()>0){
			String str="<form id='' action='' method='post'>";
			for(int i=0;i<l.size();i++){
				str+="<input type='radio' name='hwTitle'>"+l.indexOf(i)+"</input>";
			}
			str+="<button type='submit' value='do homework'/></form>";
			out.println(str);
		}else{
			out.println("no homework right now!");
		}
	
	%>


	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>
