<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
	 <base href="<%=basePath%>">
	<title>系统数据库备份</title>
    <link href="css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style4 {font-weight: bold}
-->
</style>

	</head>

	<body> 
		<form  method="post" action="servlet/BackupDB" >
			<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="1" class="tablegg">
  <tr>
    <td><table width="100%"  border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#F1F1F1">
      <tr bgcolor="#E3E2C3">
        <td height="23"><div align="center" class="style4">备份系统数据库</div></td>
      </tr>
      <tr>
        <td height="111" valign="top">
          <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
            <tr bgcolor="#EDEDE1">
              <td height="26" colspan="3"><span class="forumRow">&nbsp;&nbsp;&nbsp;<strong>&nbsp;&nbsp;<span class="style4">备份的系统数据库信息如下：</span> </strong></span></td>
            </tr>
            <tr bgcolor="#F1F1F1">
              <td height="80" colspan="3" align="left">&nbsp;&nbsp;
                <table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
                  <tr bgcolor="#F1F1F1">
                    <td width="17%" height="26" align="right">&nbsp;数据库名称　　</td>
                    <td width="83%" height="26">cotrip1</td>
                  </tr>
                  <tr bgcolor="#F1F1F1">
                    <td height="26" align="right">数据库安装bin目录　　</td>
                    <td height="26">E:\MySQL Server 5.1\bin</td>
                  </tr>
				  <tr bgcolor="#F1F1F1">
                    <td height="26" align="right">数据库用户名　　</td>
                    <td height="26">root</td>
				  </tr>
				  <tr bgcolor="#F1F1F1">
                    <td height="26" align="right">数据库密码　　</td>
                    <td height="26">kg901</td>
                  </tr>
				  <tr bgcolor="#F1F1F1">
                    <td height="26" align="right">备份好的数据库地址　　</td>
                    <td height="26">E:\cotripData</td>
                  </tr>
                </table></td>
              </tr>
            <tr bgcolor="#F1F1F1">
              <td width="13%" height="26" align="center">&nbsp;</td>
              <td height="26" colspan="2" align="left"><input name="Submit" type="submit" class="inputbutton" value="备份数据库" onclick="javascript:if(confirm('备份系统数据库，是否备份？')){return true}else{return false;}"></td>
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
