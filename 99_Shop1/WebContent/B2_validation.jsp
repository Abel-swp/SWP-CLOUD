<%@page import="project.HealthyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	HealthyDao dao = HealthyDao.getInstance();
	
	boolean validation = dao.Validation(id); 
	
	String str = "";
	if(validation == true){
		str = "NO";
		out.print(str);
	} else {
		str = "YES";
		out.print(str);
	}
%>