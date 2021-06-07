<%@page import="project.CatDao"%>
<%@page import="project.CatBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.ProBean"%>
<%@page import="project.ProDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<!-- ********** -->
	<%@ include file="A2_display_top.jsp" %>
	<!-- ********** -->
	
	<%
	request.setCharacterEncoding("UTF-8");
	String cname = request.getParameter("cname");
	String ccode = request.getParameter("ccode");
	DecimalFormat df = new DecimalFormat("###,###"); // df.format();
	ProDao dao1 = ProDao.getInstance();
	ArrayList<ProBean> list1 = dao1.Ccode(ccode);
	%>

	<h3>Welcome To Food Safety Store</h3>
	<hr color=green width=100%>
	<font color=red size=3><%=cname%></font>
	<hr color=green width=100%>
	<%if(list.size() == 0){
		out.print("<b>" + cname + " 상품이 없습니다.</b>");
	} else {%>
		<table border="0" width="100%" align="center">
			<tr>
				<%
				int count = 0;
				for(ProBean bean : list1) {
					count++;
					String pimage = bean.getPimage();
					String pname = bean.getPname();
					int price = bean.getPrice();
					int point = bean.getPoint();
					int pnum = bean.getPnum();
					String imgPath = request.getContextPath()+"/ABC/images/"+pimage;
					%>
					<td align="center">
						<a href="B2_display_prodView.jsp?pnum=<%=pnum%>&keep=<%=keep%>"><img src="<%=imgPath%>" width="130" height="130"></a>
						<br> ' <%=pname%> ' <br>
						<font color="red"><%=df.format(price)%></font> 원 <br>
						<font color="blue"><%=point%></font> point <p><p>
					</td>
					<%if(count%3==0){
						out.print("</tr><tr>"); // 여기서 첫 tr을 닫고 다시 연다
					}%>
				<%} // for %>
			</tr>
		</table>
		<p>
	<%} // else %>
	
	<!-- ********** -->
	<jsp:include page="A3_display_bottom.jsp"/>
	<!-- ********** -->
	
	