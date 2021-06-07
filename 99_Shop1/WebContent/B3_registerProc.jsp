<%@page import="project.HealthyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	request.setCharacterEncoding("UTF-8");
	
	HealthyDao dao = HealthyDao.getInstance();
	%>
	
	<jsp:useBean id="bean" class="project.HealthyBean"/> <!-- id=변수, class=파일명(확장자제외), useBean은 기본생성자만 사용가능 -->
	<jsp:setProperty name="bean" property="*"/> <!-- name=변수, property=Setter()이름(단,앞의'set'제외필수,소문자작성필수), param=인자 -->
												<!-- property값과 param값이 같다면 param을 생략할 수 있다. bean.set*(param); -->
												<!-- 필요한 경우, getProperty 또한 name 과 property 속성만 사용 -->
	
	<%int cnt = dao.insertClientInfo(bean); // HealthyBean.java로 전달된 입력값을 HealthyDao.java로 전달
	
	String msg="", url="";
	if(cnt > 0) {
		msg = "회원 가입을 축하드립니다!";
		url = "A1_main.jsp";
	} else {
		msg = "회원 가입에 실패하였습니다.";
		url = "B1_register.jsp";
	}%>
	
	<script type="text/javascript">
		alert("<%=msg%>");
		location.href = "<%=url%>";
	</script>