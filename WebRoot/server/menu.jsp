<%@ page language="java"  contentType="text/html;charset=GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>�˵�</title>
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
		if (confirm('ȷ��Ҫ�˳�Co-Trip����ͬ�̺�̨����ϵͳ��'))
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
        <td height="30" colspan="2" align="center" bgcolor="#E3E2C3"><span class="style1">  ���������Ա����˵�&nbsp;</span></td>
      </tr>
      <tr align="center" bgcolor="#FFFFFF">
        <td height="22" align="center">&nbsp;</td>
        <td height="22" align="left">�û�:${server.name }</td>
      </tr>
      <tr align="center" bgcolor="#FFFFFF">
        <td height="22" align="center">&nbsp;</td>
        <td height="22" align="left"><a href="changeserver.jsp" target="right">�޸���Ϣ</a></td>
      </tr>
	  <tr align="center" bgcolor="#FFFFFF">
        <td height="22" align="center">&nbsp;</td>
        <td height="22" align="left"><a href="logout.jsp" target="_parent" onClick="return isOut();">��ȫ�˳���¼</a></td>
      </tr>
      
	  <tr align="left" bgcolor="#EDEDE1" class="tableonderline">
        <td height="26" colspan="2" class="tableonderline">&nbsp;&nbsp;&nbsp;<img src="img/ring02.gif" width="9" height="9"><strong>&nbsp;&nbsp;&nbsp;&nbsp;�����</strong></td>
        </tr>
      <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="allusers.jsp" target="right">�ҽӴ��������</a></td>
      </tr>
      </table></td>
  </tr>
</table>
	</body>
</html>
