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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

	function checkpass(form) {
		
		if($(".pass").val() == ""){
			alert("비밀번호를 입력해주세요");
			return false;
		}
	}

</script>


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
		<h1>게시판 글 수정</h1>
		<article>
			<form action="writeModifyPro.jsp" 
			      method="post" onsubmit="return checkpass(this);" enctype="multipart/form-data" >
				
				<%-- <input type="hidden">태그를 이용해 updatePro.jsp요청시
				     <input>태그 디자인 노출 X   value속성에 적힌 값만?  request에 포함시켜서 전송!
				 --%>
				<input type="hidden" name="num" value="<%=dto.getNum()%>">
					
				<table id="notice">
					<tr>
						<td>글수정자</td>
						<td><input type="text" name="name" value="<%=(String) session.getAttribute("userId")%>" readonly></td>
					</tr>
					<tr>
						<td>글비밀번호</td>
						<td><input type="password" name="pass" class="pass"></td>
					</tr>	
					
					<tr>
						<td>이미지 업로드</td>
						<td><input type="file" name="file"></td>
					</tr>			
					
					<tr>
						<td>글제목</td>
						<td><input type="text" name="title" value="<%=dto.getTitle()%>"></td>
					</tr>
					<tr>
						<td>글내용</td>
						<td><textarea name="content" rows="13" cols="40"><%=dto.getContent()%></textarea></td>
					</tr>				
									
				</table>
				<div id="table_search">			
					<input type="submit" value="글수정" class="btn">
					<input type="reset" value="다시작성" class="btn">	
					<input type="button" value="글목록" class="btn" onclick="location.href='board.jsp'" >
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