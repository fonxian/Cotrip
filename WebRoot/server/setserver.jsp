<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="mine" uri="Myfunction" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



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
    <tr><th align="center" colspan="8" style="font-size: 16px;height: 30px;">与会者的出行计划</th></tr>
    <tr><td bgcolor="#EDEDE1">姓名</td><td bgcolor="#EDEDE1">出发时间</td><td bgcolor="#EDEDE1">到达时间</td><td bgcolor="#EDEDE1">出发地点</td><td bgcolor="#EDEDE1">到达地点</td><td bgcolor="#EDEDE1">出行方式</td><td bgcolor="#EDEDE1">电话</td><td bgcolor="#EDEDE1">备注</td></tr>
    <c:choose>
    	<c:when test="${not mine:haveTravelPlan(server.meetingID,param.userID) and not mine:haveResponse(server.meetingID,param.userID)}">
    	<tr><td colspan="8" align="center" bgcolor="#FFFFFF">没有发布或响应出行计划</td></tr>
    	</c:when>
    	
    	
    	<c:when test="${mine:haveTravelPlan(server.meetingID,param.userID)}">
    	<c:set var="plan" value="${mine:getTravelPlanByuserIDAndMeetingID(server.meetingID,param.userID)}"></c:set>
    	<tr><td   <c:choose>
    		<c:when test="${plan.userID==param.userID}">bgcolor="red"</c:when>
    		<c:otherwise>bgcolor="#FFFFFF"</c:otherwise>
    		</c:choose> >${plan.username }</td><td bgcolor="#FFFFFF">${plan.starttime}</td><td bgcolor="#FFFFFF">${plan.overtime}</td>
    	<td bgcolor="#FFFFFF">${plan.startaddress }</td><td bgcolor="#FFFFFF">${plan.overaddress}</td><td bgcolor="#FFFFFF">${plan.method}</td><td bgcolor="#FFFFFF">${plan.number}</td><td bgcolor="#FFFFFF">${plan.remark}</td></tr>
	    	<c:forEach var="response" items="${mine:getAllResponseByPlanID(plan.planID)}">
	    	<tr><td bgcolor="#EDEDE1">响应者姓名</td><td bgcolor="#EDEDE1">响应者电话</td><td colspan="6" bgcolor="#EDEDE1">响应者备注</td></tr>
	    	<tr><td <c:choose>
    		<c:when test="${response.userID==param.userID}">bgcolor="red"</c:when>
    		<c:otherwise>bgcolor="#FFFFFF"</c:otherwise>
    		</c:choose>   >${response.username }</td><td bgcolor="#FFFFFF">${response.number }</td><td bgcolor="#FFFFFF" colspan="6">${response.remark }</td></tr>	
	    	</c:forEach>
    	</c:when>
    	
    	<c:when test="${mine:haveResponse(server.meetingID,param.userID)}">
    		
    		<c:set var="ID" value="${mine:getPlanID(server.meetingID,param.userID)}"></c:set>
    		<c:set var="plan" value="${mine:getTravelPlanByID(ID)}"></c:set>
    		<tr><td bgcolor="#FFFFFF">${plan.username }</td><td bgcolor="#FFFFFF">${plan.starttime}</td><td bgcolor="#FFFFFF">${plan.overtime}</td>
    		<td bgcolor="#FFFFFF">${plan.startaddress }</td><td bgcolor="#FFFFFF">${plan.overaddress}</td><td bgcolor="#FFFFFF">${plan.method}</td><td bgcolor="#FFFFFF">${plan.number}</td><td bgcolor="#FFFFFF">${plan.remark}</td></tr>
	    	<c:forEach var="response" items="${mine:getAllResponseByPlanID(plan.planID)}">
	    	<tr><td bgcolor="#EDEDE1">响应者姓名</td><td bgcolor="#EDEDE1">响应者电话</td><td colspan="6" bgcolor="#EDEDE1">响应者备注</td></tr>
	    	<tr><td <c:choose>
    		<c:when test="${response.userID==param.userID}">bgcolor="red"</c:when>
    		<c:otherwise>bgcolor="#FFFFFF"</c:otherwise>
    		</c:choose>  >${response.username }</td><td bgcolor="#FFFFFF">${response.number }</td><td bgcolor="#FFFFFF" colspan="6">${response.remark }</td></tr>	
	    	</c:forEach>
    	</c:when>
    </c:choose>
    </table>
  </body>
</html>
