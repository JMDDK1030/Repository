<%@page import="member.memBerDAO"%>
<%@page import="member.memBerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pass =	request.getParameter("pass");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp");
	String address = request.getParameter("address");

	memBerDTO dto = new memBerDTO(id,pass,name,email,hp,address,null);

	memBerDAO dao = new memBerDAO();
	
	int result = dao.modifyPro(dto);
	  
	if(result == 1){
%>	
	<script>
		alert("수정 성공");
		location.href="logmodify.jsp";
	</script>
<% 			
	}else{
%>		
	<script>
		alert("수정 실패");
		history.back();
	</script>
<% 		
	}
 
%>
    