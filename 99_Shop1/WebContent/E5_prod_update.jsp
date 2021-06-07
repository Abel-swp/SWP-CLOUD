<%@page import="project.ProBean"%>
<%@page import="project.ProDao"%>
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
    			<a href="">쇼핑 내역</a>
    		</td>
    		<td align="center">
    			<a href="ABC/A_user/A1_display.jsp">사용자 홈</a>
    		</td>
    	</tr>
   	</table>
	
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		function outout(){
			alert("성공적으로 로그아웃 하였습니다.");
			location.href = "A1_main.jsp";
		}
		function gogogo(){
			<%session.setAttribute("keep",keep);%>
		}
		function checkcheck() {
			if($('input[name="pname"]').val() == '') {
				alert('상품명을 입력하세요.');
				$('input[name="pname"]').focus();
				return false;
			}
			if($('input[name="pcompany"]').val() == '') {
				alert('제조회사를 입력하세요.');
				$('input[name="pcompany"]').focus();
				return false;
			}
			if($('textarea[name="pcontents"]').val() == '') {
				alert('상품 소개를 입력하세요.');
				$('textarea[name="pcontents"]').focus();
				return false;
			}
		}
	</script>
	
    <font size=6>Food Safety Store</font> <p>
    <a href="A1_main.jsp" onClick="gogogo()"><font size=3>HOME</font></a> <p>
    
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
					<td>
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
    		<td align="center">
    			<a href="">다이어트식품</a>
    		</td>
    		<td align="center">
    			<a href="">건강환</a>
    		</td>
    		<td align="center">
    			<a href="">건강즙</a>
    		</td>
    		<td align="center">
    			<a href="">영양제</a>
    		</td>
    		<td align="center">
    			<a href="">한방약</a>
    		</td>
    		<td align="center">
    			<a href="">건강꿀</a>
    		</td>
    		<td align="center">
    			<a href="">홍삼/인삼</a>
    		</td>
    		<td align="center">
    			<a href="">운동보조제</a>
    		</td>
    	</tr>
    	<tr height="400">
			<!-- ********************** -->
			<%
		    String pnum = request.getParameter("a");
		    ProDao dao = ProDao.getInstance();
		    ProBean bean = dao.Pnum(pnum);
			%>
	    	<td colspan=8 align="center">
			<form name="f" action="E6_prod_updateProc.jsp?pnum=<%=bean.getPnum()%>&keep=<%=keep%>" method="post" enctype="multipart/form-data" class="form-horizontal">
			<table border=0 class="table table-striped" width="600"> <!-- outline 이라는 스타일은 style.css 에서 찾아볼 수 있는 클래스이다(.outline) -->
				<CAPTION ALIGN="TOP" style="text-align:center;"><b>:: 상품수정 ::</b></CAPTION>
				<tr>
					<th class="m2">카테고리</th>
					<td style="text-align:left;">
						<input type="text" name="pcategory_fk" value="<%=bean.getPcategory_fk()%>" readonly class="form-control" style="width:191.5px"><font color="red" style="position:absolute; top:222px; left:65em;">수정불가</font>
						<!-- disabled 혹은 readonly 를 추가하면 수정할 수 없게 됨. 단, readonly는 값을 넘길 수 있다는 장점이 있음. -->
					</td>
				</tr>
				<tr>
					<th class="m2">상품명</th>
					<td style="text-align:left;">
					<input type=text name="pname" value="<%=bean.getPname()%>">
					</td>
				</tr>
				<tr>
					<th class="m2">제조회사</th>
					<td style="text-align:left;">
					<input type=text name="pcompany" value="<%=bean.getPcompany()%>">
					</td>
				</tr>
				<tr>
					<th class="m2">상품이미지</th>
					<td style="text-align:left;">
					<!-- ────────────────────────────────────────────────────────────────────── -->
					<%String pimage = request.getContextPath() + "/ABC/images";%>
					<img src="<%=pimage%>/<%=bean.getPimage()%>" width="100" height="100"/>
					<!-- ────────────────────────────────────────────────────────────────────── -->
					<input type="file" name="pimage"> <!-- 새이미지(pimage[file])와 기존이미지(pimage2[text]) 2개가 넘어간다. 그중, pimage2만 삭제. -->
					<input type="text" name="pimage2" value="<%=bean.getPimage()%>"> <!-- pimage2는 text형식, 확인 이후에는 hidden 추천. -->
					</td>
				</tr>
				<tr>
					<th class="m2">상품 수량</th>
					<td style="text-align:left;">
					<input type="number" name="pqty" maxlength=8 value="<%=bean.getPqty()%>" min="1" max="999" step="0.000000000001"> 최대 999 개
					</td>
				</tr>
				<tr>
					<th class="m2">상품 가격</th>
					<td style="text-align:left;">
					<input type="number" name="price" maxlength=8 value="<%=bean.getPrice()%>" min="1000" max="1000000" step="0.00000001"> 최대 1,000,000원
					</td>
				</tr>
				<tr>
					<th class="m2">상품 스펙</th>
					<td style="text-align:left;">
						<select name="pspec"> <!-- 배열로 할 수도 있고, 아래처럼 할 수도 있다 -->
						<option value="NORMAL" <% if(bean.getPspec().equals("NORMAL")) { %> SELECTED <%}%> >::NORMAL::</option>
						<option value="HIT" <% if(bean.getPspec().equals("HIT")) { %> SELECTED <%}%> >HIT</option>
						<option value="NEW" <% if(bean.getPspec().equals("NEW")) { %> SELECTED <%}%> >NEW</option>
						<option value="BEST" <% if(bean.getPspec().equals("BEST")) { %> SELECTED <%}%> >BEST</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="m2">상품 소개</th>
					<td style="text-align:left;">
					<textarea name="pcontents" rows=5 cols=50 style="resize: none;"><%=bean.getPcontents()%></textarea>
					<!-- style="resize: none;" 이것을 해준 이유는 아무나 사이즈를 늘이거나 줄이지 못하도록 한 것이다  -->
					</td>
				</tr>
				<tr>
					<th class="m2">상품 포인트</th>
					<td style="text-align:left;"><input type="number" name="point" value="<%=bean.getPoint()%>" min="10" max="10000" step="0.0000000001"><font color="red"> 최대 10,000 point</font></td>
				</tr>
				<tr>	
					<td colspan=2 class="m1" align="center">
					<input type=submit value="상품 수정" onClick="return checkcheck()">
					<input type=reset value="취 소">
					</td>
				</tr>
			</table>
			</form>
			</td>
			<!-- ********************** -->
		</tr>
	    <tr>
	    	<td colspan="8" align="center">HEALTH SHOPPING MALL</td>
	    </tr>
	</table>
	
	