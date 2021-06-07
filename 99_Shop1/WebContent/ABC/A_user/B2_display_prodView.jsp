<%@page import="project.ProBean"%>
<%@page import="project.ProDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<!--
	prodView.jsp -> cartAdd.jsp -> cartlist.jsp
	(장바구니담기  : prodView(pnum,oqty) 장바구니담기클릭 - cartAdd - cartList - 주문하기클릭 - order)
	(즉시구매하기  : prodView(pnum,oqty) 즉시구매하기클릭 - order)
	-->
	
	<%
	request.setCharacterEncoding("UTF-8");
	String pnum = request.getParameter("pnum");	
	ProDao dao1 = ProDao.getInstance();
	ProBean bean1 = dao1.Pnum(pnum);
	DecimalFormat df = new DecimalFormat("###,###");
	%>
	
	<!-- ********** -->
	<%@ include file="A2_display_top.jsp" %> <!-- keep 을 넘겨받는다 -->
	<!-- ********** -->
	
	<script type="text/javascript">
		function goCart(pnum,keep){ // oqty:변수선언
			var oqty = f.oqty.value;
			if(oqty == "" || oqty < 1) {
				alert("주문 수량이 누락되었거나 1보다 작은 수가 입력되었습니다.");
				return; // 재고보다 주문이 많은 경우 돌아가기
			}
			location.href = "B3_display_cartAdd.jsp?pnum="+pnum+"&oqty="+oqty+"&keep="+keep;
		}
		function goOrder(pnum,keep){ // oqty:submit
			document.f.action = "B7_display_order.jsp?pnum="+pnum+"&keep="+keep; // form 태그에 없었던 action 속성을 붙여주기.
			document.f.submit(); // action 속성과 주소가 생겼으므로 submit 가능. 아래의 input 태그에서 oqty도 함께 넘어간다.
		}
	</script>
	
		<table width="100%" border="0" class="table table-striped">
			<tr class="active">
				<td colspan="2" align="center">
					<font color=green size="3">
					<b>[<%=bean1.getPname()%>] 상품정보</b>
					</font>
				</td>
			</tr>
			<tr>
				<td align="center" class="m3">
					<p><p><img src="<%=request.getContextPath()+"/ABC/images/"+bean1.getPimage()%>" width="220" height="220"><p>
				</td>
				<td class="m3" style="text-align:left;">
					<form name="f" method="post"><br>
						상품번호 : <%=bean1.getPnum()%> <br><br>
						상품이름 : <%=bean1.getPname()%> <br><br>
						상품가격 : <font color=red><%=df.format(bean1.getPrice())%></font> 원 <br><br>
						상품포인트 : <font color=blue><%=bean1.getPoint()%></font> point <br><br>
						상품갯수 : <input type="text" name="oqty" value="1" style="height:24px;" size="3">&nbsp;개 <p><p>
					<table border="0" width="90%">
						<tr>
							<td>
								<a href="javascript:goCart('<%=bean1.getPnum()%>','<%=keep%>')">
									<img src="../../img/cartbtn.gif" width="110" height="35"/> <!-- 상대경로 -->
								</a>
							</td>
							<td>
								<a href="javascript:goOrder('<%=bean1.getPnum()%>','<%=keep%>')">
									<img src="../../img/orderbtn.gif" width="110" height="35"/> <!-- 절대경로 -->
								</a>
							</td>
						</tr>
					</table>
					</form>
				</td>
			</tr>
			<tr height="200" valign="top">
				<td colspan="2">
					<b>:: 상품 상세 설명 ::</b><p>
					<%=bean1.getPcontents()%>
				</td>
			</tr>
		</table>
	
	<!-- ********** -->
	<jsp:include page="A3_display_bottom.jsp"/>
	<!-- ********** -->
	
	