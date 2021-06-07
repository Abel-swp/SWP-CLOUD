<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- ********** -->
    <%@ include file="../A_user/A2_display_top.jsp" %>
    <style type="text/css"> body {text-align : center;} table {margin : 0 auto;} </style>
	<%@ include file="etc/color.jsp" %>		
    <!-- ********** -->				
	
	<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	BoardDao bdao = BoardDao.getInstance();
	BoardBean bean = bdao.getBoardByNum1(num);
	int ref = bean.getRef();
	int re_step = bean.getRe_step();
	int re_level = bean.getRe_level();
	%>
	
	<table border="0" width="500" bgcolor="<%=bodyback_c%>" class="table" style="height:350px;margin-bottom:0px">
		<tr height="30">
			<td align="center" width="70" bgcolor="<%=value_c%>">번호</td>
			<td align="center" width="70" bgcolor="<%=value_c%>">제목</td>
			<td align="center" width="70" bgcolor="<%=value_c%>">작성자</td>
			<td align="center" width="70" bgcolor="<%=value_c%>">작성일</td>
			<td align="center" width="70" bgcolor="<%=value_c%>">조회수</td>
		</tr>
		<tr height="30">
			<td align="center" width="125"><%=bean.getNum()%></td>
			<td align="center" width="125"><%=bean.getSubject()%></td>
			<td align="center" width="125"><%=bean.getWriter()%></td>
			<td align="center" width="125"><%=sdf.format(bean.getReg_date())%></td>
			<td align="center" width="125"><%=bean.getReadcount()%></td>
		</tr>
		<tr height="30">
			<td align="center" width="125" bgcolor="<%=value_c%>" colspan="5">:: 글내용 ::</td>
		</tr>
		<tr height="300">
			<td align="center" width="375" colspan="5" style="text-align:left;"><pre><%=bean.getContent()%></pre></td>
		</tr>
		<tr height="30">
			<td align="center" width="500" colspan="5" bgcolor="<%=value_c%>">
				<%int n = bean.getNum(); int p = pageNum; String w = bean.getWriter(); String s = bean.getSubject(); String e = bean.getEmail(); String c = bean.getContent();%>
				<form name="f" method="post" action="D4_updateForm.jsp">
					<input type="hidden" name="n" value="<%=n%>"><input type="hidden" name="p" value="<%=p%>"><input type="hidden" name="keep" value="<%=keep%>"><input type="hidden" name="w" value="<%=w%>"><input type="hidden" name="s" value="<%=s%>"><input type="hidden" name="e" value="<%=e%>"><input type="hidden" name="c" value="<%=c%>">
					<input type="submit" class="btn btn-default" value="수정하기">
					<input type="button" class="btn btn-warning" value="삭제하기" onClick="location.href='D5_deleteForm.jsp?num=<%=bean.getNum()%>&pageNum=<%=pageNum%>&keep=<%=keep%>'">
					<input type="button" class="btn btn-default" value="댓글쓰기" onClick="location.href='D6_replyForm.jsp?ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>&pageNum=<%=pageNum%>&keep=<%=keep%>'"> <!-- ref값이 num과 같아서 num은 없어도 된다 -->
					<input type="button" class="btn btn-info" value="목록보기" onClick="location.href='D1_list.jsp?pageNum=<%=pageNum%>&keep=<%=keep%>'">
				</form>
			</td>
		</tr>
	</table>

	<!-- ********** -->
	<jsp:include page="../A_user/A3_display_bottom.jsp"/>
	<!-- ********** -->
	
	