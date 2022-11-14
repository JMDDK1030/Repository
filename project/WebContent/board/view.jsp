<%@page import="java.util.List"%>
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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	function check() {

		var real = window.confirm("글을 삭제하시겠습니까?")

		if (real) {
			$(".frm").submit();
		}
	}
</script>

<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
	<%-- 헤더 --%>
	<jsp:include page="../inc/top.jsp" />
	<%-- 헤더 --%>
<div id="body">
	<div id="contents">
		<article>
			<h1>게시판 글정보</h1>
			<form class="frm" action="writeModifyDeletePro.jsp">

				<div id="table_search">
				
				<input type="hidden" name="num" value="<%=dto.getNum()%>">
				 <input type="hidden" name="ref" value="<%=dto.getRef()%>"/>
				 <input type="hidden" name="step" value="<%=dto.getStep()%>"/>
				 <input type="hidden" name="depth" value="<%=dto.getDepth()%>"/>

					<%
						String userID = (String) session.getAttribute("userId");

					//로그인을 한사람의 아이디가 글제목을 클릭한 사람의 조회된 아이디랑 같다면?
					if (userID != null && userID.equals(dto.getId())) {
					%>
					<input type="button" value="글수정" 
						onclick="location.href='writeModify.jsp?num=<%=dto.getNum()%>'">
					<input type="hidden" name="num" value="<%=dto.getNum()%>">
					<input type="button" value="글삭제" id="buon"
						onclick="check()">
					<%
						}else if(userID != null && !userID.equals(dto.getId())){
					%>
					<input type="button" value="답글달기" onclick="location.href='writeSend.jsp?num=<%=dto.getNum()%>'">
					<%
						}
					%>
					<input type="button" value="글목록"
						onclick="location.href='board.jsp'">
					
				
				</div>
			</form>
			<table id="notice">
				<tr>
					<td><img src="../filedownload/<%=dto.getFilesource()%>" width="750" height="450"></td>
				</tr>
				
				<tr>
					<td>글번호</td>
					<td><%=dto.getNum()%></td>
					<td>조회수</td>
					<td><%=dto.getVisitcount()%></td>
				</tr>
				<tr>
					<td>글작성자</td>
					<td><%=dto.getId()%></td>
					<td>작성일</td>
					<td><%=dto.getPostdate()%></td>
				</tr>
				<tr>
					<td>글제목</td>
					<td colspan="3"><%=dto.getTitle()%></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td colspan="5"><%=dto.getContent()%></td>
				</tr>
			
			</table>

		</article>
	</div>
</div>	
	<!-- 본문들어가는 곳 -->
	<div class="clear"></div>

	<!-- 푸터들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />
	<!-- 푸터들어가는 곳 -->

</body>
</html>