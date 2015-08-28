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

<title>关于 Co-Trip</title>

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
				 <div class="side_title"><h2 align="center">关于我们</h2></div>
				<div id="div_content">
				  
				     
				      <p> <div><p><strong>本系统是湖南省第十届“蓝狐网络杯”大学生计算机程序设计竞赛-----应用开发类竞赛参赛作品</strong><strong>。<br />
				        <br />
				        作品名称：	基于微信的协同参会Co-Trip系统
<br />
				        <br />
				        作品类别：	Web应用软件类
 <br />
				        <br />
				       作　　者：	曾紫依、向江波、方志杰 <br />
				        <br />
				       指导老师：	文一凭、周栋<br /><br />
				       单　　位：	湖南科技大学计算机科学与工程学院</strong></p>
				       
			        </div>
			      </div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="mainfoot.inc"%>
</body>
</html>
