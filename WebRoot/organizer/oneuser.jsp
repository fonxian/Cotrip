<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="mine" uri="Myfunction" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:if test="${not empty param.userID}">
	<c:set var="user" value="${mine:getUserByID(param.userID)}">
	</c:set>
</c:if>


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
  	<table border="0" align="center" cellspacing="1" bgcolor="#336699" width="50%" >
	    <tr><th align="center" colspan="2" style="font-size: 16px;height: 30px;">用户<font color="red">${user.username}</font>的信息</th></tr>
	   	<tr><td bgcolor="#FFFFFF">姓名：</td><td bgcolor="#FFFFFF">${user.username }</td></tr>
	    <tr><td bgcolor="#FFFFFF">邮箱：</td><td bgcolor="#FFFFFF">${user.email }</td></tr>
	   	<tr><td bgcolor="#FFFFFF">年龄：</td><td bgcolor="#FFFFFF">${user.age }</td></tr>
	    <tr><td bgcolor="#FFFFFF">性别：</td><td bgcolor="#FFFFFF">${user.sex }</td></tr>
	    <tr><td bgcolor="#FFFFFF">国家：</td><td bgcolor="#FFFFFF">${user.country }</td></tr>
	    <tr><td bgcolor="#FFFFFF">城市：</td><td bgcolor="#FFFFFF">${user.city }</td></tr>
	    <tr><td bgcolor="#FFFFFF">职称：</td><td bgcolor="#FFFFFF">${user.title }</td></tr>
	    <tr><td bgcolor="#FFFFFF">学历：</td><td bgcolor="#FFFFFF">${user.education }</td></tr>
	    <tr><td bgcolor="#FFFFFF">公司：</td><td bgcolor="#FFFFFF">${user.company }</td></tr>
	    <tr><td bgcolor="#FFFFFF">手机号码：</td><td bgcolor="#FFFFFF">${user.mobnumber }</td></tr>
	    <tr><td bgcolor="#FFFFFF">座机号码：</td><td bgcolor="#FFFFFF">${user.telnumber }</td></tr>
	    <tr><td bgcolor="#FFFFFF">邮政地址：</td><td bgcolor="#FFFFFF">${user.address }</td></tr>
	    <tr><td bgcolor="#FFFFFF">邮政编码：</td><td bgcolor="#FFFFFF">${user.postcode }</td></tr>
	      
	 </table>
  </body>
</html>
