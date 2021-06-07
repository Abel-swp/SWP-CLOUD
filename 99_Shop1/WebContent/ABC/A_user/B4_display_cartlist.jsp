<%@page import="project.ProBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<jsp:useBean id="sb" class="project.ShopBean" scope="session"/>
	
	<%
	ArrayList<ProBean> clist = sb.AllShop();
	// System.out.println("mall_cartlist.jsp clist : " + clist.size());
	DecimalFormat df = new DecimalFormat("###,###");
	int cartTotalPrice = 0;
	int cartTotalPoint = 0;
	%>
	
	<!-- ********** -->
	<%@ include file="A2_display_top.jsp" %>
	<!-- ********** -->
	
		<table border="0" width="100%" align="center" class="table table-striped">
		
			<tr class="success">
				<td colspan="6" bgcolor="yellow" align="center">
					<b>:: 장바구니 보기 ::</b>
				</td>
			</tr>
			
			<tr class="m1">
				<td align="center" width="10%">번호</td>
				<td align="center" width="20%">상품명</td>
				<td align="center" width="20%">수량</td>
				<td align="center" width="20%">단가</td>
				<td align="center" width="20%">금액</td>
				<td align="center" width="10%">삭제</td>
			</tr>
			
			<%if(clist.size() == 0) { // 삽입된 카테고리가 하나도 없는 경우 %>
				<tr>
					<td colspan='6' align='center'>
						선택한 상품이 없습니다.
					</td>
				</tr>
			<%} else { // 삽입된 카테고리가 1개 이상 있는 경우
				for(int i=0; i<clist.size(); i++){ // for(ProductBean pbean : clist){
				ProBean bean = clist.get(i); // 일반 for문 사용시 해당 객체 선언 필요 // bean 객체 %>
					<tr>
						<td align="center" style="vertical-align:middle"><%=bean.getPnum()%></td>
						
						<td align="center">
							<img src="<%=request.getContextPath()+"/ABC/images/"+bean.getPimage()%>" width="50" height="50"><br>
							<div style="position:relative; top:4px;"><%=bean.getPname()%></div>
						</td>
						
						<td align="center">
							<form name="f" method="post" action="B5_display_update.jsp?keep=<%=keep%>"><br>
								<input type="text" name="oqty" value="<%=bean.getPqty()%>" size="1" min="1"> 개
								<input type="hidden" name="pnum" value="<%=bean.getPnum()%>"> 
								<input type="submit" value="수정">
							</form>
						</td>
						
						<td style="vertical-align:middle">
							<%=df.format(bean.getPrice())%> 원 <br>
							[<%=bean.getPoint()%>] point
						</td>
						
						<td style="vertical-align:middle">
							<font color=red><%=df.format(bean.getTotalPrice())%> 원 <br>
							[<%=bean.getTotalPoint()%>] points</font>
						</td>
						
						<td align="center" style="vertical-align:middle">
							<a href="B6_display_delete.jsp?pnum=<%=bean.getPnum()%>&keep=<%=keep%>">삭제</a>
						</td>
					</tr>
				<%
				cartTotalPrice += bean.getTotalPrice();
				cartTotalPoint += bean.getTotalPoint();
				%>
				<%} // for%>
			<%} // else%>
			
			<tr>
				<td colspan="4">
					<b>장바구니 총액 : <font color=red><%=df.format(cartTotalPrice)%>원</font></b> <br>
					<b><font color=green>총 적립 포인트 : [<%=cartTotalPoint%>] point</font></b>
				</td>
				<td colspan="2" style="vertical-align:middle">
					<a href="B7_display_order.jsp?pnum=0&oqty=0&keep=<%=keep%>">[주문하기]</a>
					<!-- <a href="javascript:history.go(-2)">[계속 쇼핑], 현재의 위치를 기준으로 이전의 이전(-2)으로 간다는 뜻. </a> -->
					<a href="A1_display.jsp?keep=<%=keep%>">[계속 쇼핑]</a>
				</td>
			</tr>
		
		</table>
	
	<!-- ********** -->
	<jsp:include page="A3_display_bottom.jsp"/>
	<!-- ********** -->
	
	