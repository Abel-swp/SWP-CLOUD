<%@page import="project.CatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
    <%
    String keep = request.getParameter("keep");
    int cnum = Integer.parseInt(request.getParameter("numnum")); // D3_cate_list.jsp, get방식
    CatDao dao = CatDao.getInstance();
    
    int cnt = dao.deleteCat(cnum); // cnum을 넘길 것 -> bean 객체 생성, setter usebean 태그도 필요 없음
	String msg = "", url = "";
    if(cnt > 0) {
		msg = "카테고리 삭제에 성공";
		url = "D3_cate_list.jsp?keep=" + keep;
	} else {
		msg = "카테고리 삭제에 실패";
		url = "D3_cate_list.jsp?keep=" + keep;
	}
	%>
	
	<script>
		alert("<%=msg%>" + "하였습니다.");
		location.href = "<%=url%>";
	</script>