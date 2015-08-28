<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html;charset=UTF-8"%>

<%@ page import="com.cotrip.daoimp.MeetingImp"%>
<%@ page import="com.cotrip.bean.Meeting"%>
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
<title>Search Co-Trip</title>
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
<style type="text/css">
#div_main #div_searchBar {
	margin: 15px;
}

#div_main #div_searchResult {
	border-top-width: thin;
	border-top-style: solid;
	border-top-color: #CCC;
	margin: 15px;
}

#div_main #div_searchResult ul li {
	padding: 10px;
}

#div_main #div_searchResult ul li {
	border-bottom-width: thin;
	border-bottom-style: dotted;
	border-bottom-color: #CCC;
}

#div_main #div_Page {
	text-align: right;
	padding: 10px;
}
</style>
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="js/easy.js"></script>
<%
	String searchKey = request.getParameter("searchKey");
	searchKey = new String(searchKey.getBytes("ISO-8859-1"), "UTF-8");
	String pageStr = request.getParameter("page");
	String pageSizeStr = request.getParameter("pageSize");

	int p = 1;// 页码
	int pageSize = 10;// 每页的大小
	int total = 0;// 总记录条数
	int totalPage = 0;// 总页数
	ArrayList<Meeting> meetings = new ArrayList<Meeting>();

	if (searchKey != null && !searchKey.trim().equals("")) {
		searchKey = searchKey.trim();
		if (pageStr != null) {
			try {
				p = Integer.parseInt(pageStr.trim());
			} catch (NumberFormatException e) {
				p = 1;
			}
		}
		if (pageSizeStr != null) {
			try {
				pageSize = Integer.parseInt(pageSizeStr.trim());
			} catch (NumberFormatException e) {
				pageSize = 1;
			}
		}
		MeetingImp mi = new MeetingImp();
		meetings = mi.queryMettings(searchKey, p, pageSize);
		total = mi.countMeeting(searchKey);
		totalPage = total / pageSize;
		if (total % pageSize != 0) {
			totalPage += 1;
		}
	} else {
		searchKey = "";
	}
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
				<div id="div_searchBar">
					<center>
						<form action="<%=basePath%>main/search.jsp" method="get">
							<input type="text" name="searchKey" size="50"
								value="<%=searchKey%>" /> <input type="submit" name="submit"
								value="搜索">
						</form>
					</center>
				</div>
				<div id="div_searchResult">
					<ul>
						<%
							if (meetings.isEmpty()) {
						%>
						<li>没有找到相关的会议！</li>
						<%
							} else {
								out.println("<li>cotrip为您搜索到" + meetings.size() + "条相关会议：</li>");
								for (int i = 0; i < meetings.size(); i++) {
									out.println("<li>");
									out.println("会议名称：<a href='main/meeting.jsp?id="
											+ meetings.get(i).getMeetingID() + "'>"
											+ meetings.get(i).getMeetingname() + "</a><br />");
									out.println("会议简介：" + meetings.get(i).getBrief() + "<br />");
									out.println("会议网址：<a href='"+meetings.get(i).getWebsite()+"' target='_blank'>" + meetings.get(i).getWebsite() + "</a><br />");
									out.println("举办国家：" + meetings.get(i).getHoldcountry()
											+ "<br />");
									out.println("举办城市：" + meetings.get(i).getHoldcity()
											+ "<br />");
									out.println("开始时间：" + meetings.get(i).getBegintime()
											+ "<br />");
									out.println("结束时间：" + meetings.get(i).getEndtime()
											+ "<br />");
									out.println("</li>");
								}
							}
						%>
					</ul>
				</div>
				<div id="div_Page">
					第<%=p%>页,共<%=totalPage%>页
					<%
					if (p > 1) {
				%>
					<a
						href="<%=basePath%>main/search.jsp?searchKey=<%=searchKey%>&page=<%=(p - 1)%>&pageSize=<%=pageSize%>">上一页</a>
					<%
						}
						if (p * pageSize < total) {
					%>
					<a
						href="<%=basePath%>main/search.jsp?searchKey=<%=searchKey%>&page=<%=(p + 1)%>&pageSize=<%=pageSize%>">下一页</a>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="mainfoot.inc"%>
</body>
</html>
