<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8"%>
<%@ page import="com.cotrip.daoimp.MeetingImp"%>
<%@ page import="com.cotrip.bean.Meeting"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String idStr = request.getParameter("id");
	Object user = session.getAttribute("curuser");
	String bool = "false";
	if (user == null) {
		bool = "false";
	} else {
		bool = "true";
	}

	int id = -1;

	if (idStr != null) {
		try {
			id = Integer.parseInt(idStr);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			id = -1;
		}
	}

	Meeting meet = null;

	if (id < 0) {
		meet = null;
	} else {
		MeetingImp mi = new MeetingImp();
		ArrayList<Meeting> list = mi.queryMettingsById(id);
		if (list.isEmpty()) {
			meet = null;
		} else {
			meet = list.get(0);
		}
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<base href="<%=basePath%>">
<title>会议详情</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<LINK rel=StyleSheet type=text/css href="css/cool.css">
<link rel=stylesheet type="text/css" href="css/main.css">
<style type="text/css"></style>
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="js/easy.js"></script>
<script type="text/javascript">
function validate() {
	var bool = Boolean(<%=bool%>);
	if(bool) {
		return true;
	} else {
		window.location="<%=basePath%>userLogin.jsp";
		return false;
	}
		
}
</script>

</head>

<body>
	<div id="div_m">
		<%@ include file="menu.html"%>
		<div id="div_main">
			<div id="div_side">
				<%@ include file="side.inc"%>
			</div>
			<div id="div_center">
				<table width="100%" border="1px" cellpadding="5px" cellspacing="0px"
					bordercolor="#B1B1E6">
					<caption>
						<center>
							<div id="div_title">
								<h3>会议详情</h3>
							</div>
						</center>
					</caption>
					<%
						if (meet == null) {
					%>
					<tr>
						<td style="color:red"><center>没有该会议！</center></td>
					</tr>
					<%
						} else {
					%>
					<tr>
						<td width="15%" style="text-align: right;">会议名称：</td>
						<td><%=meet.getMeetingname()%></td>
					</tr>
					<tr>
						<td style="text-align: right;">会议简称：</td>
						<td><%=meet.getMeetinganame()%></td>
					</tr>
					<tr>
						<td style="text-align: right;">会议网址：</td>
						<td><a href="<%=meet.getWebsite()%>" target="_blank"><%=meet.getWebsite()%></a></td>
					</tr>
					<tr>
						<td style="text-align: right;">会议简介：</td>
						<td><%=meet.getBrief()%></td>
					</tr>
					<tr>
						<td style="text-align: right;">开始时间：</td>
						<td><%=meet.getBegintime()%></td>
					</tr>
					<tr>
						<td style="text-align: right;">结束时间：</td>
						<td><%=meet.getEndtime()%></td>
					</tr>
					<tr>
						<td style="text-align: right;">举办国家：</td>
						<td><%=meet.getHoldcountry()%></td>
					</tr>
					<tr>
						<td style="text-align: right;">举办城市：</td>
						<td><%=meet.getHoldcity()%></td>
					</tr>
					<tr>
						<td style="text-align: right;">举办场地：</td>
						<td><%=meet.getPlace()%></td>
					</tr>
					<tr>
						<td style="text-align: right;">会议管理员：</td>
						<td><%=meet.getManagername()%></td>
					</tr>
					<tr>
						<td style="text-align: right;">会议组织单位：</td>
						<td><%=meet.getOrganization()%></td>
					</tr>
					<tr>
						<td style="text-align: right;">会议内容：</td>
						<td><%=meet.getContent()%></td>
					</tr>
					<tr>
						<td colspan="2"><center>
								<form action="user/JoinMeeting" method="post" onsubmit="return validate();">
									<input type="hidden" name="meetingid"
										value="<%=meet.getMeetingID()%>"> <input type="hidden"
										name="meetingname" value="<%=meet.getMeetingname()%>"><input
										type="submit" name="submit" value="参与会议">
								</form>
							</center></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="../main/mainfoot.inc"%>
</body>
</html>