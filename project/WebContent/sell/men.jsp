<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Mens - Moonstrosity Custom Shirts Website Template</title>
	<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
	<%-- 헤더 --%>
	<jsp:include page="../inc/top.jsp" />
	<%-- 헤더 --%>
	
	<div id="body">
		<div id="contents">
			<h1>Men</h1>
			<ul id="shirts">
				<li>
					<a href="#header"><img src="../images/men-shirt1.jpg" alt="Img"></a> <a href="#header" class="button">Add to cart</a>
					<p>
						Lorem ipsum <br> <span>&#36;19.00</span>
					</p>
				</li>
				<li>
					<a href="#header"><img src="../images/men-shirt2.jpg" alt="Img"></a> <a href="#header" class="button">Add to cart</a>
					<p>
						Venetis Velit <br> <span>&#36;21.99</span>
					</p>
				</li>
				<li>
					<a href="#header"><img src="../images/men-shirt3.jpg" alt="Img"></a> <a href="#header" class="button">Add to cart</a>
					<p>
						Pellentesque <br> <span>&#36;17.99</span>
					</p>
				</li>
			</ul>
		</div>
	</div>
		<!-- 푸터 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 -->
</body>
</html>