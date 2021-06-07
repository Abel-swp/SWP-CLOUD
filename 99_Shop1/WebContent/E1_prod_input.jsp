<%@page import="project.CatBean"%>
<%@page import="project.CatDao"%>
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
	
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		function outout(){
			alert("성공적으로 로그아웃 하였습니다.");
			location.href = "A1_main.jsp";
		}
		function checkcheck() {
			if($('input[placeholder="상품명을 입력하세요"]').val() == '') {
				alert('상품명을 입력하세요.');
				$('input[placeholder="상품명을 입력하세요"]').focus();
				return false;
			}
			if($('input[placeholder="상품코드를 입력하세요"]').val() == '') {
				alert('상품코드를 입력하세요.');
				$('input[placeholder="상품코드를입력하세요"]').focus();
				return false;
			}
			if($('input[placeholder="제조회사를 입력하세요"]').val() == '') {
				alert('제조회사를 입력하세요.');
				$('input[placeholder="제조회사를 입력하세요"]').focus();
				return false;
			}
			if($('textarea[placeholder="상품 소개를 입력하세요"]').val() == '') {
				alert('상품 소개를 입력하세요.');
				$('textarea[placeholder="상품 소개를 입력하세요"]').focus();
				return false;
			}
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
			CatDao dao = CatDao.getInstance();
			ArrayList<CatBean> list = dao.AllCat();
			%>
			<td colspan="<%=list.size()%>" align="center">
			<form action="E2_prod_inputProc.jsp?keep=<%=keep%>" method="post" name="myform" enctype="multipart/form-data">
			<table border="0" class="table table-striped" align="center"> <!-- outline => style.css -->
				<CAPTION ALIGN="TOP" style="text-align:center;"><b>:: 상품등록 ::</b></CAPTION>
				<tr>
					<th class="m2">카테고리</th>
					<td style="text-align:left;">
						<select name="pcategory_fk">
						<%if(list.size() == 0) {%>
							<option value="">카테고리 없음</option>
						<%} else {%>
							<%for(CatBean bean : list){%>
							<option value="<%=bean.getCcode()%>"><%=bean.getCname()%> [<%=bean.getCcode()%>]</option>
							<%}%>
						<%}%>
						</select>
					</td>
				</tr>
				<tr>
					<th class="m2">상품명</th>
					<td style="text-align:left;">
					<input type=text name="pname" placeholder="상품명을 입력하세요">
					</td>
				</tr>
				<tr>
					<th class="m2">상품코드</th>
					<td style="text-align:left;">
					<input type=text name="pcode" placeholder="상품코드를 입력하세요">
					</td>
				</tr>
				<tr>
					<th class="m2">제조회사</th>
					<td style="text-align:left;">
					<input type=text name="pcompany" placeholder="제조회사를 입력하세요">
					</td>
				</tr>
				<tr>
					<th class="m2">상품이미지</th>
					<td style="text-align:left;">
					<input type=file name="pimage">
					</td>
				</tr>
				<tr>
					<th class="m2">상품 수량</th>
					<td style="text-align:left;">
					<input type="number" name="pqty" maxlength=4 placeholder="상품수량을 입력하세요" min="1" max="999" step="0.000000000001">
					최대 999 개
					</td>
				</tr>
				<tr>
					<th class="m2">상품 가격</th>
					<td style="text-align:left;">
					<input type="number" name="price" maxlength=8 placeholder="상품가격을 입력하세요" min="1000" max="1000000" step="0.00000001">
					최대 1,000,000원
					</td>
				</tr>
				<tr>
					<th class="m2">상품 스펙</th>
					<td style="text-align:left;">
						<select name="pspec">
						<option value="NORMAL" SELECTED>::NORMAL::</option>
						<option value="HIT">HIT</option>
						<option value="NEW">NEW</option>
						<option value="BEST">BEST</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="m2">상품 소개</th>
					<td style="text-align:left;">
					<textarea name="pcontents" rows=5 cols=50 style="resize: none;" placeholder="상품 소개를 입력하세요"></textarea>
					<!-- style="resize: none;" 이것을 해준 이유는 아무나 사이즈를 늘이거나 줄이지 못하도록 한 것이다  -->
					</td>
				</tr>
				<tr>
					<th class="m2">상품 포인트</th>
					<td style="text-align:left;">
						<input type="number" name="point" maxlength="6" placeholder="상품 포인트를 입력하세요" min="10" max="10000" step="0.0000000001">
						<font color="red">최대 10,000 point</font>
					</td>
				</tr>
				<tr>	
					<td colspan=2 class="m1" align="center">
					<input type=submit value="상품 등록" onClick="return checkcheck()">
					<input type=reset value="취 소">
					</td>
				</tr>
			</table>
			</form>
			</td>
			<!-- ********************** -->
		</tr>
	    <tr>
	    	<td colspan="<%=list.size()%>" align="center">HEALTH SHOPPING MALL</td>
	    </tr>
	</table>
	
	