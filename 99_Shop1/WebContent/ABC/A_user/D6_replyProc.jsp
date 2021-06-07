<!-- (pageNum),(keep),ref,re_step,re_level,writer,subject,email,content,passwd 10가지를 넘겨받음. time과 ip는 여기서 따로 입력. -->
<%@page import="board.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%
	request.setCharacterEncoding("UTF-8");
    int pageNum = Integer.parseInt(request.getParameter("pageNum"));
    String keep = request.getParameter("keep");
    Timestamp time = new Timestamp(System.currentTimeMillis()); // 1970.1.1. 자정~현재의 시간을 밀리세컨드 단위로 표현해주는 메소드
	String ip = request.getRemoteAddr(); // 실행한 쪽의 IP주소를 받아주는 메소드로 변수 선언. 입력을 통해 넘겨받는 값이 아님.
										 // IPv4형태로 출력하는 방법=(IP주소가 너무 길어 4파트로 한정출력하기)
										 // Run Configuration -> Tomcat9 -> VM Arguments -> '-Djava.net.preferIPv4Stack=true' 추가(작은따옴표 제외)
	BoardDao dao = BoardDao.getInstance();
    %>
    
    <jsp:useBean id="bean" class="board.BoardBean"/>
	<jsp:setProperty property="*" name="bean"/> <!-- replyForm에서 받은 것을 하나로 묶음(BoardBean의 전역변수와 같은 칼럼만). -->
	
	<%
	bean.setReg_date(time); // writeForm에서 입력받지 않은 대신, Setter에 직접 TimeStamp를 추가
	bean.setIp(ip); // writeForm에서 입력받지 않은 대신, Setter에 직접 request.getRemoteAddr()를 추가
	
	int cnt = dao.insertReply(bean);
	
	if(cnt > 0) {
		response.sendRedirect("D1_list.jsp?pageNum=" + pageNum + "&keep=" + keep); // keep은 모듈화된 top.jsp에서 받음
	} else {
		response.sendRedirect("D6_replyForm.jsp?pageNum=" + pageNum + "&keep=" + keep); // keep은 모듈화된 top.jsp에서 받음
	}
	%>
	
	