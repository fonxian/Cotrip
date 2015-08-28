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
	<c:when test="${not empty param.msID}">
		<c:set var="service" value="${mine:getMeetingServiceByID(param.msID)}"></c:set>
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
	<script type="text/javascript">
		function check()
		{
			var name=document.getElementById("serviceperson").value;
			var number=document.getElementById("contactnumber").value;
			var city=document.getElementById("city").value;
			var country=document.getElementById("country").value;
			var remark=document.getElementById("remark").value;
			if(name.trim()=="")
			{
				alert("请输入姓名");
				return false;
			}
			if(name.trim().length>40)
			{
				alert("输入姓名太长，请输入40字符以内");
				return false;
			}
			if(number.trim()=="")
			{
				alert("请输入电话号码");
				return false;
			}
			if(city.trim()=="")
			{
				alert("请输入所在城市");
				return false;
			}
			if(city.trim().length>40)
			{
				alert("输入城市太长，请输入40字符以内");
				return false;
			}
			if(country.trim()=="")
			{
				alert("请输入所在国家");
				return false;
			}
			if(country.trim().length>40)
			{
				alert("输入国家太长，请输入40字符以内");
				return false;
			}
			if(remark.trim().length>200)
			{
				alert("输入备注太长，请输入200字符以内");
				return false;
			}
			if(number.trim()!=""&&!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(number))){
				alert("不是完整的11位手机号");
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
  <form action="servlet/ChangeMeetingService" method="post" onsubmit="return check();">
  	<table border="0" align="center" cellspacing="1" bgcolor="#336699" width="50%" >
	    <tr><th align="center" colspan="2" style="font-size: 16px;height: 30px;">修改会议服务信息</th></tr>
	   	<tr><td bgcolor="#FFFFFF"><font color="red">*</font>姓名：</td><td bgcolor="#FFFFFF"><input name="serviceperson" id="serviceperson" type="text" value="${service.serviceperson}"/></td></tr>
	    <tr><td bgcolor="#FFFFFF"><font color="red">*</font>手机号码：</td><td bgcolor="#FFFFFF"><input name="contactnumber" id="contactnumber" type="text"  value="${service.contactnumber}"/></td></tr>
	   	<tr><td bgcolor="#FFFFFF"><font color="red">*</font>所在城市：</td><td bgcolor="#FFFFFF"><input name="city" id="city" type="text" value="${service.city}"/></td></tr>
	    <tr><td bgcolor="#FFFFFF"><font color="red">*</font>所在国家：</td><td bgcolor="#FFFFFF"><input name="country" id="country" type="text" value="${service.country}"/></td></tr>
	    <tr><td bgcolor="#FFFFFF">备注：</td><td bgcolor="#FFFFFF"><textarea name="remark" id="remark"/>${service.remark}</textarea>
	    <input type="hidden" name="serviceID" value="${service.serviceID}" />
	    </td></tr>
	    <tr><td align="center" colspan="2"><input type="submit" value="修改 " /></td></tr>
	</table>
	</form>
  </body>
</html>
