<%@page import="project.CatBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.CatDao"%>
<%@page import="project.Encryption"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String keep = request.getParameter("keep"); // keep = Base64로 암호화 된 계정 ID
    ArrayList<CatBean> list1 = null;
    %>
    
    <%if(keep == null) { // 시작 %>
    
 		<%
		CatDao dao1 = CatDao.getInstance();
		list1 = dao1.AllCat();
		%>
    
    	<%@ include file="A2_top.jsp" %> <!-- 1. include 지시어(Original) -->
    	
		<td colspan="<%=list1.size()%>" align="center" style="height:400px;">
			<img src="img/main.jpg" width="650" height="450">
		</td>
		
		<jsp:include page="A3_bottom.jsp"/> <!-- 2. include 액션태그(Result) -->
		
    <%}%>
    
    <%if(keep != null){
        String decode = Encryption.getDecoding(keep);
        // System.out.println("decode : " + decode);%>
    
	    <%if(decode.equals("admin")){ // 관리자 계정 %>
	    	
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
		    			<a href="D1_cate_input.jsp?keep=<%=decode%>">카테고리 등록</a>
		    		</td>
		    		<td align="center">
		    			<a href="D3_cate_list.jsp?keep=<%=decode%>">카테고리 목록</a>
		    		</td>
		    		<td align="center">
		    			<a href="E1_prod_input.jsp?keep=<%=decode%>">상품 등록</a>
		    		</td>
		    		<td align="center">
		    			<a href="E3_prod_list.jsp?keep=<%=decode%>">상품 목록</a>
		    		</td>
		    		<td align="center">
		    			<a href="F1_shopping_list.jsp?keep=<%=decode%>">쇼핑 내역</a>
		    		</td>
		    		<td align="center">
		    			<a href="ABC/A_user/A1_display.jsp?keep=<%=decode%>">사용자 홈 </a>
		    		</td>
		    	</tr>
		   	</table>
	
			<script type="text/javascript">
				// history.replaceState({}, null, location.pathname);
				function outout(){
					alert("성공적으로 로그아웃 하였습니다.");
					location.href = "A1_main.jsp";
				}
			</script>
	   
		    <font size=6>Food Safety Store</font> <p>
		    <a href="A1_main.jsp?keep=<%=keep%>" id="State"><font size=3>HOME</font></a> <p>
		    
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
								<%=decode%> <b>님 환영합니다!</b> <br>
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
					list1 = dao1.AllCat();
					%>
					<%if(list1.size() == 0) {%>
						<td align="center" height="30" class="active">
							<ul class="nav nav-pills" style="position:relative; left:18.75em">
								<li><a href="">등록된 카테고리 없음</a></li>
							</ul>
						</td>
						<%-- <%out.print("<td align='center' height='30' class='active'>등록된 카테고리 없음</td>");%> --%>
					<%} else {%>
						<%for(CatBean bean : list1){ // A2_display_top.jsp 에서 가져온 카테고리 for문
						String cname = bean.getCname();
						String ccode = bean.getCcode();%>
						<td align="center" height="30" class="active">
							<ul class="nav nav-pills">
								<li><a href="ABC/A_user/B1_display_cglist.jsp?cname=<%=cname%>&ccode=<%=ccode%>&keep=<%=decode%>"><%=cname%></a></li>
		    				<%-- <a href="ABC/A_user/B1_display_cglist.jsp?cname=<%=cname%>&ccode=<%=ccode%>&keep=<%=decode%>"><%=cname%></a> --%>
		    				</ul>
		    			</td>
						<%}%>
					<%}%>
		    	</tr>
		    	<tr height="400">
		    		<!-- ********************** -->
					<td colspan="<%=list1.size()%>" align="center" style="height:400px;">
						<img src="img/main.jpg" width="650" height="450">
					</td>
					<!-- ********************** -->
				</tr>
			    <tr bgcolor="#EAF0E8" height="30" class="active">
			    	<td colspan="<%=list1.size()%>" align="center">HEALTH SHOPPING MALL</td>
			    </tr>
			</table>
			
	   	<%}%>
	    
	    <%if(!decode.equals("admin")) { // 사용자 계정 %>
		    	
			<link rel="stylesheet" type="text/css" href="css/style.css"/>
		    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
			<link rel="stylesheet" type="text/css" href="css/custom2.css">
			<link rel="stylesheet" type="text/css" href="css/kfonts2.css">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script type="text/javascript" src="js/jquery.js"></script>
			
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
		    <a href="A1_main.jsp?keep=<%=keep%>"><font size=3>HOME</font></a> <p>
	
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
								&nbsp;<%=decode%> <b>님 환영합니다 !</b>&nbsp;<br>
							</td>
						</tr>
					</table>
					<table style="margin:auto;" class="table">
						<tr class="success">
							<td><input type="button" class="btn btn-success" name="logout" value="로그아웃" onClick="outout()"></td>
						</tr>
						<tr class="active">
							<td><input type="button" class="btn btn-info" name="home" value="사용자 홈" onClick="homeh('<%=decode%>')"></td>
						</tr>
						<tr class="warning">
							<td><input type="button" class="btn btn-primary" name="shop" value="쇼핑내역" onClick="shops('<%=decode%>')"></td>
						</tr>
					</table>
					</form>
					<!-- ********************** -->
		    		</td>
		    		<%
					CatDao dao1 = CatDao.getInstance();
					list1 = dao1.AllCat();
					%>
					<%if(list1.size() == 0) {%>
						<td align="center" height="30" class="active">
							<ul class="nav nav-pills" style="position:relative; left:18.75em">
								<li><a href="">등록된 카테고리 없음</a></li>
							</ul>
						</td>
						<%-- <%out.print("<td align='center' height='30' class='active'>등록된 카테고리 없음</td>");%> --%>
					<%} else {%>
						<%for(CatBean bean : list1){ // A2_display_top.jsp 에서 가져온 카테고리 for문
						String cname = bean.getCname();
						String ccode = bean.getCcode();%>
						<td align="center" height="30" class="active">
							<ul class="nav nav-pills">
								<li><a href="ABC/A_user/B1_display_cglist.jsp?cname=<%=cname%>&ccode=<%=ccode%>&keep=<%=decode%>"><%=cname%></a></li>
		    				<%-- <a href="ABC/A_user/B1_display_cglist.jsp?cname=<%=cname%>&ccode=<%=ccode%>&keep=<%=decode%>"><%=cname%></a> --%>
		    				</ul>
		    			</td>
						<%}%>
					<%}%>
		    	</tr>
		    	<tr height="400">
		    		<!-- ********************** -->
					<td colspan="<%=list1.size()%>" align="center" style="height:400px;">
						<img src="img/main.jpg" width="650" height="450">
					</td>
					<!-- ********************** -->
				</tr>
			    <tr bgcolor="#EAF0E8" height="30" class="active">
			    	<td colspan="<%=list1.size()%>" align="center">HEALTH SHOPPING MALL</td>
			    </tr>
			</table>
	   	
	   	<%}%>
	
	<%}%>