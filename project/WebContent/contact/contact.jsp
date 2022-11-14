<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Contact - Moonstrosity Custom Shirts Website Template</title>
	<link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
	<%-- 헤더 --%>
	<jsp:include page="../inc/top.jsp" />
	<%-- 헤더 --%>
	
	<div id="body">
		<div id="contents">
			<h1>Contact</h1>
			<div id="sidebar">
				<h4>Contact Information</h4>
				<ul class="contacts">
					
				</ul>
			</div>
			<div id="main">
				<h4 class="uppercase">Get in touch with us</h4>
				<form action="contactPro.jsp" method="post" id="contacts">
					<table>
						<tbody>
							<tr>
								<td><label>Email Send:</label></td>
								<td><input type="text" name="from" value=""></td>
							</tr> <tr>
								<td><label>Email receive:</label></td>
								<td><input type="text" name="to" value=""></td>
							</tr> <tr>
								<td><label>title:</label></td>
								<td><input type="text" name="subject" value=""></td>
							</tr> <tr>
								<td><label>Message:</label></td>
								<td><textarea name="content"></textarea></td>
							</tr> 
							<tr>
									<td><label>Text:</label><input type="radio" name="format" value="text" checked="checked"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="" class="button"></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
		<!-- 푸터 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 -->

</body>
</html>