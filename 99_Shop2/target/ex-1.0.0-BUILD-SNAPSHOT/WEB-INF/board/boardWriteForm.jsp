<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@include file="../../top.jsp"%>

	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
   	<link href="${pageContext.request.contextPath}/resources/css/kfonts2.css" rel="stylesheet">
   	
   	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    
    

<script type="text/javascript">
	function checkInsert(){
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

<center><h2>글 작성</h2></center><br>
<form method="post" action="boardWrite.brd" name="myform">
	<table class="table table-striped" style="border-spacing: 0 20px; width:200px; margin: auto;">
		<tr>
			<td><a style="float:left">게시판 :&nbsp;</a>
			<select name="type">
				<option value="">유형
				<option value="요청">요청</option>
				<option value="나눔">나눔</option>
			</select>
			</td>
		</tr>
		<tr>
			<td><a style="float:left">카테고리 :&nbsp;</a>
			<select name="category">
				<option value="">카테고리</option>
				<option value="디자인">디자인</option>
				<option value="IT·프로그래밍">IT·프로그래밍</option>
				<option value="영상·사진·음향">영상·사진·음향</option>
			</select>
			</td>
		</tr>
		<tr>
			<td><a style="float:left">제목 :&nbsp;</a>
				<input type="text" name="title" placeholder="제목을 입력해주세요." size="50">
			</td>
		</tr>
		<tr>
			<td>
				<textarea name="content" rows="10" cols="100" placeholder="글을 입력해주세요." style="resize:none"></textarea>
			</td>
		</tr>
	
	</table>
	<div align="center">
		<span>
			<button type="submit" class="site-btn" onClick="return checkInsert()" style="position:relative;left:65px; border-radius:10px;">글작성</button>
		</span>
		<a href="list.brd?pageNumber=${pageNumber}" class="primary-btn" style="text-decoration: none;height:45px;position:relative;bottom:3px;left:247px; border-radius:10px;">작성취소</a>
	</div>"

	<%--
	<input type="submit" value="글작성" onClick="return checkInsert()" align="center">
	<input type="button" value="작성 취소" style="float: right;" onClick="location.href='list.brd?pageNumber=${pageNumber}'" align="right">
	--%>

</form>
