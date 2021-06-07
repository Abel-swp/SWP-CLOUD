<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%@include file="../../top.jsp"%>

	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
   	<link href="${pageContext.request.contextPath}/resources/css/kfonts2.css" rel="stylesheet">
   	
   	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    
<%-- 
	<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/style.css" type="text/css">
    
    <!-- Js Plugins -->
    <script src="<c:url value="/resources/new/js/jquery-3.3.1.min.js"/>"></script>
    <script src="<c:url value="/resources/new/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/new/js/jquery.nice-select.min.js"/>"></script>
    <script src="<c:url value="/resources/new/js/jquery-ui.min.js"/>"></script>
    <script src="<c:url value="/resources/new/js/jquery.slicknav.js"/>"></script>
    <script src="<c:url value="/resources/new/js/mixitup.min.js"/>"></script>
    <script src="<c:url value="/resources/new/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/new/js/main.js"/>"></script>
    --%>


<br>
<h2 align="center">	게시판  </h2><br>
<form action="list.brd" method="get">
	<table class="table table-striped" style="text-align: center;">
		<tr><td>
			<select name="whatColumn">
				<option value="all">전체 검색
				<option value="type">요청/나눔      
				<option value="category">카테고리
				<option value="title">제목
			</select> 
			<input type="text" name="keyword"> 
			
			<input type="submit" value="검색">
			
			<%-- <input type="button" value="글작성" onclick="location.href='boardWrite.brd?pageNumber=${page.pageNumber}'" id="btn" style="float:left;"> --%>
			<a href="boardWrite.brd?pageNumber=${page.pageNumber}" class="primary-btn" style="float:right; text-decoration: none; border-radius:10px;">글작성</a>
			
		</td></tr>
	</table>
</form>
	
	<table class="table">
		<tr style="margin: auto;text-align:center" bgcolor="#7fad39">
			<th style="text-align:center; width: 5%;">유형</th>
			<th style="text-align:center; width: 13%;">카테고리</th>
			<th style="text-align:center; width: 55%;">제목</th>
			<th style="text-align:center; width: 10%;">닉네임</th>
			<th style="text-align:center; width: 10%;">등록일</th>
			<th style="text-align:center; width: 7%;">조회수</th>
		</tr>
		
		<c:forEach items="${list }" var="board">
			<tr>
				<td align="center" <c:if test="${board.type == '나눔'}"> style="color: red;"</c:if> >
					${board.type}
				</td>
				<td align="center">
					${board.category}
				</td>
				<td align="center" style="text-align: left;">
					<a href="detailForm.brd?no=${ board.no }&pageNumber=${page.pageNumber}" 
					style="text-decoration: none; color: black;">${board.title}<span style="color: blue;">(${board.replycount })</span></a>
				<c:if test="${board.readcount > 10 }">
					<img alt="" src="<%=request.getContextPath()%>/resources/images/hot.gif"/>
				</c:if>	
				</td>
				<td align="center">
					${board.nickname }
				</td>
				<td align="center">
					<fmt:parseDate var="date" value="${board.reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${date }" pattern="yy.MM.dd HH:mm"/>
				</td>
				<td align="center">
					${board.readcount}
				</td>
			</tr>
		</c:forEach>
	</table>
	<center>
	${page.pagingHtml }
	</center>
	
















