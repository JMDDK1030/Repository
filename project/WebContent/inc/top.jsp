<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
					<a href="../member/login.jsp">Login</a> <a href="../member/join.jsp">Register</a>
				</div>
		<% 
				}else{
		%>			
			<div id="navigation">
				<div class="infos">
					<a href="index.jsp">Cart</a> <a href="index.jsp">0 items</a>
				</div>
				<div>
					<a href="../member/logout.jsp">Logout</a> <a href="../member/logmodify.jsp"><%=(String)session.getAttribute("userId") %></a>
				</div>
		<% 			
				}
		%>	
				<ul id="primary">
					<li class="selected">
						<a href="../index.jsp"><span>Home</span></a>
					</li>
					<li>
						<a href="../sell/men.jsp"><span>Men</span></a>
					</li>
					<li>
						<a href="../sell/women.jsp"><span>Women</span></a>
					</li>
				</ul>
				<ul id="secondary">
					<li>
						<a href="../board/board.jsp"><span>board</span></a>
					</li>
					<li>
						<a href="../sell/file.jsp"><span> file</span></a>
					</li>
					<li>
						<a href="../contact/contact.jsp"><span>Contact</span></a>
					</li>
				</ul>
			</div>
			<a href="../index.jsp" id="logo"><img src="../images/logo.png" alt="LOGO"></a>
		</div>
	</div>

