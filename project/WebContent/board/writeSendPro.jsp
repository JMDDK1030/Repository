<%@page import="board.boardDAO"%>
<%@page import="board.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	request.setCharacterEncoding("utf-8");
	
	String fileRealName = null;
	String fileName = null;

	boardDTO dto = new boardDTO();
	boardDAO dao = new boardDAO();

	dto.setNum(request.getParameter("num"));
	dto.setId((String)session.getAttribute("userId"));
	dto.setPass(request.getParameter("pass"));
	dto.setTitle(request.getParameter("title"));
	dto.setContent(request.getParameter("content"));
	
	
	dao.insertReply(dto); 
	
%>  
	<script>
		location.href="board.jsp";
	</script>  
    