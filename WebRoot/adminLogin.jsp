<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>会议同程Co-Trip系统网站后台管理登录</title>
<link type="text/css" href="css/css.css" rel="stylesheet" >
<style type="text/css">
<!--
.STYLE1 {
	color: #FFFFFF;
	font-weight: bold;
}
.STYLE6 {color: #FFFFFF; font-weight: bold; font-size: 14px; }
-->
</style>
<script language="javascript">
    
	
 	function check(){
		if(document.login.username.value==""){
			alert("用户名不能为空");
			
			return false;
		}
		if(document.login.username.value.length>=20||document.login.username.value.length<3){
			alert("用户长度错误,密码必须是3-20字符,请重新输入!");
			
			return false;
		}
		
		if(document.login.password.value==""){
			alert("密码不能为空");
			
			return false;
		}
		if(document.login.password.value.length>=20||document.login.password.value.length<3){
			alert("密码长度错误,密码必须是3-20字符,请重新输入!");
			
			return false;
		}
		if(document.login.role.value=="3"){
			alert("管理员级别未选定!");
			return false;
		}
	}
</script>

</head>

<body>
<%request.setCharacterEncoding("utf-8") ;%>
<br>
<br>
<table width="46%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3"><table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" align="right"><img src="img/line1.gif" width="1" height="30"></td>
        <td height="30" bgcolor="#000066"><span class="STYLE6">会议同程Co-Trip系统网站后台管理登录 </span></td>
        <td height="30"><img src="img/line1.gif" width="1" height="30"></td>
      </tr>
      <tr>
        <td width="46" height="4" bgcolor="#FF6600"></td>
        <td width="420" height="4" bgcolor="#FF6600"></td>
        <td width="134" height="4" bgcolor="#FF6600"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="46" height="91" bgcolor="#F1F1F1">&nbsp;</td>
    <td width="420" align="center" bgcolor="#F1F1F1">
    <form name="login" method="post" action="servlet/AdminLogin" onSubmit="javascript:return check();">
     <br>
      <table width="110%"  border="0" cellpadding="0" cellspacing="1">
        <tr class="tableonderline">
          <td width="25%" height="26" align="center"  class="tableonderline"><strong> 用户邮箱</strong></td>
          <td width="75%"  height="26"  class="tableonderline"><input name="username" type="text" class="inputbox" id="username" style="width:220px;"></td>
        </tr>
        <tr class="tableonderline">
          <td height="26" align="center"  class="tableonderline"><strong>密　码</strong></td>
          <td height="26"  class="tableonderline"><input name="password" type="password" class="inputbox" id="password" style="width:220px;"></td>
        </tr>
		<tr class="tableonderline">
          <td height="26" align="center"  class="tableonderline"><strong>级　别</strong></td>
          <td height="26"  class="tableonderline"><select name="role" id="role" style="width:220px;" >
                    <option value="0">系统管理员</option>
                    <option value="1">会议组织者</option>
                    <option value="2">会议接待人员</option>
                  	 <option value="3"  selected="selected">未选定</option>
                  </select></td>
        </tr>
         <tr>
          <td height="26" colspan="2" align="center"  class="tableonderline"><input name="Submit" type="submit" class="inputbutton" value="　登录　">
              <input name="Submit" type="reset" class="inputbutton" value="　重填　">
            　</td>
          </tr>
      </table>
    </form></td>
    <td width="134" bgcolor="#F1F1F1">&nbsp;<br><br><br><br><br><br><a href="userLogin.jsp"><strong>返回到网站首页</strong></a><br></td>
  </tr>
  <tr>
    <td height="30" align="center" bgcolor="#000066">&nbsp;</td>
    <td height="30" align="center" bgcolor="#000066"><span class="STYLE1">湖南科技大学知识网格实验室&nbsp;&nbsp;版权所有</span><BR></td>
    <td height="30" align="center" bgcolor="#000066">&nbsp;</td>
  </tr>
</table>
</body>
</html>
