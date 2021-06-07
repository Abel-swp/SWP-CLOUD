<%@page import="project.ProBean"%>
<%@page import="project.ProDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="sb" class="project.ShopBean" scope="session"/>
	
	<%
	String keep = request.getParameter("keep");
	String pnum = request.getParameter("pnum");
	String oqty = request.getParameter("oqty");
	// System.out.println("mall_cartEdit.jsp : pnum/oqty : " + pnum+"/"+oqty);
	
	ProDao pdao = ProDao.getInstance();
	ProBean pbean = pdao.Pnum(pnum);
	
	if(pbean.getPqty() < Integer.parseInt(oqty)){ // 해당 상품의 재고수량과 주문수량 비교 %>
		<script type="text/javascript">
			alert("주문 수량이 재고 수량을 초과하였습니다.");
			// history.back(); // 이전 페이지로 이동
		</script>
		<%return; // 수정 작업의 반복을 막는 return
	}
	sb.updateShop(pnum,oqty);
	%>
	
	<script type="text/javascript">
		alert("수량이 성공적으로 수정되었습니다.");
		location.href="B4_display_cartlist.jsp?keep=" + "<%=keep%>";
	</script>