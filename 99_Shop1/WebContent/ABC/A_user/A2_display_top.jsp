<!-- 상단, (좌측)카테고리 리스트 : cname[code] 배열 출력(E1_prod_input.jsp 참조) -->
<%@page import="project.CatBean"%>
<%@page import="project.CatDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.Encryption"%>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	request.setCharacterEncoding("UTF-8");
	String keep = null;
	// String keep = (String)session.getAttribute("keep");
	keep = request.getParameter("keep");
	%>	
	
	<style> h2 {margin: 20px 0} .tab-content {padding: 10px 0;} </style>
	<link rel="stylesheet" type="text/css" href="../../css/style.css"/>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/custom2.css">
	<link rel="stylesheet" type="text/css" href="../../css/kfonts2.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="../../js/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript">
	var str = document.getElementById("textarea").value;
	str = str.replaceAll("<br/>", "\r\n");
	document.getElementById("textarea").value = str;
	/*
	var str = document.getElementById("textarea").value;
	str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
	document.getElementById("result").value = str;
	*/
	/*
	var str = $("#textarea").val();
	str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
	$("#text").html(str);
	*/
		function outout(){
			alert("성공적으로 로그아웃 하였습니다.");
			location.href = "../../A1_main.jsp";
		}
		function writeSave() {
			var regex = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
			if($('input[name="writer"]').val() == '') {
				alert('이름을 입력하세요.');
				$('input[name="writer"]').focus();
				return false;
			}
			if($('input[name="subject"]').val() == '') {
				alert('제목을 입력하세요.');
				$('input[name="subject"]').focus();
				return false;
			}
			if($('input[name="email"]').val() == '') {
				alert('이메일을 입력하세요.');
				$('input[name="email"]').focus();
				return false;
			} else if($('input[name="email"]').val().search(regex) == -1) {
				alert('올바른 이메일 형식이 아닙니다.');
				$('input[name="email"]').focus();
				return false;
			}
			if($('textarea[name="content"]').val() == '') {
				alert('내용을 입력하세요.');
				$('textarea[name="content"]').focus();
				return false;
			}
			if($('input[name="passwd"]').val() == '') {
				alert('게시글 비밀번호를 입력하세요.');
				$('input[name="passwd"]').focus();
				return false;
			}
		}
		function checkDelete() {
			if(delForm.passwd.value == ""){ // if(document.delForm.passwd.value == ""){
				alert("비밀번호를 입력하세요.");
				delForm.passwd.focus();
				return false;
			}
		}
	</script>
	
	<!-- 
	<ol class="breadcrumb">
		<li><a href="#">Home</a></li>
		<li><a href="#">menu1 </a></li>
		<li class="active">submenu</li>
	</ol>
	-->
	
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
					<div style="text-align:right;position:absolute;top:0.9em;right:31.5em">
						<span style="text-align:center;"><font color="green"> ' <%=keep%> ' 님 </font></span> <!-- float:right -->
						<a href="javascript:outout()"><img src="../../img/logout.jpg" width="50" height="20"/>&nbsp;</a> <!-- float:right -->
					</div>
				<%} else {%>
					<div style="text-align:right;position:absolute;right:28.25em;top:3em"><a href="../../A1_main.jsp"><font color="green"><b> 회원 가입 후 상품 주문이 가능합니다.&nbsp;</b></font></a></div>
				<%}%>
			</td>
		</tr>
		<tr>
			<td width="180px" align="center" valign="top">
			<table border="0" class="table table-striped">
				<%
				CatDao dao = CatDao.getInstance();
				ArrayList<CatBean> list = dao.AllCat();
				%>
				<%if(list.size() == 0) {%>
					<tr>
						<td>카테고리 없음</td> <!-- out.print("<tr><td>등록된 카테고리 없음</td></tr>"); -->
					<tr>
					<% // return; // else가 없는 경우 사용 %>
				<%} else {%>
					<%for(CatBean bean : list){ // 왼쪽 상단의 카테고리 리스트를 만들기 위한 for문
					String cname = bean.getCname(); // 개선된 for문 사용시 해당 객체 선언이 필요 // 일종의 bean 객체
					String ccode = bean.getCcode();%>
					<tr class="warning" style="text-align:center;">
						<td>
							<a href="B1_display_cglist.jsp?cname=<%=cname%>&ccode=<%=ccode%>&keep=<%=keep%>"><%=cname%><span class="badge pull-right"><%=ccode%></span></a>
						</td>
					</tr>
					<%}%>
				<%}%>
			</table>
			</td>
			
			<td width="590px" align="center" valign="top">
			
			