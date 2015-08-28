<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html;charset=UTF-8"%>

<%@ page import="com.cotrip.daoimp.TravelPlanImp"%>
<%@ page import="com.cotrip.daoimp.MeetingImp"%>
<%@ page import="com.cotrip.daoimp.ResponseImp"%>
<%@ page import="com.cotrip.bean.TravelPlan"%>
<%@ page import="com.cotrip.bean.Meeting"%>
<%@ page import="com.cotrip.bean.User"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>My Travel Plan Co-Trip</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<LINK rel=StyleSheet type=text/css href="css/cool.css">
<LINK rel=StyleSheet type=text/css href="css/main.css">
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="js/easy.js"></script>
<%
	
%>

</head>

<body>
	<div id="div_m">
		<%@ include file="menu.html"%>
		<div id="div_main">
			<div id="div_side">
				<%@ include file="side.inc"%>
			</div>
			 <div id="div_center">
      <div class="side_title"><h2 align="center">我发布的出行计划</h2></div>
      <table width="100%" border="1px" cellpadding="5px"
						cellspacing="0px" bordercolor="#B1B1E6" style="text-align:center">
						<tr>
							<th>会议名称</th>
							<th>出发时间</th>
							<th>到达时间</th>
							<th>出发地点</th>
							<th>到达地点</th>
							<th>出行方式</th>
							<th>航班/车次</th>
							<th>备注</th>
							<th>是否共享</th>
							
						</tr>
						<%
							ArrayList<TravelPlan> list = null;
											TravelPlanImp tpi = new TravelPlanImp();
											Object o = session.getAttribute("curuser");
											if (o != null) {
												User curuser = (User) o;
												list = tpi.queryByUserId(Integer.parseInt(curuser.getUserID()));
												MeetingImp mi = new MeetingImp();
												if (list.isEmpty()) {
													out.println("<center><h3>暂无任何出行计划</h3></center>");
												} else {
													for (int i = 0; i < list.size(); i++) {
														TravelPlan tp = list.get(i);
														ArrayList<Meeting> ms = mi.queryMettingsById(Integer
																.parseInt(tp.getMeetingID()));
														if (ms.isEmpty()) {
															continue;// 跳过被拉黑的会议
														}
						%>
						<tr>
							<td><a href="meeting?id=<%=ms.get(0).getMeetingID()%>"><%=ms.get(0).getMeetinganame()%></a>
							</td>
							<td><%=tp.getStarttime()%></td>
							<td><%=tp.getOvertime()%></td>
							<td><%=tp.getStartaddress()%></td>
							<td><%=tp.getOveraddress()%></td>
							<td><%=tp.getMethod()%></td>
							<td><%=tp.getTfnumber()%></td>
							<td>${tp.remark }</td>
							<td><%=tp.getIspublic()%></td>
							</tr>
						<%
							}
												}
											} else {
												out.println("<center><h3 style='color:red'>尚未登录</h3></center>");
											}
						%>
					</table>
				</div>
				 <div id="div_center">
      <div class="side_title">
        <h2 align="center">我响应的出行计划</h2>
      </div>
				
					<table width="100%" border="1px" cellpadding="5px"
						cellspacing="0px" bordercolor="#B1B1E6" style="text-align:center">
						<tr>
							<th>会议名称</th>
							<th>出发时间</th>
							<th>到达时间</th>
							<th>出发地点</th>
							<th>到达地点</th>
							<th>出行方式</th>
							<th>航班/车次</th>
							<th>是否共享</th>
						</tr>
						<%
							ArrayList<TravelPlan> list2 = null;
							ResponseImp ri = new ResponseImp();
							
											if (o != null) {
												User curuser = (User) o;
												list2 = ri.getTravelPlansByUID(curuser.getUserID());
												MeetingImp mi = new MeetingImp();
												if (list2.isEmpty()) {
													out.println("<center><h3>暂无任何出行计划</h3></center>");
												} else {
													for (int i = 0; i < list2.size(); i++) {
														TravelPlan tp = list2.get(i);
														ArrayList<Meeting> ms = mi.queryMettingsById(Integer
																.parseInt(tp.getMeetingID()));
														if (ms.isEmpty()) {
															continue;// 跳过被拉黑的会议
														}
						%>
						<tr>
							<td><a href="meeting?id=<%=ms.get(0).getMeetingID()%>"><%=ms.get(0).getMeetinganame()%></a>
							</td>
							<td><%=tp.getStarttime()%></td>
							<td><%=tp.getOvertime()%></td>
							<td><%=tp.getStartaddress()%></td>
							<td><%=tp.getOveraddress()%></td>
							<td><%=tp.getMethod()%></td>
							<td><%=tp.getTfnumber()%></td>
							<td><%=tp.getRemark()%></td>
							<td><%=tp.getIspublic()%></td>
						</tr>
						<%
							}
												}
											} else {
												out.println("<center><h3 style='color:red'>尚未登录</h3></center>");
											}
						%>
					</table>
					</div>
						<div class="right" style="line-height: normal; width:200px;position:absolute;margin-top:270px;margin-left:820px;">
			<!-- 百度分享 -->
			<div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
				<span class="bds_more" style="margin-top: 14px; ">分享到：</span>
				<a class="bds_qzone"></a>
				<a class="bds_tsina"></a>
				<a class="bds_tqq"></a>
				<a class="bds_renren"></a>
				<a class="bds_t163"></a>
			</div>
			<script type="text/javascript" id="bdshare_js" data="type=tools" ></script>
			<script type="text/javascript" id="bdshell_js"></script>
			<script type="text/javascript">
			document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
			</script>
			<!-- 百度分享 -->
		</div>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="../main/mainfoot.inc"%>
</body>
</html>
