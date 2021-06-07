<%@page import="project.CatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	request.setCharacterEncoding("UTF-8");
	String keep = request.getParameter("keep");
	%>
	
	<jsp:useBean id="bean" class="project.CatBean"/>
	<jsp:setProperty property="*" name="bean"/>
	
	<%
	CatDao dao = CatDao.getInstance(); // Singleton 객체생성(서버 주소 1개 사용)
	int cnt = dao.insertCat(bean);
	String msg = "", url = "";
	if(cnt > 0) {
		msg = "카테고리 등록에 성공";
		url = "D3_cate_list.jsp?keep=" + keep;
	} else {
		msg = "카테고리 등록에 실패";
		url = "D1_cate_input.jsp?keep=" + keep;
	}
	%>
	
	<script>
		alert("<%=msg%>" + "하였습니다.");
		location.href = "<%=url%>";
	</script>