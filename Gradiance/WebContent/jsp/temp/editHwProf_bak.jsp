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
<script type="text/javascript">
	function HS_DateAdd(interval, number, date) {
		number = parseInt(number);
		if (typeof (date) == "string") {
			var date = new Date(date.split("-")[0], date.split("-")[1], date
					.split("-")[2])
		}
		if (typeof (date) == "object") {
			var date = date
		}
		switch (interval) {
		case "y":
			return new Date(date.getFullYear() + number, date.getMonth(), date
					.getDate());
			break;
		case "m":
			return new Date(date.getFullYear(), date.getMonth() + number,
					checkDate(date.getFullYear(), date.getMonth() + number,
							date.getDate()));
			break;
		case "d":
			return new Date(date.getFullYear(), date.getMonth(), date.getDate()
					+ number);
			break;
		case "w":
			return new Date(date.getFullYear(), date.getMonth(), 7 * number
					+ date.getDate());
			break;
		}
	}
	function checkDate(year, month, date) {
		var enddate = [ "31", "28", "31", "30", "31", "30", "31", "31", "30",
				"31", "30", "31" ];
		var returnDate = "";
		if (year % 4 == 0) {
			enddate[1] = "29"
		}
		if (date > enddate[month]) {
			returnDate = enddate[month]
		} else {
			returnDate = date
		}
		return returnDate;
	}

	function WeekDay(date) {
		var theDate;
		if (typeof (date) == "string") {
			theDate = new Date(date.split("-")[0], date.split("-")[1], date
					.split("-")[2]);
		}
		if (typeof (date) == "object") {
			theDate = date
		}
		return theDate.getDay();
	}
	function HS_calender() {
		var lis = "";
		var style = "";
		style += "<style type='text/css'>";
		style += ".calender { width:170px; height:auto; font-size:12px; margin-right:14px; background:url(calenderbg.gif) no-repeat right center #fff; border:1px solid #397EAE; padding:1px}";
		style += ".calender ul {list-style-type:none; margin:0; padding:0;}";
		style += ".calender .day { background-color:#EDF5FF; height:20px;}";
		style += ".calender .day li,.calender .date li{ float:left; width:14%; height:20px; line-height:20px; text-align:center}";
		style += ".calender li a { text-decoration:none; font-family:Tahoma; font-size:11px; color:#333}";
		style += ".calender li a:hover { color:#f30; text-decoration:underline}";
		style += ".calender li a.hasArticle {font-weight:bold; color:#f60 !important}";
		style += ".lastMonthDate, .nextMonthDate {color:#bbb;font-size:11px}";
		style += ".selectThisYear a, .selectThisMonth a{text-decoration:none; margin:0 2px; color:#000; font-weight:bold}";
		style += ".calender .LastMonth, .calender .NextMonth{ text-decoration:none; color:#000; font-size:18px; font-weight:bold; line-height:16px;}";
		style += ".calender .LastMonth { float:left;}";
		style += ".calender .NextMonth { float:right;}";
		style += ".calenderBody {clear:both}";
		style += ".calenderTitle {text-align:center;height:20px; line-height:20px; clear:both}";
		style += ".today { background-color:#ffffaa;border:1px solid #f60; padding:2px}";
		style += ".today a { color:#f30; }";
		style += ".calenderBottom {clear:both; border-top:1px solid #ddd; padding: 3px 0; text-align:left}";
		style += ".calenderBottom a {text-decoration:none; margin:2px !important; font-weight:bold; color:#000}";
		style += ".calenderBottom a.closeCalender{float:right}";
		style += ".closeCalenderBox {float:right; border:1px solid #000; background:#fff; font-size:9px; width:11px; height:11px; line-height:11px; text-align:center;overflow:hidden; font-weight:normal !important}";
		style += "</style>";

		var now;
		if (typeof (arguments[0]) == "string") {
			selectDate = arguments[0].split("-");
			var year = selectDate[0];
			var month = parseInt(selectDate[1]) - 1 + "";
			var date = selectDate[2];
			now = new Date(year, month, date);
		} else if (typeof (arguments[0]) == "object") {
			now = arguments[0];
		}
		var lastMonthEndDate = HS_DateAdd("d", "-1",
				now.getFullYear() + "-" + now.getMonth() + "-01").getDate();
		var lastMonthDate = WeekDay(now.getFullYear() + "-" + now.getMonth()
				+ "-01");
		var thisMonthLastDate = HS_DateAdd("d", "-1", now.getFullYear() + "-"
				+ (parseInt(now.getMonth()) + 1).toString() + "-01");
		var thisMonthEndDate = thisMonthLastDate.getDate();
		var thisMonthEndDay = thisMonthLastDate.getDay();
		var todayObj = new Date();
		today = todayObj.getFullYear() + "-" + todayObj.getMonth() + "-"
				+ todayObj.getDate();

		for (i = 0; i < lastMonthDate; i++) { // Last Month's Date
			lis = "<li class='lastMonthDate'>" + lastMonthEndDate + "</li>"
					+ lis;
			lastMonthEndDate--;
		}
		for (i = 1; i <= thisMonthEndDate; i++) { // Current Month's Date

			if (today == now.getFullYear() + "-" + now.getMonth() + "-" + i) {
				var todayString = now.getFullYear() + "-"
						+ (parseInt(now.getMonth()) + 1).toString() + "-" + i;
				lis += "<li><a href=javascript:void(0) class='today' onclick='_selectThisDay(this)' title='"
						+ now.getFullYear()
						+ "-"
						+ (parseInt(now.getMonth()) + 1)
						+ "-"
						+ i
						+ "'>"
						+ i
						+ "</a></li>";
			} else {
				lis += "<li><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"
						+ now.getFullYear()
						+ "-"
						+ (parseInt(now.getMonth()) + 1)
						+ "-"
						+ i
						+ "'>"
						+ i
						+ "</a></li>";
			}

		}
		var j = 1;
		for (i = thisMonthEndDay; i < 6; i++) { // Next Month's Date
			lis += "<li class='nextMonthDate'>" + j + "</li>";
			j++;
		}
		lis += style;

		var CalenderTitle = "<a href='javascript:void(0)' class='NextMonth' onclick=HS_calender(HS_DateAdd('m',1,'"
				+ now.getFullYear()
				+ "-"
				+ now.getMonth()
				+ "-"
				+ now.getDate() + "'),this) title='Next Month'>&raquo;</a>";
		CalenderTitle += "<a href='javascript:void(0)' class='LastMonth' onclick=HS_calender(HS_DateAdd('m',-1,'"
				+ now.getFullYear()
				+ "-"
				+ now.getMonth()
				+ "-"
				+ now.getDate() + "'),this) title='Previous Month'>&laquo;</a>";
		CalenderTitle += "<span class='selectThisYear'><a href='javascript:void(0)' onclick='CalenderselectYear(this)' title='Click here to select other year' >"
				+ now.getFullYear()
				+ "</a></span>年<span class='selectThisMonth'><a href='javascript:void(0)' onclick='CalenderselectMonth(this)' title='Click here to select other month'>"
				+ (parseInt(now.getMonth()) + 1).toString() + "</a></span>月";

		if (arguments.length > 1) {
			arguments[1].parentNode.parentNode.getElementsByTagName("ul")[1].innerHTML = lis;
			arguments[1].parentNode.innerHTML = CalenderTitle;

		} else {
			var CalenderBox = style
					+ "<div class='calender'><div class='calenderTitle'>"
					+ CalenderTitle
					+ "</div><div class='calenderBody'><ul class='day'><li>日</li><li>一</li><li>二</li><li>三</li><li>四</li><li>五</li><li>六</li></ul><ul class='date' id='thisMonthDate'>"
					+ lis
					+ "</ul></div><div class='calenderBottom'><a href='javascript:void(0)' class='closeCalender' onclick='closeCalender(this)'>×</a><span><span><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"
					+ todayString + "'>Today</a></span></span></div></div>";
			return CalenderBox;
		}
	}
	function _selectThisDay(d) {
		var boxObj = d.parentNode.parentNode.parentNode.parentNode.parentNode;
		boxObj.targetObj.value = d.title;
		boxObj.parentNode.removeChild(boxObj);
	}
	function closeCalender(d) {
		var boxObj = d.parentNode.parentNode.parentNode;
		boxObj.parentNode.removeChild(boxObj);
	}

	function CalenderselectYear(obj) {
		var opt = "";
		var thisYear = obj.innerHTML;
		for (i = 1970; i <= 2020; i++) {
			if (i == thisYear) {
				opt += "<option value="+i+" selected>" + i + "</option>";
			} else {
				opt += "<option value="+i+">" + i + "</option>";
			}
		}
		opt = "<select onblur='selectThisYear(this)' onchange='selectThisYear(this)' style='font-size:11px'>"
				+ opt + "</select>";
		obj.parentNode.innerHTML = opt;
	}

	function selectThisYear(obj) {
		HS_calender(obj.value
				+ "-"
				+ obj.parentNode.parentNode.getElementsByTagName("span")[1]
						.getElementsByTagName("a")[0].innerHTML + "-1",
				obj.parentNode);
	}

	function CalenderselectMonth(obj) {
		var opt = "";
		var thisMonth = obj.innerHTML;
		for (i = 1; i <= 12; i++) {
			if (i == thisMonth) {
				opt += "<option value="+i+" selected>" + i + "</option>";
			} else {
				opt += "<option value="+i+">" + i + "</option>";
			}
		}
		opt = "<select onblur='selectThisMonth(this)' onchange='selectThisMonth(this)' style='font-size:11px'>"
				+ opt + "</select>";
		obj.parentNode.innerHTML = opt;
	}
	function selectThisMonth(obj) {
		HS_calender(obj.parentNode.parentNode.getElementsByTagName("span")[0]
				.getElementsByTagName("a")[0].innerHTML
				+ "-" + obj.value + "-1", obj.parentNode);
	}
	function HS_setDate(inputObj) {
		var calenderObj = document.createElement("span");
		calenderObj.innerHTML = HS_calender(new Date());
		calenderObj.style.position = "fixed";
		calenderObj.targetObj = inputObj;
		inputObj.parentNode.insertBefore(calenderObj, inputObj.nextSibling);
	}
