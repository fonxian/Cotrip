<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>Co-Trip用户主页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<LINK rel=StyleSheet type=text/css href="css/cool.css">
<LINK rel=StyleSheet type=text/css href="css/main.css">
<SCRIPT src="js/menu.js">
	
</SCRIPT>
<SCRIPT src="js/easy.js">
	
</SCRIPT>

</head>

<body>

	<div id="div_m">
		<%@ include file="menu.html"%>
		<div id="div_main">
			<div id="div_side">
				<%@ include file="side.inc"%>
			</div>
			<div id="div_center"><p><strong>本系统是湖南省第十届“蓝狐网络杯”大学生计算机程序设计竞

赛-----应用开发类竞赛参赛作品</strong><strong>。</strong></p>
              <p>    “Co-Trip”的主要目的是为具有相同出发地与目的地的参会人员提供一同出行方面的信息服务，实现促

进同行之间的交流，同时方便会议服务人员的接待工作。 </p>
              <p>    参会人员在注册后，可进行出行计划的管理，即：可通过发布自己的出行计划（主要包括出发地与目的

地，出发与到达时间范围等信息），形成同行  方案，并吸引其它愿意一同出行的参会人员参与；也可通过共享自己的出行计划给部

分参会人员，形成同行方案。会议组织者也可根据参会人员的出行计划情况，推  荐形成同行方案。 </p>
              <p>    参会人员在注册后，也可进行同行信息的管理，即：可察看并参与上述三种同行方案，还可进一步通过

Email与其它有同行意向的参会人员进行交流。 </p>
              <p>    会议组织者通过了解这些同行方案，可更好的安排会议服务人员做好接待工作。 <br />
              </p>
              <p><strong>系统主要运转过程 </strong></p>
              <p align="justify">     会议组织者完成用户注册后，通过Email向系统管理员申请会议管理资格，获得批准

后，系统管理员在系统中建立“会议名称”等相关记录。<br />
                <br />
                参会人员完成用户注册后，可针对系统中存在的相关“会议”进行出行计划管理、同行信息管理、出行服务信息浏

览等操作。<br />
  <br />
                会议组织者在系统管理员授权后，可针对系统中已有可管理的“会议”进行同行信息管理、出行服务信息管理等操

作。<br />
  <br />
                系统管理员可进行会议注册、会议信息维护、系统用户管理等操作。</p>
              <div>
                <p><strong><br />
                  注意：</strong>当您注册“Co-Trip”后，主办方就认为您已同意将自己的一些通讯信息，共享给与自己同路来

参加会议的人。 </p>
              </div>
            </div>
		</div>
	</div>
	<%@ include file="../main/mainfoot.inc"%>

	
</body>
</html>