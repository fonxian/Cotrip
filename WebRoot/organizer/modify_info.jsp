<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
	 <base href="<%=basePath%>">
	<title>修改信息</title>
    <link href="css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style4 {font-weight: bold}
-->
</style>
<script language="javascript">
	
 	function check(){
		
		var name = document.getElementById("name").value;
		var mobnumber = document.getElementById("mobnumber").value;
		
		if(name.trim()=="")
		{
			alert("姓名不能为空！");
			return false;
		}
		if(mobnumber.trim()=="")
		{
			alert("电话不能为空！");
			return false;
		}
		if(mobnumber.trim()!=""&&!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(mobnumber))){
				alert("不是完整的11位手机号");
				return false;
		}
		if(name.trim().length>20)
		{
			alert("姓名太长，请输入20字符以内！");
			return false;
		}
		return true;
	}
	String.prototype.trim=function()
		{
			return this.replace(/(^\s*)|(\s*$)/g, ""); 
		}
</script>
	</head>

	<body> 
		<form name="modify_password_form" method="post" action="servlet/ModifyInfo" onSubmit="return check();">
			<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" class="tablegg">
  <tr>
    <td><table width="100%"  border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#F1F1F1">
      <tr bgcolor="#E3E2C3">
        <td height="23"><div align="center" class="style4">修改信息</div></td>
      </tr>
      <tr>
        <td height="111" valign="top">
          <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
            <tr bgcolor="#EDEDE1">
              <td height="26" colspan="3"><span class="forumRow">&nbsp;&nbsp;&nbsp;<strong>&nbsp;&nbsp;: : <span class="style4">修改信息</span> : :</strong></span></td>
            </tr>
            <tr bgcolor="#F1F1F1">
              <td height="80" colspan="3" align="left">&nbsp;&nbsp;
                <table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
                  <tr bgcolor="#F1F1F1">
                    <td height="26" align="right">姓名　　</td>
                    <td height="26"><input name="name" type="text" class="inputbox" id="name" value="${organizer.managername }"></td>
                  </tr>
				  <tr bgcolor="#F1F1F1">
                    <td height="26" align="right">电话　　</td>
                    <td height="26"><input name="mobnumber" type=text class="inputbox" id="mobnumber" value="${organizer.mobnumber }">
                    <input name="mID" type=hidden  id="mID" value="${organizer.managerID}">
                    </td>
                  </tr>
                </table></td>
              </tr>
            <tr bgcolor="#F1F1F1">
              <td width="13%" height="26" align="center">&nbsp;</td>
              <td height="26" colspan="2" align="left"><input name="Submit" type="submit"  value="修改"></td>
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
