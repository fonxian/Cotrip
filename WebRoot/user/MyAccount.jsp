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

<title>MyAccount Co-Trip</title>

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
<link rel="stylesheet" type=text/css href="css/citySelector.css">
<style type="text/css">
.sp {
	font-size: 10px;
	color: #999;
	background-repeat: no-repeat;
	padding-left: 14px;
	line-height: 12px;
	height: 12px;
}
.cityinput{
    border-width: 1px;
    border-style: solid;
    border-color: #666 #ccc #ccc #666;
    height: 24px;
    line-height: 24px;
    width: 175px;
    font-size: 12px;
    padding-left: 2px;
    background: url(http://img02.taobaocdn.com/tps/i2/T1EPyLXm0hXXXXXXXX-200-100.png) no-repeat 150px 5px;
}
</style>
<SCRIPT src="js/menu.js">
	
</SCRIPT>
<SCRIPT src="js/easy.js">
	
</SCRIPT>

<script type="text/javascript">
	//var test=new Vcity.CitySelector({input:'u_city'});
	var b_age = false;
	var b_username = false;
	var b_phone = false;
	var b_tel = false;
	var b_postcode = false;
	var b_address = false;
	window.onload = init;

	function init() {
		var sex = document.getElementById("u_sex");
		var v = sex.getAttribute("value");
		if (v == "男") {
			document.getElementById("sel_sex").options[1].selected  = true;
		} else if (v == "女") {
			document.getElementById("sel_sex").options[2].selected  = true;
		}
		validate();
	}

	function validate() {
		chkAge();
		chkUsername();
		chkPhone();
		chkTelnumber();
		chkPostcode();
		chkAddress();
		if(b_age&&b_username&&b_phone&&b_tel&&b_postcode&&b_address) {
			return true;
		} else {
			return false;
		}
	}

	function chkAge() {
		var reg = /^[0-9]+$/;
		var params = document.getElementById("u_age").value;
		var sp = document.getElementById("sp_age");
		if (reg.test(params)||params=="") {
			if(params <= 130 && params >= 0) {
				b_age = true;
				sp.innerHTML="";
				sp.style.backgroundImage="url(images/ok.png)";
			} else {
				b_age = false;
				sp.innerHTML="年龄只能在0~130之间";
				sp.style.backgroundImage="url(images/error.png)";
			}
		} else {
			b_age = false;
			sp.innerHTML="年龄有非法字符";
			sp.style.backgroundImage="url(images/error.png)";
		}
	}
	
	function chkUsername() {
		var params = document.getElementById("u_username").value;
		var sp = document.getElementById("sp_username");
		if (params.length > 15) {
			b_username = false;
			sp.innerHTML="姓名不能超过15个字符";
			sp.style.backgroundImage="url(images/error.png)";
		} else {
			b_username = true;
			sp.innerHTML="";
			sp.style.backgroundImage="url(images/ok.png)";
		}
	}
	
	function chkPhone() {
		var reg = /^1[3458]\d{9}$/; 
		var params = document.getElementById("u_mobnumber").value;
		var sp = document.getElementById("sp_mobnumber");
		if (params == "" || reg.test(params)) {
			b_phone = true;
			sp.innerHTML="";
			sp.style.backgroundImage="url(images/ok.png)";
		} else {
			b_phone = false;
			sp.innerHTML="手机号码有误";
			sp.style.backgroundImage="url(images/error.png)";
		}
	}
	function chkTelnumber() {
		var reg = /^[0-9]+$/; 
		var params = document.getElementById("u_telnumber").value;
		var sp = document.getElementById("sp_telnumber");
		if (params == "" || reg.test(params)) {
			b_tel = true;
			sp.innerHTML="";
			sp.style.backgroundImage="url(images/ok.png)";
		} else {
			b_tel = false;
			sp.innerHTML="座机号码有误";
			sp.style.backgroundImage="url(images/error.png)";
		}
	}
	function chkPostcode() {
		var reg = /^[0-9]+$/; 
		var params = document.getElementById("u_postcode").value;
		var sp = document.getElementById("sp_postcode");
		if (params == "" || reg.test(params)) {
			b_postcode = true;
			sp.innerHTML="";
			sp.style.backgroundImage="url(images/ok.png)";
		} else {
			b_postcode = false;
			sp.innerHTML="邮政编码有误";
			sp.style.backgroundImage="url(images/error.png)";
		}
		
	}
	function chkAddress() {
		var params = document.getElementById("u_address").value;
		var sp = document.getElementById("sp_address");
		if (params.length <= 120) {
			b_address = true;
			sp.innerHTML="";
			sp.style.backgroundImage="url(images/ok.png)";
		} else {
			b_address = false;
			sp.innerHTML="超出长度";
			sp.style.backgroundImage="url(images/error.png)";
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
				<form action="<%=basePath%>user/UserUpdate" method="post"
						onSubmit="return validate();">
				 <div id="div_center">
      <div class="side_title"><h2 align="center">我的账户</h2></div>
      <table width="100%" border="1px" cellpadding="5px"
						cellspacing="0px" bordercolor="#B1B1E6" style="text-align:center">
							<tr>
								<td style="text-align: right">邮箱(登录名)：</td>
								<td><div align="left"><%=getStr(curuser.getEmail())%> &nbsp;&nbsp;<font color="#FF0000">*</font>&nbsp;&nbsp;<span class="sp" id="sp_email">不能修改</span>
							    </div></td>
							</tr>
							<tr>
								<td style="text-align: right">用户真实姓名：</td>
							  <td><div align="left">
  <input type="text" name="username" id="u_username"
									value="<%=getStr(curuser.getUsername())%>" maxlength="15"
									onBlur="chkUsername();" readonly="readonly" />
  &nbsp;&nbsp;<font color="#FF0000">*</font>&nbsp;&nbsp;<span
									class="sp" id="sp_username"></span>
							    </div></td>
							</tr>
							<tr>
								<td style="text-align: right">年龄：</td>
							  <td><div align="left">
  <input type="text" name="age" id="u_age"
									value="<%=getStr(curuser.getAge())%>" onBlur="chkAge();"
									maxlength="3" />
  &nbsp;&nbsp;<span class="sp" id="sp_age"></span>
							    </div></td>
							</tr>
							<tr>
								<td style="text-align: right">性别：</td>
							  <td><div align="left">
								  <select id="sel_sex" name="sex">
								    <option value="">&nbsp;&nbsp;</option>
								    <option value="男">男</option>
								    <option value="女">女</option>
							    </select> 
							    <input type="hidden" id="u_sex"
									value="<%=getStr(curuser.getSex())%>" />
							    &nbsp;&nbsp;<span
									class="sp" id="sp_sex"></span>
							    </div></td>
							</tr>
							<tr>
								<td style="text-align: right">所在国家：</td>
							  <td><div align="left">
							    <input type="text" name="country" id="u_country"
									value="<%=getStr(curuser.getCountry())%>" maxlength="15" />
							    &nbsp;&nbsp;<span
									class="sp" id="sp_country"></span>
							    </div></td>
							</tr>
							<tr>
								<td style="text-align: right">所在城市：</td>
								<td>
								  <div align="left">
  <input type="text" class="cityinput" id="city" name="city" value="<%=getStr(curuser.getCity())%>">
  &nbsp;&nbsp;<span
									class="sp" id="sp_city"></span>						          </div></td>
							</tr>
							<tr>
								<td style="text-align: right">职称：</td>
							  <td><div align="left">
							    <input type="text" name="title" id="u_title"
									value="<%=getStr(curuser.getTitle())%>" maxlength="15" />
							    &nbsp;&nbsp;<span
									class="sp" id="sp_title"></span>
							    </div></td>
							</tr>
							<tr>
								<td style="text-align: right">学历：</td>
							  <td><div align="left">
							    <input type="text" name="education" id="u_education"
									value="<%=getStr(curuser.getEducation())%>" maxlength="15" />
							    &nbsp;&nbsp;<span
									class="sp" id="sp_education"></span>
							    </div></td>
							</tr>
							<tr>
								<td style="text-align: right">所在公司：</td>
							  <td><div align="left">
							    <input type="text" name="company" id="u_company"
									value="<%=getStr(curuser.getCompany())%>" maxlength="25" />
							    &nbsp;&nbsp;<span
									class="sp" id="sp_company"></span>
							    </div></td>
							</tr>
							<tr>
								<td style="text-align: right">手机号码：</td>
							  <td><div align="left">
							    <input type="text" name="mobnumber" id="u_mobnumber"
									value="<%=getStr(curuser.getMobnumber())%>" maxlength="11"
									onBlur="chkPhone();" />
							    &nbsp;&nbsp;<span class="sp"
									id="sp_mobnumber"></span>
							    </div></td>
							</tr>
							<tr>
								<td style="text-align: right">座机号码：</td>
							  <td><div align="left">
							    <input type="text" name="telnumber" id="u_telnumber"
									value="<%=getStr(curuser.getTelnumber())%>" maxlength="11"
									onBlur="chkTelnumber();" />
							    &nbsp;&nbsp;<span class="sp"
									id="sp_telnumber"></span>
							    </div></td>
							</tr>
							<tr>
								<td style="text-align: right">邮政地址：</td>
							  <td><div align="left">
								    <textarea cols="30" rows="3" name="address"
										id="u_address" onBlur="chkAddress();"><%=getStr(curuser.getAddress())%></textarea>
							    &nbsp;&nbsp;120字符以内&nbsp;&nbsp;<span
									class="sp" id="sp_address">120字符以内</span>
								</div></td>
							</tr>
							<tr>
								<td style="text-align: right">邮政编码：</td>
							  <td><div align="left">
							    <input type="text" name="postcode" id="u_postcode"
									value="<%=getStr(curuser.getPostcode())%>" maxlength="6"
									onBlur="chkPostcode()" />
							    &nbsp;&nbsp;<span class="sp"
									id="sp_postcode"></span>
							    </div></td>
							</tr>
							<tr>
								<td style="text-align: right">注册时间：</td>
								<td><div align="left"><%=getStr(curuser.getRegisttime())%>&nbsp;&nbsp;<font color="#FF0000">*</font>&nbsp;&nbsp;<span
									class="sp" id="sp_registtime">不能修改</span>
							    </div></td>
							</tr>
						</table>
						<br />
						<center>
							<input type="submit" name="submit" value="修改">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" value="重置">
						</center>
					
				</div>
				</form>
				<%
					} else {
						out.println("<center><h3 style='color:red'>尚未登录</h3></center>");
					}
				%>
			</div>
							
		</div>
	</div>
	
	<%@ include file="../main/mainfoot.inc"%>
<script src="js/citySelector.js" type="text/javascript"></script>
<script type="text/javascript">
    var test=new Vcity.CitySelector({input:'city'});
</script>
</body>
</html>
