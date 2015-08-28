<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
	 <base href="<%=basePath%>">
	<title>修改密码</title>
    <link href="css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style4 {font-weight: bold}
-->
</style>
<script language="javascript">
	
 	function check(){
		
		var UserPwd = document.modify_password_form.inputpwd1.value;
		var reUserPwd = document.modify_password_form.inputpwd2.value;
		
		if(document.modify_password_form.inputpwd.value ==""||document.modify_password_form.inputpwd.value ==null){
			alert("用户旧密码不能为空");	return false;
		}
	    if(UserPwd=="")
		{	alert("用户新密码不能为空");	return false;}
		if(UserPwd.length>20 || UserPwd.length<3)
		{
		alert("新密码长度错误,密码必须是3-20字符,请重新输入!");
		document.modify_password_form.inputpwd1.value ="";	document.modify_password_form.inputpwd2.value ="";
		document.modify_password_form.inputpwd1.focus();	return false;
		}
		if(reUserPwd=="")
		{	alert("请重新密码输入");	return false;}
		if (UserPwd!=reUserPwd) 
		{	alert("两次输入密码不一致！请重新输入");
			document.modify_password_form.inputpwd1.value ="";	document.modify_password_form.inputpwd2.value ="";
			document.modify_password_form.inputpwd1.focus();	return false;
		}
	}
</script>
	</head>

	<body> 
		<form name="modify_password_form" method="post" action="servlet/ModifyPassword" onSubmit="javascript:return check();">
			<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" class="tablegg">
  <tr>
    <td><table width="100%"  border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#F1F1F1">
      <tr bgcolor="#E3E2C3">
        <td height="23"><div align="center" class="style4">修改密码</div></td>
      </tr>
      <tr>
        <td height="111" valign="top">
          <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
            <tr bgcolor="#EDEDE1">
              <td height="26" colspan="3"><span class="forumRow">&nbsp;&nbsp;&nbsp;<strong>&nbsp;&nbsp;: : <span class="style4">修改密码</span> : :</strong></span></td>
            </tr>
            <tr bgcolor="#F1F1F1">
              <td height="80" colspan="3" align="left">&nbsp;&nbsp;
                <table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
                  <tr bgcolor="#F1F1F1">
                    <td width="17%" height="26" align="right">&nbsp;用户邮箱　　</td>
                    <td width="83%" height="26">${manager.manageremail }<input name="inputusr" type="hidden" class="inputbox" id="inputusr" value="${manager.manageremail }"></td>
                  </tr>
                  <tr bgcolor="#F1F1F1">
                    <td height="26" align="right">旧密码　　</td>
                    <td height="26"><input name="inputpwd" type="password" class="inputbox" id="inputpwd"></td>
                  </tr>
				  <tr bgcolor="#F1F1F1">
                    <td height="26" align="right">新密码　　</td>
                    <td height="26"><input name="inputpwd1" type="password" class="inputbox" id="inputpwd1"></td>
                  </tr>
				  <tr bgcolor="#F1F1F1">
                    <td height="26" align="right">重复密码　　</td>
                    <td height="26"><input name="inputpwd2" type="password" class="inputbox" id="inputpwd2"></td>
                  </tr>
                </table></td>
              </tr>
            <tr bgcolor="#F1F1F1">
              <td width="13%" height="26" align="center">&nbsp;</td>
              <td height="26" colspan="2" align="left"><input name="Submit" type="submit" class="inputbutton" value="修改密码"></td>
            </tr>
          </table>
       </td>
      </tr>
      <tr align="center" bgcolor="#EDEDE1">
        <td height="35" align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
    </table></td>
  </tr>
</table>
		</form>
	</body>
</html>
