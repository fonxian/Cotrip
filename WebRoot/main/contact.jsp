<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">

<title>联系我们 Co-Trip</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<LINK rel=StyleSheet type=text/css href="css/cool.css">
<link rel=stylesheet type="text/css" href="css/main.css">
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="js/easy.js"></script>
</head>

<body>
	<div id="div_m">
		<%@ include file="menu.html"%>
		<div id="div_main">
			<div id="div_side">
				<%@ include file="side.inc"%>
			</div>
			<div id="div_center">
				 <div class="side_title"><h2 align="center">联系我们</h2></div>
			  <div id="div_content"><strong>Tel:　</strong>　13170324064<br />
                  <strong>Email:</strong>　ypwen81@gmail.com <br />
                <strong>URL:</strong>　<a href="http://kpnm.hnust.cn" target="_blank"> http://kpnm.hnust.cn</a> </div>
			</div>
		</div>
	</div>
	<%@ include file="mainfoot.inc"%>
</body>
</html>
