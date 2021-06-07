<%@page import="java.sql.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="fm.RefBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	
<!DOCTYPE html>

<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>
    
    <!-- ***** -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/resources/css/kfonts2.css" rel="stylesheet">
      <!-- ***** -->

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/style.css" type="text/css">
</head>
<script src="<%=request.getContextPath()%>/resources/jsjs/jquery.js"></script>
<script type="text/javascript" src = "<%=request.getContextPath() %>/resources/jsjs/test.js"></script>
<script type="text/javascript">

function play(){
	alert(1);
	document.getElementById("video").play();
}

function testa() {
	var stan = document.getElementById("test1").value;
	if(stan==""){
		alert("Standard 서비스가 없는 상품입니다.");
		return false;
	}
}
function testb() {
	var stan = document.getElementById("test2").value;
	if(stan==""){
		alert("Deluxe 서비스가 없는 상품입니다.");
		return false;
	}
}
function testc() {
	var stan = document.getElementById("test3").value;
	if(stan==""){
		alert("Premium 서비스가 없는 상품입니다.");
		return false;
	}
}
	
//지금부터 추가
 function showhide(num) {
	//document.getElementById().style.fontSize = "30px";
	//1 클릭한 대상
	me = eval("ME"+num); 
	
	//2 일단 모두 25
	for(var i=1; i<=3; i++){
		eval("ME"+i).style.fontSize = "25px";
	}
	//3 클릭대상만 따로 45
	me.style.fontSize = "45px";
	
	
	//1 클릭한 대상
	obj = eval("KIN"+num); 
	//2 일단 히든
	for(var i=1;i<=3;i++) {
		eval("KIN"+i).style.display = "none";
	}
	//3 클릭대상만 보이기
	obj.style.display = "";
	
	
	if(num==1){
		$("a[id='price']").html(); //대상 선정
		$("a[id='price']").html("<a id='price'>${detailList.svat }</a>"); //삽입
	}else if(num==2){
		$("a[id='price']").html();
		$("a[id='price']").html("<a id='price'>${detailList.dvat }</a>");
	}else if(num==3){
		$("a[id='price']").html();
		$("a[id='price']").html("<a id='price'>${detailList.pvat }</a>");
	}
	
	}

 function init(){
	 //onload로 display:none을 했는데 ,, standard만 보이게 하기 위해
	 eval("KIN"+1).style.display = "";
 	
	 //시작 글꼴
	 eval("ME"+1).style.fontSize = "45px";
	 eval("ME"+2).style.fontSize = "25px";
	 eval("ME"+3).style.fontSize = "25px";
 	 
	 //바로 가격을 보이게 하기 위함
	 document.getElementById("ME1").click();
 } 
//여기까지 추가
</script>

