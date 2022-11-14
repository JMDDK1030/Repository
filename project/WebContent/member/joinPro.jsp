<%@page import="java.sql.Date"%>
<%@page import="member.memBerDAO"%>
<%@page import="member.memBerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//한글화
	request.setCharacterEncoding("utf-8");
	
	//내장객체에 저장되있는 정보 꺼낸오기
	String id = request.getParameter("id");
	String pass =	request.getParameter("pass");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp");
	String address = request.getParameter("address");
	
	//입력한 정보 DB에 insert 하기
	//DTO 객체 생성에 저장
	memBerDTO dto = new memBerDTO(id,pass,name,email,hp,address,null);
	
	memBerDAO dao = new memBerDAO();
			
	int result = dao.insert(dto);
	
	if(result == 1){
%>	
	<script>
		alert("회원가입 완료되었습니다");
		location.href="login.jsp";
	</script>
<% 			
	}else{
%>		
	<script>
		alert("회원가입에 실패하였습니다");
		history.back();
	</script>
<% 		
	}
 
%>
