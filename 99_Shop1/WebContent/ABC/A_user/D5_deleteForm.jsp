<!-- (num,pageNum,keep)3개의 값을 넘겨 받음. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<!-- ********** -->
    <%@ include file="../A_user/A2_display_top.jsp" %>
    <style type="text/css"> body {text-align : center;} table {margin : 0 auto;} </style>
	<%@ include file="etc/color.jsp" %>		
    <!-- ********** -->
    
    <%
	int num = Integer.parseInt(request.getParameter("num")); // onSubmit으로 넘기기
	int pageNum = Integer.parseInt(request.getParameter("pageNum")); // onSubmit으로 넘기기
	// request.getParameter("keep")은 모듈화된 top.jsp에서 받음 // onSubmit으로 넘기기
	%>

	<form method="post" name="delForm" action="D5_deleteProc.jsp?num=<%=num%>&pageNum=<%=pageNum%>&keep=<%=keep%>" onSubmit="return checkDelete()"> <!-- 아래에서 onClick 미사용 시 상단의 form태그에서 onSubmit으로 비슷하게 사용 가능 -->
	<table align="center" width="220" style="position:absolute; top:9.5em; left:47em">
		<tr height="30">
			<td align="center" bgcolor="<%=value_c%>"><b>비밀번호를 입력해 주세요.</b></td>
		</tr>
		<tr height="40">
			<td align="center">
				<div style="text-align:left;">&nbsp;비밀번호 :</div>
				<input type="password" name="passwd" class="form-control" style="width:60%;position:absolute;top:2.375em;left:5.5em" maxlength="12"> <!-- input으로 넘기기 -->
				<%-- <input type="hidden" name="num" value="<%=num%>"> 이렇게 hidden 으로 넘길 수도 있음. --%>
			</td>
		</tr>
		<tr height="30">
			<td align="center" bgcolor="<%=value_c%>">
				<input type="submit" class="btn btn-warning" value="글삭제"><!-- <input type="submit" class="btn btn-warning" value="글삭제" onClick="return checkDelete()"> -->
				<input type="button" class="btn btn-info" value="글목록" onClick="location.href='D1_list.jsp?pageNum=<%=pageNum%>&keep=<%=keep%>'">
			</td>
		</tr>
	</table>
	</form>
	
	<!-- ********** -->
	<jsp:include page="../A_user/A3_display_bottom.jsp"/>
	<!-- ********** -->
	
	