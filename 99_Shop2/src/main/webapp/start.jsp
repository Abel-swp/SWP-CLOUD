<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	wepapp/start.jsp <br>
	
	<%
	String viewPage = request.getContextPath() + "/result.fm";
	response.sendRedirect(viewPage);
	%>
	
	