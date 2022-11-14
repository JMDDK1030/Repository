<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<% 
		//모든 세션 제거
    	session.invalidate();
    	//재요청
    	response.sendRedirect("../index.jsp");
    %>