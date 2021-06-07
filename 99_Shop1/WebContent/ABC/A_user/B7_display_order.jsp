<%@page import="java.text.DecimalFormat"%>
<%@page import="project.ProBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="sb" class="project.ShopBean" scope="session"/>
    <%DecimalFormat df = new DecimalFormat("###,###");%>

    <!-- ********** -->
	<%@ include file="A2_display_top.jsp" %>
	<!-- ********** -->
    
    <%if(keep.equals("admin")){%>
    	<script type="text/javascript">
		alert("관리자는 상품을 주문할 수 없습니다.");
		history.back();
		</script>
    <%} else if(keep.equals("guest")){%>
    	<script type="text/javascript">
		alert("회원으로 등록된 고객님만 상품 주문이 가능합니다.");
		history.back();
		</script>
    <%}%>
    
    <%
    // keep은 include로 넘겨받음
    String pnum = request.getParameter("pnum");
    String oqty = request.getParameter("oqty");
    System.out.println("mall_order.jsp pnum : " + pnum + ", oqty : " + oqty);
    
    // 장바구니 : pnum과 oqty가 0으로 넘어옴
    // 즉시구매 : pnum과 oqty가 잘 넘어옴
    
    if(!pnum.equals("0") && !oqty.equals("0")){ // 즉시구매시 바로 추가하기
    	sb.insertShop(pnum,oqty);
    }
    %>
    
    <table width="90%" border="0" align="center" class="table table-striped">
    
    	<tr class="m2">
    		<td colspan="3" align="center"><h4>:: 결재 내역서 보기 ::</h4></td>
    	</tr>
    	
    	<tr class="m1">
    		<th width="40%" style="text-align:center;">상품명</th>
    		<th width="20%" style="text-align:center;">수량</th>
    		<th width="40%" style="text-align:center;">금액</th>
    	</tr>
    	
    	<% int totalPrice = 0; // 뒤에 사용할 변수 미리 초기화
    	ArrayList<ProBean> listlist = sb.AllShop(); // 장바구니 전체 조회
    	for(ProBean bean : listlist) {%>
    		<tr>
    			<td><%=bean.getPname()%></td>
    			<td><%=bean.getPqty()%></td>
    			<td><%=bean.getTotalPrice()%></td>
    		</tr>
    	<%	totalPrice += bean.getTotalPrice();
    	}%>
    	
    	<tr class="m1">
    		<td colspan="3" align="center">
    		<b>결재하실 총액 : </b><font color="red"><%=df.format(totalPrice)%>&nbsp;원</font>
    		</td>
    	</tr>
    
    </table>
    
    <input type="button" value="결재하기" onClick="location.href='B8_display_calculate.jsp?keep=<%=keep%>'">
    
    <!-- ********** -->
	<jsp:include page="A3_display_bottom.jsp"/>
	<!-- ********** -->
	
	