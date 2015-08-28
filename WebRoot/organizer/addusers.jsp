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
	<script type="text/javascript">
		function check()
		{
			var name=document.getElementById("name").value;
			var email=document.getElementById("email").value;
			var password=document.getElementById("password").value;
			var remark=document.getElementById("remark").value;
			var mobnumber=document.getElementById("mobnumber").value;
			var trueemail=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			if(name.trim()=="")
			{
				alert("请输入姓名");
				return false;
			}
			if(name.trim().lentgh>40)
			{
				alert("输入姓名太长，请输入40字符以内");
				return false;
			}
			if(email.trim()=="")
			{
				alert("请输入邮箱");
				return false;
			}
			if(email.trim().length>40)
			{
				alert("输入邮箱太长，请输入40字符以内");
				return false;
			}
			if(password.trim()=="")
			{
				alert("请输入密码");
				return false;
			}
			if(password.trim().length>20)
			{
				alert("输入密码太长，请输入20字符以内");
				return false;
			}
			if(!trueemail.test(email))
			{
				alert("请输入正确邮箱");
				return false;
			}
			if(mobnumber.trim()!=""&&!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(mobnumber))){
				alert("不是完整的11位手机号");
				return false;
			}
			if(remark.trim().length>200)
			{
				alert("备注太长，请输入200字符以内！");
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
  <form action="servlet/AddMeetingUser" method="post" onsubmit="return check();">
  	<table border="0" align="center" cellspacing="1" bgcolor="#336699" width="50%" >
	    <tr><th align="center" colspan="2" style="font-size: 16px;height: 30px;">添加参会人员</th></tr>
	   	<tr><td bgcolor="#FFFFFF"><font color="red">*</font>姓名：</td><td bgcolor="#FFFFFF"><input name="name" id="name" type="text"/></td></tr>
	    <tr><td bgcolor="#FFFFFF"><font color="red">*</font>邮箱：</td><td bgcolor="#FFFFFF"><input name="email" id="email" type="text"/></td></tr>
	    <input type="hidden" name="meetingID" value="${meeting.meetingID }" />
	    </td></tr>
	    <tr><td align="center" colspan="2"><input type="submit" value="添加 " /></td></tr>
	</table>
	</form>
  </body>
</html>
