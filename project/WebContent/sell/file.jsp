<%@page import="board.boardDAO"%>
<%@page import="board.boardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About - Custom Shirt Web Template</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%-- 헤더 --%>
	<jsp:include page="../inc/top.jsp" />
	<%-- 헤더 --%>
	<div id="body">
		<div id="contents">
			<h1>file</h1>
			<div id="wrap">
				<article>
					<table id="notice">
						<%
							List<boardDTO> fileList = new boardDAO().downloadSelect();
							int i = 0;											
						if (fileList.isEmpty()) {
						%>
						<tr align="center">
							<td colspan="5" algin="center">등록된 게시물이 없습니다.</td>
						</tr>
						<%
							}else{
						for (boardDTO dto : fileList) {
							
							
								
							
						%>
						<tr>
							<td><img src="../filedownload/<%=dto.getFilename()%>" width="400" height="250"><br>
							<a href="<%=request.getContextPath()%>/sell/fileDownload.jsp?folder=filedownload&file=
									<%=dto.getFilename()%>">
									<%=dto.getFilename()%>(다운로드 횟수 : <%=dto.getDowncount() %>)
							</a></td>
						</tr>
						<%
							}
						}
						%>
					</table>
					<div id="table_search"></div>
					<div class="clear"></div>
					<div id="page_control">
					</div>
				</article>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<jsp:include page="../inc/bottom.jsp" />
	<!-- 푸터 -->
</body>
</html>