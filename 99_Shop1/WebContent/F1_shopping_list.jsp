<%@page import="project.CatBean"%>
<%@page import="project.CatDao"%>
<%@page import="project.OrderBean"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.Encryption"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<jsp:useBean id="dao" class="project.OrderDao" scope="session"/> <!-- OrderDao dao = new OrderDao(); 의 싱글톤 효과[B8_display_calculate.jsp에서 가져옴] -->
	<jsp:useBean id="bean" class="project.OrderBean"/><%String keep = request.getParameter("keep");%>
	
	<%if(keep.equals("admin")){ // 관리자 계정 %>
		<%
		String memid = request.getParameter("memid"); // 여기서 넘겨서 여기서 받는다
		ArrayList<OrderBean> list = null;
		System.out.println("list1 : " + list);
		if(memid != null) { // 쇼핑내역조회에 입력값이 있었다면
			list = dao.JoinOrd(memid); // 해당 내역 출력
			System.out.println("list2 : " + list);
		}
		%>
		
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
	    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/custom2.css">
		<link rel="stylesheet" type="text/css" href="css/kfonts2.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/jquery.js"></script>
		
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
	    			<a href="ABC/A_user/A1_display.jsp?keep=<%=keep%>">사용자 홈 </a>
	    		</td>
	    	</tr>
	   	</table>
		
		<script type="text/javascript">
			function outout(){
				alert("성공적으로 로그아웃 하였습니다.");
				location.href = "A1_main.jsp";
			}
			function homeh(keep){
				location.href = "ABC/A_user/A1_display.jsp?keep=" + keep;
			}
			function shops(keep){
				location.href = "F1_shopping_list.jsp?keep=" + keep;
			}
		</script>
	    
	    <font size=6>Food Safety Store</font> <p>
	    <a href="A1_main.jsp?keep=<%=Encryption.getEncoding(keep)%>"><font size=3>HOME</font></a> <p>
	
	    <table border="1" width="800" height="400" align="center">
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
					<%for(CatBean bean1 : list1){ // A2_display_top.jsp 에서 가져온 카테고리 for문
					String cname = bean1.getCname();
					String ccode = bean1.getCcode();%>
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
				<td colspan="<%=list1.size()%>" align="center" valign="top">
					<table border="0" width="800" class="table table-striped">
						<tr>
							<td colspan="5">
								<form method="post" action="F1_shopping_list.jsp?keep=<%=keep%>">
									<b style="position:relative; top:6px;">조회할 회원 아이디 입력 :&nbsp;
									<input type="text" name="memid" placeholder="조회할 ID를 입력해주세요">&nbsp;
									<input type="submit" value="내역조회" class="btn btn-default"></b>
								</form>
							</td>
						</tr>
						<tr bgcolor="d5d5d5" align="center"> <!-- healthy, prodprod, ord 테이블의 join 형태로 조회 -->
							<td>고객명</td>
							<td>아이디</td>
							<td>상품명</td>
							<td>수량</td>
							<td>금액</td>
						</tr class="warning">
						<%
						DecimalFormat df = new DecimalFormat("###,###");
						int total = 0;
						%>
						<%if(list != null) {%>
							<%for(OrderBean ob : list){%>
								<tr>
									<td align="center"><%=ob.getMname()%></td>
									<td align="center"><%=ob.getMid()%></td>
									<td align="center"><%=ob.getPname()%></td>
									<td align="right"><%=ob.getQty()%></td>
									<td align="right">₩<%=df.format(ob.getAmount())%></td>
								</tr>
							<%
							total += ob.getAmount();
							}%>
						<%} if(list==null || list.size()==0) {%>
							<tr>
								<td colspan="5">쇼핑 내역이 없습니다.</td>
							</tr>
						<%}%>
						<tr>
							<td colspan="4" align="center"><font color="red"><b>:: 총합 ::</b></font></td>
							<td align="right">₩<%=df.format(total)%></td>
						</tr>
					</table>
				</td>
				<!-- ********** -->
			</tr>
		    <tr>
		    	<td colspan="<%=list1.size()%>" align="center">HEALTH SHOPPING MALL</td>
		    </tr>
		</table>
	<%}%>
	
	<%if(!keep.equals("admin")) { // 사용자 계정 %>
		<%
		String memid = request.getParameter("memid"); // 여기서 넘겨서 여기서 받는다
		ArrayList<OrderBean> list = null;
		System.out.println("list1 : " + list);
		if(memid != null) { // 쇼핑내역조회에 입력값이 있었다면
			list = dao.JoinOrd(memid); // 해당 내역 출력
			System.out.println("list2 : " + list);
		}
		%>
		
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
	    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/custom2.css">
		
		<script type="text/javascript">
			function outout(){
				alert("성공적으로 로그아웃 하였습니다.");
				location.href = "A1_main.jsp";
			}
			function homeh(keep){
				location.href = "ABC/A_user/A1_display.jsp?keep=" + keep;
			}
			function shops(keep){
				location.href = "F1_shopping_list.jsp?keep=" + keep;
			}
		</script>
	    
	    <font size=6>Food Safety Store</font> <p>
	    <a href="A1_main.jsp?keep=<%=Encryption.getEncoding(keep)%>"><font size=3>HOME</font></a> <p>
	
	    <table border="1" width="800" height="400" align="center">
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
					<tr class="active">
						<td><input type="button" class="btn btn-info" name="home" value="사용자 홈" onClick="homeh('<%=keep%>')"></td>
					</tr>
					<tr class="warning">
						<td><input type="button" class="btn btn-primary" name="shop" value="쇼핑내역" onClick="shops('<%=keep%>')"></td>
					</tr>
				</table>
				</form>
				<!-- ********************** -->
	    		</td>
	    		<%
				CatDao dao2 = CatDao.getInstance();
				ArrayList<CatBean> list2 = dao2.AllCat();
				%>
				<%if(list2.size() == 0) {%>
					<td align="center" height="30" class="active">
						<ul class="nav nav-pills">
							<li>등록된 카테고리 없음</li>
						</ul>
					</td>
					<%-- <%out.print("<td align='center' height='30' class='active'>등록된 카테고리 없음</td>");%> --%>
				<%} else {%>
					<%for(CatBean bean3 : list2){ // A2_display_top.jsp 에서 가져온 카테고리 for문
					String cname = bean3.getCname();
					String ccode = bean3.getCcode();%>
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
				<td colspan="<%=list2.size()%>" align="center" valign="top">
					<table border="0" width="800" class="table table-striped">
						<tr>
							<td colspan="5">
								<form method="post" action="F1_shopping_list.jsp?keep=<%=keep%>">
									<b style="position:relative; top:6px;">조회할 회원 아이디 입력 :&nbsp;
									<input type="text" name="memid" placeholder="조회할 ID를 입력해주세요">&nbsp;
									<input type="submit" value="내역조회"></b>
								</form>
							</td>
						</tr>
						<tr bgcolor="d5d5d5" align="center"> <!-- healthy, prodprod, ord 테이블의 join 형태로 조회 -->
							<td>고객명</td>
							<td>아이디</td>
							<td>상품명</td>
							<td>수량</td>
							<td>금액</td>
						</tr class="warning">
						<%
						DecimalFormat df = new DecimalFormat("###,###");
						int total = 0;
						%>
						<%if(list != null) {%>
							<%for(OrderBean ob : list){%>
								<tr>
									<td align="center"><%=ob.getMname()%></td>
									<td align="center"><%=ob.getMid()%></td>
									<td align="center"><%=ob.getPname()%></td>
									<td align="right"><%=ob.getQty()%></td>
									<td align="right">₩<%=df.format(ob.getAmount())%></td>
								</tr>
							<%
							total += ob.getAmount();
							}%>
						<%} if(list==null || list.size()==0) {%>
							<tr>
								<td colspan="5">쇼핑 내역이 없습니다.</td>
							</tr>
						<%}%>
						<tr>
							<td colspan="4" align="center"><font color="red"><b>:: 총합 ::</b></font></td>
							<td align="right">₩<%=df.format(total)%></td>
						</tr>
					</table>
				</td>
				<!-- ********** -->
			</tr>
		    <tr>
		    	<td colspan="<%=list2.size()%>" align="center">HEALTH SHOPPING MALL</td>
		    </tr>
		</table>
	<%}%>
	
	
	
	