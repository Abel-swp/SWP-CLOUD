<!-- 중단, (우측)상품 리스트 : 카테고리 리스트 포함 -->
<%@page import="java.text.DecimalFormat"%>
<%@page import="project.ProBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.ProDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<!-- ********** -->
	<%@ include file="A2_display_top.jsp" %>
	<!-- ********** -->
	
		<h3>Welcome To Food Safety Store</h3>
		<% DecimalFormat df = new DecimalFormat("###,###");
		ProDao dao1 = ProDao.getInstance();
		String[] spec = {"HIT","NEW","BEST","NORMAL"};
		for(int i=0; i<spec.length; i++){
			ArrayList<ProBean> list1 = dao1.Pspec(spec[i]);%>
			<hr class="m2" width=85%>
			<font color=red size=3><%=spec[i]%></font>
			<hr class="m2" width=85%>
			<%if(list.size() == 0){%>
				<b><%=spec[i]%> 상품이 없습니다.</b><p>
			<%} else {%>
				<table border="0" width="100%" align="center" class="table table-striped">
					<tr>
						<%int count = 0;
						for(ProBean bean : list1) {
							count++;
							String pimage = bean.getPimage(); // ~.jpg, 경로를 포함한 파일화 필요
							String pname = bean.getPname();
							int price = bean.getPrice();
							int point = bean.getPoint();
							int pnum = bean.getPnum();
							String imgPath = request.getContextPath()+"/ABC/images/"+pimage; // 이미지 파일화 완료 %>
							<td align="center">
								<a href="B2_display_prodView.jsp?pnum=<%=pnum%>&keep=<%=keep%>"><img src="<%=imgPath%>" width="80" height="60"></a>
								<br> ' <%=pname%> ' <br>
								<font color="red"><%=df.format(price)%></font> 원 <br>
								<font color="blue"><%=point%></font> point <br>
							</td>
							<%if(count%3==0){
								out.print("</tr><tr>");
							}%>
						<%} // for ---> 'String[] spec' 상품의 갯수만큼 반복 %>
					</tr>
				</table>
				<p><br>
			<%} // else %>
		<%} // for %>
	
	<!-- ********** -->
	<jsp:include page="A3_display_bottom.jsp"/>
	<!-- ********** -->
	
	