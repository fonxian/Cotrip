<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"></base>
<title>申请会议</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
<meta http-equiv="description" content="This is my page"/>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel=StyleSheet type=text/css href="css/cool.css" />
<link rel=stylesheet type="text/css" href="css/main.css"/>
<style type="text/css"></style>
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="js/easy.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="js/Calendar5.js"></script>

<style type="text/css">
/* side */
#div_main #div_side {
	float: left;
	width: 850px;
	margin: 0px;
	padding: 0px;
}
</style>
<link rel="stylesheet" href="js/citySelector.css"/>
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
String.prototype.trim=function()
		{
			return this.replace(/(^\s*)|(\s*$)/g, ""); 
		}
		
	function check(){
		for ( instance in CKEDITOR.instances )
			{
				CKEDITOR.instances[instance].updateElement();
			}
		var managername = document.getElementById("managername").value;
		var mobnumber = document.getElementById("mobnumber").value;
		var email = document.getElementById("manageremail").value;
		var password = document.getElementById("managerpassword").value;
		var repassword = document.getElementById("remanagerpassword").value;
		var trueemail=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		
		var name=document.getElementById("meetingname").value;
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
		
		if(managername.trim()=="")
		{
			alert("会议管理员姓名不能为空！");
			return false;
		}
		if(mobnumber.trim()=="")
		{
			alert("会议管理员电话不能为空！");
			return false;
		}
		if(mobnumber.trim()!=""&&!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(mobnumber))){
				alert("会议管理员电话不是完整的11位手机号");
				return false;
		}
		if(name.trim().length>20)
		{
			alert("会议管理员姓名太长，请输入20字符以内！");
			return false;
		}
		if(email.trim()=="")
		{
			alert("请输入会议管理员邮箱");
			return false;
		}
		if(email.trim().length>40)
		{
			alert("输入会议管理员邮箱太长，请输入40字符以内");
			return false;
		}
		if(!trueemail.test(email))
		{
			alert("请输入正确会议管理员邮箱");
			return false;
		}
		if(password.trim()=="")
		{
			alert("请输入管理员密码");
			return false;
		}
		if(password.trim().length>20)
		{
			alert("输入管理员密码太长，请输入20字符以内");
			return false;
		}
		if(repassword.trim()=="")
		{
			alert("请确认管理员密码");
			return false;
		}
		if(repassword.trim()!=password.trim())
		{
			alert("两次密码不相同！");
			return false;
		}
		if(name.trim()=="")
		{
			alert("请输入会议名称！");
			return false;
		}
		if(name.trim().length>100)
		{
			alert("输入会议名称太长，请输入100字符以内！");
			return false;
		}
		if(organization.trim()=="")
		{
			alert("请输入会议组织者！");
			return false;
		}
		if(organization.trim().length>40)
		{
			alert("输入会议组织太长，请输入40字符以内！");
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
			alert("输入会议的场地太长，请输入100字符以内！");
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
			alert("请输入会议内容！");
			return false;
		}
		if(content.trim().length>60000)
		{
			alert("输入会议内容太长，请输入60000字符以内！");
			return false;
		}
		if(true)
		{
       		 var sTimeA = begintime.split('-');  
             var eTimeA = endtime.split('-');  
             var maxDate = new Date(eTimeA[0], eTimeA[1], eTimeA[2]);  
             var minDate = new Date(sTimeA[0], sTimeA[1], sTimeA[2]);  
             if (maxDate < minDate) { 
                 alert("会议开始日期不能大于结束日期");
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
			alert("输入会议联系人太长，请输入200字符以内！");
			return false;
		}
		if(remark.trim().length>200)
		{
			alert("输入会议备注太长，请输入200字符以内！");
			return false;
		}
		return true;
	}

</script>
</head>

