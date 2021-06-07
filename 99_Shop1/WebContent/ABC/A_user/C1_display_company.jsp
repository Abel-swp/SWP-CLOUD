<!-- 상단, (좌측)카테고리 리스트 : cname[code] 배열 출력(E1_prod_input.jsp 참조) -->
<%@page import="project.CatBean"%>
<%@page import="project.CatDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.Encryption"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	String keep = null;
	// String keep = (String)session.getAttribute("keep");
	keep = request.getParameter("keep");
	%>	
	
	<link rel="stylesheet" type="text/css" href="../../css/style.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/custom2.css">
	<link rel="stylesheet" type="text/css" href="../../css/kfonts2.css">
	
	<style>
	h2 {
		margin: 20px 0
	}
    .tab-content {
    	padding: 10px 0;
    }
    </style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="../../js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function outout(){
			alert("성공적으로 로그아웃 하였습니다.");
			location.href = "../../A1_main.jsp";
		}
	</script>
	
	<table border="1" width="800px" align="center">
		<tr height="50">
			<td colspan="2">
			<ol class="breadcrumb">
				<%if(!keep.equals("guest")){%>
				<li><a href="../../A1_main.jsp?keep=<%=Encryption.getEncoding(keep)%>">MAIN</a></li>
				<%} else {%>
				<li><a href="../../A1_main.jsp">MAIN</a></li> 
				<%}%>
				<li><a href="A1_display.jsp?keep=<%=keep%>">전체상품보기</a></li>
				<li><a href="B4_display_cartlist.jsp?keep=<%=keep%>">장바구니</a></li>
				<li><a href="D1_list.jsp?keep=<%=keep%>">게시판</a></li>
				<li><a href="C1_display_company.jsp?keep=<%=keep%>">회사소개</a></li></ol>
				<%if(!keep.equals("guest")){%>
					<div style="text-align:right;position:absolute;top:0.9em;right:23em">
						<span style="text-align:center;"><font color="green"> ' <%=keep%> ' 님 </font></span> <!-- float:right -->
						<a href="javascript:outout()"><img src="../../img/logout.jpg" width="50" height="20"/>&nbsp;</a> <!-- float:right -->
					</div>
				<%} else {%>
					<div style="text-align:right;position:absolute;right:13.5em;top:3em"><a href="../../A1_main.jsp"><font color="green"><b> 회원 가입 후 상품 주문이 가능합니다.&nbsp;</b></font></a></div>
				<%}%>
			</td>
		</tr>
		<tr> <!-- 두번째 줄 -->
			<td width="180px" align="center" valign="top">
				<%--
				<table border="0" align="center" class="table table-striped">
					<tr class="success" style="text-align:center;">
						<td>
							<a href="C3_display_ceo.jsp?keep=<%=keep%>">CEO인사말</a>
						</td>
					</tr>
					<tr class="active" style="text-align:center;">
						<td>
							<a href="C4_display_history.jsp?keep=<%=keep%>">회사연혁</a>
						</td>
					</tr>
					<tr class="active" style="text-align:center;">
						<td>
							<a href="C5_display_chart.jsp?keep=<%=keep%>">조직도</a>
						</td>
					</tr>
				</table>
				--%>
				<div class="container">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#home" data-toggle="tab">회사소개</a></li>
						<li><a href="#tab1" data-toggle="tab">CEO인사말</a></li>
						<li><a href="#tab2" data-toggle="tab">회사연혁</a></li>
						<li><a href="#tab3" data-toggle="tab">조직도</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active fade in" id="home">
							<img src="../../img2/100.png" width="1000" height="1800">
						</div>
						<div class="tab-pane fade" id="tab1" style="position:relative; right:100px;">
							<p><p><img src="../../img2/200.jpg" width="900" height="500">
						</div>
						<div class="tab-pane fade" id="tab2">
							<img src="../../img2/300.jpg" width="1000" height="1000">
						</div>
						<div class="tab-pane fade" id="tab3">
							<p><p><img src="../../img2/400.jpg" width="900" height="600">
						</div>
					</div>
				</div>
			</td>
			
			<td width="590px" align="center" valign="top">
			
	<!-- ********** -->
	<jsp:include page="A3_display_bottom.jsp"/>
	<!-- ********** -->
	
	