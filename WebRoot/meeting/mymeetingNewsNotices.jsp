<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.cotrip.bean.*" %>
<%@ page import="com.cotrip.daoimp.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    HttpSession se=request.getSession(true);
    String meetingID=(String)se.getAttribute("meetingID");
    String type,tp;
    if(request.getParameter("type").equals("N")){
       type="新闻";
       tp="N";
    }else{
       type="公告"; 
       tp="P";
    }
    
    int pageSize=10;//一页大小
 	int pageNow=1;//显示第几页
 	
 	//动态接受pageNow
	String spageNow=request.getParameter("spageNow");
    if(spageNow!=null)
    	pageNow=Integer.parseInt(spageNow);
    	
    MeetingNewsNoticesImp MMIL=new MeetingNewsNoticesImp(pageNow,pageSize,tp);
    ArrayList<MeetingNewsNotices> list;
        list=MMIL.getMeetingAllNewsNotices(meetingID,pageNow,pageSize,tp);
 	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会议发布系统</title>
    
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
	<SCRIPT src="js/menu.js"> </SCRIPT>
	<SCRIPT src="js/easy.js"> </SCRIPT>
	
<script language="javascript" type="text/javascript">
function open(obj){
	window.open("meeting/NewsNoticesInfo.jsp?mnnID="+obj,"_self");
}
 
</script>
  </head>
 
  <body>
   <div id="div_m">
      <jsp:include page="/meeting/meetingMenu.jsp"/>
      <div id="div_main">
  <div id="div_side">
	<%@ include file="side.inc"%>
  </div>
     <div id="div_center">
      <div class="side_title">
         <%if(tp.equals("N")){%>
          <h2 align="center">会议新闻</h2>
        <% }else {%>
          <h2 align="center">会议公告</h2>
        <%} %>
        </div>
      	  <table width="100%" border="1px" cellpadding="5px"
						cellspacing="0px" bordercolor="#B1B1E6" style="text-align:center">
		<tr>
		<th align="center"  width="35%">标    题</th><th width="48%" >发布时间</th>
		<th width="17%" >查 看</th>
		</tr>
		<% for(int i=0;i<list.size();i++)
		     {
			MeetingNewsNotices meetingNewsNotices=list.get(i);%>
     		
			<tr>
			<td ><a href=meeting/NewsNoticesInfo.jsp?mnnID=<%=meetingNewsNotices.getMnnID()%>><%=meetingNewsNotices.getMnnname()%></a></td>
			<td ><%=meetingNewsNotices.getMnntime()%></td>
			<td align="center"><a href=meeting/NewsNoticesInfo.jsp?mnnID=<%=meetingNewsNotices.getMnnID()%>>查看</a></td>
			</tr>
     	<%}%>
</table>

    <table align="right">
      <tr align="center">
       <td >
       <% if(pageNow!=1){%>
        <a href=meeting/mymeetingNewsNotices.jsp?spageNow=<%=(pageNow-1)%>&type=<%=tp%>>上一页</a>
       <%}else {%>
           上一页 
           <%}%>
        <%for(int i=pageNow;i<=pageNow+4&&i<=MMIL.getpageCount();i++){%>
         <a href=meeting/mymeetingNewsNotices.jsp?spageNow=<%=i%>&type=<%=tp%>><%=i%></a>
        <%}%>
        <%if(pageNow!=MMIL.getpageCount()){%>
       	<a href=meeting/mymeetingNewsNotices.jsp?spageNow=<%=(pageNow+1)%>&type=<%=tp%>>下一页</a><br>
       <%}else {%>
               下一页
        <%}%>
       </td>
       </tr>
        <tr>
        <td>
        <form action=meeting/mymeetingNewsNotices.jsp?type=<%=type%> style="padding-left:40px;"  method=post>
        <input type=text name=spageNow>
        <input type=submit value=转到>
        </form>
        </td>
         </tr>   
      </table>
      </div>
      </div>
      </div>
        <div id="div_footer"> Co-Trip&copy;2012-2013 </div>    
  </body>
</html>
