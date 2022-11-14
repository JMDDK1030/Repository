<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Moonstrosity Custom Shirts Website Template</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
	<div id="header">
		<div>
		<%
			if((String)session.getAttribute("userId") == null){
		%>
			
			<div id="navigation">
				<div class="infos">
					<a href="index.jsp">Cart</a> <a href="index.jsp">0 items</a>
				</div>
				<div>
					<a href="member/login.jsp">Login</a> <a href="member/join.jsp">Register</a>
				</div>
		<% 
				}else{
		%>			
			<div id="navigation">
				<div class="infos">
					<a href="index.jsp">Cart</a> <a href="index.jsp">0 items</a>
				</div>
				<div>
					<a href="member/logout.jsp">Logout</a> <a href="member/logmodify.jsp"><%=(String)session.getAttribute("userId") %></a>
				</div>
		<% 			
				}
		%>	
				<ul id="primary">
					<li class="selected">
						<a href="index.jsp"><span>Home</span></a>
					</li>
					<li>
						<a href="sell/men.jsp"><span>Men</span></a>
					</li>
						<li>
						<a href="sell/women.jsp"><span>Women</span></a>
					</li>
				</ul>
				<ul id="secondary">
				
					<li>
						<a href="board/board.jsp"><span>board</span></a>
					</li>
						<li>
						<a href="sell/file.jsp"><span> file</span></a>
					</li>
					<li>
						<a href="contact/contact.jsp"><span>Contact</span></a>
					</li>
				</ul>
			</div>
			<a href="index.jsp" id="logo"><img src="images/logo.png" alt="LOGO"></a>
		</div>
	</div>
	<div id="adbox">
		<h1>Hot Shirts for this Month</h1>
		<ul>
			<li>
				<a href=""><img src="images/men-shirt1.jpg" alt="Img"></a>
			</li>
			<li>
				<a href=""><img src="images/woman-shirt1.jpg" alt="Img"></a>
			</li>
			<li>
				<a href=""><img src="images/men-shirt2.jpg" alt="Img"></a>
			</li>
		</ul>
	</div>
	<div id="body">
		<div id="contents">
			<ul id="articles">
				<li>
					<h1>Why Us?</h1>
					<p>
						This website template has been designed by <a href="http://www.freewebsitetemplates.com/">Free Website Templates</a> for you, for free. You can replace all this text with your own text.
					</p>
					<a href="" class="more">Read More</a>
				</li>
				<li>
					<h1>On Sale</h1>
					<p>
						You can remove any link to our website from this website template, you're free to use this website template without linking back to us.
					</p>
					<a href="" class="more">View All</a>
				</li>
				<li>
					<h1>Get a Quote</h1>
					<p>
						If you're having problems editing this website template, then don't hesitate to ask for help on the <a href="http://www.freewebsitetemplates.com/forums/">Forum</a>.<br><br>
					</p>
					<a href="" class="more">Request</a>
				</li>
			</ul>
		</div>
	</div>
	<div id="footer">
		<div class="background">
			<div class="body">
				<div class="subscribe">
					<h3>Get Weekly Newsletter</h3>
					<form action="index.html" method="post">
						<input type="text" value="" class="txtfield">
						<input type="submit" value="" class="button">
					</form>
				</div>
				<div class="posts">
					<h3>Latest Post</h3>
					<p>
						Integer sit amet erat at nulla sodales fermentum vel quis mi. <br> Morbi bibendum <a href="#header">...</a> <span>12/05/2011</span>
					</p>
				</div>
				<div class="connect">
					<h3>Follow Us:</h3>
					<a href="http://freewebsitetemplates.com/go/facebook/" target="_blank" class="facebook"></a> <a href="http://freewebsitetemplates.com/go/twitter/" target="_blank" class="twitter"></a> <a href="http://freewebsitetemplates.com/go/googleplus/" target="_blank" class="googleplus"></a>
				</div>
			</div>
		</div>
		<span id="footnote"> <a href="index.html">Moonstrosity Custom Shirts</a> &copy; 2012 | All Rights Reserved.</span>
	</div>
</body>
</html>