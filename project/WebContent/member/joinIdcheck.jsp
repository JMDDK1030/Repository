<%@page import="member.memBerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창 join_IDcheck.jsp</title>

<%
	String id = request.getParameter("id");
	
	memBerDAO dao = new memBerDAO();
	
	int check = dao.idCheck(id);  
	
	if(check==1){
%>
	<script type="text/javascript">
		alert("중복된 아이디");
		location.href="join.jsp";
	</script>
<% 
		
	}else{
%>
	<script type="text/javascript">
		alert("사용가능한아이디입니다");
		window.close();
	</script>
<%
	}
%>
		
</body>
</html>
