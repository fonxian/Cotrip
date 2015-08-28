<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.cotrip.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%
     Meeting meeting=(Meeting)request.getAttribute("meeting");
     String changeresponse=request.getParameter("changeresponse");
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
<script language="javascript" type="text/javascript">
  function success(){
	  alert("修改成功");
  }
</script>

  <style type="text/css">
<!--
.STYLE5 {font-size: 14px}
-->
  </style>
  </head>
 
  <body>
  <div id="div_m">
      <jsp:include page="/meeting/meetingMenu.jsp"/>
  <div id="div_main">
  <div id="div_side">
	<%@ include file="side.inc"%>
  </div>
     <div id="div_center">
      <div class="side_title">
      <h2 align="center"><span >会议信息</span></h2></div>
      <table width="100%" border="1px" cellpadding="5px"
						cellspacing="0px" bordercolor="#B1B1E6" style="text-align:center">
      <tr id="row1" >
	      <td style="font-weight:bold;"><div align="right"><span class="STYLE5">&nbsp;会议名:</span></div></td>
	      <td ><div align="left"><span class="STYLE5"><%=meeting.getMeetingname() %></span></div></td>
      </tr>
       <tr id="row1" >
	      <td style="font-weight:bold;"><div align="right"><span class="STYLE5">&nbsp;会议网址:</span></div></td>
	      <td ><div align="left"><span class="STYLE5"><a href="<%=meeting.getWebsite()%>" target="_blank"> <%=meeting.getWebsite() %></a></span></div></td>
      </tr>
      <tr id="row2" >
	      <td style="font-weight:bold;"><div align="right"><span class="STYLE5">&nbsp;组织者:</span></div></td>
	      <td ><div align="left"><span class="STYLE5"><%=meeting.getOrganization() %></span></div></td>
      </tr>
      <tr id="row3" >
	      <td style="font-weight:bold;"><div align="right"><span class="STYLE5">&nbsp;管理员:</span></div></td>
	      <td><div align="left"><span class="STYLE5"><%=meeting.getManagername() %></span></div></td>
      </tr>
       <tr id="row4" >
	      <td style="font-weight:bold;"><div align="right"><span class="STYLE5">&nbsp;联系人:</span></div></td>
	      <td ><div align="left"><span class="STYLE5"><%=meeting.getContactperson() %></span></div></td>
      </tr>
      <tr id="row5" >
	      <td style="font-weight:bold;"><div align="right"><span class="STYLE5">&nbsp;开始时间:</span></div></td>
	      <td ><div align="left"><span class="STYLE5"><%=meeting.getBegintime() %></span></div></td>
      </tr>
      <tr id="row6" >
	      <td style="font-weight:bold;"><div align="right"><span class="STYLE5">&nbsp;结束时间:</span></div></td>
	      <td ><div align="left"><span class="STYLE5"><%=meeting.getEndtime() %></span></div></td>
      </tr>
      <tr id="row7" >
	      <td style="font-weight:bold;"><div align="right"><span class="STYLE5">&nbsp;举办国家:</span></div></td>
	      <td ><div align="left"><span class="STYLE5"><%=meeting.getHoldcountry() %></span></div></td>
      </tr>
      <tr id="row8" >
	      <td style="font-weight:bold;"><div align="right"><span class="STYLE5">&nbsp;举办城市:</span></div></td>
	      <td ><div align="left"><span class="STYLE5"><%=meeting.getHoldcity() %></span></div></td>
      </tr>
	  <tr id="row8" >
	      <td style="font-weight:bold;"><div align="right"><span class="STYLE5">&nbsp;举办场地:</span></div></td>
	      <td ><div align="left"><span class="STYLE5"><%=meeting.getPlace() %></span></div></td>
      </tr>
      </table>
      <div class="side_title"><h2 align="center"><span style="padding-left:15px;padding-top:15px;">会议内容</span></h2>
      </div>
      <table style="padding-top:5px; clear:right;" cellspacing="0" class="ct_table" cellpadding="0"><td style="font-size:14px"><%=meeting.getContent()%></td></table>
   </div>
   </div>
   </div>
   <div id="div_footer"> Co-Trip&copy;2012-2013 </div>    
   
   <%if("success".equals(changeresponse)){ %>
      <script language="javascript">success();</script>
   <%} %>
  </body>
</html>
