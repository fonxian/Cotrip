<%@ page language="java"  contentType="text/html;charset=GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>菜单</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
}
.style2 {color: #FF0000}
-->
</style>
<script language="javascript">

	function isOut(){
		if (confirm('确定要退出Co-Trip会议同程后台管理系统吗？'))
			return true;
		else
			return false;
	}
	
	
</script>
	</head>

	<body>
	<table width="145" border="0" align="center" cellpadding="0" cellspacing="0" class="tablegg">
  <tr>
    <td width="239"><table width="145"  border="0" align="center" cellpadding="0" cellspacing="1">
      <tr>
        <td height="30" colspan="2" align="center" bgcolor="#E3E2C3"><span class="style1"> : :&nbsp; 总管理员管理菜单&nbsp; : : </span></td>
      </tr>
      <tr align="center" bgcolor="#FFFFFF">
        <td height="22" align="center">&nbsp;</td>
        <td height="22" align="left">用户:<a href="modify_info.jsp" target="right">${manager.managername }</a>
          </td>
      </tr>
      <tr align="center" bgcolor="#FFFFFF">
        <td height="22" align="center">&nbsp;</td>
        <td height="22" align="left"><a href="modify_password.jsp" target="right">修改密码</a></td>
      </tr>
	  <tr align="center" bgcolor="#FFFFFF">
        <td height="22" align="center">&nbsp;</td>
        <td height="22" align="left"><a href="logout.jsp" target="_parent" onClick="return isOut();">安全退出登录</a></td>
      </tr>
      <tr align="left" bgcolor="#EDEDE1" class="tableonderline">
        <td height="26" colspan="2" class="tableonderline">&nbsp;&nbsp;&nbsp;<img src="img/ring02.gif" width="9" height="9"><strong>&nbsp;&nbsp;&nbsp; 系统信息管理</strong></td>
        </tr>
      <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="addnews.jsp" target="right">添加系统新闻</a></td>
      </tr>
      <tr class="tableonderline">
        <td height="26" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="allnews.jsp" target="right">系统新闻管理</a></td>
      </tr>
      <tr class="tableonderline">
        <td height="26" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="addnotices.jsp" target="right">添加系统公告</a></td>
      </tr>
      <tr class="tableonderline">
        <td height="26" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="allnotices.jsp" target="right">系统公告管理</a></td>
      </tr>
      
	    <tr align="left" bgcolor="#EDEDE1" class="tableonderline">
        <td height="26" colspan="2" class="tableonderline">&nbsp;&nbsp;&nbsp;<img src="img/ring02.gif" width="9" height="9"><strong>&nbsp;&nbsp;&nbsp;&nbsp;会议管理</strong></td>
        </tr>
      <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="allnewmeetings.jsp" target="right">待审核会议</a></td>
      </tr>
      <tr class="tableonderline">
        <td height="26" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="allpassmeetings.jsp" target="right">所有会议</a></td>
      </tr>
      <tr class="tableonderline">
        <td height="26" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="allblackmeetings.jsp" target="right">黑名单会议</a></td>
      </tr>
       <tr align="left" bgcolor="#EDEDE1" class="tableonderline">
        <td height="26" colspan="2" class="tableonderline">&nbsp;&nbsp;&nbsp;<img src="img/ring02.gif" width="9" height="9"><strong>&nbsp;&nbsp;&nbsp;&nbsp;注册用户管理</strong></td>
        </tr>
      <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="allusers.jsp" target="right">所有注册用户</a></td>
      </tr>
      <tr class="tableonderline">
        <td height="26" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="blackusers.jsp" target="right">黑名单用户</a></td>
      </tr>
	  <tr align="left" bgcolor="#EDEDE1" class="tableonderline">
        <td height="26" colspan="2" class="tableonderline">&nbsp;&nbsp;&nbsp;<img src="img/ring02.gif" width="9" height="9"><strong>&nbsp;&nbsp;&nbsp;&nbsp;系统数据库管理</strong></td>
        </tr>
      <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="backupDB.jsp" target="right">备份系统数据库</a></td>
      </tr>
      <tr class="tableonderline">
        <td height="26" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="recoveryDB.jsp" target="right" >恢复系统数据库</a></td>
      </tr>
    </table></td>
  </tr>
</table>
	</body>
</html>
