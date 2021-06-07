<%@page import="project.HealthyBean"%>
<%@page import="project.HealthyDao"%>
<%@page import="project.Encryption"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	System.out.println(id + password);
	
	HealthyDao dao = HealthyDao.getInstance();
	
	HealthyBean bean = dao.LogIn(id,password); // 2개의 입력값을 HealthyDao.java의 LogIn()로 전달

	String viewPage = null;
	if(bean != null) { // 회원 정보를 찾은 경우
		// session.setAttribute("keep",bean.getId()); // ("임의의 변수명",실제내용); 을 하나의 객체로 공유
		// String keep = bean.getId();
		String keep = Encryption.getEncoding(bean.getId());
		viewPage = "A1_main.jsp?keep=" + keep;
		
		session.setAttribute("mno", bean.getNo()); // 결재하기를 위해 나중에 추가된 session
		
		%>
		<%if(bean.getId().equals("admin")){ // 회원 정보를 찾았고, 로그인 ID가 관리자(admin)인 경우%>
		<script type="text/javascript">
			alert("로그인에 성공했습니다.");
			alert("관리자 권한 페이지에 접속합니다.");
		</script>
		<%} else { // 회원 정보를 찾았고, 로그인 ID가 관리자(admin)가 아닌 경우%>
		<script type="text/javascript">
			alert("로그인에 성공했습니다.");
		</script>
		<%}%>
		
	<%} else { // 회원 정보를 찾지 못한 경우
		viewPage = "A1_main.jsp";%> 
		<script type="text/javascript">
			alert("가입하지 않은 아이디, 혹은 잘못된 비밀번호입니다.");
		</script>
	<%}%>
	
	<script type="text/javascript">
		location.href = "<%=viewPage%>";
	</script>
	
	