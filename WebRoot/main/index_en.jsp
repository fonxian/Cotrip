<%@ page language="java" import="java.util.*" pageEncoding="gbk"
	contentType="text/html;charset=gbk"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<base href="<%=basePath%>">
<title>home Co-Trip</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<LINK rel=StyleSheet type=text/css href="css/cool.css">
<link rel=stylesheet type="text/css" href="css/main.css">
<style type="text/css"></style>
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="js/easy.js"></script>
</head>

<body>
	<div id="div_m">
		<%@ include file="menu.html"%>
		<div id="div_main">
			<div id="div_side">
				<%@ include file="side.inc"%>
			</div>
			<div id="div_center">
				EasyChair is a <b>free</b> conference management system that is
				flexible, easy to use, and has many features to make it suitable for
				various conference models. It is currently probably <a
					href="users.cgi">the most commonly used conference management
					system.</a>
				<p>
					If you would like to know why you should use EasyChair for your
					conference, <a href="/images/easychair.jpg">look at this image!</a>

					<p>
						For all other questions contact <a href="http://www.voronkov.com">the
							main system developer</a>.
					</p>
				</p>
				<h3>What EasyChair Helps You to Do</h3>
				<p>EasyChair has been designed to help program chairs to cope
					with the complexity of the refereeing process. The current version
					supports</p>
				<ol>
					<li>management and monitoring of the program committee;</li>
					<li>sophisticated and flexible management of the access of PC
						members and referees to papers and conflicts of interests;</li>
					<li>automatic paper submission;</li>
					<li>paper assignment based on the preferences of PC members;</li>
					<li>list of the latest events;</li>
					<li>submission of reviews;</li>
					<li>sending email to PC members, referees and authors;</li>
					<li>monitoring email;</li>
					<li>online discussion of papers;</li>
					<li>the author response (aka rebuttal) phase, when the author
						can respond to the reviews;</li>
					<li>automatic preparation of conference proceedings</li>
				</ol>
				<p>and many other features. In fact, EasyChair is flexible
					enough to have been used for evaluating project proposals.</p>
				<h3>Supported Models</h3>
				<p>Currently, EasyChair supports two models.</p>
				<ol>
					<li>The standard model is intended for conferences having a
						single program committee. The papers are distributed among PC
						members, normally based on their preferences.</li>
					<li>The multi-track version is for conferences such as IJCAI
						having multiple tracks. Each track has its own program committee
						and one of more track chairs. This model requires a 'superchair'
						to monitor or supervize the work of the tracks.</li>
				</ol>
				<p>For each of the supported models the users can choose among
					various options to adjust the system to their requirements. For
					example, she can choose to use anonymous submissions.</p>
				<p>
					In addition to the supported models, EasyChair may offer some other
					features. For example, special features for multi-conferences are
					under implementation for <a
						href="http://www.easychair.org/FLoC-06/">FLoC 2006.</a>
				</p>
			</div>
		</div>
	</div>
	<%@ include file="mainfoot.inc"%>
</body>
</html>