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
	<c:when test="${not empty param.mnnID}">
		<c:set var="mnn" value="${mine:getMeetingNewsNoticesByID(param.mnnID)}">
		</c:set>
	</c:when>
</c:choose>
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
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		function check()
		{
			for ( instance in CKEDITOR.instances )
			{
				CKEDITOR.instances[instance].updateElement();
			}
			var name=document.getElementById("newname").value;
			var content=document.getElementById("newcontent").value;
			if(name.trim()=="")
			{
				alert("请输入名称！");
				return false;
			}
			if(content.trim()=="")
			{
				alert("请输入内容！");
				return false;
			}
			return true;
		}
		
		String.prototype.trim=function()
		{
			return this.replace(/(^\s*)|(\s*$)/g, ""); 
		}
	</script>
  </head>
  
  <body>
  	<form action="servlet/ChangeMeetingNewsNotices" method="post" onsubmit="return check();">
    <table border="0" align="center" cellspacing="1" bgcolor="#336699">
    <tr><th align="center" colspan="2" style="font-size: 16px;height: 30px;">
    <c:choose>
    	<c:when test="${sysnewsnotices.type=='N'}">
    	修改新闻
    	</c:when>
    	<c:when test="${sysnewsnotices.type=='P'}">
    	修改公告
    	</c:when>
    </c:choose>
    </th></tr>
    <tr><td bgcolor="#FFFFFF">名称</td><td bgcolor="#FFFFFF"><input name="newname" id="newname" size="60" value="${mnn.mnnname }"/></td></tr>
    <tr><td bgcolor="#FFFFFF">内容</td><td bgcolor="#FFFFFF"><textarea name="newcontent" id="newcontent">${mnn.mnncontent}</textarea></td></tr>
    <tr><td colspan="2" align="center">
    <input type="hidden" name="type" value="${mnn.type}"/>
    <input type="hidden" name="mnnID" value="${mnn.mnnID}"/>
    <input type="submit" value="修改"/>
    </td></tr>
    </table>
    </form>
    <script type="text/javascript">
		window.onload = function()
		{
			CKEDITOR.replace( 'newcontent' );
			
		};
	</script>
  </body>
</html>
