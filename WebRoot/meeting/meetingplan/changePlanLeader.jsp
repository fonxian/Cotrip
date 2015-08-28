<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cotrip.bean.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
 ArrayList<Response> list=(ArrayList<Response>)request.getAttribute("responseList");
String planID=request.getParameter("planID");
String userID=request.getParameter("userID");
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

  
    <script type="text/javascript" src="meeting/js/pwshare.js"></script>
		<script>
			function selected(){
			
			var selectedtag = document.getElementById("apisSelected[]");
			var selectedyan = document.getElementById("yan");
			if(selectedtag.length!=1){
				selectedyan.innerHTML="<font color='red'>× 请选择一名用户</font>";
				   return false;
				}
			  selectedtag.options[0].selected = true;
			return true;
			}
		</script>

   <body>
    <div id="div_m">
      <jsp:include page="/meeting/meetingMenu.jsp"/>
       <div id="div_main">
  <div id="div_side">
	<%@ include file="side.inc"%>
  </div>
     <div id="div_center">
     <div class="side_title"><h2 align="center">执行计划拥有者</h2></div>
<form action="updatePlanServlet?what=change&planID=<%=planID%>" method="post" onSubmit="return selected();" style="padding-left:25px;">
     <h2><span>你的计划已经被其他用户响应，请在这些用户选择一名拥有这个计划</span></h2>
      <table class="regist"  border="1px" cellpadding="5px"
						cellspacing="0px" bordercolor="#B1B1E6" style="text-align:center">
	  
      <th align="center"><span class="bright" ></span>指定用户</th><td class="right">
				<select name="allApis[]" size="10" multiple="multiple" style="width:150px">
					
					   <%for(int i=0;i<list.size();i++){
						  if(!list.get(i).getUserID().equals(userID)){%>
						<option value="<%=list.get(i).getUserID()%>"><%=list.get(i).getUsername()%>:<%=list.get(i).getEmail()%></option>
						<% }
						  }%>
				</select>
			
			</td>
			<td class="center">
				<input type="button" name="addButton" value="&nbsp;&nbsp;&raquo;&nbsp;&nbsp;" width="100" onClick="move(this.form.elements['allApis[]'], this.form.elements['apisSelected[]']);" /><br />
				<input type="button" name="removeButton" value="&nbsp;&nbsp;&laquo;&nbsp;&nbsp;" width="100" onClick="move(this.form.elements['apisSelected[]'], this.form.elements['allApis[]']);" /><br />
			</td>
			<td class="left">
				<select name="apisSelected[]" id="apisSelected[]" size="10" style="width:150px"></select>
			</td>		
			<td colspan="4" align="center"><input type="submit" value="提交"/><span id="yan"></span></td>
			
			</table>
		
		</form>
 
       
     </div>
     </div>
     </div>
     <div id="div_footer"> Co-Trip&copy;2012-2013 </div> 
  </body>
</html>
