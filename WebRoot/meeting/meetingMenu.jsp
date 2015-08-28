
<%@page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.cotrip.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
     Meeting meeting=(Meeting)session.getAttribute("meeting");
%>
<script language="javascript">

	function isOut(){
		if (confirm('Are you Sure to quit Co-Trip System?'))
			return true;
		else
			return false;
	}
	
	
</script>
<DIV id=menu0 class=menu>
			<DIV>
				<TABLE style="POSITION: static; FLOAT: right; VISIBILITY: visible"
					class=menu>
					<TBODY>
						<TR>
							<TD id=menu7 class=top 
								title="Co-Trip Help" onMouseOut="Menu.hide('menu7')" 
								><a href="####" target="_blank" style="text-decoration:none">
								<font color="#003399"><U>帮  助</U></font></a>
							</TD><% Object o = session.getAttribute("curuser"); if (o != null) {%>
							<TD id=menu8 class=top title="我的账户" onMouseOut="Menu.hide('menu8')"><a
						href="<%=basePath%>user/index.jsp" style="text-decoration:none"><font
							color="#003399"><U>个人中心</U> </font> </a></TD> <% } else { %>
					<TD id=menu8 class=top title="登录co-trip"
						onMouseOut="Menu.hide('menu8')"><a
						href="<%=basePath%>userLogin.jsp" style="text-decoration:none"><font
							color="#003399"><U>登录</U> </font> </a></TD> <% } %>
						</TR>
					</TBODY>
				</TABLE>
				<SPAN class=menuheading>欢迎来到<font size="4" color="black"><%=meeting.getMeetingname() %></font> </SPAN>
			</DIV>
			<br>

			<TABLE style="POSITION: static; VISIBILITY: visible" class=menu>
				<TBODY>
					<TR>
						<TD id=menu1 class=top onMouseOver="Menu.show('menu1')"
							title="单个会议的详细介绍"
							onmouseout="Menu.hide('menu1')"
							onclick="Menu.followLink('menu1','<%=path%>/meetingServlet')">
							会议介绍
						</TD>
						<TD id=menu2 class=top onMouseOver="Menu.show('menu2')"
							title="您参与该会议，有“系统推荐”、“他人共享”、“已有计划”、“发布计划”选项"
							onmouseout="Menu.hide('menu2')" >
							我要参与
						</TD>
						<TD id=menu4 class=top onMouseOver="Menu.show('menu4')"
							title="您对该会议发布您的出行计划"
							onMouseOut="Menu.hide('menu4')"
							onclick="Menu.followLink('menu4','<%=path%>/planServlet?what=create')">
							我要发布
						</TD>
						
						<TD id=menu6 class=top onMouseOver="Menu.show('menu6')"
							title="您对该会议的出行计划，有且仅能有一个出行计划"
							onMouseOut="Menu.hide('menu6')"
							onclick="Menu.followLink('menu6','<%=path%>/planServlet?what=myTravelPlan')">
							我的计划
						</TD>
						<TD id=menu20 class=top onMouseOver="Menu.show('menu20')"
							title="该会议的会议新闻"
							onMouseOut="Menu.hide('menu20')"
							onclick="Menu.followLink('menu20','<%=path%>/meetingServlet?what=news')">
							会议新闻
						</TD>
						<TD id=menu9 class=top onMouseOver="Menu.show('menu9')"
							title="该会议的会议公告" onMouseOut="Menu.hide('menu9')"
							onclick="Menu.followLink('menu9','<%=path%>/meetingServlet?what=notices')">
							会议公告
						</TD>
<!--  						<TD id=menu10 class=top onMouseOver="Menu.show('menu10')"
							title="该会议的相关的一些服务信息，如：出租车相关的信息" onMouseOut="Menu.hide('menu10')"
							>
							服务信息
						</TD>
-->
						<TD id=menu11 class=top onMouseOver="Menu.show('menu11')"
							title="Co-Trip" onMouseOut="Menu.hide('menu11')"
							>
							Co-Trip
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			
			<TABLE style="Z-INDEX: 1" id=tmenu11 class=menu>
				<TBODY>
					<TR>
						<TD id=menu12 class=tab onMouseOver="Menu.show('menu12')"
							title="Co-Trip新闻" onMouseOut="Menu.hide('menu12')"
							onclick="Menu.followLink('menu10','#')">
							Co-Trip 新闻
						</TD>
					</TR>
					<TR>
						<TD id=menu13 class=tab onMouseOver="Menu.show('menu13')"
							title="您的账户信息"
							onMouseOut="Menu.hide('menu13')"
							onclick="Menu.followLink('menu13','<%=basePath%>user/MyAccount.jsp')">
							我的账号
						</TD>
					</TR>
					<TR>
						<TD id=menu14 class=tab onMouseOver="Menu.show('menu14')"
							title="您参与的所有的会议" onMouseOut="Menu.hide('menu14')"
							onclick="Menu.followLink('menu14','<%=basePath%>user/MyConferences.jsp')">
							我的会议
						</TD>
					</TR>
					<TR>
						<TD id=menu15 class=tab onMouseOver="Menu.show('menu15')"
							title="退出" onMouseOut="Menu.hide('menu15')"
							onclick="Menu.followLink('menu15','<%=basePath%>userLogout.jsp')">
							&nbsp;退     出&nbsp;
						</TD>
					</TR>
					
			
				</TBODY>
			</TABLE>
			
			<TABLE style="Z-INDEX: 1" id=tmenu2 class=menu>
				<TBODY>
					<TR>
						<TD id=menu16 class=tab onMouseOver="Menu.show('menu16')"
							title="系统推荐给您的出行计划" onMouseOut="Menu.hide('menu16')"
							onclick="Menu.followLink('menu16','<%=path%>/otherPlanServlet?what=system')">
							系统推荐
						</TD>
					</TR>
					<TR>
						<TD id=menu17 class=tab onMouseOver="Menu.show('menu17')"
							title="他人共享给您的出行计划"
							onMouseOut="Menu.hide('menu17')"
							onclick="Menu.followLink('menu17','<%=path%>/otherPlanServlet?what=onlyshared')">
							他人共享
						</TD>
					</TR>
					<TR>
						<TD id=menu18 class=tab onMouseOver="Menu.show('menu18')"
							title="所有公开的出行计划" onMouseOut="Menu.hide('menu18')"
							onclick="Menu.followLink('menu18','<%=path%>/otherPlanServlet?what=otherplan')">
							已有计划
						</TD>
					</TR>
					<TR>
						<TD id=menu19 class=tab onMouseOver="Menu.show('menu19')"
							title="发布您的出行计划" onMouseOut="Menu.hide('menu19')"
							onclick="Menu.followLink('menu19','<%=path%>/planServlet?what=create')">
							发布计划
						</TD>
					</TR>		
				</TBODY>
			</TABLE>			
		</DIV>