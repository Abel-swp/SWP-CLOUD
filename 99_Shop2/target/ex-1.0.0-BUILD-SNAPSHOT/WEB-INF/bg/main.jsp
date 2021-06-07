<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Phantom by HTML5 UP</title>
		<%
		String conpath = request.getContextPath();
		System.out.println(conpath);
		%>
		<script>
			function goGeneric(conpath) {
				location.href = conpath + "/generic.bg";
			}
			function goElements(conpath) {
				location.href = conpath + "/elements.bg";
			}
			function goMain2(conpath) {
				location.href = conpath + "/main2.bg";
			}
			function goGeneric2(conpath) {
				location.href = conpath + "/generic2.bg";
			}
			function goElements2(conpath) {
				location.href = conpath + "/elements2.bg";
			}
			function BLOG(conpath) {
				location.href = conpath + "/blog.fm";
			}
			function BLOG_DETAIL(conpath) {
				location.href = conpath + "/blog_detail.fm";
			}
			function CHECKOUT(conpath) {
				location.href = conpath + "/checkout.fm";
			}
			function CONTACT(conpath) {
				location.href = conpath + "/contact.fm";
			}
			function INDEX(conpath) {
				location.href = conpath + "/index.fm";
			}
			function MAIN(conpath) {
				location.href = conpath + "/main.fm";
			}
			function SHOP_DETAIL(conpath) {
				location.href = conpath + "/shop_detail.fm";
			}
			function SHOP_GRID(conpath) {
				location.href = conpath + "/shop_grid.fm";
			}
			function SHOPPING_CART(conpath) {
				location.href = conpath + "/shopping_cart.fm";
			}
			function CATEGORY(conpath) {
				location.href = conpath + "/category.fm";
			}
		</script>
		
		<input type="button" value="작업대보기" onClick="goGeneric('<%=conpath%>')"/>
		<input type="button" value="재료보기" onClick="goElements('<%=conpath%>')"/>
		<input type="button" value="카테고리/상품 메인보기" onClick="goMain2('<%=conpath%>')"/>
		<input type="button" value="카테고리/상품 작업대보기" onClick="goGeneric2('<%=conpath%>')"/>
		<input type="button" value="카테고리/상품 재료보기" onClick="goElements2('<%=conpath%>')"/>
		<br>
		<input type="button" value="BLOG" onClick="BLOG('<%=conpath%>')"/>
		<input type="button" value="BLOG_DETAIL" onClick="BLOG_DETAIL('<%=conpath%>')"/>
		<input type="button" value="CHECKOUT" onClick="CHECKOUT('<%=conpath%>')"/>
		<input type="button" value="CONTACT" onClick="CONTACT('<%=conpath%>')"/>
		<input type="button" value="INDEX" onClick="INDEX('<%=conpath%>')"/>
		<input type="button" value="MAIN" onClick="MAIN('<%=conpath%>')"/>
		<input type="button" value="SHOP_DETAIL" onClick="SHOP_DETAIL('<%=conpath%>')"/>
		<input type="button" value="SHOP_GRID" onClick="SHOP_GRID('<%=conpath%>')"/>
		<input type="button" value="SHOPPING_CART" onClick="SHOPPING_CART('<%=conpath%>')"/>
		<br>
		<input type="button" value="INPUT" onClick="CATEGORY('<%=conpath%>')"/>
		
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<noscript><link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" /></noscript>
	</head>
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
							<header>
								<h1>This is Phantom, a free, fully responsive site<br />
								template designed by <a href="http://html5up.net">HTML5 UP</a>.</h1>
								<p>Etiam quis viverra lorem, in semper lorem. Sed nisl arcu euismod sit amet nisi euismod sed cursus arcu elementum ipsum arcu vivamus quis venenatis orci lorem ipsum et magna feugiat veroeros aliquam. Lorem ipsum dolor sit amet nullam dolore.</p>
							</header>
							<section class="tiles">
								<article class="style1">
									<span class="image">
										<img src="${pageContext.request.contextPath}/resources/images/pic01.jpg" alt="" />
									</span>
									<a href="generic.html">
										<h2><c:forEach var="i" begin="0" end="0" step="1">${catList[0].ref1}</c:forEach></h2>
										<div class="content">
											<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
										</div>
									</a>
								</article>
								<article class="style2">
									<span class="image">
										<img src="${pageContext.request.contextPath}/resources/images/pic02.jpg" alt="" />
									</span>
									<a href="generic.html">
										<h2><c:forEach var="i" begin="1" end="1" step="1">${catList[1].ref1}</c:forEach></h2>
										<div class="content">
											<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
										</div>
									</a>
								</article>
								<article class="style3">
									<span class="image">
										<img src="${pageContext.request.contextPath}/resources/images/pic03.jpg" alt="" />
									</span>
									<a href="generic.html">
										<h2><c:forEach var="i" begin="2" end="2" step="1">${catList[2].ref1}</c:forEach></h2>
										<div class="content">
											<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
										</div>
									</a>
								</article>
								<article class="style4">
									<span class="image">
										<img src="${pageContext.request.contextPath}/resources/images/pic04.jpg" alt="" />
									</span>
									<a href="generic.html">
										<h2>Tempus</h2>
										<div class="content">
											<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
										</div>
									</a>
								</article>
								<article class="style5">
									<span class="image">
										<img src="${pageContext.request.contextPath}/resources/images/pic05.jpg" alt="" />
									</span>
									<a href="generic.html">
										<h2>Aliquam</h2>
										<div class="content">
											<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
										</div>
									</a>
								</article>
								<article class="style6">
									<span class="image">
										<img src="${pageContext.request.contextPath}/resources/images/pic06.jpg" alt="" />
									</span>
									<a href="generic.html">
										<h2>Veroeros</h2>
										<div class="content">
											<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
										</div>
									</a>
								</article>
								<article class="style2">
									<span class="image">
										<img src="${pageContext.request.contextPath}/resources/images/pic07.jpg" alt="" />
									</span>
									<a href="generic.html">
										<h2>Ipsum</h2>
										<div class="content">
											<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
										</div>
									</a>
								</article>
								<article class="style3">
									<span class="image">
										<img src="${pageContext.request.contextPath}/resources/images/pic08.jpg" alt="" />
									</span>
									<a href="generic.html">
										<h2>Dolor</h2>
										<div class="content">
											<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
										</div>
									</a>
								</article>
								<article class="style1">
									<span class="image">
										<img src="${pageContext.request.contextPath}/resources/images/pic09.jpg" alt="" />
									</span>
									<a href="generic.html">
										<h2>Nullam</h2>
										<div class="content">
											<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
										</div>
									</a>
								</article>
								<article class="style5">
									<span class="image">
										<img src="${pageContext.request.contextPath}/resources/images/pic10.jpg" alt="" />
									</span>
									<a href="generic.html">
										<h2>Ultricies</h2>
										<div class="content">
											<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
										</div>
									</a>
								</article>
								<article class="style6">
									<span class="image">
										<img src="${pageContext.request.contextPath}/resources/images/pic11.jpg" alt="" />
									</span>
									<a href="generic.html">
										<h2>Dictum</h2>
										<div class="content">
											<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
										</div>
									</a>
								</article>
								<article class="style4">
									<span class="image">
										<img src="${pageContext.request.contextPath}/resources/images/pic12.jpg" alt="" />
									</span>
									<a href="generic.html">
										<h2>Pretium</h2>
										<div class="content">
											<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor veroeros et feugiat.</p>
										</div>
									</a>
								</article>
							</section>
						</div>
					</div>

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
			<script src="<c:url value="/resources/assets/js/jquery.min.js"/>"></script>
			<script src="<c:url value="/resources/assets/js/browser.min.js"/>"></script>
			<script src="<c:url value="/resources/assets/js/breakpoints.min.js"/>"></script>
			<script src="<c:url value="/resources/assets/js/util.js"/>"></script>
			<script src="<c:url value="/resources/assets/js/main.js"/>"></script>

	</body>
</html>