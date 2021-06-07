<%@page import="project.ProBean"%>
<%@page import="project.ProDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<!-- 장바구니 Proc. (장바구니담기/즉시주문하기). ShopBean.java의 inserShop() 메소드 이동. 'useBean 액션태그는 항상 기본생성자 호출' -->
	
	<!-- 'sb' = 장바구니1개  --> <jsp:useBean id="sb" class="project.ShopBean" scope="session"/> <!-- ShopBean sb = new ShopBean(); -->
	
	<!-- scope="page(현재페이지까지)/request(다음페이지까지)/session(어디서든)" , 장바구니 무한 생성을 막기 위해 scope="session" 사용. -->
	
	<%
	String pnum = request.getParameter("pnum");
	String oqty = request.getParameter("oqty");
	String keep = request.getParameter("keep");
	// System.out.println("상품번호/주문수량 : " + pnum+"/"+oqty);
	
	ProDao dao = ProDao.getInstance();
	ProBean bean = dao.Pnum(pnum);
	
	if(bean.getPqty() < Integer.parseInt(oqty)){ // 재고보다 주문수량이 많다면 %>
		<script type="text/javascript">
			alert("주문 수량이 재고 수량을 초과하였습니다.");
			location.href="A1_display.jsp?keep=" + keep;
		</script>
		<%return;
	}
	sb.insertShop(pnum,oqty);
	response.sendRedirect("B4_display_cartlist.jsp?keep=" + keep);
	%>