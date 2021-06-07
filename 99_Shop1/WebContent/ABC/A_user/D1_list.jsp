<!-- D1_list.jsp = pageNum 1개만 넘겨받음. keep은 top.jsp에서 공수. -->
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- ********** -->
    <%@ include file="../A_user/A2_display_top.jsp" %>
    <style type="text/css"> body {text-align : center;} table {margin : 0 auto;} </style>
	<%@ include file="etc/color.jsp" %>	
    <!-- ********** -->
	
	<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	int pageSize = 10; // 한 페이지에 보여줄 게시글의 갯수(값을 넘겨주기 위해 문자열 지정)
	int pageNum = 0; // 클릭한 현재 페이지(ex:[1][2])를 문자열로 저장하는 변수. 아래 조건문에 따라 홈페이지 처음 접속 시 페이지 넘버 [1]로 시작.
	if(request.getParameter("pageNum") == null) {pageNum = 1;} else {pageNum = Integer.parseInt(request.getParameter("pageNum"));}
	int startRow = (pageNum - 1) * pageSize + 1; // startRow = pageNum 가 1인 경우 1, 2인경우 11, 3인경우 21, 4인경우 31, 5인경우 41  (10씩증가)
	int endRow = pageNum * pageSize;			 // endRow   = pageNum 가 1인 경우 10, 2인경우 20, 3인경우 30, 4인경우 40, 5인경우 50 (10씩증가)
	int number = 0; // 전체 글 수(초기화)
	%>
	
	<%
	BoardDao bdao = BoardDao.getInstance(); // BoardDao Singleton Method
	int count = bdao.AllAriticlesCount(); // 페이지 분할 선행 준비. insert 된 레코드 전체 갯수를 셈
	ArrayList<BoardBean> blist = bdao.AllArticles(startRow,endRow); // 전체 내용 조회
	number = count - (pageNum - 1) * pageSize; // count가 14인 경우 = 또 pageNum 이 1이면 14, 2는 4, 3은 -6, 4는 -16, 5는 -26 (10씩감소)
	// count = 전체 글 수
	// number = 현재 페이지에 따라 바뀌는 전체 글 수(페이지 1개의 최대 수용 레코드는 pageSize인 10개)
	%>
	
	<h2 style="text-align:left"><font color="gray">&nbsp;&nbsp;자유게시판</font></h2>
	<hr style="width:612px;height:2px;border:0px;background:#ccc;position:absolute;top:118px"><br>
	
	<table width="700" align="center" class="table table-striped" style="margin:0;padding:0">
		<tr align="center" bgcolor="<%=value_c%>">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
			<!-- <td>IP주소</td> -->
		</tr><%
		for(int i=0; i<blist.size(); i++){
		BoardBean bean = blist.get(i);%>
		<tr>
			<td> <!-- 번호 -->
				<%=number--%> <!-- getNum()은 댓글에 따라 번호가 뒤섞임. -->
			</td>
			<td style="text-align:left"> <!-- 제목 --> <%
				int wid=0; // 댓글 앞에 붙일 이미지 파일 가로 길이 초기화
				if(bean.getRe_level() > 0){ // re_level = 원본:0, 댓글:1, 대댓글:2, 즉 원본이 아닌 경우의 조건문
				wid = 20 * bean.getRe_level(); // 댓글:20, 대댓글:40, 으로 지정 %>
				<img src="images/level.gif" width="<%=wid%>" height="16">[댓글]<!-- <img src="images/re.gif"> --> <%}%>
				<a href="D2_content.jsp?num=<%=bean.getNum()%>&pageNum=<%=pageNum%>&keep=<%=keep%>"><%=bean.getSubject()%></a> <%
				if(bean.getReadcount() >= 10){ // 만약 조회수 10이상 시 image 하나 부착 %>
				<img src="images/hot.gif"> <%}%>
			</td>
			<td><%=bean.getWriter()%></td> <!-- 작성자 -->
			<td><%=sdf.format(bean.getReg_date())%></td> <!-- 작성일 -->
			<td><%=bean.getReadcount()%></td> <!-- 조회수 -->
			<%-- <td><%=bean.getIp()%></td> <!-- IP주소 --> --%>
		</tr><%}%>
	</table>

	<div align="right" style="position:relative; right:1.75em; bottom:-2.6em"><button type="button" class="btn btn-primary" onClick="location.href='D3_writeForm.jsp?keep=<%=keep%>'">글쓰기</button><br></div> <%
	
	if(count > 0){ // ex) [1][2][3] ---> 페이지 넘버 매기기 조건문. 레코드가 1개라도 있으면 실행
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1); // pageCount = 전체 글 수에 따라 필요한 페이지 수
		int pageBlock = 10; // pageBlock : 말 그대로 페이지 블럭의 갯수 'ex)[1][2][3][4][5]'.
		int startPage = ((pageNum-1) / pageBlock * pageBlock) + 1; // pageNum에 따라 증가 : 1-11-21-31-41-51 ~ (startRow와 비슷)
		int endPage = startPage + pageBlock - 1; // 10-20-30-40-50 ~ (endRow와 비슷)
		if(endPage > pageCount){endPage = pageCount;}
		if(startPage > 10){
		%><ul class="pagination" style="margin:0;padding:0;"><li><a href="D1_list.jsp?pageNum=<%=startPage - 10%>&keep=<%=keep%>">«</a></li></ul><%
		}
		for(int i=startPage; i<=endPage; i++){
		%><ul class="pagination" style="margin:0;padding:0;"><li><a href="D1_list.jsp?pageNum=<%=i%>&keep=<%=keep%>"><%=i%></a></li></ul><%
		}
		if(endPage < pageCount){
		%><ul class="pagination" style="margin:0;padding:0;"><li><a href="D1_list.jsp?pageNum=<%=startPage + 10 %>&keep=<%=keep%>">»</a></li></ul><%
		}
	}%>
	<p><br>
	<!-- ********** -->
	<jsp:include page="../A_user/A3_display_bottom.jsp"/>
	<!-- ********** -->
	
	