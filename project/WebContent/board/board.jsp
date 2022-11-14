<%@page import="board.boardPage"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="board.boardDAO"%>
<%@page import="board.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	boardDAO dao = new boardDAO();

	Map<String, Object> param = new HashMap<String, Object>();
	//검색
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	if (searchWord != null) {
	
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	//페이징
	int totalCount = dao.selectCount(param);
	
	int pageSize = Integer.parseInt(application.getInitParameter("PAGES_PER_PAGE"));
	int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
	
	int totalPage = (int) (Math.ceil((double) totalCount / pageSize));
	
	int pageNum = 1;
	
	String pageTemp = request.getParameter("pageNum");
	
	if (pageTemp != null && !pageTemp.equals("")) {
	
		pageNum = Integer.parseInt(pageTemp);
	
	}
	
	int start = (pageNum - 1) * pageSize + 1;
	int end = pageNum * pageSize;
	
	param.put("start", start);
	param.put("end", end);
	
	List<boardDTO> list = dao.boardList(param);
	
	
%>
<!DOCTYPE html>	
<html>
<head>
<meta charset="UTF-8">
<title>Blog - Moonstrosity Custom Shirts Website Template</title>
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/style.css" type="text/css">

</head>
<body>
	<%-- 헤더 --%>
	<jsp:include page="../inc/top.jsp" />
	<%-- 헤더 --%>
	<div id="body">
		<div id="contents">
			<h1>board</h1>
			<div id="wrap">

				<article>
					<h2>
						총 조회글:<%=totalCount%></h2>
					<table id="notice">	
						<%
							if (list.isEmpty()) {
						%>
						<tr align="center">
							<td colspan="5" algin="center">등록된 게시물이 없습니다.</td>
						</tr>
						<%
							} else {
								int virtualNum = 0;//화면상에서의 게시물 번호

								int countNum = 0;
							
								for (boardDTO dto : list) {

									virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
				
						%>
							<tr align="center">
								<th>이미지</th>
								<th>글제목</th>
								<th>글작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
							<tr align="center">

									<td><img src="../filedownload/<%=dto.getFilesource()%>" width="400" height="300"></td>
									<td><a href="view.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a></td>
									<td><%=dto.getId()%></td>
									<td><%=dto.getPostdate()%></td>
									<td><%=dto.getVisitcount()%></td>

								</tr>
				
						<%
							
							}
						}
						%>
					</table>

					<div id="table_search">
						<form action="board.jsp" method="post">
							<select name="searchField">
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select> <input type="text" name="searchWord" class="input_box">
							<input type="submit" value="검색" >
						</form>
					</div>

					<div id="table_search">
						<%
							if ((String) session.getAttribute("userId") != null) {
						%>
						<input type="button" value="글쓰기" 
							onclick="location.href='write.jsp'">
						<%
							}
						%>
					</div>
					<div class="clear"></div>
					<div id="page_control">
					<%=boardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI())%>
					</div>
				
				</article>
				

			</div>
			<div id="main"></div>
		</div>
	</div>

	<div class="clear"></div>
	</div>

	<!-- 푸터들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />
	<!-- 푸터들어가는 곳 -->

</body>
</html>