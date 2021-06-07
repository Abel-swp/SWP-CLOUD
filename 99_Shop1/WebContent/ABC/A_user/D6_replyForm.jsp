<!-- (ref,re_step,re_level,pageNum,keep)5개의 값을 넘겨 받음. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- ********** -->
    <%@ include file="../A_user/A2_display_top.jsp" %>
    <style type="text/css"> body {text-align : center;} table {margin : 0 auto;} </style>
	<%@ include file="etc/color.jsp" %>
    <!-- ********** -->
	
	<%
	int ref = Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = Integer.parseInt(request.getParameter("re_level"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	// request.getParameter("keep")은 모듈화된 top.jsp에서 받음
	%>

	<form method="post" name="replyForm" action="D6_replyProc.jsp?ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>&pageNum=<%=pageNum%>&keep=<%=keep%>">
	<table border="0" width="450" bgcolor="<%=bodyback_c%>" class="table" style="margin-bottom:-13px">
		<tr>
			<td width="350">
				<input type="text" name="writer" maxlength="10" placeholder="이름을 입력하세요">
			</td>
			<td width="70" bgcolor="<%=value_c%>" align="center">이름</td>
		</tr>
		<tr>
			<td width="350">
				<input type="text" name="subject" maxlength="20" placeholder="제목을 입력하세요">
			</td>
			<td width="70" bgcolor="<%=value_c%>" align="center">제목</td>
		</tr>
		<tr>
			<td width="350">
				<input type="text" name="email" maxlength="30" placeholder="이메일을 입력하세요">
			</td>
			<td width="70" bgcolor="<%=value_c%>" align="center">Email</td>
		</tr>
		<tr>
			<td width="350" style="width:10%">
				<textarea name="content" rows="15" cols="60" id="ct" placeholder="내용을 입력하세요" style="resize:none;"></textarea>
			</td>
			<td width="70" bgcolor="<%=value_c%>" align="center">내용</td>
		</tr>
		<tr>
			<td width="350">
				<input type="password" name="passwd" maxlength="10" placeholder="해당글 비밀번호를 등록하세요">
			</td>
			<td width="70" bgcolor="<%=value_c%>" align="center">비밀번호</td>
		</tr>
		<tr class="active">
			<td colspan="2" bgcolor="<%=value_c%>" align="center" height="30">
				<input type="submit" value="댓글쓰기" class="btn btn-default" onClick="return writeSave()">
				<!-- 이 파일 내부에서 writeSave() 함수를 찾고, 없으면 자동으로 script.js 파일로 가서 찾는다. -->
				<input type="button" value="목록보기" class="btn btn-info" onClick="location.href='D1_list.jsp?keep=<%=keep%>'">
			</td>
		</tr>
	</table>
	</form>

	<!-- ********** -->
	<jsp:include page="../A_user/A3_display_bottom.jsp"/>
	<!-- ********** -->
	
	