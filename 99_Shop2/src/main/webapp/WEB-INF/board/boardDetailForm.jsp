<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>    
<%@include file="../../top.jsp"%>

	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
   	<link href="${pageContext.request.contextPath}/resources/css/kfonts2.css" rel="stylesheet">
   	
   	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<style type="text/css">
	.link{
		text-decoration : none;
		font-size: 14px;
		border-radius:10px;
		background: #7fad39; 
		color: #ffffff;
		padding: 10px 10px 10px;
		border: none;
	}
	.link2{
		text-decoration : none;
		font-size: 14px;
		border-radius:10px;
		background: #7fad39; 
		color: #ffffff;
		padding: 5px 5px 5px;
		border: none;
		border-radius: 50%;
	}
</style>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jsjs/jquery.js"></script>
<script type="text/javascript">
	function txtareaRemove(){
		//alert("1");
		$('textarea').removeAttr('value');
		return false;
	}

	
	function deleteCheck(){
		//alert(1);
		var nick = "${nick}";
		//alert(nick);
		
		if(nick==""){
			alert("로그인을 해주세요.");
			location.href="login.mb";
			return false;
		}
		var answer = confirm('정말 삭제하시겠습니까?');
		if(answer){
			location.href="delete.brd?no=${bean.no}&pageNumber=${pageNumber }";
			return true;
		}
		return false;
	}
	
	
	//디테일폼
	function detailForm(){
		//alert(1);
		location.href='detailForm.brd?no=${bean.no}&pageNumber=${pageNumber}';
	}
	
	
	//댓글 추가
	function btnReply(){
		var nick = "${nick}";
		//alert(nick);
		
		if(nick==""){
			alert("로그인을 해주세요.");
			location.href="login.mb";
			return false;
		}
		var answer = confirm('댓글을 등록하시겠습니까?');
		if(answer){
			var replytext = $("#replytext").val(); //댓글내용
			var no = "${bean.no}";  //게시물 번호
			var pageNumber = "${pageNumber}";
			if(replytext == ""){
				alert("내용을 확인해주세요.");
				$("#replytext").focus();
				return false;
			}
			var param = {"replytext": replytext, "no":no, "pageNumber": pageNumber, "nick": nick};
			$.ajax({
				type: "post", 
				url: "boardReplyInsert.brd",
				data: param,
						
				success: function(){
					alert("댓글이 등록되었습니다.");	
					$('textarea').removeAttr('value');
					//alert(result);
					detailForm();
				},
				error : function(){
					alert("댓글 등록 에러");
				}
			});
			return true;
		};
		$('#replytext').select();
		return false;
		
	}
	
	
 
 	//댓글 수정폼 가져오기
	function updateFormReply(rno){
		var nick = "${nick}";
		//alert(nick);
		
		if(nick==""){
			alert("로그인을 해주세요.");
			location.href="login.mb";
			return false;
		}
		//alert(rno);
		var param = {"rno":rno, "nick":nick};
		$.ajax({
			type: "GET",
			url: "boardReplyUpdate.brd",
			data: param,
			success: function(data){
				//alert(data);
				if(data=='no'){
					alert('해당 닉네임이 일치하지 않습니다.');
					return false;
				}else{
					//고유한 값을 갖기위해
					var buttonId = "#rereplyBtn_"+rno;
					var textId = "#rereplytext_"+rno;
					var updateBtnId = "#replyUpdate_"+rno;
					var deleteBtnId = "#replyDelete_"+rno;
					var divId = '#p_Reply'+rno;
					var rcontentId = '#rcontent'+rno;
					
					$(textId).fadeIn();
					$(textId).html(data);
					$(buttonId).hide();
					$(updateBtnId).remove();
					$(deleteBtnId).remove();
					$(rcontentId).remove();
					var tempHtml = "";
					//alert("수정폼"+rno);
					tempHtml += '<input type="button" value="수정" onclick="return replyUpdate('+rno+')" class="link">&nbsp;';
					tempHtml += '<input type="button" value="취소" onclick="return detailForm()" class="link">';          
					$(divId).append(tempHtml); 
				}
			},
			error: function(){
				alert("수정폼 오류");
			}
		});
	}   
 	
 	  
 	//댓글 수정
	function replyUpdate(rno){
 		
 		var answer = confirm("수정하시겠습니까?");
 		if(answer){
 			var textId = "#rereplytext_"+rno;
 			//alert(textId);
 			var udtContent = $(textId).val();
 			//alert(udtContent);
	 		//alert(rno);
	 		if(udtContent==""){
	 			alert("내용을 확인해주세요.");
	 			$(textId).focus();
	 			return false;
	 		}
	 		var param = {"udtContent":udtContent,"rno":rno};
	 		$.ajax({
	 			type: "POST",
				url: "boardReplyUpdate.brd",
				data: param,
				success: function(data){
						alert('수정 성공');	
						detailForm();
				},
				error: function(){
					alert("댓글수정에러");
				}
	 		
	 		});
	 		return true;
 		}
 		return false;
 	}
	
	//댓글 삭제
	function deleteFormReply(rno){
		var nick = "${nick}";
		//alert(nick);
		var no = "${bean.no}";  //게시물 번호
		var pageNumber = "${pageNumber}";
		if(nick==""){
			alert("로그인을 해주세요.");
			location.href="login.mb";
			return false;
		}
		var answer = confirm("정말로 삭제하시겠습니까?");
		if(answer){
			var param = {"rno":rno, "nick":nick}; 
			$.ajax({
				url: "boardReplyDelete.brd",  				
				data: param,
				success: function(data){
					if($.trim(data) == 'yes'){
						alert("삭제성공");
						detailForm();
					}else{
						alert('해당 닉네임이 일치하지 않습니다.')
						return false;
					}
				},
				error: function(){
					alert("댓글삭제에러");
				}
			});
			return true;
		}
		return false;
	}
	
	//답글처리
	function rereply(rno,ref){
		var nick = "${nick}";
		//alert(nick);
		
		if(nick==""){
			alert("로그인을 해주세요.");
			location.href="login.mb";
			return false;
		}
		//alert(rno);
		//alert(ref);
		//alert(restep);
		var buttonId = "#rereplyBtn_"+rno;
		var textId = "#rereplytext_"+rno;
		var updateBtnId = "#replyUpdate_"+rno;
		var deleteBtnId = "#replyDelete_"+rno;
		var divId = '#p_Reply'+rno;
		//alert(textid);
		//alert(buttonid);
		
		$(textId).show();
		$(buttonId).hide();
		$(updateBtnId).remove();
		$(deleteBtnId).remove();
		var tempHtml = "";
		tempHtml += '<br><input type="button" value="등록" onclick="return re_replyInsert('+rno+','+ref+')" class="link">&nbsp;';
		tempHtml += '<input type="button" value="취소" onclick="return rereplyCancel()" class="link">';      
		$(divId).append(tempHtml); 
	}
	
	
	
	//답글취소
	function rereplyCancel(){
		detailForm();		
	}
	
	//답글 추가
	function re_replyInsert(rno,ref){
		var nick = "${nick}";
 		var answer = confirm("등록하시겠습니까?");
 		if(answer){
 			var textId = "#rereplytext_"+rno;
 			//alert(textId);
 			var istContent = $(textId).val();
 			//alert(udtContent); 
	 		//alert(rno);
	 		var no = "${bean.no}";
	 		//alert(no);
	 		if(istContent==""){
	 			alert("내용을 확인해주세요.");
	 			$(textId).focus();
	 			return false;
	 		}
	 		var param = {"istContent":istContent,"rno":rno, "no":no, "ref":ref, "nick":nick};
	 		$.ajax({
	 			type: "GET",
				url: "boardRe_replyInsert.brd",
				data: param,
				success: function(){
					alert('답글이 등록되었습니다.');	
					detailForm();
				
				},
				error: function(){
					alert("답글등록에러");
				}
	 		
	 		});
	 		return true;
 		}
 		return false;
		
	}
		
