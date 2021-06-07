<!-- num,(pageNum),(keep),passwd 4가지를 넘겨받음. -->
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%
	// 이번에는 하나로 묶어주는 액션태그를 사용하지 않으므로 BoardBean의 전역변수와 같은 칼럼 모두 request.getParameter()로 받아주기
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String keep = request.getParameter("keep");
	String passwd = request.getParameter("passwd");
	
	BoardDao dao = BoardDao.getInstance();
	
	int cnt = dao.deleteData(num,passwd);
	if(cnt > 0){ // 글 삭제 시, 총 페이지 갯수 변동사항을 대비한 조건문
		int count = dao.AllAriticlesCount(); // count = 전체 글 수
		int pageCount = count / 10 + ( count % 10 == 0 ? 0 : 1); // pageCount = 전체 글 수에 따라 필요한 페이지 수
		if(pageNum > pageCount) {
			%><script type="text/javascript">
				alert("삭제되었습니다.")
				location.href = "D1_list.jsp?pageNum=" + '<%=pageNum-1%>' + "&keep=" + '<%=keep%>';
			</script><%
		} else {
			%><script type="text/javascript">
				alert("삭제되었습니다.")
				location.href = "D1_list.jsp?pageNum=" + '<%=pageNum%>' + "&keep=" + '<%=keep%>';
			</script><%
		}
	}else{%>
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.");
			history.go(-1);
		</script>
	<%}%>
	
	