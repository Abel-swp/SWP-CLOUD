<!-- num,(pageNum),(keep),writer,subject,email,content,passwd 8가지를 넘겨받음. -->
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%
	request.setCharacterEncoding("UTF-8");
	String keep = request.getParameter("keep");
	String pageNum = request.getParameter("pageNum");
    BoardDao dao = BoardDao.getInstance();
    %>
    
    <jsp:useBean id="bean" class="board.BoardBean"/>
	<jsp:setProperty property="*" name="bean"/> <!-- updateForm에서 받은 것을 하나로 묶음(BoardBean의 전역변수와 같은 칼럼만). --> <%
	
	int cnt = dao.updateData(bean); 
	if(cnt > 0){%>
		<script type="text/javascript">
			alert("수정에 성공하였습니다.");
			location.href = "D1_list.jsp?pageNum=" + '<%=pageNum%>' + "&keep=" + '<%=keep%>';
		</script><%
	}else{%>
		<script type="text/javascript">
			alert("수정에 실패하였습니다.");
			history.go(-1); // D4_updateForm.jsp로 입력 시 'bean.getNum()' 같이 위에서 묶여진 bean으로 보내주기 가능. 단 7개나 되서 이전 이동이 편리하고 빠름.
			/* 1번째 방법 : */ /* history.back(); */ /* 바로 이전 파일로 돌아가기. */
			/* 2번째 방법 : */ /* history.go(-2); */ /* 두번 이전 파일로 돌아가기. */
		</script>
	<%}%>