<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ include file="A2_top.jsp" %> <!-- 1. include 지시어(Original) -->
		<td colspan="8" align="center" style="height:200px;">
			<form method="post" action="C2_findidProc.jsp">
			<table border="0" align="center" width="500" class="table table-striped">
					<caption style="text-align:center;"><font color="brown"><b>:: 아이디 찾기 ::</b></font></caption>
					<tr>
						<td bgcolor="#EFFA99" align="center">이름</td>
						<td style="text-align:left;"><input type="text" name="name" size="18"></td>
					</tr>
					<tr>
						<td bgcolor="#EFFA99" align="center">주민등록번호</td>
						<td style="text-align:left;">
							<input type="text" name="rrn1" maxlength="6" size="6">
							- 
							<input type="text" name="rrn2" maxlength="7" size="7">
						</td>
					</tr>
					<tr class="warning">
						<td colspan="2" bgcolor="#FFCC00" align="center" style="width:675px;">
							<input type="submit" value="아이디 찾기" class="btn btn-warning">
						</td>
					</tr>
			</table>
			</form>
		</td>
	<jsp:include page="A3_bottom.jsp"/> <!-- 2. include 액션태그(Result) -->