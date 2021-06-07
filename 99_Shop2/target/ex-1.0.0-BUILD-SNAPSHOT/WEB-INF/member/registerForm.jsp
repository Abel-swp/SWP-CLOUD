<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Generic - Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" /></noscript>
	</head>
	<%
		String conpath = request.getContextPath();
		int flag;
		%>
		<!-- <script type="text/javascript">
			/* function Send(conpath) {
				alert(1);
				var name = document.myForm.name.value;
				var email = document.myForm.email.value;
				var password = document.myForm.password.value;
				alert("이메일이 전송되었습니다.");
				location.href = conpath + "/sendMail.mb?email="+email+"&name="+name+"&password="+password;
			} */
			
			
			function aa(){
				alert(1);
			}
			
			function checkEmail(){
				var Echeck = ${randNum};
				var check = document.myForm.randNum.value;
				if(Echeck != check){
					alert("인증번호가 잘못되었습니다.")
					return false;
				}
				return true;
			}
			$("#email_id").val();
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"  type="text/javascript"></script>﻿
		</script> -->
		<script type="text/javascript" src="resources/jsjs/jquery.js"></script>
		<script type="text/javascript">
		var isChange;
		 	function setEmailDomain(domain){
		        $("#email_domain").val(domain);
		    }
			function Send(conpath){
		  var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		  var email_id = document.myForm.email_id.value;
		  var email_domain =$("#email_domain").val();
		  var mail ="";
				if(!email_id){
				      alert("이메일을 입력해주세요");
				    $("#email_id").focus();
				    return false;
				  }
				  if(!email_domain){
				      alert("도메인을 입력해주세요");
				    $("#email_domain").focus();
				    return false;
				  }
				  mail = email_id+"@"+email_domain;
				  $("#mail").val(mail);  
				  
				  if(!email_rule.test(mail)){
				      alert("이메일을 형식에 맞게 입력해주세요.");
				    return false;
				  }
				  
				  
				var name = document.myForm.name.value;
				var password = document.myForm.password.value;
				location.href = conpath + "/sendMail.mb?email_id="+email_id+"&email_domain="+email_domain+"&name="+name+"&password="+password;
			}
			
			function checkEmail(){
				/* var Echeck = 0;
				if(${randNum}==0){
					Echeck = 1;
				}
				else{
					Echeck = ${randNum};
				} */
				var check = document.myForm.randNum.value;
				if(document.myForm.name.value == ""){
					alert("이름을 입력하세요");
					return false;
				}
				if(document.myForm.nickname.value == ""){
					alert("닉네임을 입력하세요")
					return false;
				}
				if(check == ""){
					alert("인증번호를 입력해주세요");
					return false;
				}
				
				if(Echeck != check){
					alert("인증번호가 잘못되었습니다.")
					return false;
				}
				if(document.myForm.password.value == ""){
					alert("비밀번호를 입력해주세요.")
					return false;
				}
				// 중복체크여부
			}
			function nickName(conpath){
				isChange = true;
				var name = document.myForm.name.value;
				var password = document.myForm.password.value;
				var nickname = document.myForm.nickname.value;
				if(document.myForm.nickname.value == ""){
					alert("닉네임을 입력하세요")
					return false;
				}
				
				location.href = conpath + "/nickNameCheck.mb?nickname="+nickname+"&name="+name+"&password="+password;
			}
			
		</script>

	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
								<a href="main.fm" class="logo">
									<span class="symbol"><img src="${pageContext.request.contextPath}/resources/images/logo.svg" alt="" /></span><span class="title">Phantom</span>
								</a>

							<!-- Nav -->
								<nav>
									<ul>
										<li><a href="#menu">Menu</a></li>
									</ul>
								</nav>

						</div>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<h2>Menu</h2>
						<ul>
							<li><a href="main.fm">Home</a></li>
							<li><a href="generic.html">Ipsum veroeros</a></li>
							<li><a href="generic.html">Tempus etiam</a></li>
							<li><a href="generic.html">Consequat dolor</a></li>
							<li><a href="elements.html">Elements</a></li>
						</ul>
					</nav>

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<h1 align="center">회원 가입</h1>
						</div>
					</div>
					<form action="sendMail.mb" method="post" name="myForm">
					
					<div align="center">
					<table style="width:70%">
						<tr align="center">
							<td>이름</td>
							<td><input type="text" name="name" value="${sessionScope.name }"></td>
						</tr>
						<tr align="center">
							<td>닉네임</td>
							<td><input type="text" name="nickname" value="${nickname }"style="width:64%;float:left">
								<input type="button" value="중복체크" style="width:20%;float:left" OnClick="return nickName('<%=conpath%>')">
							</td>
						</tr>
						<tr align="center">
							<td>이메일</td>
							<%-- <td><input type="text" name="email" value="${email }"></td> --%>
							<td>
								<input type="text" id="email_id" name="email_id" value="${email_id }" title="이메일 아이디" placeholder="이메일" maxlength="18" style="width:20%;float:left">
								<div style="float:left;position:relative;top:10px">&nbsp;&nbsp;@&nbsp;&nbsp;</div>
								<input type="text" id="email_domain" name="email_domain" value="${email_domain }" title="이메일 도메인" placeholder="이메일 도메인" maxlength="18" style="width:20%;float:left"> 
								<select class="select" title="이메일 도메인 주소 선택" onclick="setEmailDomain(this.value);return false;" style="width:20%;float:left">
    								<option value="">-선택-</option>
    								<option value="naver.com" <c:if test="${fn:contains(email_domain,'naver.com') }">selected</c:if> >naver.com</option>
    								<option value="gmail.com" <c:if test="${fn:contains(email_domain,'gmail.com') }">selected</c:if> >gmail.com</option>
    								<option value="hanmail.net" <c:if test="${fn:contains(email_domain,'hanmail.net') }">selected</c:if> >hanmail.net</option>
    								<option value="hotmail.com" <c:if test="${fn:contains(email_domain,'hotmail.com') }">selected</c:if> >hotmail.com</option>
    								<option value="korea.com" <c:if test="${fn:contains(email_domain,'korea.com') }">selected</c:if> >korea.com</option>
    								<option value="nate.com" <c:if test="${fn:contains(email_domain,'nate.com') }">selected</c:if> >nate.com</option>
    								<option value="yahoo.com" <c:if test="${fn:contains(email_domain,'yahoo.com') }">selected</c:if> >yahoo.com</option>
								</select>
								&nbsp;&nbsp;<input type="button" value="인증하기" style="width:20%;float:left" OnClick="return Send('<%=conpath%>')">
							</td>
							<td></td>
						</tr>
						<tr align="center">
							<td>인증번호 입력</td>
							<td><input type="text" name="randNum"></td>
						</tr>
						<tr align="center">
							<td>비밀번호</td>
							<td><input type="text" name="password" value="${password }"></td>
						</tr>
						<!-- <tr align="center">
							<td>contents</td>
							<td><input type="text" name="contents"></td>
						</tr> -->
						<tr align="center">
							<td colspan="2"><input type="submit" value="전송"  onClick="return checkEmail()"/></td>
						</tr>
					</table>
					</div>
					</form>
				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h2>Get in touch</h2>
								<form method="post" action="#">
									<div class="fields">
										<div class="field half">
											<input type="text" name="name" id="name" placeholder="Name" />
										</div>
										<div class="field half">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
										<div class="field">
											<textarea name="message" id="message" placeholder="Message"></textarea>
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Send" class="primary" /></li>
									</ul>
								</form>
							</section>
							<section>
								<h2>Follow</h2>
								<ul class="icons">
									<li><a href="#" class="icon brands style2 fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands style2 fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands style2 fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands style2 fa-dribbble"><span class="label">Dribbble</span></a></li>
									<li><a href="#" class="icon brands style2 fa-github"><span class="label">GitHub</span></a></li>
									<li><a href="#" class="icon brands style2 fa-500px"><span class="label">500px</span></a></li>
									<li><a href="#" class="icon solid style2 fa-phone"><span class="label">Phone</span></a></li>
									<li><a href="#" class="icon solid style2 fa-envelope"><span class="label">Email</span></a></li>
								</ul>
							</section>
							<ul class="copyright">
								<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<%-- <script src="<c:url value="<%=request.getContextPath() %>/resources/assets/js/jquery.min.js"/>"></script>
			<script src="<c:url value="<%=request.getContextPath() %>/resources/assets/js/browser.min.js"/>"></script>
			<script src="<c:url value="<%=request.getContextPath() %>/resources/assets/js/breakpoints.min.js"/>"></script>
			<script src="<c:url value="<%=request.getContextPath() %>/resources/assets/js/util.js"/>"></script>
			<script src="<c:url value="<%=request.getContextPath() %>/resources/assets/js/main.js"/>"></script> --%>

	</body>
</html>