<body onLoad="init()">

	<!-- 추가:머리 -->
	
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="${pageContext.request.contextPath}/resources/new/img/logo.png" alt=""></a>
        </div>
        <!-- <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div> -->
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="${pageContext.request.contextPath}/resources/new/img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> 사용자@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <%@include file="../../top.jsp" %>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
            
                <!-- 카테고리 -->
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>카테고리</span>
                        </div>
                        <ul>
                        	<%
                        	List<RefBean> refList = (List<RefBean>)session.getAttribute("refList");
                        	%>
                        	<c:set var="refList" value="<%=refList%>"/>
                            <c:forEach var="i" begin="0" end="${fn:length(refList)-1}" step="1">
								<li><a href="grid.fm?ref=${refList[i].ref}">${refList[i].ref}</a></li>
							</c:forEach>
                        </ul>
                    </div>
                </div>
                
                <!-- search 검색-->  
                <div class="col-lg-9">
                    <div class="hero__search"> 
                        <div class="hero__search__form">
                            <form action="result.fm" method="get">
                            	<input type="hidden" name="whatColumn" value="all"/>
                                <input type="text" placeholder="키워드를 검색해주세요" name="keyword" value="">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        
                        <!-- 전화번호 -->
                        <!-- <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
    
    
    
    
    <!-- //추가:머리 -->


	<!-- 본문 큰제목 -->
    <!-- Breadcrumb Section Begin -->
    <%-- <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/resources/new/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Vegetableâs Package</h2>
                        <div class="breadcrumb__option">  
                            <a href="./index.html">Home</a>
                            <a href="./index.html">Vegetables</a>
                            <span>Vegetableâs Package</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> --%>
    <!-- Breadcrumb Section End -->
















	<%-- <img src="<%=request.getContextPath()+"/resources/"%>${lists.simgname }" alt=""> --%>


    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                    	<!-- 제일먼저 나오는 ,, 큰사진 -->
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="${pageContext.request.contextPath}/resources/${detailList.mimgname}" alt="">
                        </div>
                        <!-- // -->
                        
                        <!-- 상세사진 -->
                        <div class="product__details__pic__slider owl-carousel">
                        	<!-- big:큰 사진 ,, src:작은 사진 분류됨 -->
                            <img src="${pageContext.request.contextPath}/resources/${detailList.simgname}" alt="" width="120" height="120">
                            <video src="<%=request.getContextPath() %>/resources/${detailList.videoname }"  controls width="120" height="120" style="position: relative; bottom: 9px"
							id="video" onclick="play()"></video>
							<div style="width:120px;height:120px;position:relative;right:145px" data-toggle="modal" data-target="#myModala">
							</div>
                            <img data-imgbigurl="${pageContext.request.contextPath}/resources/new/img/product/details/3.jpg"
                                src="${pageContext.request.contextPath}/resources/new/img/product/details/33.jpg" alt="">
                            <img data-imgbigurl="${pageContext.request.contextPath}/resources/new/img/product/details/4.jpg"
                                src="${pageContext.request.contextPath}/resources/new/img/product/details/44.jpg" alt="">
                        </div>
                        
                        <!-- 모달추가 -->
                        <div class="modal fade" id="myModala" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		                  <div class="modal-dialog"><!-- class="modal-dialog"에 modal-lg추가하면 큰모달,  modal-sm추가하면 작은모달, 아무것도 안쓰면 중간크기의 모달이 만들어진다. -->
		                     <div class="modal-content" style="width:600px">
		                        <!-- 이하 모달 콘텐츠 -->
		                        <div class="modal-header">
		                           <b class="modal-title" id="myModalLabel" style="font-size:20px;font-family:'나눔 고딕';position:relative;left:210px">video</b>
		                           <hr>
		                        </div>
		                        <div class="modal-body" style="font-size:20px;letter-spacing:0.1px;line-height:30px;opacity:0.7;margin:10px">
		                        <video src="<%=request.getContextPath() %>/resources/${detailList.videoname }"  controls width="100%" height="300" style="position: relative; bottom: 9px"
								id="video" onclick="play()"></video>
		                        </div>
		                        <div>
		                           <a href="#" class="primary-btn cart-btn" data-dismiss="modal" style="width:95%;margin:15px;text-align:center">닫기</a>
		                        </div>
		                     </div> <!-- 모달 콘텐츠 -->
		                  </div> <!-- 모달 다이얼로그 -->
		               </div> <!-- 모달 전체 윈도우 -->
                        <!-- // -->
                        
                    </div>
                </div>
                
                
                
                
                
                
                
                <!-- 추가 -->
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                    	<!-- 상품명 -->
                        <h4 style="line-height:1.5"> <%-- ${list.pname} --%>${detailList.pname }</h4>   
                        <hr>
                        <!-- 가격!! -->
                        <div class="product__details__price" align="right" ><a id="price"><!-- 반응형 가격 출력됨 --></a><br>  
                        														<span style="font-size: 20px;opacity: 0.5">(VAT포함가)</span></div>  
                        	<!-- STANDARD -->
                        	<form action="checkout.fm?flag=1" method="post">     
								
								<b href="#n" onclick="showhide(1);" style="cursor:pointer;" id="ME1">&nbsp;STANDARD</b><br>   
								<div style="display:none;height:245px;position:relative;border:1px solid black;padding:15px" id="KIN1">
									<!-- contents -->
									<br>
									<a style="font-weight: bold;text-align: left; font-size: 15px">${detailList.smain }</a><br>
									<input id="test1" type="hidden" value="${detailList.smain }">
								   	<a id="small" style="font-size: 15px;text-align: left;">${detailList.scontent }</a><br>
								   	<p>
								   	<hr>
								   	
								   	<!-- 설명: /div로 옆에 벽을 만들어 2개 값까지 들어오게 만듬 ,, /if문으로 null값일때 빈공간으로 만들고 ,, /생긴 빈공간을 left때문에 다른값들이  순차적으로 채우게 됨-->
								   	<div style="max-width:320px">
									   	<c:if test="${detailList.sdate != null}">
										   	<div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>작업기간 : ${detailList.sdate}
											    </div>
										    </div>
									    </c:if>
									    <c:if test="${detailList.scountsu != null}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>수정횟수 : ${detailList.scountsu}
											    </div>
										    </div>
									    </c:if>
									   	<c:if test="${detailList.scountsi != null}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>시안개수 : ${detailList.scountsi}
											    </div>
										    </div>
									    </c:if>
									   	<c:if test="${detailList.sorigin != '0'}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>원본파일제공
											    </div>
										    </div>
									    </c:if>
									   	<c:if test="${detailList.sdesign != '0'}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>응용디자인
											    </div>
										    </div>
									    </c:if>
									   	<c:if test="${detailList.spossible != '0'}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>상업적이용가능
											    </div>
										    </div>
									    </c:if>
									   	<c:if test="${detailList.sregist != '0'}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>상표등록가능
											    </div>
										    </div>
									    </c:if>
									    <c:if test="${detailList.sdate == null}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.scountsu == null}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.scountsi == null}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.sorigin == '0'}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.sdesign == '0'}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.spossible == '0'}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.sregist == '0'}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <div style="min-width:160px;max-width:160px;clear:left;position:relative;left:405px;bottom:55px"><button type="submit" class="site-btn" onclick="return testa()">구매하기</button></div>
								    </div>
								    <!-- style="float:right;margin:10px;position:relative;bottom:58px;left:8px;width:125px;text-align:center" -->						    
								</div>
							</form>
							 
							 <!-- DELUXE -->
							 <form action="checkout.fm?flag=2" method="post">
								<b href="#n" onclick="showhide(2);" style="cursor:pointer;" id="ME2">&nbsp;DELUXE</b><br>
								<div style="display:none;height:245px;
							    position:relative;
							    border:1px solid black;
							    padding:15px;" ID="KIN2">
									<!-- contents -->
									<br>
									<a style="font-weight: bold;text-align: left; font-size: 15px">${detailList.dmain }</a><br>
									<input id="test2" type="hidden" value="${detailList.dmain }">
								   	<a id="small" style="font-size: 15px;text-align: left;">${detailList.dcontent }</a><br>
								   	<p>
								   	<hr>
								   		<!-- 설명: /div로 옆에 벽을 만들어 2개 값까지 들어오게 만듬 ,, /if문으로 null값일때 빈공간으로 만들고 ,, /생긴 빈공간을 left때문에 다른값들이  순차적으로 채우게 됨-->
								   	<div style="max-width:320px">
									   	<c:if test="${detailList.ddate != null}">
										   	<div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>작업기간 : ${detailList.ddate}
											    </div>
										    </div>
									    </c:if>
									    <c:if test="${detailList.dcountsu != null}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>수정횟수 : ${detailList.dcountsu}
											    </div>
										    </div>
									    </c:if>
									   	<c:if test="${detailList.dcountsi != null}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>시안개수 : ${detailList.dcountsi}
											    </div>
										    </div>
									    </c:if>
									   	<c:if test="${detailList.dorigin != '0'}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>원본파일제공
											    </div>
										    </div>
									    </c:if>
									   	<c:if test="${detailList.ddesign != '0'}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>응용디자인
											    </div>
										    </div>
									    </c:if>
									   	<c:if test="${detailList.dpossible != '0'}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>상업적이용가능
											    </div>
										    </div>
									    </c:if>
									   	<c:if test="${detailList.dregist != '0'}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>상표등록가능
											    </div>
										    </div>
									    </c:if>
									    <c:if test="${detailList.ddate == null}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.dcountsu == null}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.dcountsi == null}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.dorigin == '0'}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.ddesign == '0'}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.dpossible == '0'}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.dregist == '0'}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <div style="min-width:160px;max-width:160px;clear:left;position:relative;left:405px;bottom:55px"><button type="submit" class="site-btn" onclick="return testb()">구매하기</button></div>
								    </div>
								</div>
							</form>
					 
					 
					 		<!-- PREMIUM -->
							<form action="checkout.fm?flag=3" method="post">
								<b href="#n" onclick="showhide(3);" style="cursor:pointer;" id="ME3">&nbsp;PREMIUM</b><br>
								<div style="display:none;height:245px;
							    position:relative;
							    border:1px solid black;
							    padding:15px;" ID="KIN3">
									<!-- contents -->
									<br>
									<a style="font-weight: bold;text-align: left; font-size: 15px">${detailList.pmain }</a><br>
									<input id="test3" type="hidden" value="${detailList.pmain }">
								   	<a id="small" style="font-size: 15px;text-align: left;">${detailList.pcontent }</a><br>
								   	<p>
								   	<hr>
								   		<!-- 설명: /div로 옆에 벽을 만들어 2개 값까지 들어오게 만듬 ,, /if문으로 null값일때 빈공간으로 만들고 ,, /생긴 빈공간을 left때문에 다른값들이  순차적으로 채우게 됨-->
								   	<div style="max-width:320px">
									   	<c:if test="${detailList.pdate != null}">
										   	<div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>작업기간 : ${detailList.pdate}
											    </div>
										    </div>
									    </c:if>
									    <c:if test="${detailList.pcountsu != null}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>수정횟수 : ${detailList.pcountsu}
											    </div>
										    </div>
									    </c:if>
									   	<c:if test="${detailList.pcountsi != null}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>시안개수 : ${detailList.pcountsi}
											    </div>
										    </div>
									    </c:if>
									   	<c:if test="${detailList.porigin != '0'}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>원본파일제공
											    </div>
										    </div>
									    </c:if>
									   	<c:if test="${detailList.pdesign != '0'}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>응용디자인
											    </div>
										    </div>
									    </c:if>
									   	<c:if test="${detailList.ppossible != '0'}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>상업적이용가능
											    </div>
										    </div>
									    </c:if>
									   	<c:if test="${detailList.pregist != '0'}">
										    <div style="min-width:160px;max-width:160px;float:left">
											    <div style="opacity: 0.8;font-size:15px;">
											    	<img src="${pageContext.request.contextPath}/resources/new/img/checked.jpg" width="20" height="20" style="margin-bottom: 6px;"/>상표등록가능
											    </div>
										    </div>
									    </c:if>
									    <c:if test="${detailList.pdate == null}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.pcountsu == null}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.pcountsi == null}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.porigin == '0'}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.pdesign == '0'}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.ppossible == '0'}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <c:if test="${detailList.pregist == '0'}"><div style="min-width:160px;height:20px;margin-bottom:6px;float:left"></div></c:if>
									    <div style="min-width:160px;max-width:160px;clear:left;position:relative;left:405px;bottom:55px"><button type="submit" class="site-btn" onclick="return testc()">구매하기</button></div>
								    </div>
								</div>
							</form>
							<!--  -->
                    </div>
                </div>
                <!-- //추가 -->
                
                
                
                
                
                
                <!-- Product Details Section start -->
                <div class="col-lg-12">
                        <br><br><br>
                        <ul class="nav nav-tabs nav-justified" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab" 
                                    aria-selected="true"><span style="font-size:15px; color:#82b91a; font-weight: bold">포트폴리오</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false" style="font-size:15px; color:#82b91a; font-weight: bold">서비스 설명</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false" style="font-size:15px; color:#82b91a; font-weight: bold">취소 환불 규정</a>
                            </li>
							<li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab"
                                    aria-selected="false" style="font-size:15px; color:#82b91a; font-weight: bold">서비스 평가</a>
                            </li>                            
                        </ul>
                        <br>
                        
                        <div class="tab-content">
							<!-- ///////////////////////////////////////////////////// -->  
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>포트폴리오</h6>
                                    <!-- 포트폴리오 Product Section Begin -->
                                    <p>
                                      <br><br><br>
									  <div class="product__details__pic__slider owl-carousel">
											<img 
											    src="${pageContext.request.contextPath}/resources/new/img/product/details/a.jpg" alt="" data-toggle="modal" data-target="#myModal1">
											<img 
											    src="${pageContext.request.contextPath}/resources/new/img/product/details/b.jpg" alt="" data-toggle="modal" data-target="#myModal2">
											<img 
											    src="${pageContext.request.contextPath}/resources/new/img/product/details/c.jpg" alt="" data-toggle="modal" data-target="#myModal3">
											<img 
											    src="${pageContext.request.contextPath}/resources/new/img/product/details/d.jpg" alt="" data-toggle="modal" data-target="#myModal4">
			                          </div>
			                          <br><br><br>
			                          
			                          
			           <!-- 모달1번 -->
		               <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		                  <div class="modal-dialog"><!-- class="modal-dialog"에 modal-lg추가하면 큰모달,  modal-sm추가하면 작은모달, 아무것도 안쓰면 중간크기의 모달이 만들어진다. -->
		                     <div class="modal-content" style="width:600px">
		                        <!-- 이하 모달 콘텐츠 -->
		                        <div class="modal-header">
		                           <b class="modal-title" id="myModalLabel" style="font-size:20px;font-family:'나눔 고딕';position:relative;left:210px">취소 및 환불 규정</b>
		                           <hr>
		                        </div>
		                        <div class="modal-body" style="font-size:20px;letter-spacing:0.1px;line-height:30px;opacity:0.7;margin:10px">
		                        1번
		                        </div>
		                        <div>
		                           <a href="#" class="primary-btn cart-btn" data-dismiss="modal" style="width:95%;margin:15px;text-align:center">닫기</a>
		                        </div>
		                     </div> <!-- 모달 콘텐츠 -->
		                  </div> <!-- 모달 다이얼로그 -->
		               </div> <!-- 모달 전체 윈도우 -->
		               <!-- 모달2번 -->
		               <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		                  <div class="modal-dialog"><!-- class="modal-dialog"에 modal-lg추가하면 큰모달,  modal-sm추가하면 작은모달, 아무것도 안쓰면 중간크기의 모달이 만들어진다. -->
		                     <div class="modal-content" style="width:600px">
		                        <!-- 이하 모달 콘텐츠 -->
		                        <div class="modal-header">
		                           <b class="modal-title" id="myModalLabel" style="font-size:20px;font-family:'나눔 고딕';position:relative;left:210px">취소 및 환불 규정</b>
		                           <hr>
		                        </div>
		                        <div class="modal-body" style="font-size:20px;letter-spacing:0.1px;line-height:30px;opacity:0.7;margin:10px">
		                        2번
		                        </div>
		                        <div>
		                           <a href="#" class="primary-btn cart-btn" data-dismiss="modal" style="width:95%;margin:15px;text-align:center">닫기</a>
		                        </div>
		                     </div> <!-- 모달 콘텐츠 -->
		                  </div> <!-- 모달 다이얼로그 -->
		               </div> <!-- 모달 전체 윈도우 -->
		               <!-- 모달3번 -->
		               <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		                  <div class="modal-dialog"><!-- class="modal-dialog"에 modal-lg추가하면 큰모달,  modal-sm추가하면 작은모달, 아무것도 안쓰면 중간크기의 모달이 만들어진다. -->
		                     <div class="modal-content" style="width:600px">
		                        <!-- 이하 모달 콘텐츠 -->
		                        <div class="modal-header">
		                           <b class="modal-title" id="myModalLabel" style="font-size:20px;font-family:'나눔 고딕';position:relative;left:210px">취소 및 환불 규정</b>
		                           <hr>
		                        </div>
		                        <div class="modal-body" style="font-size:20px;letter-spacing:0.1px;line-height:30px;opacity:0.7;margin:10px">
		                        3번
		                        </div>
		                        <div>
		                           <a href="#" class="primary-btn cart-btn" data-dismiss="modal" style="width:95%;margin:15px;text-align:center">닫기</a>
		                        </div>
		                     </div> <!-- 모달 콘텐츠 -->
		                  </div> <!-- 모달 다이얼로그 -->
		               </div> <!-- 모달 전체 윈도우 -->
		               <!-- 모달4번 -->
		               <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		                  <div class="modal-dialog"><!-- class="modal-dialog"에 modal-lg추가하면 큰모달,  modal-sm추가하면 작은모달, 아무것도 안쓰면 중간크기의 모달이 만들어진다. -->
		                     <div class="modal-content" style="width:600px">
		                        <!-- 이하 모달 콘텐츠 -->
		                        <div class="modal-header">
		                           <b class="modal-title" id="myModalLabel" style="font-size:20px;font-family:'나눔 고딕';position:relative;left:210px">취소 및 환불 규정</b>
		                           <hr>
		                        </div>
		                        <div class="modal-body" style="font-size:20px;letter-spacing:0.1px;line-height:30px;opacity:0.7;margin:10px">
		                        4번
		                        </div>
		                        <div>
		                           <a href="#" class="primary-btn cart-btn" data-dismiss="modal" style="width:95%;margin:15px;text-align:center">닫기</a>
		                        </div>
		                     </div> <!-- 모달 콘텐츠 -->
		                  </div> <!-- 모달 다이얼로그 -->
		               </div> <!-- 모달 전체 윈도우 -->
               		   <!-- ********** -->
                                    </p>
                                    <!-- Related Product Section End -->
                                </div>
                            </div>
                            
                            <!-- 서비스 설명 추가 -->
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>서비스</h6>
                                    <p>
                                    	${detailList.servicecontent}
                                    </p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>취소 환불 규정</h6><br><br>
                                    <p>