</script>
<br>
<table class="table">
	<tr><td>
	<table class="table">
		<tr bgcolor="#7fad39">
			<td>[${bean.type }] ${bean.title }
			<c:if test="${bean.readcount > 10 }">
				<img alt="" src="<%=request.getContextPath()%>/resources/images/hot.gif"/>
			</c:if>
			</td>
		</tr>	
		<tr>
			<td>
				<b>${bean.nickname }</b>
			 |  <fmt:parseDate var="date" value="${bean.reg_date }" pattern="yyyy-MM-dd HH:mm"/>
				<fmt:formatDate value="${date }" pattern="yy.MM.dd HH:mm"/> 
			 | ${bean.readcount }</td>
		</tr>	
		<tr>
			<td colspan="2" width="500px" height="300px" style="vertical-align: top;">${bean.content }</td>
		</tr>		
	</table>
	</td></tr>
	<tr><td>
	<p style="float: left;">
		<a href="move.brd?no=${bean.no}&move=2&pageNumber=${pageNumber }" class="primary-btn" style="text-decoration: none;height:40px; border-radius:10px;">이전글</a>
		<a href="move.brd?no=${bean.no}&move=1&pageNumber=${pageNumber }" class="primary-btn" style="text-decoration: none;height:40px; border-radius:10px;">다음글</a>
	</p>
	<p style="float: right;">
 		<a href="update.brd?no=${bean.no}&pageNumber=${pageNumber}" class="link">수정</a>
		<input type="button" value="삭제" onClick="return deleteCheck()" class="link">
		<a href="list.brd?pageNumber=${pageNumber}" class="link">목록</a>
	</p>
	</td></tr>
	<tr>
		<td style="text-align: left;">
		<br><h4>댓글 ${cnt }개</h4>
			<textarea rows="5" cols=110 placeholder="댓글을 남겨주세요" id="replytext" style="width: 100%; vertical-align: top;">${rcontent }</textarea>
			<div align="center" id="div_btn"><br>
				<button type="button" class="site-btn" onClick="return btnReply()" style="border-radius:10px;">등록</button>
				<button type="button" class="site-btn" onClick="return txtareaRemove()" style="border-radius:10px;">취소</button>
			</div>
		<br><br>
		</td>
	</tr>
