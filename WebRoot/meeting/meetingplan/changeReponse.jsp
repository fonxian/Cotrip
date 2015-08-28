<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cotrip.bean.*" %>
<%@ page import="com.cotrip.daoimp.ResponseImp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
   Date currentTime = new java.util.Date();//得到当前系统时间 
   String str_date1 = formatter.format(currentTime); //将日期时间格式化 

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
  
<script language="javascript" type="text/javascript">

    //姓名验证
      var nameFlag=false;
	 function checkname(){
		 var name=document.getElementById("username").value;
		 var nameMsg=document.getElementById("nameyan");
		 if(name==""){//用户名是否为空
		    nameFlag=false;
		    nameMsg.innerHTML="<font color='red'>× 请填写姓名</font>";
		 }
		 else if(name.length<2){//用户名是否小于6为
		    nameFlag=false;
		    nameMsg.innerHTML="<font color='red'>× 姓名不能小于2位</font>";
		  }
		 else if(name.length>16){//用户名是否大于16为
		    nameFlag=false;
		    nameMsg.innerHTML="<font color='red'>× 姓名不能大于16位</font>";
		  }
		 else{
		    nameFlag=true;
		    nameMsg.innerHTML="<font color='green'>√</font>";
		 }
		}

	//验证E-mail
	 var emailFlag=false;
	 function checkEmail(){
	  var email=document.getElementById("email").value;
	  var emailMsg=document.getElementById("emailyan");
	  if(email==""){
	     emailFlag=false;
	     emailMsg.innerHTML="<font color='red'>× 请填写电子邮箱</font>";
	  }else if(!/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(email)){ //使用正则表达式验证
	     emailFlag=false;
	     emailMsg.innerHTML="<font color='red'>× 电子邮箱格式不正确</font>";
	  }else{
	     emailFlag=true;
	     emailMsg.innerHTML="<font color='green'>√</font>";
	  }
	 }
     //验证电话
     var numberFlag=false;
	 function checkNumber(){
		 var number=document.getElementById("number").value;
		 var numberMsg=document.getElementById("numberyan");	      
		     if(!(/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/.test(number))){
		    	 numberFlag=false;
		    	 numberMsg.innerHTML="<font color='red'>× 不是正确的11位手机号或者正确的固话</font>";
		     }else{
		    	 numberFlag=true;
		    	 numberMsg.innerHTML="<font color='green'>√</font>";
		     }
		 }
	 
	
	 	 
	 //整体验证
	 function Validation(){
	 	checkname();
	 	checkEmail();
	 	checkNumber();
		 if(nameFlag&&emailFlag&&numberFlag&&methodFlag&&overaddressFlag&&startaddressFlag&&timeFlag ){
			    return true;
			 }else{
			    alert("您的信息不完整！");
			    return false;
			 }
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
     <div class="side_title">
      <h2 align="center"><span >修改响应</span></h2></div>
       <form name="form1" method="post" action="<%=path%>/otherPlanServlet?what=changeReponse"  onsubmit="return Validation();" style="padding-left:25px;">
           <input type="hidden" name="planid" value="<%= request.getParameter("planid")%>">
           <table class="regist"  border="1px" cellpadding="5px"
						cellspacing="0px" bordercolor="#B1B1E6" style="text-align:center">
           <tr>
             <td align="left"><div align="right"><font color="red">*</font>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</div></td>
             <td align="left"><div align="left">
               <input type="text" id="username" name="username"  value="${user.username }" >
             <span id="nameyan"></span></div></td>
           </tr>
           <tr>
             <td align="left"><div align="right"><font color="red">*</font>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</div></td>
             <td align="left"><div align="left">
               <input type="text" id="email" name="email"  value="${user.email }" >
             <span id="emailyan"></span></div></td>
           </tr>
           <tr>
             <td align="left"><div align="right"><font color="red">*</font>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:</div></td>
             <td align="left"><div align="left">
               <input type="text" id="number" name="number"  value="${user.mobnumber }" >
             <span id="numberyan"></span></div></td>
           </tr>
           <tr>
             <td align="left"><div align="right">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</div></td>
             <td align="left"><div align="left">
               <input type="textarea" id="remark" name="remark">
             </div></td>
           </tr>
           <tr>
             <td align="left"><div align="right">公&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开:</div></td>
             <td align="left"><div align="left">
               <select id="status" name="status" size="1">
                 <option value="Y">共享</option>
                 <option value="N">不共享</option>
                </select>
             </div></td>
           </tr>
           <tr>
           <td colspan="2" style="padding-left:100px;">
	           <input type="submit" name="submit" value="提交">
	           &nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value="重置">           </td>
           </tr>
           </table>
       </form>
       </div>
       </div>
       </div>
       
      <div id="div_footer"> Co-Trip&copy;2012-2013 </div> 
  </body>
</html>
