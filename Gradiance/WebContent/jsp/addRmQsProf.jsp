<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add/Remove Questions</title>
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
</head>

<body style="font-family: sans-serif; font-weight:lighter ">

	<!-- Here we use this java code to get params from server and display ^_^ -->
	<title><%=request.getAttribute("title") %></title> 
	<div id="header">
		<%--<button style="float: left" onclick="g();">Click Me!!!</button>--%>
		<font size="5">Welcome to CSC540</font>
		<font size="4"><br>Database Management Systems</font>
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
											<form action="<%=request.getContextPath()+"/rest/prof/getHomeworkQuestion"%>" method="post">
												<select name="aid" style="width: 300px">
												<option>&nbsp;</option>
												<%
													String html = "";
													String str = (String)request.getAttribute("homeworkList");
													if(str!=null) {
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
											<textarea rows="2" readonly style="width:150px">1. Introduction to database design 
												2. Storing data: Disks and Files 
												3. Primary File organizations 
												4. Tree Structures </textarea>
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
											<font size="2">from&nbsp;
											<input type="text" style="width: 30px" name="attemptnum" placeholder="1">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to&nbsp;
											<input type="text" style="width: 30px" name="attemptnum" placeholder="5">
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
									
									
									<form action="<%=request.getContextPath()+"/rest/prof/addRmQuestion"%>" method="post">
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
									<tr><td><br><td></tr>
									<%
										String list = (String) request.getAttribute("homeworkQuestion");
										String str2="";
										
										if(list!=null&&list.length()>0){
											String[] s=list.split("@");
											for(int i=0;i<s.length;i+=3){
												
												str2 = "<tr><td valign='top' align='center' style='width: 50px;'><input type='checkbox' name='questions' value='"+s[i]+"'";
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
										}else{
											str2 = "<tr><td valign='top' align='center' style='width: 50px;'></td>"
												+  "<td colspan='3' align='center' style='word-wrap: break-word; width:574px'>"
												+  "<font size='2'>Sorry, there is no Question to Add or Remove."
												+  "</font></td><td style='width: 50px;'></td></tr>";
												
											out.println(str2);
											
										}
									%>		
									
									<tr><td><br><td></tr>
									<tr>
										<td colspan="5" align="center">
											<input type="submit" value="Confirm">
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
