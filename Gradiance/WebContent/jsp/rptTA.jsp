<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Reports for TA</title>
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
							<jsp:include page="../jsp/menuTA.jsp"/>
						</td>
						<td style="width: 2px; background-color: grey;"></td>
						<td style="width: 686px;">
							<table>
								<tbody>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td colspan="4"><font color="midnightblue" size="4"><br>
												Reports:<br></font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="6"><br></td></tr>
									<tr>
										<td colspan="6" align="center"
											style="color: white; background-color: grey; height: 15px">
											Retrieval/Reports Query:</td>
									</tr>
									<tr><td colspan="6">&nbsp;</td></tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Choose A Query:</font>
										</td>
										<td colspan="3" align="left" style="white-space: nowrap">
											<form action="<%=request.getContextPath()+"/rest/Report/runSQL"%>" method="post">
												<select name="rptId" style="width: 400px">
												<option>&nbsp;</option>
												<option value="1">Find students who did not take Homework 1.</option>
												<option value="2">Find students who scored the maximum score on the first attempt for Homework 1.</option>
												<option value="3">Find students who scored the maximum score on the first attempt for any homework.</option>
												<option value="4">For each student, show total score for each homework and average score overall homework.</option>
												<option value="5">For each homework and question, show the maximum and minimum score.</option>
												<option value="6">For each homework and question, show average number of attempts.</option>
												</select>
												&nbsp;&nbsp;&nbsp;
												<input type="submit" value="Choose">
											</form>
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									
									<tr>
										<td></td>
										<td align="center" style="white-space: nowrap" >
											<font size="2">OR</font>
										</td>
										<td colspan="3"></td>
										<td></td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" valign="top" style="white-space: nowrap" >
											<font size="2">•&nbsp;Input SQL Query:</font>
										</td>
										<td colspan="3" align="left" valign="top" style="white-space: nowrap">
											<form action="<%=request.getContextPath()+"/rest/Report/runSQL"%>" method="post">
												<textarea style="width: 400px" rows="5" cols="58" name="sql" 
												placeholder="Please input your query here"><%
												if(request.getAttribute("sql")!=null ) out.print(request.getAttribute("sql")); %></textarea>
												&nbsp;&nbsp;&nbsp;
												<input type="submit" value="Submit">
											</form>										
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="6">&nbsp;</td></tr>
									<tr>
										<td colspan="6" align="center"
											style="color: white; background-color: grey; height: 15px">
											Query Result:</td>
									</tr>
									<tr><td colspan="6">&nbsp;<%//=request.getAttribute("sqlResult") %></td></tr>
									<%
										String sqlResult = 	(String)request.getAttribute("sqlResult");
										if(sqlResult!=null && sqlResult.length()>0) {
											String[] str = sqlResult.split("#");
											int len = str[0].split("@").length;
											
											//print result table header
											out.println("<tr><td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td>");
											for(int i=0;i<len;i++) {
												out.print("<td ");
												if(len==1)
													out.print("colspan='4' style='max-width:700px'");
												out.print(" align='center' style='background-color: lightgray; white-space: nowrap; width: 142px;'>");
												out.println(""+str[0].split("@")[i]+"</td>");
												//out.println(str.length+"</td>");
											}
											out.println("<td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>");
											
											//print result table content
											int len2 = str.length; 
											for(int i=1;i<len2;i++) {
												String[] str2 = str[i].split("@");	
												out.println("<tr><td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td>");
												
												for(int j=0;j<len;j++) {
													out.println("<td ");
													if(len==1)
														out.print("colspan='4' style='max-width:700px'");
													out.println(" align='center' style='background-color: lightgray;word-break: break-all; width: 142px;'>");
													out.println("<font size='2'>"+str2[j]+"</font></td>");
												}
												out.println("<td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>");
											}
											out.println("<td style='width: 50px;'>&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>");
										}
									%>
									
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
</body>
</html>
