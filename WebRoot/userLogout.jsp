<%@ page language="java" import="java.util.*" pageEncoding="gb2312"
	contentType="text/html;charset=UTF-8"%>

<%@ page import="javax.servlet.http.HttpSession"%>
<%!public boolean logout(HttpSession session) {
		boolean bool = true;
		if (session.getAttribute("curuser") != null) {
			session.removeAttribute("curuser");
		}
		return bool;
	}%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>Logout-cotrip</title>
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
<script type="application/javascript">
var v = setTimeout(goHome,3000);
window.onload = v;

function goHome() {
	window.location = "";
}

function goError() {
	window.location = "";
}
</script>
</head>

<body>
	<%@ include file="main/menu.html"%>
	<div id="div_main">
		<div id="div_center">
			<center>
				<%
					if (logout(session)) {
				%>
				<h3>退出成功</h3>
				<%
					} else {
				%>
				<h3>退出失败</h3>
				<%
					}
				%>
			</center>
		</div>
	</div>
	<div id="div_footer">Co-Trip&copy;2012-2013</div>
</body>
</html>
