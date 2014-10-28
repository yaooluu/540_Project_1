<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Homework</title>
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

<script type="text/javascript" src="<%=request.getContextPath()+"/js/Canledar.js"%>"></script>


</head>

<body style="font-family: sans-serif; font-weight:lighter ">
	<title><%=request.getAttribute("title") %></title> 

	<div id="header">
		<font size="5">Welcome to <%=session.getAttribute("cid") %></font>
		<font size="4"><br><%=session.getAttribute("cname") %></font>
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
										<td colspan="3" style="width: 586px"><font color="midnightblue" size="4"><br>Edit
												Homework:<br></font></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="5"><br></td></tr>
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Existing Homework:</td>
									</tr>
									<tr><td colspan="5">&nbsp;</td></tr>

									<tr>
									<td colspan="5">
										<table>
											<tbody>
												<tr>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="left" style="white-space: nowrap"><font
														size="2">•&nbsp;Choose A Homework:</font></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="left" style="white-space: nowrap">
														<form action="<%=request.getContextPath()+"/rest/prof/getHomeworkBasic"%>" method="post">
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
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
												</tr>
											</tbody>
										</table>
									</td>
									</tr>

								<tr><td colspan="5"><br></td></tr>
															
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Updating Homework Information:</td>
									</tr>
									<tr><td colspan="5"><br></td></tr>
									
									<tr>
										<td colspan="5">
										<form action="<%=request.getContextPath()+"/rest/prof/editHomework"%>" method="post">
											<table>
											<tbody>
												<tr valign="top" style="color: black;">
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="left" style="white-space: nowrap; width: 260px">
														<font size="2">•&nbsp;Title:</font>
													</td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td style="width: 260px;"><input name="title" value="<%
														String str0 = (String)request.getAttribute("homeworkBasic");
														if(str0!=null) out.print(str0.split(",")[0]);%>"
														type="text" style="width: 150px" placeholder="eg.HW1"
														required></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
												</tr>

												<tr valign="top" style="color: black;">
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="left" style="white-space: nowrap"><font
														size="2">•&nbsp;Start Date:</font></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><input name="tstart" type="text" disabled value="<%
														String str1 = (String)request.getAttribute("homeworkBasic");
														if(str1!=null) out.print(str1.split(",")[1]);
													%>"
														style="width: 150px" placeholder="2014-10-31"
														onfocus="HS_setDate(this)"></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
												</tr>

												<tr valign="top" style="color: black;">
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="left" style="white-space: nowrap"><font
														size="2">•&nbsp;End Date:</font></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><input name="tend" type="text" value="<%
														String str2 = (String)request.getAttribute("homeworkBasic");
														if(str2!=null) out.print(str2.split(",")[2]);
													%>"
														style="width: 150px" placeholder="2014-10-31"
														onfocus="HS_setDate(this)"></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
												</tr>

												<tr valign="top" style="color: black;">
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="left" style="white-space: nowrap"><font
														size="2">•&nbsp;Attempt Numbers:</font></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><input name="retry" type="text" disabled value="<%
														String str5 = (String)request.getAttribute("homeworkBasic");
														if(str5!=null) out.print(str5.split(",")[5]);
													%>"
														style="width: 150px" name="retry"
														placeholder="eg.5; and 0 for infinity" required></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
												</tr>
												<tr valign="top" style="color: black;">
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="left" style="white-space: nowrap"><font
														size="2">•&nbsp;Topics:</font></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><select name="tidList" multiple="multiple" disabled
														style="width: 156px; height: 100px" size="2">
															<option value="1">1. Introduction to database
																design</option>
															<option value="2">2. Storing data: Disks and
																Files</option>
															<option value="3">3. Primary File organizations</option>
															<option value="4">4. Tree Structures</option>
															<option value="999">5. Other</option>
													</select></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
												</tr>

												<tr valign="top" style="color: black;">
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="left" style="white-space: nowrap"><font
														size="2">•&nbsp;Difficulty:</font></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="left" style="white-space: nowrap"><font
														size="2">from&nbsp; <select name="minDif" disabled
															style="width: 38px"> 
														<%
															String str3 = (String)request.getAttribute("homeworkBasic");
															if(str3!=null) {
																String minDif = str3.split(",")[3];
																for(int i=1;i<=5;i++) {
																	if(minDif.compareTo(""+i)==0)
																		out.print("<option value='"+i+"' selected>"+i+"</option>");
																	else
																		out.print("<option value='"+i+"'>"+i+"</option>");
																}
															}
														%>
														</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to&nbsp; <select disabled
															name="maxDif" style="width: 38px">
														<%
															String str4 = (String)request.getAttribute("homeworkBasic");
															if(str4!=null) {
																String minDif = str4.split(",")[4];
																for(int i=1;i<=5;i++) {
																	if(minDif.compareTo(""+i)==0)
																		out.print("<option value='"+i+"' selected>"+i+"</option>");
																	else
																		out.print("<option value='"+i+"'>"+i+"</option>");
																}
															}
														%>
														</select>
													</font></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
												</tr>

												<tr valign="top" style="color: black;">
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="left" style="white-space: nowrap"><font
														size="2">•&nbsp;Score Selection:</font></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><select name="scoreSelect" style="width: 156px">
														<%
															String str8 = (String)request.getAttribute("homeworkBasic");
															if(str8!=null) {
																String scoreSelect = str8.split(",")[8];
																if(scoreSelect.compareTo("latest attempt")==0)
																	out.print("<option value='latest attempt' selected>latest attempt</option>");
																else
																	out.print("<option value='latest attempt'>latest attempt</option>");
																if(scoreSelect.compareTo("average score")==0)
																	out.print("<option value='average score' selected>average score</option>");
																else
																	out.print("<option value='average score'>average score</option>");
																if(scoreSelect.compareTo("maximum score")==0)
																	out.print("<option value='maximum score' selected>maximum score</option>");
																else
																	out.print("<option value='maximum score'>maximum score</option>");
															}
														%>
													</select></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
												</tr>

												<tr valign="top" style="color: black;">
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="left" style="white-space: nowrap"><font
														size="2">•&nbsp;Question Numbers:</font></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><input type="text" style="width: 150px" disabled
														name="questionnum" placeholder="eg.10" required></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
												</tr>

												<tr valign="top" style="color: black;">
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="left" style="white-space: nowrap"><font
														size="2">•&nbsp;Correct Answer Points:</font></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><input type="text" style="width: 150px"  value="<%
														String str6 = (String)request.getAttribute("homeworkBasic");
														if(str6!=null) out.print(str6.split(",")[6]);
													%>"
														name="corrPts" placeholder="eg.4" required></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
												</tr>

												<tr valign="top" style="color: black;">
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td align="left" style="white-space: nowrap"><font
														size="2">•&nbsp;Incorrect Answer Points:</font></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><input type="text" style="width: 150px"  value="<%
														String str7 = (String)request.getAttribute("homeworkBasic");
														if(str7!=null) out.print(str7.split(",")[7]);
													%>"
														name="penalPts" placeholder="eg.2" required></td>
													<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
												</tr>
												<%
													if (request.getAttribute("editHomeworkResult") != null)
														out.print("<tr style='width:400px'><td colspan='5' align='center'><font color='red'>("
																+ request.getAttribute("editHomeworkResult")
																+ ")</font></td></tr>");
												%>
												<tr>
													<td colspan="5" align="center"><input type="hidden" name="aid" value="<%
														String str9 = (String)request.getAttribute("homeworkBasic");
														if(str9!=null) out.print(str9.split(",")[9]);
													%>""></td>
												</tr>
												<tr>
													<td colspan="5" align="center"><input type="submit"
														value="Update Homework"></td>
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
