<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html;charset=UTF-8"%>

<%@ page import="com.cotrip.daoimp.TravelPlanImp"%>
<%@ page import="com.cotrip.bean.TravelPlan"%>
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
	request.setCharacterEncoding("utf-8");
	String searchKey = request.getParameter("searchKey");
	searchKey = new String(searchKey.getBytes("ISO-8859-1"), "UTF-8");
	String pageStr = request.getParameter("page");
	String pageSizeStr = request.getParameter("pageSize");

	int p = 1;// 页码
	int pageSize = 10;// 每页的大小
	int total = 0;// 总记录条数
	int totalPage = 0;// 总页数
	ArrayList<TravelPlan> travelPlans = new ArrayList<TravelPlan>();

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
		TravelPlanImp ti = new TravelPlanImp();
		HttpSession se = request.getSession(true);
		String meetingID = (String) se.getAttribute("meetingID");
		System.out.println("===meetingID==="+meetingID);
		travelPlans = ti.queryPlans(searchKey, p, pageSize,meetingID);
		total = ti.countTravelPlan(searchKey,meetingID);
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
		<jsp:include page="meetingMenu.jsp"></jsp:include>
		<div id="div_main">
			<div id="div_side">
				<%@ include file="side.inc"%>
			</div>
			<div id="div_center">
				<div id="div_searchBar">
					<center>
						<form action="meeting/searchPlan.jsp" method="get">
							<input type="text" name="searchKey" size="50"
								value="<%=searchKey%>" /> <input type="submit" name="submit"
								value="搜索"/>
						</form>
					</center>
				</div>
				<div id="div_searchResult">
					<ul>
						<%
							if (travelPlans.isEmpty()) {
						%>
						<li>没有找到相关的人员的计划！</li>
						<%
							} else {
								out.println("<li>cotrip为您搜索到" + travelPlans.size() + "个出行计划信息：</li>");
								for (int i = 0; i < travelPlans.size(); i++) {
									out.println("<li>");
									
									out.println("姓名：" + travelPlans.get(i).getUsername() + "<br />");
									out.println("出发时间："+travelPlans.get(i).getStarttime() + "<br />");
									out.println("出发地点：" + travelPlans.get(i).getStartaddress()
											+ "<br />");
									out.println("出行方式：" + travelPlans.get(i).getMethod()
											+ "<br />");
									out.println("航班/车次：" + travelPlans.get(i).getTfnumber()
											+ "<br />");
									out.println("电子邮箱：" + travelPlans.get(i).getEmail()
											+ "<br />");
									out.println("电话：" + travelPlans.get(i).getNumber()
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
					if (p>1) {
				%>
					<a
						href="<%=basePath%>meeting/searchPlan.jsp?searchKey=<%=searchKey%>&page=<%=(p - 1)%>&pageSize=<%=pageSize%>">上一页</a>
					<%
						}
						if (p * pageSize < total) {
					%>
					<a
						href="<%=basePath%>meeting/searchPlan.jsp?searchKey=<%=searchKey%>&page=<%=(p + 1)%>&pageSize=<%=pageSize%>">下一页</a>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<div id="div_footer">Co-Trip&copy;2012-2013</div>
</body>
</html>
