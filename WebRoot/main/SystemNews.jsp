<%@ page language="java" import="java.util.*" pageEncoding="gb2312"
	contentType="text/html;charset=UTF-8"%>

<%@ page import="com.cotrip.daoimp.SysNewsNoticesImp"%>
<%@ page import="com.cotrip.bean.SysNewsNotices"%>
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
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
<title>news Co-Trip</title>
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
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="js/easy.js"></script>
<%
	String nid = request.getParameter("id");
	String type = "N";

	ArrayList<SysNewsNotices> news = new ArrayList<SysNewsNotices>();

	SysNewsNoticesImp mi = new SysNewsNoticesImp();
	news = mi.querySysNewsNoticesById(nid, type);
%>

</head>

<body>
	<div id="div_m">
		<%@ include file="menu.html"%>
		<div id="div_main">
			<div id="div_side">
				<%@ include file="side.inc"%>
			</div>
			
				<%
					if (news == null || news.isEmpty()) {
				%>
				<div id="div_title" style="color:red">
					<center>
						<h3>
							<b>没有该条新闻！</b>
						</h3>
					</center>
				</div>
				<%
					} else {
						SysNewsNotices n = news.get(0);
				%>
			 <div id="div_center">
      <div class="side_title"><h2 align="center"><%=n.getSysnnname()%></h2>
      </div>
				
				<div id="div_content">
					<ul>
						<%
							SimpleDateFormat sdf = new SimpleDateFormat(
										"yyyy-MM-dd hh:mm:ss");
								SimpleDateFormat dateParse = new SimpleDateFormat(
										"yyyy-MM-dd hh:mm:ss.SS");// 转换从数据库中读取的数据
								try {
									String time = sdf.format(dateParse.parse(n.getSysnntime()
											.trim()));
									out.println("<center>" + time + "</center>");
								} catch (ParseException e) {
								}
								out.println("<li>" + n.getSysnncontent() + "</li>");
							}
						%>
					</ul>
				</div>
				<div id="div_Page"></div>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="mainfoot.inc"%>
</body>
</html>