<body>
	<div id="div_m">
		<%@ include file="menu.html"%>
		<div id="div_main" >

			

			<div id="div_side">
				<div id="div_title">
					<center>
						<h3><strong>申请会议</strong></h3>
					</center>
				</div>
				<div id="div_content">
					<form action="servlet/ApplyMeeting" method="post" onsubmit="return check();">
						<table  border="1px" cellpadding="5px"
							cellspacing="0px" bordercolor="#B1B1E6">
							<tr>
								<td align="center" colspan="2">会议管理员信息</td>
								
							</tr>
							<tr>
								<td width="20%" bgcolor="#FFFFFF" style="text-align: right"><font color="red">*</font>会议管理员姓名：</td>
								<td><input type="text" name="managername" id="managername"
									maxlength="20" />
								</td>
							</tr>
							<tr>
								<td width="20%" style="text-align: right"><font color="red">*</font>会议管理员电话：</td>
								<td><input type="text" name="mobnumber" id="mobnumber"
									maxlength="15"  />
								</td>
							</tr>
							<tr>
								<td width="20%" style="text-align: right"><font color="red">*</font>会议管理员邮箱：</td>
								<td><input type="text" name="manageremail" id="manageremail"
									maxlength="40"   />
								</td>
							</tr>
							<tr>
								<td style="text-align: right"><font color="red">*</font>会议管理员密码：</td>
								<td><input type="password" name="managerpassword" id="managerpassword"
									maxlength="20"  />
								</td>
							</tr>
							<tr>
								<td style="text-align: right"><font color="red">*</font>重复密码：</td>
								<td><input type="password" name="remanagerpassword" id="remanagerpassword"
									maxlength="20" />
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">会议信息</td>
								
							</tr>
							<tr>
								<td style="text-align: right">会议简称：</td>
								<td><input type="text" name="meetinganame" id="meetinganame"
									maxlength="40"  />
								</td>
							</tr>
							<tr>
								<td style="text-align: right"><font color="red">*</font>会议全称：</td>
								<td><input type="text" name="meetingname" id="meetingname"
									maxlength="40" />
								</td>
							</tr>
							<tr>
								<td style="text-align: right">会议网址：</td>
								<td><input type="text" name="website" id="website"  />
								</td>
							</tr>
							<tr>
								<td style="text-align: right"><font color="red">*</font>会议组织者：</td>
								<td><input type="text" name="organization" id="organization"  />
								</td>
							</tr>
							<tr>
								<td style="text-align: right"><font color="red">*</font>会议开始时间：</td>
								<td><input type="text" name="begintime" id="begintime"
									maxlength="15" readonly="readonly" onfocus="c.showMoreDay = false;c.show(this);" />
								</td>
							</tr>
							<tr>
								<td style="text-align: right"><font color="red">*</font>会议结束时间：</td>
								<td><input type="text" name="endtime" id="endtime" readonly="readonly"
									maxlength="15" onfocus="c.showMoreDay = false;c.show(this);" />
								</td>
							</tr>
							
							<tr>
								<td style="text-align: right"><font color="red">*</font>会议举办国家：</td>
								<td><input type="text" name="holdcountry" id="holdcountry"   />
								</td>
							</tr>
							<tr>
								<td style="text-align: right"><font color="red">*</font>会议举办城市：</td>
								<td><input type="text" name="holdcity" id="holdcity"  />
								</td>
							</tr>
							<tr>
								<td style="text-align: right"><font color="red">*</font>会议举办场地：</td>
								<td><input type="text" name="place" id="place"  />
								</td>
							</tr>
							<tr>
								<td style="text-align: right">会议联系人：</td>
								<td><input type="text" name="contactperson" id="contactperson"   />
								</td>
							</tr>
							<tr>
								<td style="text-align: right"><font color="red">*</font>会议简介：</td>
								<td><textarea  name="brief" id="brief"></textarea>
								</td>
							</tr>
							<tr>
								<td style="text-align: right"><font color="red">*</font>会议内容：</td>
								<td><textarea  name="content" id="content"></textarea>
								</td>
							</tr>
							<tr>
								<td style="text-align: right">备注：</td>
								<td><textarea  name="remark" id="remark"></textarea>
								</td>
							</tr>
							<tr><br />


								<td colspan="2" align="center"><input type="submit" name="submit" value="提交申请"/></td><br />


							</tr>
							
						</table>
						<br />
						
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
				</div>
			</div>
		</div>
	</div>
	<%@ include file="mainfoot.inc"%>
</body>
</html>