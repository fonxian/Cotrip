
<%@ page language="java"  pageEncoding="utf-8"%>
<%@ page import="com.cotrip.daoimp.*"%>
<%@ page import="com.cotrip.bean.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<ul>

	<!-- 最新会议列表 -->
	<%
	ArrayList<Meeting> meetings11 = new ArrayList<Meeting>();
	MeetingImp mi11 = new MeetingImp();
	meetings11 = mi11.queryNewMettings();
	
	%>
	<li>
		<div class="side_title">
			<h3 style="margin: 0px;">&nbsp;&nbsp;最新会议列表</h3>
		</div>
		<div class="side_content side_font">
				<%
							if (meetings11.isEmpty()) {
				%>
				<center>暂时没有新的会议！</center>
				<%
							} else {
								out.println("<table>");
								out.println("<tr><td>会议名称</td><td>开始时间</td></tr>");
								
								for (int i = 0; i < meetings11.size(); i++) {
									out.println("<tr>");
									out.println("<td><a href='user/meeting.jsp?id="
											+ meetings11.get(i).getMeetingID() + "'>");
									if(meetings11.get(i).getMeetingname().length()>=20)	
										if(meetings11.get(i).getMeetinganame().length()>=4&&meetings11.get(i).getMeetinganame().length()<=20)	
											out.println(meetings11.get(i).getMeetinganame() + "</a></td><td>"+meetings11.get(i).getBegintime()+"</td>");
										else
											out.println(meetings11.get(i).getMeetingname().substring(0,19) + "</a></td><td>"+meetings11.get(i).getBegintime()+"</td>");
									else
											out.println(meetings11.get(i).getMeetingname() + "</a></td><td>"+meetings11.get(i).getBegintime()+"</td>");
									out.println("</tr>");
								}
								out.println("</table>");
							}
							
							
				%>
		</div>
	</li>
	<!--  -->
	<!-- 搜索会议 -->
	<li>
		<div class="side_title">
			<h3 style="margin: 0px;">&nbsp;&nbsp;搜索会议</h3>
		</div>
		<div class="side_content side_font">
			<form action="user/search.jsp" method="get">
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
	    <strong>Tel:　</strong>　13170324064<br /> 
	    <strong>Email:</strong>　ypwen81@gmail.com <br /> 
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
