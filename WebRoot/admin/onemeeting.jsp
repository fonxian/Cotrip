<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="mine" uri="Myfunction" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:choose>
	<c:when test="${not empty param.delmnnID}">
		<c:choose>
			<c:when test="${mine:delMeetingNewsNotices(param.delmnnID)}">
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
	<c:when test="${not empty param.meetingID}">
		<c:set var="meeting" value="${mine:getMeetingByID(param.meetingID)}"></c:set>
		<c:if test="${not empty meeting}">
			<c:set var="meetingmanager" value="${mine:getManagerByID(meeting.managerID)}"></c:set>
		</c:if>
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
<c:set var="rowCount" scope="page" value="${mine:getMeetingNNCount(param.meetingID)}"></c:set>
<c:set var="ipage" scope="page" value="${5}"></c:set>
<c:set var="pageCount" scope="page" value="${0}"></c:set>
<c:choose>
	<c:when test="${rowCount%ipage==0}">
		<c:set var="pageCount" scope="page" value="${rowCount/ipage}" ></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="pageCount" scope="page" value="${rowCount/ipage+1}"></c:set>
	</c:otherwise>
</c:choose>
<fmt:formatNumber var="pageCount" value="${pageCount}" pattern="#" scope="page"/>

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
  	
  	<table border="0" align="center" cellspacing="1" bgcolor="#336699" width="98%" >
    <tr><th align="center" colspan="5" style="font-size: 16px;height: 30px;">会议</th></tr>
    <tr><td bgcolor="#EDEDE1">会议名称</td><td bgcolor="#EDEDE1">组织单位</td><td bgcolor="#EDEDE1">召开时间</td><td bgcolor="#EDEDE1">召开地点</td><td bgcolor="#EDEDE1">操作</td></tr>
    <tr><td bgcolor="#FFFFFF">${meeting.meetingname }</td><td bgcolor="#FFFFFF">${meeting.organization}</td><td bgcolor="#FFFFFF">${meeting.begintime}</td><td bgcolor="#FFFFFF">${meeting.holdcity}</td>
    <td bgcolor="#FFFFFF"><a href="admin/meetingdetail.jsp?meetingID=${meeting.meetingID}">查看</a></td>
    </tr>
    </table><br><br><br>
    <table border="0" align="center" cellspacing="1" bgcolor="#336699" width="98%" >
    <tr><th align="center" colspan="4" style="font-size: 16px;height: 30px;">会议管理员</th></tr>
    <tr><td bgcolor="#EDEDE1">姓名</td><td bgcolor="#EDEDE1">电话</td><td bgcolor="#EDEDE1">邮箱</td><td bgcolor="#EDEDE1">密码</td></tr>
   	<tr><td bgcolor="#FFFFFF">${meetingmanager.managername }</td><td bgcolor="#FFFFFF">${meetingmanager.mobnumber }</td><td bgcolor="#FFFFFF">${meetingmanager.manageremail }</td><td bgcolor="#FFFFFF">${meetingmanager.managerpassword}</td>
    </tr>
    </table><br><br><br>
  	
  	<table border="0" align="center" cellspacing="1" bgcolor="#336699" width="98%" >
    <tr><th align="center" colspan="6" style="font-size: 16px;height: 30px;">会议相关(公告/新闻)</th></tr>
    <tr><td bgcolor="#EDEDE1">编号</td><td bgcolor="#EDEDE1">名称</td><td bgcolor="#EDEDE1">发布时间</td><td bgcolor="#EDEDE1">类型</td><td bgcolor="#EDEDE1" colspan="2">操作</td></tr>
    <c:forEach var="mnn" items="${mine:getMeetingNewsNotices(showPage,ipage,param.meetingID)}" varStatus="num">
    <tr><td bgcolor="#FFFFFF">${(showPage-1)*ipage+num.count}</td><td bgcolor="#FFFFFF">${mnn.mnnname}</td><td bgcolor="#FFFFFF">${mnn.mnntime}</td>
    	<td bgcolor="#FFFFFF">
    		<c:choose>
    			<c:when test="${mnn.type=='N'}">新闻</c:when>
    			<c:otherwise>公告</c:otherwise>
    		</c:choose>
    	</td>
    <td bgcolor="#FFFFFF"><a href="admin/meetingnews.jsp?mnnID=${mnn.mnnID}">查看</a></td>
    <td bgcolor="#FFFFFF"><a href="admin/onemeeting.jsp?meetingID=${meeting.meetingID}&delmnnID=${mnn.mnnID}&showPage=${showPage}" onclick="javascript:if(confirm('删除后无法恢复，是否删除?')){return true}else{return false;}">删除</a></td>
    </tr>
    </c:forEach>
    <tr><td colspan="6" bgcolor="#FFFFFF"> 
    <div align="right">
		    	<form action="admin/onemeeting.jsp?meetingID=${meeting.meetingID}">
					共
					<font color=red>${rowCount}</font>条&nbsp;
					${ipage }条/页&nbsp; 第
					<font color=red>${showPage }</font>页
					<a href="admin/onemeeting.jsp?meetingID=${meeting.meetingID}&showPage=1">[首页]</a>&nbsp;
					
					<c:choose>
						<c:when test="${showPage>1}">
						<a href="admin/onemeeting.jsp?meetingID=${meeting.meetingID}&showPage=${showPage-1 }">[上一页]</a>&nbsp;
						</c:when>
						<c:otherwise>
							[上一页]&nbsp;
						</c:otherwise>
					</c:choose>
		
					<c:choose>
						<c:when test="${showPage < pageCount}">
							<a href="admin/onemeeting.jsp?meetingID=${meeting.meetingID}&showPage=${showPage+1 }">[下一页]</a>&nbsp;
						</c:when>
						<c:otherwise>
							[下一页]&nbsp;
						</c:otherwise>
					</c:choose>
		
					<a href="admin/onemeeting.jsp?meetingID=${meeting.meetingID}&showPage=${pageCount }">[尾页]</a>&nbsp; 转到
					<select name="showPage">
						<c:forEach var="x" begin="1" end="${pageCount}" step="1"> 
							<option value="${x}" <c:if test="${showPage==x}">selected</c:if>>${x}</option>
						</c:forEach>
					</select>
					页&nbsp;
					<input type="submit" name="go" value="提交">
				</form>
		    </div>
		 </td></tr>
    </table>
   
  </body>
</html>
