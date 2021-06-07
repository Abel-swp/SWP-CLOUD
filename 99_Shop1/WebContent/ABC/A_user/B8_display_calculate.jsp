<%@page import="project.ProBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<jsp:useBean id="sb" class="project.ShopBean" scope="session"/>
	
	<%
	String keep = request.getParameter("keep");
	ArrayList<ProBean> list = sb.AllShop();
	// OrderDao dao = new OrderDao(); ---> useBean 액션 태그로 불러오기(사실상 Singleton)
	%>
	
	<jsp:useBean id="dao" class="project.OrderDao" scope="session"/> <!-- OrderDao dao = new OrderDao(); 의 싱글톤 효과 -->
	
	<%
	int mno = (Integer)session.getAttribute("mno");
	
	int cnt = dao.insertOrd(list,mno);
			
	String msg="", url="";
	
	if(cnt > 0) {
		msg = "주문을 완료했습니다.";
		sb.Initialization(); // 장바구니 전부 비우기%>
		
		<script type="text/javascript">
		alert("<%=msg%>");
		var answer = confirm("계속 쇼핑 하시겠습니까?");
		if(answer) { // 쇼핑하는 경우
			location.href="A1_display.jsp?keep=" + "<%=keep%>";
		} else { // 쇼핑 안하는 경우
			location.href="../../A1_main.jsp?keep=" + "<%=keep%>";
		}
		</script>
		
	<%} else {
		msg = "주문에 실패했습니다.";
		url = "A1_display.jsp?keep=" + keep;%>
		
		<script type="text/javascript">
		alert("<%=msg%>");
		location.href="<%=url%>";
		</script>
		
	<%}%>
	
	