<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<ul>
	<!-- 搜索会议 -->
	<li>
		<div class="side_title">
			<h3 style="margin: 0px;">&nbsp;&nbsp;搜索会议</h3>
		</div>
		<div class="side_content side_font">
			<form action="meeting/searchMeeting.jsp" method="get">
				<input class="side_font" type="text" name="searchKey" /> <input
					type="submit" name="submit" value="搜索" />
			</form>
		</div>
	</li>
	<!-- 搜索计划 -->
	<li>
		<div class="side_title">
			<h3 style="margin: 0px;">&nbsp;&nbsp;搜索计划</h3>
		</div>
		<div class="side_content side_font">
			<form action="meeting/searchPlan.jsp" method="get">
				<input class="side_font" type="text" name="searchKey" /> <input
					type="submit" name="submit" value="搜索" />
			</form>
		</div>
	</li>
	<!--  -->
	<li>
		<div class="side_title">
			<h3 style="margin: 0px;">&nbsp;&nbsp;联系我们</h3>
		</div>
		<div class="side_content side_font">
	    <strong>Tel:　</strong>　13873239148<br /> 
	    <strong>Email:</strong>　ljx529@gmail.com <br /> 
		<strong>URL:</strong>　 <a href="http://kpnm.hnust.cn" target="_blank">http://kpnm.hnust.cn</a> <br />
		</div>
	</li>
	<!-- 
	<li>
		<div class="side_title">
			<h3 style="margin: 0px;">&nbsp;&nbsp;建议</h3>
		</div>
		<div class="side_content side_font">
			<form action="#" method="get">
				<input class="side_font" type="text" name="searchKey" /> <input
					type="submit" name="submit" value="submit" />
			</form>
		</div></li>
		 -->
</ul>
