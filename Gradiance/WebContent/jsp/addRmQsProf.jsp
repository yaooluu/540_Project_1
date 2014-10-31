<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Add/Remove Questions</title>
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
	//assemble selected question ids and into one string, for the convenience of passing back to server, and submit the form
	//the final string looks like "qid1,qid2,qid3"
	
	function getSelectedQidAndSubmit() {
		var str = "";
		var qids = document.getElementsByName("questionIds");
		
		for(var i=0;i<qids.length;i++) {
			var qid = qids[i];
			if(qids[i].checked) {
					str += qids[i].value + ",";
			}
		}
		
		document.getElementById("selectedQidList").value = str.substring(0,str.length-1);
		document.getElementById("editQsForm").submit();
	}
</script>

</head>

<body style="font-family: sans-serif; font-weight:lighter ">

	<!-- Here we use this java code to get params from server and display ^_^ -->
	<div id="header">
		<font size="5">Welcome to <%=session.getAttribute("cid") %></font>
		<font size="4"><br><%=session.getAttribute("courseTitle") %></font>
	</div>
	
		<div align=center>
			<table>
				<tbody valign="top">
					<tr>
						<td style="width: 220px;">
							<jsp:include page="../jsp/menuProf.jsp"/>
						</td>
						<td style="width: 2px; background-color: grey;"></td>
						<td style="width: 686px;">
							<table>
								<tbody>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="3" style="width: 586px"><font color="midnightblue" size="4"><br>Add/Remove
												Questions:<br></font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="5"><br></td></tr>
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Choose Homework:</td>
									</tr>
									<tr><td colspan="5">&nbsp;</td></tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Choose A Homework:</font>
										</td>
										<td colspan="3" align="left" style="white-space: nowrap">
											<form action="<%=request.getContextPath()+"/rest/prof/addRmQsProf"%>" method="post">
												<select name="aid" style="width: 300px">
												<option>&nbsp;</option>
												<%
													String html = "";
													String str = (String)request.getAttribute("homeworkList");
													if(str!=null && str.length()>0) {
														String[] s = str.split(",");
														for(int i=0;i<s.length;i+=2) {
															html += "<option value="+s[i]+">"+s[i+1]+"</option>";
														}
													}
													out.println(html);
												%>
												</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												<input type="submit" value="Choose">
											</form>
										</td>
									</tr>									
									<tr><td colspan="5"><br></td></tr>
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Basic Homework Information:</td>
									</tr>
									<tr><td colspan="5">&nbsp;</td></tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td valign="top" align="left" style="white-space: nowrap; width:268px" >
											<font size="2">•&nbsp;Topics:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap; width:268px">
											<select name="tidList" multiple="multiple" style="width: 156px; height: 100px" size="2">
												<%
												List<String> topics = (List<String>)request.getAttribute("homeworkBasic");
												if(topics!=null) {
													String tmp = "";
													for(int i=0;i<topics.get(1).split(",").length;i++) {
														tmp += "<option value='"+topics.get(1).split(",")[i]+"'>"
															+ (i+1)+". "+topics.get(2).split("@")[i]+"</option>";
													}
													out.println(tmp);
												}
												 %>
											</select>
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Difficulty:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap">
											<font size="2">From&nbsp;<select name="minDif" disabled
													style="width: 38px"> 
												<%
													List<String> str3 = (ArrayList<String>)request.getAttribute("homeworkBasic");
													if(str3!=null) {
														String minDif = str3.get(0).split("@")[3];
														for(int i=1;i<=5;i++) {
															if(minDif.compareTo(""+i)==0)
																out.print("<option value='"+i+"' selected>"+i+"</option>");
															else
																out.print("<option value='"+i+"'>"+i+"</option>");
														}
													}
												%>
												</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To&nbsp; <select disabled
													name="maxDif" style="width: 38px">
												<%
													List<String> str4 = (List<String>)request.getAttribute("homeworkBasic");
													if(str4!=null) {
														String minDif = str4.get(0).split("@")[4];
														for(int i=1;i<=5;i++) {
															if(minDif.compareTo(""+i)==0)
																out.print("<option value='"+i+"' selected>"+i+"</option>");
															else
																out.print("<option value='"+i+"'>"+i+"</option>");
														}
													}
												%>
												</select>
											</font>
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									<tr><td colspan="5"><br></td></tr>
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Question List:</td>
									</tr>
									<tr><td colspan="5">&nbsp;</td></tr>
									
									<tr>
									<td colspan="5">
									
									
									<form id="editQsForm" action="<%=request.getContextPath()+"/rest/prof/addRmQsProf"%>" method="post">
									<table>
									<tbody>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="3" align="center" style="width:574px">
											<font size="2">(Please tick the Questions you want to add and untick the Questions you want to remove.)
											</font>		
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td><br></td></tr>
									<%
										String list = (String) request.getAttribute("homeworkQuestion");
										String editQsResult = (String) request.getAttribute("editQsResult");
										String str2="";
										
										if(editQsResult==null && list!=null&&list.length()>0){
											String[] s=list.split("@");
											out.println("<input type='hidden' name='aid' value='"+s[s.length-1]+"'></input>");
											out.println("<input type='hidden' name='selectedQidList' id='selectedQidList' value=''></input>");
											
											for(int i=0;i<s.length-1;i+=3){
												
												str2 = "<tr><td valign='top' align='center' style='width: 50px;'><input type='checkbox' name='questionIds' value='"+s[i]+"'";
												if (s[i+1].compareTo("1")==0){
													str2+= "checked";}
												str2+= "></td><td colspan='3' align='left' style='word-wrap: break-word; width:574px'><font size='2'>[";
												str2+=  s[i];
												str2+=  "]&nbsp;&nbsp;";
												str2+=  s[i+2];
												str2+=  "</font></td><td style='width: 50px;'></td></tr>";
												str2+=  "<tr><td></td><td colspan='3'><HR></td><td></td></tr>";
												out.println(str2);
											}
										}else if(editQsResult!=null) {
											str2 = "<tr style='width:400px'><td colspan='5' align='center'><font color='red'>("
													+ editQsResult
													+ ")</font></td></tr>";
											out.println(str2);
										}
										else{
											str2 = "<tr><td valign='top' align='center' style='width: 50px;'></td>"
												+  "<td colspan='3' align='center' style='word-wrap: break-word; width:574px'>"
												+  "<font size='2'>Sorry, there is no Question to Add or Remove."
												+  "</font></td><td style='width: 50px;'></td></tr>";
												
											out.println(str2);
											
										}
									%>		
									
									<tr><td><br></td></tr>
									<tr>
										<td colspan="5" align="center">
											<%
											String list2 = (String) request.getAttribute("homeworkQuestion");
											String editQsResult2 = (String) request.getAttribute("editQsResult");
											
											if(editQsResult2==null && list2!=null&&list2.length()>0)
												out.println("<input type='button' value='Confirm' onclick=\"getSelectedQidAndSubmit();\">");
											%>
										</td>
									</tr>
									</tbody>
									</table>
									</form>
									</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

</body>
</html>
