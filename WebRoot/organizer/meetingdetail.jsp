<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="mine" uri="Myfunction" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<c:choose>
	<c:when test="${not empty meeting}">
		<c:set var="m" value="${mine:getMeetingByID(meeting.meetingID)}"></c:set>
	</c:when>
</c:choose>
<html>
<head>
<base href="<%=basePath%>">
<title>Co-Trip首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="js/Calendar5.js"></script>
<link rel="stylesheet" href="js/citySelector.css">
    <style type="text/css">
        .cityinput{
            border-width: 1px;
            border-style: solid;
            border-color: #666 #ccc #ccc #666;
            height: 24px;
            line-height: 24px;
            width: 175px;
            font-size: 12px;
            padding-left: 2px;
            background: url(http://img02.taobaocdn.com/tps/i2/T1EPyLXm0hXXXXXXXX-200-100.png) no-repeat 150px 5px;
            }
    </style>
<script type="text/javascript">
        var c = new Calendar("c");
        document.write(c);
</script>
<script type="text/javascript">
		function check()
		{
			for ( instance in CKEDITOR.instances )
			{
				CKEDITOR.instances[instance].updateElement();
			}
			var name=document.getElementById("meetinganame").value;
			var organization=document.getElementById("organization").value;
			var begintime=document.getElementById("begintime").value;
			var endtime=document.getElementById("endtime").value;
			var holdcountry=document.getElementById("holdcountry").value;
			var holdcity=document.getElementById("holdcity").value;
			var place=document.getElementById("place").value;
			var brief=document.getElementById("brief").value;
			var content=document.getElementById("content").value;
			var meetinganame=document.getElementById("meetinganame").value;
			var website=document.getElementById("website").value;
			var contactperson=document.getElementById("contactperson").value;
			var remark=document.getElementById("remark").value;
			
			var strRegex = "^((https|http|ftp|rtsp|mms)?://)"  
	        + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" //ftp的user@  
	        + "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184  
	        + "|" // 允许IP和DOMAIN（域名）
	        + "([0-9a-z_!~*'()-]+\.)*" // 域名- www.  
	        + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名  
	        + "[a-z]{2,6})" // first level domain- .com or .museum  
	        + "(:[0-9]{1,4})?" // 端口- :80  
	        + "((/?)|" // a slash isn't required if there is no file name  
	        + "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";  
	       var re=new RegExp(strRegex);  
	      
			
			if(name.trim()=="")
			{
				alert("请输入名称！");
				return false;
			}
			if(name.trim().length>100)
			{
				alert("输入名称太长，请输入100字符以内！");
				return false;
			}
			if(organization.trim()=="")
			{
				alert("请输入组织者！");
				return false;
			}
			if(organization.trim().length>40)
			{
				alert("输入组织太长，请输入40字符以内！");
				return false;
			}
			if(begintime.trim()=="")
			{
				alert("请输入会议召开时间！");
				return false;
			}
			if(endtime.trim()=="")
			{
				alert("请输入会议结束时间！");
				return false;
			}
			if(holdcountry.trim()=="")
			{
				alert("请输入会议所在国家！");
				return false;
			}
			if(holdcountry.trim().length>40)
			{
				alert("输入国家太长，请输入40字符以内！");
				return false;
			}
			if(holdcity.trim()=="")
			{
				alert("请输入会议所在城市！");
				return false;
			}
			if(holdcity.trim().length>40)
			{
				alert("输入城市太长，请输入40字符以内！");
				return false;
			}
			if(place.trim()=="")
			{
				alert("请输入会议所在场地！");
				return false;
			}
			if(place.trim().length>100)
			{
				alert("输入会议所在场地太长，请输入100字符以内！");
				return false;
			}
			if(brief.trim()=="")
			{
				alert("请输入会议简介！");
				return false;
			}
			if(brief.trim().length>200)
			{
				alert("输入会议简介太长，请输入200字符以内！");
				return false;
			}
			if(content.trim()=="")
			{
				alert("请输入内容！");
				return false;
			}
			if(content.trim().length>60000)
			{
				alert("输入内容太长，请输入60000字符以内！");
				return false;
			}
			if(true)
			{
        		 var sTimeA = begintime.split('-');  
	             var eTimeA = endtime.split('-');  
	             var maxDate = new Date(eTimeA[0], eTimeA[1], eTimeA[2]);  
	             var minDate = new Date(sTimeA[0], sTimeA[1], sTimeA[2]);  
	             if (maxDate < minDate) { 
	                 alert("开始日期不能大于结束日期");
	                 return false;  
	             } 
        	}
        	 if (website.trim()!=""&&!re.test(website)){
	       		alert("会议网址无效，请输入有效网址！");
	           return false;  
	        }

			if(meetinganame.trim().length>40)
			{
				alert("输入会议简称太长，请输入40字符以内！");
				return false;
			}
			if(contactperson.trim().length>200)
			{
				alert("输入联系人太长，请输入200字符以内！");
				return false;
			}
			if(remark.trim().length>200)
			{
				alert("输入备注太长，请输入200字符以内！");
				return false;
			}
			
			return true;
		}
		
		
		String.prototype.trim=function()
		{
			return this.replace(/(^\s*)|(\s*$)/g, ""); 
		}
	</script>
<style type="text/css">
	<!--
	
	body,td,th {
		font-size: 14px;
	}
	
	-->
</style>
<!-- CuFon ends -->
</head>
<body>
    <form action="servlet/ChangeMeeting" method="post" onSubmit="return check();">
      <table border="0" align="center" cellspacing="1" bgcolor="#336699" width="80%">
      	<tr><th align="center" colspan="2" height="30px">${m.meetingname }的信息</th></tr>
      	<tr><th bgcolor="#FFFFFF">会议简称：</th><td bgcolor="#FFFFFF"><input type="text" name="meetinganame" id="meetinganame" value="${m.meetinganame }" /></td></tr>
      	<tr><th bgcolor="#FFFFFF"><font color="red">*</font>会议全称：</th><td bgcolor="#FFFFFF"><input type="text" name="meetingname" id="meetingname" value="${m.meetingname }" readonly="readonly"/></td></tr>
      	<tr><th bgcolor="#FFFFFF">会议网址：</th><td bgcolor="#FFFFFF"><input type="text" name="website" id="website" value="${m.website }"/></td></tr>
      	<tr><th bgcolor="#FFFFFF"><font color="red">*</font>组织者：</th><td bgcolor="#FFFFFF"><input type="text" id="organization" name="organization" value="${m.organization}" readonly="readonly"/></td></tr>
      	<tr><th bgcolor="#FFFFFF"><font color="red">*</font>开始时间：</th><td bgcolor="#FFFFFF"><input onFocus="c.showMoreDay = false;c.show(this);" type="text" name="begintime" id="begintime" value="${m.begintime }" readonly="readonly"/></td></tr>
      	<tr><th bgcolor="#FFFFFF"><font color="red">*</font>结束时间：</th><td bgcolor="#FFFFFF"><input onFocus="c.showMoreDay = false;c.show(this);" type="text" name="endtime" id="endtime" value="${m.endtime }" readonly="readonly" /></td></tr>
      	<tr><th bgcolor="#FFFFFF"><font color="red">*</font>所在国家：</th><td bgcolor="#FFFFFF"><input type="text" name="holdcountry" id="holdcountry" value="${m.holdcountry }"/></td></tr>
      	<tr><th bgcolor="#FFFFFF"><font color="red">*</font>所在城市：</th>
      	  <td bgcolor="#FFFFFF"><input type="text" name="holdcity" id="holdcity" value="${m.holdcity }"/></td>
      	</tr>
		<tr><th bgcolor="#FFFFFF"><font color="red">*</font>所在场地：</th>
      	  <td bgcolor="#FFFFFF"><input type="text" name="place" id="place" value="${m.place }"/></td>
      	</tr>
      	<tr><th bgcolor="#FFFFFF">会议联系人：</th><td bgcolor="#FFFFFF"><textarea name="contactperson" id="contactperson" >${m.contactperson }</textarea></td></tr>
      	<tr><th bgcolor="#FFFFFF"><font color="red">*</font>会议简介：</th><td bgcolor="#FFFFFF"><textarea name="brief" id="brief">${m.brief }</textarea></td></tr>
      	<tr><th bgcolor="#FFFFFF"><font color="red">*</font>会议内容：</th><td bgcolor="#FFFFFF"><textarea name="content" id="content" cols="" rows="">${m.content}</textarea></td></tr>
      	<tr><th bgcolor="#FFFFFF">备注：</th><td bgcolor="#FFFFFF"><textarea name="remark" id="remark">${m.remark}</textarea><input type="hidden" name="meetingID" value="${m.meetingID}" /></td></tr>
      	<tr><td align="center" colspan="2"><input type="submit" value="修改"/></td></tr>
      </table>
</form>
	<script type="text/javascript">
		window.onload=function(){
			CKEDITOR.replace("content");
			
			
		}
	</script>
	<script src="js/citySelector.js" type="text/javascript"></script>
	<script type="text/javascript">
	    var test=new Vcity.CitySelector({input:'holdcity'});
	</script>
</body>
</html>
