<%@page import="member.memBerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	memBerDAO dao = new memBerDAO();
	
	dao.deletemodify((String)session.getAttribute("userId")); 

	session.invalidate();
%>
    <script type="text/javascript">
		alert("탈퇴 되었습니다.");
		location.href="../index.jsp";
	</script>