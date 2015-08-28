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
        <td height="30" colspan="2" align="center" bgcolor="#E3E2C3"><span class="style1"> ::&nbsp; 会议组织者管理菜单&nbsp; :: </span></td>
      </tr>
      <tr align="center" bgcolor="#FFFFFF">
        <td height="22" align="center">&nbsp;</td>
        <td height="22" align="left">用户:<a href="modify_info.jsp" target="right">${organizer.managername }</a></td>
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
        <td height="26" colspan="2" class="tableonderline">&nbsp;&nbsp;&nbsp;<img src="img/ring02.gif" width="9" height="9"><strong>&nbsp;&nbsp;&nbsp; 会议信息管理</strong></td>
        </tr>
      <tr class="tableonderline">
        <td height="26" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="meetingdetail.jsp" target="right">会议信息管理</a></td>
      </tr>
       <tr align="left" bgcolor="#EDEDE1" class="tableonderline">
        <td height="26" colspan="2" class="tableonderline">&nbsp;&nbsp;&nbsp;<img src="img/ring02.gif" width="9" height="9"><strong>&nbsp;&nbsp;&nbsp;&nbsp;会议新闻/公告管理</strong></td>
        </tr>
      <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="addnews.jsp" target="right">添加会议新闻</a></td>
      </tr>
      <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="allnews.jsp" target="right">所有会议新闻</a></td>
      </tr>
      <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="addnotices.jsp" target="right">添加会议公告</a></td>
      </tr>
      <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="allnotices.jsp" target="right">所有会议公告</a></td>
      </tr>
	  <tr align="left" bgcolor="#EDEDE1" class="tableonderline">
        <td height="26" colspan="2" class="tableonderline">&nbsp;&nbsp;&nbsp;<img src="img/ring02.gif" width="9" height="9"><strong>&nbsp;&nbsp;&nbsp;&nbsp;参会人员管理</strong></td>
        </tr>
      <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="addusers.jsp" target="right">添加参会人员</a></td>
      </tr>
	  <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="allusers.jsp" target="right">所有参会人员</a></td>
      </tr>
      <tr class="tableonderline">
        <td height="26" colspan="2" bgcolor="#EDEDE1" class="tableonderline">&nbsp;&nbsp;&nbsp;<img src="img/ring02.gif" width="9" height="9"><strong>&nbsp;&nbsp;&nbsp;会议服务人员管理</strong></td>
      </tr>
      <tr class="tableonderline">
        <td height="0" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="addserver.jsp" target="right">添加会议服务人员</a></td>
      </tr>
      <tr class="tableonderline">
        <td height="0" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="allservers.jsp" target="right">所有会议服务人员</a></td>
      </tr>
	  <tr class="tableonderline">
        <td height="26" colspan="2" bgcolor="#EDEDE1" class="tableonderline">&nbsp;&nbsp;&nbsp;<img src="img/ring02.gif" width="9" height="9"><strong>&nbsp;&nbsp;&nbsp;出行服务信息管理</strong></td>
      </tr>
      <tr class="tableonderline">
        <td height="26" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="addservice.jsp" target="right">添加出行服务信息</a></td>
      </tr>
      <tr class="tableonderline">
        <td height="0" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="allservices.jsp" target="right">所有出行服务信息</a></td>
      </tr>
      
    </table></td>
  </tr>
</table>
	</body>
</html>
