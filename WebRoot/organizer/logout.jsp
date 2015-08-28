<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<%
	session.removeAttribute("organizer");
%>
<%request.setCharacterEncoding("UTF-8") ;%>
<script language="javascript">
parent.location.href="../adminLogin.jsp";
</script>
