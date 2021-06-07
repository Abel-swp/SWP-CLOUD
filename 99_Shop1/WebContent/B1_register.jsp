<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%--
	* B1_register.jsp ------> script.js ------> B2_validation.jsp ------> B3_registerProc.jsp
	(script.js 의 AJAX 함수 ---> validation.jsp 로 검사 ---> 결과에 따라 응답 값 register.jsp 에 출력 ---> B3_registerProc.jsp 에서 회원가입 진행)
	--%>
	
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	
	<%@ include file="A2_top.jsp" %> <!-- 1. include 지시어(Original) -->
		<td colspan="8">
			<form action="B3_registerProc.jsp" method="post" onSubmit="return writeSave()" class="form-horizontal"> <!-- <form action="B3_registerProc.jsp" method="post"> -->
			<table width="650" style="margin-bottom:-20px">
				<tr>
					<td colspan="2" bgcolor="#C2B6FF" height="40">
						<font size="4" color="black">
							<b>:: Client Information (회원 가입/Sign Up) ::</b>
						</font>
					</td>
				</tr>
				<tr>
					<th bgcolor="#F8F6FF"> &nbsp; * 회원 아이디 </th>
					<td style="text-align:left;">
						<input type="text" name="id" placeholder="신규 아이디 입력" class="form-control" style="width:43%">
						<input type="button" id="id_check" value="중복체크" class="btn btn-default" onClick="return duplicate()">
						<span id="idmessage"></span>
					</td>
				</tr>
				<tr>
					<th bgcolor="#C2B6FF"> &nbsp; * 비밀 번호</th>
					<td style="text-align:left;">
						<input type="password" name="password" placeholder="신규 비밀번호 입력" class="form-control" style="width:43%"><div>&nbsp;영문 소문자/숫자 조합3~8자</div>
					</td>
				</tr>
				<tr>
					<th bgcolor="#F8F6FF"> &nbsp; * 비밀 번호 확인</th>
					<td>
						<input type="password" name="repassword" id="repassword" class="form-control" placeholder="신규 비밀번호 확인 입력" style="width:43%">
						<span id="pwmessage" style="display:none;"></span>
					</td>
				</tr>
				<tr>
					<th bgcolor="#C2B6FF" align="center"> &nbsp; * E-Mail </th>
					<td>
						<input type="text" name="email" class="form-control" placeholder="신규 이메일 입력" style="width:43%"> 
					</td>
				</tr>
				<tr>
					<th bgcolor="#F8F6FF" align="center"> &nbsp; * 이름 </th>
					<td>
						<input type="text" name="name" class="form-control" placeholder="신규 이름 입력" style="width:43%">
					</td>
				</tr>
				<tr>
					<th bgcolor="#C2B6FF" align="center"> &nbsp; * 주민 등록 번호 </th>
					<td style="text-align:left;">
						<input type="text" name="rrn1" maxlength="6" size="16" placeholder="주민등록번호 앞 6자리" style="height:36px;"> - 
						<input type="text" name="rrn2" maxlength="7" size="16" placeholder="주민등록번호 뒤 7자리" style="height:36px;">
					</td>				
				</tr>
				<tr>
					<th bgcolor="#F8F6FF" align="center"> &nbsp; * 전화 번호 </th>
					<td style="text-align:left; height:36px;">
						<select name="phone1">
							<option value="02">02</option>
							<option value="051">051</option>
						</select> - 
						<input type="text" name="phone2" size="4" maxlength="4" size="15" placeholder="1234"> - 
						<input type="text" name="phone3" size="4" maxlength="4" size="15" placeholder="5678"> 예) 051-000-0000
					</td>
				</tr>
				<tr>
					<th bgcolor="#C2B6FF" align="center"> &nbsp; * 휴대 전화 번호 </th>
					<td style="text-align:left; height:36px;">
						<select name="hp1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="011">017</option>
						</select> - 
						<input type="text" name="hp2" size="4" maxlength="4" size="15" placeholder="1357"> - 
						<input type="text" name="hp3" size="4" maxlength="4" size="15" placeholder="2468"> 예) 010-0000-0000
					</td>
				</tr>
				<tr>
					<th bgcolor="#F8F6FF" align="center"> &nbsp; * 가입 일자 </th>
					<td style="text-align:left; height:36px;">
						<input type="text" name="joindate" size="15" placeholder="2020/01/01" onBlur="datecheck()"> 예)2020/01/01
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" style="height:50px;">
						<p><input type="submit" value="가입 하기" id="sub" class="btn btn-info">&nbsp;&nbsp; <!-- <input type="submit" value="가입 하기" id="sub" onClick="return writeSave()">&nbsp;&nbsp; -->
						<input type="reset" value="입력초기화" class="btn btn-info"><br>
					</td>
				</tr>
			</table>
			</form>
		</td>
	<jsp:include page="A3_bottom.jsp"/> <!-- 2. include 액션태그(Result) -->
	
	