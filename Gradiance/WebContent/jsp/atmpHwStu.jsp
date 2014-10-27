<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<link href="<%=request.getContextPath()+"/css/style.css"%>" rel="stylesheet" type="text/css" />
</head>

<body>
	<title>Attempt Homework</title>
	<div id="header"><h1>Attempt Homework</h1></div><br>
	<div align="center">
	<%
		List<List<String>> list = (List<List<String>>) request.getAttribute("++++++++"); 
			String str;
			
			if(list != null&&list.size()>0) {
				str+="<form action='++++++++++++' method='post'>";
				for(int i=1;i<list.get(0).size()/3+1;i++){
					str+="<p>"+i+"."+list.get(0).get(i*3)+"<br><strong>Hint:</strong>"+list.get(0).get(i*3+1)+
					"<br><input type='radio' name='choice_"+i+"' value='0'>"+list.get(i+2).get(0)+"</input><br>"+
					"<input type='radio' name='choice_"+i+"' value='1'>"+list.get(i+2).get(1)+"</input><br>"+
					"<input type='radio' name='choice_"+i+"' value='2'>"+list.get(i+2).get(2)+"</input><br>"+
					"<input type='radio' name='choice_"+i+"' value='3'>"+list.get(i+2).get(3)+"</input></p>";
				}
				str+="<input type='submit'/></form>";
				 out.println(str);
			}else{
				out.println("No result found!");
			}
		%>

	</div><br>
	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>