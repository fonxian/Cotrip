<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<script src=" http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=956167257" type="text/javascript" charset="utf-8"></script>

<script language="javascript">
	function isOut() {
		if (confirm('	'))
			return true;
		else
			return false;
	}
</script>
<script type="text/javascript"
src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="101151649" data-redirecturi="http://www.hnustcotrip.cn/" charset="utf-8"></script> 
<DIV id=menu0 class=menu>
	<DIV>
		<TABLE style="POSITION: static; FLOAT: right; VISIBILITY: visible"
			class=menu>
			<TBODY>
				<TR>
					<% Object o = session.getAttribute("curuser"); if (o != null) {
					//User curuser = (User) o; %>
					<TD id=menu8 class=top title="鎴戠殑璐︽埛" onMouseOut="Menu.hide('menu8')"><a
						href="<%=basePath%>user/index.jsp" style="text-decoration:none"><font
							color="#003399"><U>涓汉涓績</U> </font> </a></TD> <% } else { %>
					<TD id=menu8 class=top title="鐧诲綍co-trip"
						onMouseOut="Menu.hide('menu8')" bgcolor="#FFFFFF" ><a
						href="<%=basePath%>userLogin.jsp" style="text-decoration:none"><font
							color="#003399"><U>&nbsp;鐧�nbsp;褰�nbsp;</U> </font> </a></TD>
							<TD id=menu8 class=top title="閫氳繃QQ鐧诲綍co-trip">
							<span id="qqLoginBtn" align="absmiddle"></span>
<script type="text/javascript">
    QC.Login({
       btnId:"qqLoginBtn"	//鎻掑叆鎸夐挳鐨勮妭鐐筰d
});

</script>	
</TD>
<TD id=menu8 class=top title="閫氳繃鏂版氮寰崥鐧诲綍co-trip">
<span id="wb_connect_btn" align="absmiddle"></span>
<script type="text/javascript">
		WB2.anyWhere(function(W){
		W.widget.connectButton({
			id: "wb_connect_btn",	
			type:'3,2',
			callback : {
				login:function(o){	//鐧诲綍鍚庣殑鍥炶皟鍑芥暟
					alert("login: "+o.screen_name)	
				},
				logout:function(){	//閫�嚭鍚庣殑鍥炶皟鍑芥暟
					alert('logout');
				}
			}
		});
	});

	</script>	

							</TD> <% } %>
					<TD id=menu5 class=top title="鐢宠浼氳"
						onMouseOut="Menu.hide('menu5')"><a
						href="<%=basePath%>main/apply.jsp" style="text-decoration:none"><font
							color="#003399"><U>鐢宠浼氳</U> </font> </a></TD> 
					<TD id=menu7 class=top title="Co-Trip 甯姪"
						onMouseOut="Menu.hide('menu7')"><a
						href="http://kg.hnust.edu.cn" target="_blank"
						style="text-decoration:none"> <font color="#003399"><U>甯姪</U>
						</font> </a></TD> 
				</TR>
			</TBODY>
		</TABLE>
		<SPAN class=menuheading>娆㈣繋鏉ュ埌Co-Trip绯荤粺!! </SPAN>
		




	</DIV>
	<br>

	<TABLE style="POSITION: static; VISIBILITY: visible" class=menu>
		<TBODY>
			<TR>
				<TD id=menu1 class=top onMouseOver="Menu.show('menu1')"
					title="Co-Trip 棣栭〉" onmouseout="Menu.hide('menu1')"
					onclick="Menu.followLink('menu1','<%=basePath%>main/index.jsp')">绯荤粺棣栭〉</TD>
				<TD id=menu2 class=top onMouseOver="Menu.show('menu2')"
					title="Co-Trip 绯荤粺鏂伴椈" onmouseout="Menu.hide('menu2')"
					onclick="Menu.followLink('menu2','<%=basePath%>main/SystemNewsList.jsp')">绯荤粺鏂伴椈</TD>
				<TD id=menu4 class=top onMouseOver="Menu.show('menu4')"
					title="Co-Trip 绯荤粺鍏憡" onMouseOut="Menu.hide('menu4')"
					onclick="Menu.followLink('menu4','<%=basePath%>main/SystemNoticesList.jsp')">
					绯荤粺鍏憡</TD>

				<TD id=menu6 class=top onMouseOver="Menu.show('menu6')"
					title="鍏充簬 鎴戜滑" onMouseOut="Menu.hide('menu6')"
					onclick="Menu.followLink('menu6','<%=basePath%>main/about.jsp')">
					鍏充簬鎴戜滑</TD>
				<TD id=menu17 class=top onMouseOver="Menu.show('menu17')"
					title="鑱旂郴鎴戜滑" onMouseOut="Menu.hide('menu17')"
					onclick="Menu.followLink('menu17','<%=basePath%>main/contact.jsp')">
					鑱旂郴鎴戜滑</TD>
				<%  if (o != null) {
					//User curuser = (User) o; %>
					<TD id=menu18 class=top onMouseOver="Menu.show('menu18')" title="鎴戠殑璐︽埛" onMouseOut="Menu.hide('menu18')"
					onclick="Menu.followLink('menu18','<%=basePath%>user/index.jsp')">涓汉涓績</TD> <% }  %>
			</TR>
		</TBODY>
	</TABLE>
</DIV>