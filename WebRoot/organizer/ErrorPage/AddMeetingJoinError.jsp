<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Error Page</title>
    
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
  	<img src="organizer/img/error.gif"></img></br></br>
  	
  	<%= request.getParameter("ErrorInfo") %></br></br>
  	<form action="/cotrip/organizer/addusers.jsp" method="post">
	  <input type="submit" value="·µ»Ø " />
	</form>

  	
  </body>
</html>