</script>
</head>

<body style="font-family: sans-serif; font-weight:lighter ">

	<!-- Here we use this java code to get params from server and display ^_^ -->
	<title><%=request.getAttribute("title") %></title> 

	<div id="header">
		<%--<button style="float: left" onclick="g();">Click Me!!!</button>--%>
		<font size="5">Welcome to CSC540</font>
		<font size="4"><br>Database Management Systems</font>
	</div>

	<form action="<%=request.getContextPath()+"/rest/login" %>" method="post">
		<div align=center>
			<table>
				<tbody valign="top">
					<tr>
						<td style="width: 220px;">
							<table>
								<tbody>
									<tr>
										<td>
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/indexProf.jsp" style="color: black;">Home Page</a>
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/addHwProf.jsp" style="color: black;">Add Homework</a> 
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/addRmQsProf.jsp" style="color: black;">Add/Remove Questions</a> 
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/editHwProf.jsp" style="color: black;">Edit Homework</a> 
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/viewHwProf.jsp" style="color: black;">View Homework</a> 
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/viewNotifProf.jsp" style="color: black;">View Notification</a> 
											<br> <br> •&nbsp; <a href="http://localhost:8080/Gradiance/jsp/rptProf.jsp" style="color: black;">Reports</a> 
											<br> <br> •&nbsp; <a href="" style="color: black;">Log Out</a>
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td><HR></td>
									</tr>
									<tr style="color: black; height: 20px;">
										<td valign="middle"><font size="1">Copyright © 2014&nbsp;YYYD Database Team.</font></td>
									</tr>
								</tbody>
							</table>
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
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Choose A Homework:</font>
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap">
											<select style="width: 156px">
												<option>&nbsp;</option>
												<option>Homework 1</option>
												<option>Homework 2</option>
												<option>Homework 3</option>
											</select>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="submit" value="Choose">
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr><td colspan="5"><br></td></tr>
									<tr>
										<td colspan="5" align="center"
											style="color: white; background-color: grey; height: 15px">
											Updating Homework Information:</td>
									</tr>
									<tr><td colspan="5">&nbsp;</td></tr>
									<tr valign="top" style="color: black;">
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Start Date:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap"><input type="text" style="width: 150px"
											value="2014-10-22" onfocus="HS_setDate(this)"></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;End Date:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap"><input type="text" style="width: 150px"
											value="2014-10-22" onfocus="HS_setDate(this)"></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Attempt Numbers:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap"><input type="text" style="width: 150px"
											name="attemptnum" placeholder="eg.5; and 0 for infinity" required></td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td valign="top" align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Topics:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap">
											<select multiple="multiple" style="width: 156px" size="2">
												<option value="intr">1. Introduction to database design</option>
												<option value="data">2. Storing data: Disks and Files</option>
												<option value="file">3. Primary File organizations</option>
												<option value="tree">4. Tree Structures</option>
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
											<font size="2">from&nbsp;
											<select style="width: 38px">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
											</select>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to&nbsp;
											<select style="width: 38px">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
											</select>
											</font>
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Score Selection:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap">
											<select style="width: 156px">
												<option>latest attempt</option>
												<option>maximum score</option>
												<option>average score</option>
											</select>
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Question Numbers:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap">
											<input type="text" style="width: 150px" name="questionnum" placeholder="eg.10" required>
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Correct Answer Points:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap">
											<input type="text" style="width: 150px" name="correctpts" placeholder="eg.4" required>
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap" >
											<font size="2">•&nbsp;Incorrect Answer Points:</font>	
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td align="left" style="white-space: nowrap">
											<input type="text" style="width: 150px" name="incorrectpts" placeholder="eg.2" required>
										</td>
										<td style="width: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<tr><td colspan="5" align="center"><input type="submit" value="Edit" style="height:50px; width:50px"></td></tr>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			<br><br>
			<input type="submit" onclick="f()" value="Submit">
		</div>
	</form>

</body>
</html>
