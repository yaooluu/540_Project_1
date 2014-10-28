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
	<div align="left">
	<%
		List<List<String>> list = (List<List<String>>) request.getAttribute("homeworkContent"); 
			String str = "";
			
			if(list != null && list.size()>0 && list.get(0).size()>0) {
				str+="<form action='"+request.getContextPath()+"/rest/student/submitHomework"+"' method='post'>";
				for(int i=0;i<list.get(0).size();i++){
					str+="<p>"+i+".&nbsp;"+list.get(0).get(i).split("@")[0]+"<br><strong>Hint:</strong>"+list.get(0).get(i).split("@")[1]+
					"<br><input type='radio' name='choice_"+i+"' value='0'>&nbsp;"+list.get(i+1).get(0).split("@")[0]+"</input><br>"+
					"<input type='radio' name='choice_"+i+"' value='1'>&nbsp;"+list.get(i+1).get(1).split("@")[0]+"</input><br>"+
					"<input type='radio' name='choice_"+i+"' value='2'>&nbsp;"+list.get(i+1).get(2).split("@")[0]+"</input><br>"+
					"<input type='radio' name='choice_"+i+"' value='3'>&nbsp;"+list.get(i+1).get(3).split("@")[0]+"</input></p>";
				}
				str+="<input type='submit' value='Submit Homework'/></form>";
				 out.println(str);
			}else{
				out.println("No Question for this homework found!");
			}
		%>

	</div><br>
	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>