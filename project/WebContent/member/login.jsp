<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css" type="text/css">

 <script type="text/javascript">
 
 	function checkFrom(form) {
		
 		if (!form.id.value) {
			alert("아이디를 입력하세요");
			return false;
		}
 		if (form.pass.value == "") {
			alert("비밀번호를 입력하세요");
			return false;
		}
	}
 
 </script>
 
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- 헤더 -->
<div id="body">
	<div id="wrap">

		<article>
			<h1>Login</h1>
			<form action="loginPro.jsp" id="join" method="post" name="loginFrm" onsubmit="return checkFrom(this);">
				<fieldset style="height: 100px">
					<legend>Login Info</legend>
					<table style="align:center;">
						<tr>
							<td>User Id</td> 
							<td><input type="text" name="id"><br><br></td>
						</tr>
						<tr>	
							<td>Password</td> 
							<td><input type="password" name="pass"><br></td>
						</tr>
					</table>
				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<input type="submit" value="로그인" class="submit"> <input type="reset" value="취소" class="cancel">
				</div>
			</form>
		</article>
		
		<div class="clear"></div>
	</div>
</div>	
		<!-- 푸터 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터 -->
</body>
</html>
