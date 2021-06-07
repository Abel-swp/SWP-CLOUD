<%@page import="project.CatBean"%>
<%@page import="project.CatDao"%>
<%@page import="project.ProBean"%>
<%@page import="project.ProDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.Encryption"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%
    request.setCharacterEncoding("UTF-8");
    String keep = request.getParameter("keep");
    %>

   	<link rel="stylesheet" type="text/css" href="css/style.css"/>
  	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/custom2.css">
	
   	<table border="1" class="table">
    	<tr class="active">
    		<td align="center">
    			<a href="D1_cate_input.jsp?keep=<%=keep%>">카테고리 등록</a>
    		</td>
    		<td align="center">
    			<a href="D3_cate_list.jsp?keep=<%=keep%>">카테고리 목록</a>
    		</td>
    		<td align="center">
    			<a href="E1_prod_input.jsp?keep=<%=keep%>">상품 등록</a>
    		</td>
    		<td align="center">
    			<a href="E3_prod_list.jsp?keep=<%=keep%>">상품 목록</a>
    		</td>
    		<td align="center">
    			<a href="F1_shopping_list.jsp?keep=<%=keep%>">쇼핑 내역</a>
    		</td>
    		<td align="center">
    			<a href="ABC/A_user/A1_display.jsp?keep=<%=keep%>">사용자 홈</a>
    		</td>
    	</tr>
   	</table>

	<script type="text/javascript">
		function outout(){
			alert("성공적으로 로그아웃 하였습니다.");
			location.href = "A1_main.jsp";
		}
	    function checkDel(pnum,pimage,keep) {
			var answer = confirm("정말 삭제하시겠습니까?");
			if(answer){
				location.href="E4_prod_delete.jsp?a="+pnum+"&b="+pimage+"&keep="+keep;
			}
		}
	</script>

    <font size=6>Food Safety Store</font> <p>
    <a href="A1_main.jsp?keep=<%=Encryption.getEncoding(keep)%>"><font size=3>HOME</font></a> <p>
    
    <table border="1" width="850" height="400" align="center">
    	<tr>
    		<td rowspan="3" align="center">
    		<!-- ********************** -->
   			<form>
			<table border="0" class="table">
				<tr class="active">
					<td bgcolor="#FFCC00" align="center"> :: ID :: <br>
					</td>
				</tr>
				<tr>
					<td style="position:relative; top:9px;">
						<%=keep%> <b>님 환영합니다!</b> <br>
					</td>
				</tr>
			</table>
			<table style="margin:auto;" class="table">
				<tr class="success">
					<td><input type="button" class="btn btn-success" name="logout" value="로그아웃" onClick="outout()"></td>
				</tr>
			</table>
			</form>
			<!-- ********************** -->
    		</td>
    		<%
			CatDao dao1 = CatDao.getInstance();
			ArrayList<CatBean> list1 = dao1.AllCat();
			%>
			<%if(list1.size() == 0) {%>
				<td align="center" height="30" class="active">
					<ul class="nav nav-pills">
						<li>등록된 카테고리 없음</li>
					</ul>
				</td>
				<%-- <%out.print("<td align='center' height='30' class='active'>등록된 카테고리 없음</td>");%> --%>
			<%} else {%>
				<%for(CatBean bean : list1){ // A2_display_top.jsp 에서 가져온 카테고리 for문
				String cname = bean.getCname();
				String ccode = bean.getCcode();%>
				<td align="center" height="30" class="active">
					<ul class="nav nav-pills">
						<li><a href="ABC/A_user/B1_display_cglist.jsp?cname=<%=cname%>&ccode=<%=ccode%>&keep=<%=keep%>"><%=cname%></a></li>
    				<%-- <a href="ABC/A_user/B1_display_cglist.jsp?cname=<%=cname%>&ccode=<%=ccode%>&keep=<%=decode%>"><%=cname%></a> --%>
    				</ul>
    			</td>
				<%}%>
			<%}%>
    	</tr>
    	<tr height="400">
    		<!-- ********************** -->
			<%
			ProDao dao = ProDao.getInstance();
			ArrayList<ProBean> list = dao.AllPro();
			%>
			<td colspan="<%=list1.size()%>" align="center">
			<table border=0 class="table table-striped" width="99%">
				<CAPTION ALIGN="TOP" style="text-align:center;"><b>:: 상품목록 ::</b></CAPTION>
				<tr class="success">
					<th style="text-align:center;">번호</th>
					<th style="text-align:center;">상품코드</th>
					<th style="text-align:center;">상품명</th>
					<th style="text-align:center;">이미지</th>
					<th style="text-align:center;">가격</th>
					<th style="text-align:center;">제조사</th>
					<th style="text-align:center;">수량</th>
					<th style="text-align:center;">수정 | 삭제</th>
				</tr>
				<%if(list.size() == 0) {
					out.print("<tr><td colspan='8' align='center'>등록된 상품이 없습니다.</td></tr>");
				
				} else {
					for(ProBean bean : list){ // for(int i=0; i<list.size(); i++){ // ProductBean pbean = list.get(i);%>
						<tr class="active">
							<td align="left" width="50"><%=bean.getPnum()%></td>
							<td align="center"><%=bean.getPcategory_fk()%></td>
							<td align="center"><%=bean.getPname()%></td>
							<td align="center">
								<img src="<%=request.getContextPath() + "/ABC/images/" + bean.getPimage()%>" width="40" height="40">
							</td>
							<td align="center"><%=bean.getPrice()%></td>
							<td align="center"><%=bean.getPcompany()%></td>
							<td align="center"><%=bean.getPqty()%></td>
							<td align="center">
								<a href="E5_prod_update.jsp?a=<%=bean.getPnum()%>&keep=<%=keep%>">수정 </a>|
								<a href="javascript:checkDel('<%=bean.getPnum()%>','<%=bean.getPimage()%>','<%=keep%>')">삭제</a>
							</td>
						</tr>
					<%}%>
				<%}%>
			</table>
			</td>
			<!-- ********************** -->
		</tr>
	    <tr>
	    	<td colspan="<%=list1.size()%>" align="center">HEALTH SHOPPING MALL</td>
	    </tr>
	</table>
	
	