<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="mine" uri="Myfunction"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:choose>
	<c:when test="${not empty param.joinID}">
		<c:choose>
			<c:when test="${mine:delMeetingJoinByID(param.joinID)}">
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

<c:choose>
	<c:when test="${param.showPage==null}">
		<c:set var="showPage" scope="page" value="${1}"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="showPage" scope="page" value="${param.showPage}"></c:set>
	</c:otherwise>
</c:choose>
<c:set var="rowCount" scope="page"
	value="${mine:getMeetingJoinCountByMeetingID(meeting.meetingID)}"></c:set>
<c:set var="ipage" scope="page" value="${15}"></c:set>
<c:set var="pageCount" scope="page" value="${0}"></c:set>
<c:choose>
	<c:when test="${rowCount%ipage==0}">
		<c:set var="pageCount" scope="page" value="${rowCount/ipage}"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="pageCount" scope="page" value="${rowCount/ipage+1}"></c:set>
	</c:otherwise>
</c:choose>
<fmt:formatNumber var="pageCount" value="${pageCount}" pattern="#"
	scope="page" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'addnews.jsp' starting page</title>
		<style type="text/css">
<!--
body,td,th {
	font-size: 14px;
}
-->
</style>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<table border="0" align="center" cellspacing="1" bgcolor="#336699"
			width="98%">
			<tr>
				<th align="center" colspan="6"
					style="font-size: 16px; height: 30px;">
					参会人员用户管理
				</th>
			</tr>
			<tr>
				<td bgcolor="#EDEDE1">
					编号
				</td>
				<td bgcolor="#EDEDE1">
					用户姓名
				</td>
				<td bgcolor="#EDEDE1">
					接待员
				</td>
				<td bgcolor="#EDEDE1" colspan="3">
					操作
				</td>
			</tr>
			<%
				String submitFlag = request.getParameter("submitFlag");
				if (submitFlag == null) {
			%>
			<c:forEach var="join"
				items="${mine:getAllMeetingJoin(showPage,ipage,meeting.meetingID)}"
				varStatus="num">
				<tr>
					<td bgcolor="#FFFFFF">
						${(showPage-1)*ipage+num.count}
					</td>
					<td bgcolor="#FFFFFF">
						${join.username}
					</td>
					<td bgcolor="#FFFFFF">
						${join.name}
					</td>
					<td bgcolor="#FFFFFF">
						<a href="organizer/oneuser.jsp?userID=${join.userID}">查看信息</a>
					</td>
					<td bgcolor="#FFFFFF">
						<a href="organizer/setserver.jsp?userID=${join.userID}">分配接待员</a>
					</td>
					<td bgcolor="#FFFFFF">
						<a href="organizer/allusers.jsp?joinID=${join.joinID}"
							onclick="javascript:if(confirm('此操作会删除用户发布的出行计划和别人对计划的响应，会对用户造成影响，且删除后无法恢复，是否删除?')){return true}else{return false;}">删除</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6" bgcolor="#FFFFFF">
					<div align="right">
						<form action="organizer/allusers.jsp">
							共
							<font color=red>${rowCount}</font>条&nbsp; ${ipage }条/页&nbsp; 第
							<font color=red>${showPage }</font>页
							<a href="organizer/allusers.jsp?showPage=1">[首页]</a>&nbsp;

							<c:choose>
								<c:when test="${showPage>1}">
									<a href="organizer/allusers.jsp?showPage=${showPage-1 }">[上一页]</a>&nbsp;
						</c:when>
								<c:otherwise>
							[上一页]&nbsp;
						</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${showPage < pageCount}">
									<a href="organizer/allusers.jsp?showPage=${showPage+1 }">[下一页]</a>&nbsp;
						</c:when>
								<c:otherwise>
							[下一页]&nbsp;
						</c:otherwise>
							</c:choose>

							<a href="organizer/allusers.jsp?showPage=${pageCount }">[尾页]</a>&nbsp;
							转到
							<select name="showPage">
								<c:forEach var="x" begin="1" end="${pageCount}" step="1">
									<option value="${x}"
										<c:if test="${showPage==x}">selected</c:if>>
										${x}
									</option>
								</c:forEach>
							</select>
							页&nbsp;
							<input type="submit" name="go" value="提交">
						</form>
						<form action="organizer/allusers.jsp?submitFlag=1" method="post">
							<input type="text" name="searchKey" />
							<input type="submit" name="search" value="搜索" />
						</form>
					</div>
				</td>
			</tr>
			<%
				} else {
					String searchKey1 = request.getParameter("searchKey");
					request.setAttribute("searchKey1", searchKey1);
			%>
			<c:forEach var="join"
				items="${mine:getAllMeetingJoinFromKey(meeting.meetingID,searchKey1)}"
				varStatus="num">
				<tr>
					<td bgcolor="#FFFFFF">
						${(showPage-1)*ipage+num.count}
					</td>
					<td bgcolor="#FFFFFF">
						${join.username}
					</td>
					<td bgcolor="#FFFFFF">
						${join.name}
					</td>
					<td bgcolor="#FFFFFF">
						<a href="organizer/oneuser.jsp?userID=${join.userID}">查看信息</a>
					</td>
					<td bgcolor="#FFFFFF">
						<a href="organizer/setserver.jsp?userID=${join.userID}">分配接待员</a>
					</td>
					<td bgcolor="#FFFFFF">
						<a href="organizer/allusers.jsp?joinID=${join.joinID}"
							onclick="javascript:if(confirm('此操作会删除用户发布的出行计划和别人对计划的响应，会对用户造成影响，且删除后无法恢复，是否删除?')){return true}else{return false;}">删除</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7" bgcolor="#FFFFFF">
					<div align="right">
						<form action="organizer/allusers.jsp?submitFlag=1" method="post">
							<input type="text" name="searchKey" />
							<input type="submit" name="search" value="搜索" />
						</form>
					</div>
				</td>
			</tr>
			<%}%>
		</table>

	</body>
</html>
