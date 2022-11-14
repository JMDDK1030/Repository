<%@page import="board.boardDTO"%>
<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
	<%
	request.setCharacterEncoding("utf-8");
	boardDAO dao = new boardDAO();
	boardDTO dto = dao.view(request.getParameter("num"));
	
	%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
	<%-- 헤더 --%>
	<jsp:include page="../inc/top.jsp" />
	<%-- 헤더 --%>
<div id="body">
	<div id="contents">
		<h1>board</h1>
		<article>
			<form action="writeSendPro.jsp" method="post">
				<table id="notice">
					<tr>
						<td>글쓴이ID</td>
						<td><input type="text" name="id" value="<%=(String) session.getAttribute("userId")%>" readonly></td>
					</tr>
					<tr>
						<td>비번</td>
						<td><input type="password" name="pass"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title"></td>
					</tr>	
					<tr>
						
						<td>답글내용</td>
						<td><textarea name="content" rows="20" cols="50"></textarea></td>
					</tr>
				</table>

				<div id="table_search">
					<input type="submit" value="답글쓰기"> 
					<input type="reset" value="다시쓰기"> 
					<input type="button" value="글목록" onclick="location.href='board.jsp'"><br> 
				</div>
			</form>
		</article>
	</div>
</div>
	<!-- 푸터들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />
	<!-- 푸터들어가는 곳 -->

</body>
</html>