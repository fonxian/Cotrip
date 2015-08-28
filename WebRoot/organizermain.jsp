<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:choose>
 		<c:when test="${not empty organizer}">
 			<c:set var="organizer" value="${organizer}" scope="session"></c:set>
 			<c:if test="${not empty meeting}">
 			<c:set var="meeting" value="${meeting}" scope="session"></c:set>
 			</c:if>
 		</c:when>
 		<c:otherwise>
 			<jsp:forward page="adminLogin.jsp"></jsp:forward>
 		</c:otherwise>
 </c:choose>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<base href="<%=basePath%>">
	<title>欢迎进入会议同程Co-Trip系统网站后台管理系统</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
	</head>
	<%request.setCharacterEncoding("UTF-8") ;%>
	<frameset rows="90,*" cols="*" framespacing="0" frameborder="NO" border="0">
  <frame src="organizer/top.jsp" name="left" scrolling="no" noresize>
  <frameset rows="*" cols="170,*" framespacing="0" frameborder="NO" border="0">
        <frame src="organizer/menu.jsp" name="left">
        <frame src="organizer/home.jsp" name="right" scrolling="yes" noresize>
      </frameset>
</frameset>
<noframes><body>
</body></noframes>
</html>
