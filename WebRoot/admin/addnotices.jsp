<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addnews.jsp' starting page</title>
    <style type="text/css">
	<!--
	
	body,td,th {
		font-size: 14px;
	}
	
	-->
	</style>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		function check()
		{
			for ( instance in CKEDITOR.instances )
			{
				CKEDITOR.instances[instance].updateElement();
			}
			var name=document.getElementById("newname").value;
			var content=document.getElementById("newcontent").value;
			if(name.trim()=="")
			{
				alert("请输入公告名称！");
				return false;
			}
			if(name.trim().length>40)
			{
				alert("公告名称太长！请输入40字符以内。");
				return false;
			}
			if(content.trim()=="")
			{
				alert("请输入公告内容！");
				return false;
			}
			if(name.trim().length>60000)
			{
				alert("公告内容太长！请输入60000字符以内。");
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
  	<form action="servlet/AddSysNewsNotices" method="post" onsubmit="return check();">
    <table border="0" align="center" cellspacing="1" bgcolor="#336699">
    <tr><th align="center" colspan="2" style="font-size: 16px;height: 30px;">添加系统公告</th></tr>
    <tr><td bgcolor="#FFFFFF">公告名</td><td bgcolor="#FFFFFF"><input name="newname" id="newname" size="60" /></td></tr>
    <tr><td bgcolor="#FFFFFF">公告内容</td><td bgcolor="#FFFFFF"><textarea name="newcontent" id="newcontent"></textarea></td></tr>
    <tr><td colspan="2" align="center"><input type="hidden" name="type" value="P"/><input type="submit" value="发布"/></td></tr>
    </table>
    </form>
    <script type="text/javascript">
		window.onload = function()
		{
			CKEDITOR.replace( 'newcontent' );
			
		};
	</script>
  </body>
</html>
