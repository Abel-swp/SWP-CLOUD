<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp<br>
<%@ include file="../common/common.jsp" %>
<%@include file="../../top.jsp"%>

	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
   	<link href="${pageContext.request.contextPath}/resources/css/kfonts2.css" rel="stylesheet">
   	
   	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    
<script type="text/javascript">

	function checkUpdate(){
		//alert(1);
		
		if(!myform.type.value){
			alert("유형을 선택하세요");
			myform.type.focus();
		return false;
		}
		
		if(!myform.category.value){
			alert("카테고리를 선택하세요");
			myform.category.focus();
		return false;
		}
		
		if(!myform.title.value){
			alert("제목을 입력하세요");
			myform.title.focus();
		return false;
		}
		
		if(!myform.content.value){
			alert("글을 입력해주세요");
			myform.content.focus();
		return false;
		}
		
	}
</script>
<%
	String category[] = {"디자인","IT·프로그래밍","영상·사진·음향"};
%>
<center>
<h2>글 수정</h2></center><br>
<form method="post" action="update.brd" name="myform">
	<input type="hidden" name="pageNumber" value="${pageNumber }">
	<input type="hidden" name="no" value="${bean.no }">
	
	<table class="table table-striped" style="border-spacing: 0 20px; width:200px; margin: auto;">
		<tr>
			<td><h5>게시판</h5>
			
			<select name="type">
				<option value="">유형
				<option value="요청" <c:if test='${fn:contains(bean.type, "요청") }'> selected </c:if> >요청</option>
				<option value="나눔" <c:if test='${fn:contains(bean.type, "나눔") }'> selected </c:if> >나눔</option> 
			</select>
			</td>
		</tr>
		<tr>
			<td><h5>카테고리</h5>
			<select name="category">
				<option value="">카테고리</option>
				
				<c:forEach var="cate" items="<%=category %>">
					<option value="${cate }" <c:if test='${bean.category eq cate }'> selected </c:if> >${cate }</option>
				</c:forEach>	
			</select>
			</td>
		</tr>
		<tr>
			<td><h5>제목</h5>
				<input type="text" name="title" placeholder="제목을 입력해주세요." size="50" value="${bean.title }" style="margin-bottom: 20px;"> 
			</td>
		</tr>

		<tr>
			<td>
				<textarea name="content" rows="10" cols="100" placeholder="글을 입력해주세요.">${bean.content }</textarea>
			</td>
		</tr>
	</table>
	
<%-- 	<input type="submit" value="글수정" align="center" onClick="return checkUpdate()">
		<input type="button" value="수정 취소" style="float: right;" onClick="location.href='detailForm.brd?pageNumber=${pageNumber}&no=${bean.no }'"> --%>
	<div align="center">
		<span>
			<button type="submit" class="site-btn" onClick="return checkUpdate()" style="position:relative;left:65px; border-radius:10px;">글수정
		</button></span>
		<a href="detailForm.brd?pageNumber=${pageNumber}&no=${bean.no }" class="primary-btn" style="text-decoration: none;height:45px;position:relative;bottom:3px;left:247px; border-radius:10px;">수정 취소</a>
	</div>"
</form>
