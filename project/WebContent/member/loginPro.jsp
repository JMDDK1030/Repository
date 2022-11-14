<%@page import="member.memBerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

       <%
    	request.setCharacterEncoding("utf-8");
    	String id = request.getParameter("id");
 		String pass = request.getParameter("pass");
 		
 		int check = new memBerDAO().userCheck(id,pass);
    
 		if(check == 1){
   		session.setAttribute("userId", id);
   		response.sendRedirect("../index.jsp");
 		
 		}else if(check == 0){
 	%>
 		<script>
 			alert("비밀번호 에러");
 			history.back();
 		</script>
 	<% 		
 		}else{
 	%>
 		<script>
 			alert("없는 아이디 입니다");
 			history.back();
 		</script>
 	<% 		
 		}
    %>
    