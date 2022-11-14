<%@page import="mail.NaverSMTP"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	Map<String,String> email = new HashMap<String,String>();
	
	email.put("from", request.getParameter("from"));
	email.put("to", request.getParameter("to"));
	email.put("subject", request.getParameter("subject"));
	
	String content = request.getParameter("content");
	String format = request.getParameter("format");
	
	if(format.equals("text")){
		
		email.put("content", content);
		email.put("format", "text/plain;charset=UTF-8");
	}
	try{
		NaverSMTP smtp = new NaverSMTP();
		smtp.emailSending(email);
		out.print("전송 성공");
		
	}
	catch(Exception e){
		out.print("전송 실패");
		e.printStackTrace();
	}
	

%>