</table>
<div id="listReply" style="margin-left: 10px; margin-right: 20px;">
<c:forEach var="reply" items="${rList }" >
	<input type="hidden" name="rno_${reply.rno }" value="${reply.rno }">
<hr>
	
	<c:if test="${reply.relevel > 0 }">
		<img src="<%=request.getContextPath()%>/resources/images/level.gif" width="50" height="15"/>
	</c:if>
		<b>${reply.nickname }</b>
		<fmt:parseDate var="date" value="${reply.rreg_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
		<fmt:formatDate value="${date }" pattern="yy.MM.dd HH:mm"/><br>
	<c:if test="${reply.relevel > 0 }">
		<img src="<%=request.getContextPath()%>/resources/images/level.gif" width="50" height="15"/>
	</c:if>	
		<span id="rcontent${reply.rno }">${reply.rcontent }</span><br><br>
		<div id="p_Reply${reply.rno }">  
		<c:if test="${reply.relevel > 0 }">
			<img src="<%=request.getContextPath()%>/resources/images/level.gif" width="50" height="15"/>
		</c:if>	
				<c:if test="${reply.relevel == 0 }">
					<input type="button" value="답글작성" onclick="return rereply(${reply.rno},${reply.ref })" id="rereplyBtn_${reply.rno }" class="link2">
				</c:if>
				<br><textarea rows="5" cols="100" style="display: none;" id="rereplytext_${reply.rno }"></textarea>
				<p style="text-align: right;">	
					<input type="button" value="수정" onClick="return updateFormReply(${reply.rno })" id="replyUpdate_${reply.rno }" class="link">
					<input type="button" value="삭제" onClick="return deleteFormReply(${reply.rno })" id="replyDelete_${reply.rno }" class="link">
					
				</p>	
		</div>
</c:forEach>
</div>
<br><br><br><br>
<center>
	<c:if test="${rePage < cnt}">
		<a href="detailForm.brd?no=${bean.no}&pageNumber=${pageNumber }&rePage=${rePage }" class="primary-btn" style="text-decoration: none;height:40px; position:relative; bottom:3px; border-radius:10px;">댓글 더보기</a>
	</c:if>
	<a href="list.brd?pageNumber=${pageNumber}" class="primary-btn" style="text-decoration: none;height:40px; position:relative; bottom:3px; border-radius:10px;">목록으로</a>
	<br><br><br><br><br>
</center>
