<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.cotrip.bean.User"%>

<%!public String getStr(String str) {
		if (str == null || str.equalsIgnoreCase("null")) {
			return "";
		} else {
			return str;
		}
	}%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>ChangePassword Co-Trip</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<LINK rel=StyleSheet type=text/css href="css/cool.css">
<LINK rel=StyleSheet type=text/css href="css/main.css">
<style type="text/css">
.sp {
	font-size: 10px;
	color: #999;
	background-repeat: no-repeat;
	padding-left: 14px;
	line-height: 12px;
	height: 12px;
}
</style>
<SCRIPT src="js/menu.js">
	
</SCRIPT>
<SCRIPT src="js/easy.js">
	
</SCRIPT>

<script type="text/javascript">
	var b_oldpass = false;
	var b_newpass = false;
	var b_newpass2 = false;

	function validate() {
		chkOldPW();
		chkNewPW();
		chkNewPW2();
		if(b_oldpass&&b_newpass&&b_newpass2) {
			return true;
		} else {
			return false;
		}
	}
	
	function chkOldPW() {
		var params = document.getElementById("u_oldpass").value;
		var sp = document.getElementById("sp_oldpass");
		var filter=/^\s*[.A-Za-z0-9_-]{5,20}\s*$/;
		if(params.length < 5 || params.length > 20) {
			b_oldpass = false;
			sp.innerHTML="密码长度5~20个字符";
			sp.style.backgroundImage="url(images/error.png)";
		} else {
			if (!filter.test(params)) {
				b_oldpass = false;
				sp.innerHTML="可使用的字符为（字母，数字, _,-),长度5~20个字符";
				sp.style.backgroundImage="url(images/error.png)";
			} else {
				b_oldpass = true;
				sp.innerHTML="";
				sp.style.backgroundImage="url(images/ok.png)";
			}
		}
	}
	
	function chkNewPW() {
		var params = document.getElementById("u_newpass").value;
		var sp = document.getElementById("sp_newpass");
		var filter=/^\s*[.A-Za-z0-9_-]{5,20}\s*$/;
		if(params.length < 5 || params.length > 20) {
			b_newpass = false;
			sp.innerHTML="密码长度5~20个字符";
			sp.style.backgroundImage="url(images/error.png)";
		} else {
			if (!filter.test(params)) {
				b_newpass = false;
				sp.innerHTML="可使用的字符为（字母，数字, _,-),长度5~20个字符";
				sp.style.backgroundImage="url(images/error.png)";
			} else {
				b_newpass = true;
				sp.innerHTML="";
				sp.style.backgroundImage="url(images/ok.png)";
			}
		}
	}
	
	function chkNewPW2() {
		var params = document.getElementById("u_newpass2").value;
		var sp = document.getElementById("sp_newpass2");
		var filter=/^\s*[.A-Za-z0-9_-]{5,20}\s*$/;
		if(params.length < 5 || params.length > 20) {
			b_newpass2 = false;
			sp.innerHTML="密码长度5~20个字符";
			sp.style.backgroundImage="url(images/error.png)";
		} else {
			if (!filter.test(params)) {
				b_newpass2 = false;
				sp.innerHTML="可使用的字符为（字母，数字, _,-),长度5~20个字符";
				sp.style.backgroundImage="url(images/error.png)";
			} else {
				b_newpass2 = true;
				sp.innerHTML="";
				sp.style.backgroundImage="url(images/ok.png)";
			}
		}
	}
</script>

</head>

<body>
	<div id="div_m">
		<%@ include file="menu.html"%>
		<div id="div_main">
			<div id="div_side">
				<%@ include file="side.inc"%>
			</div>
			
				<%
					Object o = session.getAttribute("curuser");
					if (o != null) {
						User curuser = (User) o;
				%>
				<form action="<%=basePath%>user/ChangePassword" method="post"
						onSubmit="return validate();">
			 <div id="div_center">
      <div class="side_title"><h2 align="center">修改密码</h2></div>
      <table width="100%" border="1px" cellpadding="5px"
						cellspacing="0px" bordercolor="#B1B1E6" style="text-align:center">
					
						
							<tr>
								<td width="20%" style="text-align: right">原密码：</td>
							  <td><div align="left">
							    <input type="password" name="oldpass" id="u_oldpass"
									maxlength="20" onBlur="chkOldPW()" />
							    &nbsp;&nbsp;<span
									class="sp" id="sp_oldpass"></span>
							    </div></td>
							</tr>
							<tr>
								<td style="text-align: right">新密码：</td>
							  <td><div align="left">
							    <input type="password" name="newpass" id="u_newpass"
									maxlength="20" onBlur="chkNewPW()" />
							    &nbsp;&nbsp;<span
									class="sp" id="sp_newpass"></span>
							    </div></td>
							</tr>
							<tr>
								<td style="text-align: right">确认新密码：</td>
							  <td><div align="left">
							    <input type="password" name="newpass2" id="u_newpass2"
									maxlength="20" onBlur="chkNewPW2()" />
							    &nbsp;&nbsp;<span
									class="sp" id="sp_newpass2"></span>
							    </div></td>
							</tr>
						</table>
						<br />
						<center>
							<input type="submit" name="submit" value="确定修改">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value="重置">
						</center>
		  </form>
				</div>
				<%
					} else {
						out.println("<center><h3 style='color:red'>尚未登录</h3></center>");
					}
				%>
			</div>
		</div>
	</div>
	<div id="div_footer">Co-Trip&copy;2012-2013</div>
</body>
</html>
