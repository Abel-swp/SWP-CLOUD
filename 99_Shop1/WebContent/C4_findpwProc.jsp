<%@page import="project.HealthyBean"%>
<%@page import="project.HealthyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String rrn1 = request.getParameter("rrn1");
	String rrn2 = request.getParameter("rrn2");
	
	HealthyDao dao = HealthyDao.getInstance();
	
	HealthyBean bean = dao.selectClientPw(id,name,rrn1,rrn2); // 4개의 입력값을 HealthyDao.java의 selectClientId()로 전달
	
	String msg = "", url = "";
	if(bean == null) { // 회원 정보를 찾지 못한 경우
		msg = "해당 정보로 등록된 비밀번호가 없습니다.";
		url = "C3_findpw.jsp";
	} else { // 회원 정보를 찾은 경우
		msg = "찾아낸 비밀번호 : '" + bean.getPassword() + "'";
		url = "A1_main.jsp";
	}
	%>
	
	<script type="text/javascript">
		alert("<%=msg%>");
		location.href = "<%=url%>";
	</script>