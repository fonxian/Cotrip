<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String to = request.getHeader("referer");// 跳转的url
	//out.println(to);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0044)https://www.easychair.org/account/signin.cgi -->
<HTML lang=en-US xml:lang="en-US" xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<base href="<%=basePath%>">
<TITLE>错误页面</TITLE>


<LINK rel=StyleSheet type=text/css href="css/ad.css">
<LINK rel=StyleSheet type=text/css href="css/cool.css">
<LINK rel=icon type=image/jpeg href="images/chairEC.jpg">
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<META name=GENERATOR content="MSHTML 8.00.7600.17115">
</HEAD>
<BODY>
	你所绑定的账号不存在！请重新输入！<a href ="qqlogin.jsp">返回</a>
</BODY>
</HTML>
