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
        <td height="30" colspan="2" align="center" bgcolor="#E3E2C3"><span class="style1"> ::&nbsp; ������֯�߹���˵�&nbsp; :: </span></td>
      </tr>
      <tr align="center" bgcolor="#FFFFFF">
        <td height="22" align="center">&nbsp;</td>
        <td height="22" align="left">�û�:<a href="modify_info.jsp" target="right">${organizer.managername }</a></td>
      </tr>
      <tr align="center" bgcolor="#FFFFFF">
        <td height="22" align="center">&nbsp;</td>
        <td height="22" align="left"><a href="modify_password.jsp" target="right">�޸�����</a></td>
      </tr>
	  <tr align="center" bgcolor="#FFFFFF">
        <td height="22" align="center">&nbsp;</td>
        <td height="22" align="left"><a href="logout.jsp" target="_parent" onClick="return isOut();">��ȫ�˳���¼</a></td>
      </tr>
      <tr align="left" bgcolor="#EDEDE1" class="tableonderline">
        <td height="26" colspan="2" class="tableonderline">&nbsp;&nbsp;&nbsp;<img src="img/ring02.gif" width="9" height="9"><strong>&nbsp;&nbsp;&nbsp; ������Ϣ����</strong></td>
        </tr>
      <tr class="tableonderline">
        <td height="26" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="meetingdetail.jsp" target="right">������Ϣ����</a></td>
      </tr>
       <tr align="left" bgcolor="#EDEDE1" class="tableonderline">
        <td height="26" colspan="2" class="tableonderline">&nbsp;&nbsp;&nbsp;<img src="img/ring02.gif" width="9" height="9"><strong>&nbsp;&nbsp;&nbsp;&nbsp;��������/�������</strong></td>
        </tr>
      <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="addnews.jsp" target="right">��ӻ�������</a></td>
      </tr>
      <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="allnews.jsp" target="right">���л�������</a></td>
      </tr>
      <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="addnotices.jsp" target="right">��ӻ��鹫��</a></td>
      </tr>
      <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="allnotices.jsp" target="right">���л��鹫��</a></td>
      </tr>
	  <tr align="left" bgcolor="#EDEDE1" class="tableonderline">
        <td height="26" colspan="2" class="tableonderline">&nbsp;&nbsp;&nbsp;<img src="img/ring02.gif" width="9" height="9"><strong>&nbsp;&nbsp;&nbsp;&nbsp;�λ���Ա����</strong></td>
        </tr>
      <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="addusers.jsp" target="right">��Ӳλ���Ա</a></td>
      </tr>
	  <tr class="tableonderline">
        <td width="26" height="26" align="center" class="tableonderline">&nbsp;</td>
        <td width="116" height="26" class="tableonderline"><a href="allusers.jsp" target="right">���вλ���Ա</a></td>
      </tr>
      <tr class="tableonderline">
        <td height="26" colspan="2" bgcolor="#EDEDE1" class="tableonderline">&nbsp;&nbsp;&nbsp;<img src="img/ring02.gif" width="9" height="9"><strong>&nbsp;&nbsp;&nbsp;���������Ա����</strong></td>
      </tr>
      <tr class="tableonderline">
        <td height="0" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="addserver.jsp" target="right">��ӻ��������Ա</a></td>
      </tr>
      <tr class="tableonderline">
        <td height="0" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="allservers.jsp" target="right">���л��������Ա</a></td>
      </tr>
	  <tr class="tableonderline">
        <td height="26" colspan="2" bgcolor="#EDEDE1" class="tableonderline">&nbsp;&nbsp;&nbsp;<img src="img/ring02.gif" width="9" height="9"><strong>&nbsp;&nbsp;&nbsp;���з�����Ϣ����</strong></td>
      </tr>
      <tr class="tableonderline">
        <td height="26" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="addservice.jsp" target="right">��ӳ��з�����Ϣ</a></td>
      </tr>
      <tr class="tableonderline">
        <td height="0" align="center" class="tableonderline">&nbsp;</td>
        <td height="26" class="tableonderline"><a href="allservices.jsp" target="right">���г��з�����Ϣ</a></td>
      </tr>
      
    </table></td>
  </tr>
</table>
	</body>
</html>
