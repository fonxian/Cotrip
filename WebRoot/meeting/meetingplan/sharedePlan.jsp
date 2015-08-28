<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.cotrip.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%
     Meeting meeting=(Meeting)request.getAttribute("meeting");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会议发布系统</title>
    
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
	<SCRIPT src="js/menu.js"> </SCRIPT>
	<SCRIPT src="js/easy.js"> </SCRIPT>

  </head>
 
  <body>
   <div id="div_m">
      <jsp:include page="/meeting/meetingMenu.jsp"/>
          <div id="div_main">
  <div id="div_side">
	<%@ include file="side.inc"%>
  </div>
     <div id="div_center">
      <center>
       <%if(request.getParameter("error").equals("havaplan")){%>
           <h2>你已经有计划！</h2>
           <%}else if(request.getParameter("error").equals("fail")){%>
           <h2>参加出行计划失败！</h2>
           <%}else if(request.getParameter("error").equals("success")){%>
           <h2>参加出行计划成功！</h2>
           <%}%>
     </center>
     </div>
     </div>
     </div>
       <div id="div_footer"> Co-Trip&copy;2012-2013 </div> 
  </body>
</html>
