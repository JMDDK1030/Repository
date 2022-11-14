<%@page import="board.boardDAO"%>
<%@page import="board.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	boardDAO dao = new boardDAO();
	
	int check = dao.writeDelete(request.getParameter("num"));
	 
	if(check == 1){
%>	
	<script type="text/javascript">
	
		window.alert("삭제 완료");
		location.href="board.jsp";
	</script>
<%			
	}else{
%>		
	<script type="text/javascript">
		window.alert("삭제 실패");
		history.back();
	</script>	
<%		
	}
%>

    