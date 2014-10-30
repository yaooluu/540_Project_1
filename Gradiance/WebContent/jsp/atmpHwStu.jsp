<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*,edu.ncsu.gradiance.dao.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Attempt Homework</title>
	<link href="<%=request.getContextPath()+"/css/style.css"%>" rel="stylesheet" type="text/css" />
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
	</style>
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
			for(var i=0;i<numOfQs;i++)
				str += document.getElementById("idList_"+i).value + "@";
			for(var i=0;i<numOfQs;i++)
				str += document.getElementById("ansIdList_"+i).value + "@";
			
			str+=numOfQs;
			document.getElementById("userAnsAndIdLists").value = str;
			document.getElementById("homeworkForm").submit();
		}
	</script>
</head>

<body style="font-family: sans-serif; font-weight:lighter ">
	
	<div id="header">
		<font size="5">Welcome to <%=session.getAttribute("cid") %></font>
		<font size="4"><br><%=session.getAttribute("courseTitle") %></font>
	</div>
	
		<div align=center>
			<table>
				<tbody valign="top">
					<tr>
						<td style="width: 220px;">
							<jsp:include page="../jsp/menuStu.jsp"/>
						</td>
						<td style="width: 2px; background-color: grey;"></td>
						<td style="width: 686px;">
							<table>
								<tbody>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="3"><font color="midnightblue" size="4"><br>
												Attempt:<br></font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									<tr><td colspan="5"><br></td></tr>
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Question List:</td>
									</tr>
									<tr><td colspan="5">&nbsp;</td></tr>
								
									<tr><td colspan="5" style="width: 686px;">
									<%
										List<List<String>> list = (List<List<String>>) request.getAttribute("homeworkContent"); 
										String str = "";
			
										if(list != null && list.size()>0 && list.get(0).size()>0) {
											str += "<form id='homeworkForm' action='"+request.getContextPath()+"/rest/student/submitHomework"+"' method='post'>";
											str += "<table><tbody>";
											for(int i=0;i<list.get(0).size();i++){
												str += "<tr><td style='width: 50px;'></td><td colspan='3' align='left' style='word-wrap: break-word; width:574px'><font size='2'>"
													+  (i+1)
													+  ".&nbsp;&nbsp;"
													+  list.get(0).get(i).split("@")[0]
													+  "<br>(Hint:&nbsp;"
													+  list.get(0).get(i).split("@")[1]
													+  ")<br>"
													+  "<input type='radio' name='choice_"+i+"' value='0'>&nbsp;&nbsp;"+list.get(i+1).get(0).split("@")[0]+"</input><br>"
													+  "<input type='radio' name='choice_"+i+"' value='1'>&nbsp;&nbsp;"+list.get(i+1).get(1).split("@")[0]+"</input><br>"
													+  "<input type='radio' name='choice_"+i+"' value='2'>&nbsp;&nbsp;"+list.get(i+1).get(2).split("@")[0]+"</input><br>"
													+  "<input type='radio' name='choice_"+i+"' value='3'>&nbsp;&nbsp;"+list.get(i+1).get(3).split("@")[0]+"</input><br>"
													+  "<input type='hidden' id='idList_"+i+"' value='"+list.get(list.size()-4).get(i)+ "'/>"
													+  "<input type='hidden' id='ansIdList_"+i+"' value='"+list.get(list.size()-3).get(i)+"'/>"
													+  "</font></td><td style='width: 50px;'></td></tr>"
					    							+  "<tr><td></td><td colspan='3'><HR></td><td></td></tr>";
											}
											str+="<input type='hidden' name='ansPosList' value='"+list.get(list.size()-2).get(0)+"'/>";
											str+="<input type='hidden' name='points' value='"+list.get(list.size()-1).get(0)+"'/>";
											str+="<input type='hidden' id='numOfQs' value='"+list.get(0).size()+"'/>";
											str+="<input type='hidden' name='userAnsAndIdLists' id='userAnsAndIdLists' value=''/>";
											str +=  "<tr><td style='width: 50px;'></td><td colspan='3' align='center' style='word-wrap: break-word; width:574px'>"
												+   "<input type='button' onclick='getStuAnsListAndSubmit();' value='Submit Homework'/>"
											    +   "</td><td style='width: 50px;'></td></tr>";
											str+="</tbody></table>";
											str+="</form>";
											//str+="<input type='submit' value='Submit Homework'/></form>";
												
										}else{				
											str +=  "<tr><td style='width: 50px;'></td><td colspan='3' align='center' style='word-wrap: break-word; width:574px'>"
												+   "<font size='2'>No Question for this homework found!<br></font>"
												+   "</td><td style='width: 50px;'></td></tr>";
										}
										out.println(str);
		              				%>
									</td></tr>
	
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	
</body>
</html>
