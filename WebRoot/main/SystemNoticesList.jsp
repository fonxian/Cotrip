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
<title>公告列表 Co-Trip</title>
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
	String pageStr = request.getParameter("page");
	String pageSizeStr = request.getParameter("pageSize");

	int p = 1;// 页码
	int pageSize = 10;// 每页的大小
	int total = 0;// 总记录条数
	int totalPage = 0;// 总页数
	ArrayList<SysNewsNotices> news = new ArrayList<SysNewsNotices>();
	String type = "P";

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
	SysNewsNoticesImp mi = new SysNewsNoticesImp();
	news = mi.querySysNewsNotices(type, p, pageSize);
	total = mi.countNewsNotices(type);
	totalPage = total / pageSize;
	if (total % pageSize != 0) {
		totalPage += 1;
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
      <div class="side_title"><h2 align="center">公告列表</h2></div>
      <table width="100%" border="0px" cellpadding="5px"
						cellspacing="0px" style="text-align:left">
						<%
							if (news.isEmpty()) {
						%>
						<tr>
							<td style="color:red"><center>暂时没有任何公告！</center></td>
						</tr>
						<%
							} else {
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								SimpleDateFormat dateParse = new SimpleDateFormat(
										"yyyy-MM-dd hh:mm:ss.SS");// 转换从数据库中读取的数据
								for (int i = 0; i < news.size(); i++) {
									out.println("<tr><td>");
									out.println("<a href='" + basePath
											+ "main/SystemNotices.jsp?id="
											+ news.get(i).getSysnnID() + "'>"
											+ news.get(i).getSysnnname() + "</a>");
									try {
										String time = sdf.format(dateParse.parse(news.get(i)
												.getSysnntime().trim()));
										out.println("</td><td width='14%'>" + time
												+ "</td></tr>");
									} catch (ParseException e) {
									}
								}
							}
						%>
					</table>
					<div id="div_Page">
					第<%=p%>页,共<%=totalPage%>页
					<%
					if (p > 1) {
				%>
					<a
						href="<%=basePath%>main/SystemNotices.jsp?page=<%=(p - 1)%>&pageSize=<%=pageSize%>">上一页</a>
					<%
						}
						if (p * pageSize < total) {
					%>
					<a
						href="<%=basePath%>main/SystemNotices.jsp?page=<%=(p + 1)%>&pageSize=<%=pageSize%>">下一页</a>
					<%
						}
					%>
				</div>
				</div>
				
			</div>
		</div>
	</div>
	<%@ include file="mainfoot.inc"%>
</body>
</html>