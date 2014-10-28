<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<link href="<%=request.getContextPath()+"/css/style.css"%>" rel="stylesheet" type="text/css" />
	<script>
		//assemble student answers and idList into one string, for the convenience of passing back to server, and submit the form
		//the final string looks like "ans1,ans2,ans3,@idList1@idList2@numOfQs"
		
		function getStuAnsListAndSubmit() {
			var str = "";
			var numOfQs = document.getElementById("numOfQs").value;
			
			for(var i=0;i<numOfQs;i++) {
				var choices = document.getElementsByName("choice_"+i);
				for(var j=0;j<4;j++) {
					if(choices[j].checked) {
						str += choices[j].value + ",";
					} 
				}
			}
			str+='@';
			for(var i=0;i<numOfQs;i++) {
				str += document.getElementById("idList_"+i).value + "@";
			}
			str+=numOfQs;
			document.getElementById("userAnsAndIdLists").value = str;
			document.getElementById("homeworkForm").submit();
		}
	</script>

</head>

<body>
	<title>Attempt Homework</title>
	<div id="header"><h1>Attempt Homework</h1></div><br>
	<div align="left">
	<%
		List<List<String>> list = (List<List<String>>) request.getAttribute("homeworkContent"); 
			String str = "";
			
			if(list != null && list.size()>0 && list.get(0).size()>0) {
				str+="<form id='homeworkForm' action='"+request.getContextPath()+"/rest/student/submitHomework"+"' method='post'>";
				for(int i=0;i<list.get(0).size();i++){
					str+="<p>"+i+".&nbsp;"+list.get(0).get(i).split("@")[0]+"<br><strong>Hint:</strong>"+list.get(0).get(i).split("@")[1]+
					"<br><input type='radio' name='choice_"+i+"' value='0'>&nbsp;"+list.get(i+1).get(0).split("@")[0]+"</input><br>"+
					"<input type='radio' name='choice_"+i+"' value='1'>&nbsp;"+list.get(i+1).get(1).split("@")[0]+"</input><br>"+
					"<input type='radio' name='choice_"+i+"' value='2'>&nbsp;"+list.get(i+1).get(2).split("@")[0]+"</input><br>"+
					"<input type='radio' name='choice_"+i+"' value='3'>&nbsp;"+list.get(i+1).get(3).split("@")[0]+"</input></p>"+
					"<input type='hidden' id='idList_"+i+"' value='"+list.get(list.size()-3).get(i)+"'/>";
				}
				str+="<input type='hidden' name='ansPosList' value='"+list.get(list.size()-2).get(0)+"'/>";
				str+="<input type='hidden' name='points' value='"+list.get(list.size()-1).get(0)+"'/>";
				str+="<input type='hidden' id='numOfQs' value='"+list.get(0).size()+"'/>";
				str+="<input type='hidden' name='userAnsAndIdLists' id='userAnsAndIdLists' value=''/>";
				str+="<input type='button' onclick='getStuAnsListAndSubmit();' value='Submit Homework'/></form>";
				//str+="<input type='submit' value='Submit Homework'/></form>";
				out.println(str);
			}else{
				out.println("No Question for this homework found!");
			}
		%>

	</div><br>
	<div id="footer">Copyright @YY,YY,YY,DD</div>
</body>
</html>