01. 전문가와 의뢰인 간의 상호 협의 후 청약철회가 가능합니다.<br>  

02. 전문가의 귀책사유로 디자인작업을 시작하지 않았거나 혹은 이에 준하는 보편적인 관점에서 심각하게 잘못 이행한 경우 결제 금액 전체 환불이 가능합니다.<br>

03. 전문가가 작업 기간 동안 지정된 서비스를 제공하지 못할 것이 확실한 경우 지급받은 서비스 비용을 일할 계산하여 작업물 개수와 작업 기간 일수만큼 공제하고 잔여 금액을 환불합니다.<br>

04. 서비스 받은 항목을 공제하여 환불하며, 공제 비용은 정가 처리됩니다.<br>
가. 소비자 피해 보상 규정에 의거하여 작업물 원본의 멸실 및 작업 기간 미이행 및 이에 상응하는 전문가 책임으로 인한 피해 발생 시, 전액 환불<br>
나. 시안 작업 진행된 상품 차감 환불<br>
ⓐ. '디자인'에 대한 금액이 서비스 내 별도 기재가 되지 않았거나, 디자인 상품 패키지 내 수정 횟수가 1회(1회 포함) 이상인 서비스 상품의 시안 or 샘플이 제공된 경우<br>
→ 구매금액의 10% 환불(디자인 비용이 별도 기재되어 있는 경우, 해당금액 차감 후 환불)<br>
※ 시안 제공 및 수정이 추가로 이뤄진 경우 환불 금액내 수정 횟수에 따라 분할하여 환불.<br>
<br>
05. 주문 제작 상품 등 서비스 받은 항목이 없으며, 결제 후 1일 이내 작업이 진행되기 전 시점은 전액 환불 가능.<br>
<br>
06. 다만, 환불이 불가능한 서비스에 대한 사실을 표시사항에 포함한 경우에는 의뢰인의 환불요청이 제한될 수 있습니다.<br>
가. 고객의 요청에 따라 개별적으로 주문 제작되는 재판매가 불가능한 경우(인쇄, 이니셜 각인, 사이즈 맞춤 등)<br>
ⓐ. 주문 제작 상품 특성상 제작(인쇄 등) 진행된 경우.<br>
ⓑ. 인쇄 색상의 차이 : 모니터의 종류에 따라 색상의 차이가 발생하며,인쇄 시마다 합판 인쇄 방법의 특성상 색상 표현의 오차가 발생함.<br>
ⓒ. 디자인 서비스이며 수정 횟수가 존재하지 않았던 상품일 경우 시안 수령 후 환불 불가<br>
                                    </p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-4" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>서비스 평가</h6>
                                    <p>
                                    	4내용
                                    </p>
                                </div>
                            </div>
                            <!-- ///////////////////////////////////////////////////// -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->
	


    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="./index.html"><img src="${pageContext.request.contextPath}/resources/new/img/logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 60-49 Road 11378 New York</li>
                            <li>Phone: +65 11.188.888</li>   
                            <li>Email: 사용자@colorlib.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">About Our Shop</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">Delivery infomation</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>Join Our Newsletter Now</h6>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        <div class="footer__copyright__payment"><img src="${pageContext.request.contextPath}/resources/new/img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

    <!-- Js Plugins -->
    <script src="<c:url value="/resources/new/js/jquery-3.3.1.min.js"/>"></script>
    <script src="<c:url value="/resources/new/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/new/js/jquery.nice-select.min.js"/>"></script>
    <script src="<c:url value="/resources/new/js/jquery-ui.min.js"/>"></script>
    <script src="<c:url value="/resources/new/js/jquery.slicknav.js"/>"></script>
    <script src="<c:url value="/resources/new/js/mixitup.min.js"/>"></script>
    <script src="<c:url value="/resources/new/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/new/js/main.js"/>"></script>

</body>
</html>



