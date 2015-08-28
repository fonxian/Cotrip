<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html;charset=UTF-8"%>

<%@ page import="com.cotrip.daoimp.MeetingJoinImp"%>
<%@ page import="com.cotrip.daoimp.MeetingImp"%>
<%@ page import="com.cotrip.bean.MeetingJoin"%>
<%@ page import="com.cotrip.bean.User"%>
<%@ page import="com.cotrip.bean.Meeting"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="mine" uri="Myfunction" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:choose>
	<c:when test="${not empty param.delID}">
		<c:choose>
			<c:when test="${mine:delMeetingJoinByID(param.delID)}">
				<script>
					alert("删除成功");
				</script>
			</c:when>
			<c:otherwise>
				<script>
					alert("删除失败");
				</script>
			</c:otherwise>
		</c:choose>
	</c:when>
</c:choose>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>My Conferences Co-Trip</title>
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
      <div class="side_title"><h2 align="center">我参与的会议</h2></div>
      <table width="100%" border="1px" cellpadding="5px"
						cellspacing="0px" bordercolor="#B1B1E6" style="text-align:center">
						<tr>
							<th>会议名称</th>
							<th>组织单位</th>
							<th>举办地点</th>
							<th>开始时间</th>
							<th>结束时间</th>
							<th>管理者姓名</th>
							<th>进入会议</th>
							<th>操作</th>
						</tr>
						<%
							ArrayList<MeetingJoin> joinList = null;
							MeetingJoinImp mji = new MeetingJoinImp();
							Object o = session.getAttribute("curuser");
							if (o != null) {
								User curuser = (User) o;
								joinList = mji.queryByUserName(curuser.getUsername());
								MeetingImp mi = new MeetingImp();
								if (joinList.isEmpty()) {
									out.println("<center><h3>暂无任何会议</h3></center>");
								} else {
									for (int i = 0; i < joinList.size(); i++) {
										int id = Integer.parseInt(joinList.get(i)
												.getMeetingID());
										ArrayList<Meeting> ms = mi.queryMettingsById(id);
										if (ms.isEmpty()) {
											continue;// 过滤掉拉黑的会议
										}
										Meeting mt = ms.get(0);
						%>
						<tr>
							<td><%=mt.getMeetingname()%></td>
							<td><%=mt.getOrganization()%></td>
							<td><%=mt.getHoldcity() + " " + mt.getHoldcountry()%></td>
							<td><%=mt.getBegintime()%></td>
							<td><%=mt.getEndtime()%></td>
							<td><%=mt.getManagername()%></td>
							<td><a href="meeting?id=<%=mt.getMeetingID()%>">进入会议</a>
							</td>
							<td><a href="user/MyConferences.jsp?delID=<%=joinList.get(i).getJoinID()%>" onClick="javascript:if(confirm('此操作会删除用户发布的出行计划和别人对计划的响应，会对用户造成影响，且删除后无法恢复，是否删除?')){return true}else{return false;}">删除</a></td>
						
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

			</div>
		</div>
	</div>

	<%@ include file="../main/mainfoot.inc"%>
</body>
</html>
