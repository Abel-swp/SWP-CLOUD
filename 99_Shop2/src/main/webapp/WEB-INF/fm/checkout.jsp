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
<script type="text/javascript">
var sellprice;
var amount;
var amount2;

function donate(){
	alert("결제하신 금액은 전액 기부됩니다. 감사합니다.");
}
function init() {
sellprice = document.myform.sellprice.value;
amount = document.myform.amount.value;
amount2 = document.myform.amount2.value;
document.myform.sum.value = sellprice;
change();
}
function add() {
hm = document.myform.amount;
hm2 = document.myform.amount2;
sum = document.myform.sum;
hm.value++;
hm2.value = parseInt(hm.value) * amount2;
sum.value = parseInt(hm.value) * sellprice;
$("#clone").html(parseInt(hm.value) * sellprice + " 원");
}
function del() {
hm = document.myform.amount;
hm2 = document.myform.amount2;
sum = document.myform.sum;
	if (hm.value > 1) {
		hm.value--;
		hm2.value = parseInt(hm.value) * amount2;
		sum.value = parseInt(hm.value) * sellprice;
		$("#clone").html(parseInt(hm.value) * sellprice + " 원");
	}
}
function change() {
hm = document.myform.amount;
hm2 = document.myform.amount2;
sum = document.myform.sum;
	if (hm.value < 0) {
		hm.value = 0;
	}
	hm2.value = parseInt(hm.value) * amount2;
	sum.value = parseInt(hm.value) * sellprice;
	$("#clone").html(parseInt(hm.value) * sellprice + " 원");
}
Number.prototype.formatNumber = function(){
if(this==0) return 0;
let regex = /(^[+-]?\d+)(\d)/;
let nstr = (this + '');
while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
return nstr;
};

/* 추가 */
var proQty = $('.pro-qty');
    proQty.prepend('<span class="dec qtybtn" onClick="del()">-</span>');
    proQty.append('<span class="inc qtybtn" onClick="add()">+</span>');
    proQty.on('click', '.qtybtn', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        /*if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }*/
        $button.parent().find('input').val(newVal);
    });
</script>
<style>
.box {border-radius: 4px;border: solid 1px #c9c9c9;margin-bottom: 2em;padding: 1.5em;}
.box > :last-child,.box > :last-child > :last-child,.box > :last-child > :last-child > :last-child {margin-bottom: 0;}
.box.alt {border: 0;border-radius: 0;padding: 0;}
</style>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/kfonts2.css" rel="stylesheet">
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

<body onload="init()">
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
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
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
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
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
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            <li><a href="#">Fresh Meat</a></li>
                            <li><a href="#">Vegetables</a></li>
                            <li><a href="#">Fruit & Nut Gifts</a></li>
                            <li><a href="#">Fresh Berries</a></li>
                            <li><a href="#">Ocean Foods</a></li>
                            <li><a href="#">Butter & Eggs</a></li>
                            <li><a href="#">Fastfood</a></li>
                            <li><a href="#">Fresh Onion</a></li>
                            <li><a href="#">Papayaya & Crisps</a></li>
                            <li><a href="#">Oatmeal</a></li>
                            <li><a href="#">Fresh Bananas</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/resources/new/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>결제하기</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">

            <div class="checkout__form">
                <form action="buy.fm" name="myform">
                
                <input type="hidden" name="name" value="${detailList.pname}"/>
                <input type="hidden" name="nickname" value="${nickname}"/>
                
                
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="box">
								<h5 style="font-weight:bold;font-size:22px">주문 내역</h5><p>
								
								
								<c:if test="${flag == 1 }">
								 <c:if test="${detailList.svat != null }">
                	<input type="hidden" name="sellprice" value="${detailList.svat}">
                </c:if>
                <c:if test="${detailList.smain != null }">
                	<input type="hidden" name="catname" value="${detailList.smain}">
                </c:if>
								<!-- -----------------------------------standard--------------------------------------------------- -->
								<div class="checkout__input" style="font-size:14px">mimgname/pname/nickname(사진,이름,회사명)</div>
								<div class="shoping__cart__table">
								<table class="table" style="font-size:14px">
									<thead>
									<tr>
										<td>기본항목</td>
										<td>수량선택</td>
										<td>작업일</td>
										<td>flag1가격</td>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td class="shoping__cart__total" style="width:120px">
											$list.smain/dmain/pmain123<br><br>
											<c:if test="${detailList.scountsu != '0'}">
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;수정횟수 : ${detailList.scountsu != '0'}</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:215px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">기본 제공되는 수정 가능 횟수입니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
                                 <c:if test="${detailList.scountsi != '0'}"><br><br>
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;시안개수 : ${detailList.scountsi != '0'}</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:200px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">기본 제공되는 시안의 개수입니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
                                 <c:if test="${detailList.sorigin != '0'}"><br><br>
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;원본파일제공</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:215px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">수정 가능한 원본 파일이 제공됩니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
                                 <c:if test="${detailList.sdesign != '0'}"><br><br>
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;응용디자인제공</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:230px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">사용 가능한 응용 디자인이 제공됩니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
                                 <c:if test="${detailList.spossible != '0'}"><br><br>
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;상업적이용가능</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:300px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">최종 작업물을 상업적 용도로 사용하실 수 있습니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
                                 <c:if test="${detailList.sregist != '0'}"><br><br>
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;상표등록가능</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:240px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">최종 작업물에 상표를 등록할 수 있습니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
										</td>
										<td class="shoping__cart__quantity">
	                                        <div class="quantity" style="position:relative;bottom:6px">
	                                            <div class="pro-qty">
	                                                <input type="text" name="amount" value="1" onChange="change()">
	                                            </div>
	                                        </div>
	                                    </td>
	                                    
											<td class="shoping__cart__total">
												<!-- <input type="text" name="amount2" value="4" size="3" readonly> -->
												<!-- value : sdate,ddate,pdate 中 1 -->
												<div class="checkout__input" style="position:relative;bottom:6px">
												    <input type="text" name="amount2" value="${detailList.sdate}" style="color:black;width:70px;height:40px;text-align:left" readonly>
												</div>
											</td>
										
										<td class="shoping__cart__total">
											<!-- <input type="text" name="sum" size="4" readonly>원 -->
											<!-- value : svat,dvat,pvat 中 1 -->
											<div class="checkout__input" style="position:relative;bottom:6px">
											    <input type="text" name="sum" value="4" style="color:black;width:100px;height:40px;text-align:left" readonly>
											</div>
										</td>
									</tr>
									</tbody>
								</table>
								</div>
								</c:if>
								<!-- -----------------------------------standard--------------------------------------------------- -->
								<c:if test="${flag == 2 }">
								<c:if test="${detailList.dvat != null }">
                	<input type="hidden" name="sellprice" value="${detailList.dvat}">
                </c:if>
                <c:if test="${detailList.dmain != null }">
                	<input type="hidden" name="catname" value="${detailList.dmain}">
                </c:if>
								<!-- -----------------------------------dl--------------------------------------------------- -->
								<div class="checkout__input" style="font-size:14px">mimgname/pname/nickname(사진,이름,회사명)</div>
								<div class="shoping__cart__table">
								<table class="table" style="font-size:14px">
									<thead>
									<tr>
										<td>기본항목</td>
										<td>수량선택</td>
										<td>작업일</td>
										<td>flag2가격</td>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td class="shoping__cart__total" style="width:120px">
											$list.smain/dmain/pmain123<br><br>
											<c:if test="${detailList.dcountsu != '0'}">
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;수정횟수 : ${detailList.dcountsu != '0'}</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:215px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">기본 제공되는 수정 가능 횟수입니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
                                 <c:if test="${detailList.dcountsi != '0'}"><br><br>
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;시안개수 : ${detailList.dcountsi != '0'}</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:200px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">기본 제공되는 시안의 개수입니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
                                 <c:if test="${detailList.dorigin != '0'}"><br><br>
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;원본파일제공</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:215px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">수정 가능한 원본 파일이 제공됩니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
                                 <c:if test="${detailList.ddesign != '0'}"><br><br>
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;응용디자인제공</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:230px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">사용 가능한 응용 디자인이 제공됩니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
                                 <c:if test="${detailList.dpossible != '0'}"><br><br>
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;상업적이용가능</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:300px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">최종 작업물을 상업적 용도로 사용하실 수 있습니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
                                 <c:if test="${detailList.dregist != '0'}"><br><br>
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;상표등록가능</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:240px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">최종 작업물에 상표를 등록할 수 있습니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
										</td>
										<td class="shoping__cart__quantity">
	                                        <div class="quantity" style="position:relative;bottom:6px">
	                                            <div class="pro-qty">
	                                                <input type="text" name="amount" value="1" onChange="change()">
	                                            </div>
	                                        </div>
	                                    </td>
										
											<td class="shoping__cart__total">
												<!-- <input type="text" name="amount2" value="4" size="3" readonly> -->
												<!-- value : sdate,ddate,pdate 中 1 -->
												<div class="checkout__input" style="position:relative;bottom:6px">
												    <input type="text" name="amount2" value="${detailList.ddate}" style="color:black;width:70px;height:40px;text-align:left" readonly>
												</div>
											</td>

										<td class="shoping__cart__total">
											<!-- <input type="text" name="sum" size="4" readonly>원 -->
											<!-- value : svat,dvat,pvat 中 1 -->
											<div class="checkout__input" style="position:relative;bottom:6px">
											    <input type="text" name="sum" value="4" style="color:black;width:100px;height:40px;text-align:left" readonly>
											</div>
										</td>
									</tr>
									</tbody>
								</table>
								</div>
								</c:if>
								<!-- -----------------------------------dl--------------------------------------------------- -->
								<c:if test="${flag == 3 }">
								<c:if test="${detailList.pvat != null }">
                	<input type="hidden" name="sellprice" value="${detailList.pvat}"> 
                </c:if>
                <c:if test="${detailList.pmain != null }">
                	<input type="hidden" name="catname" value="${detailList.pmain}">
                </c:if>
								<!-- -----------------------------------pr--------------------------------------------------- -->
								<div class="checkout__input" style="font-size:14px">mimgname/pname/nickname(사진,이름,회사명)</div>
								<div class="shoping__cart__table">
								<table class="table" style="font-size:14px">
									<thead>
									<tr>
										<td>기본항목</td>
										<td>수량선택</td>
										<td>작업일</td>
										<td>flag3가격</td>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td class="shoping__cart__total" style="width:120px">
											$list.smain/dmain/pmain123<br><br>
											<c:if test="${detailList.pcountsu != '0'}">
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;수정횟수 : ${detailList.pcountsu != '0'}</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:215px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">기본 제공되는 수정 가능 횟수입니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
                                 <c:if test="${detailList.pcountsi != '0'}"><br><br>
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;시안개수 : ${detailList.pcountsi != '0'}</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:200px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">기본 제공되는 시안의 개수입니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
                                 <c:if test="${detailList.porigin != '0'}"><br><br>
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;원본파일제공</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:215px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">수정 가능한 원본 파일이 제공됩니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
                                 <c:if test="${detailList.pdesign != '0'}"><br><br>
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;응용디자인제공</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:230px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">사용 가능한 응용 디자인이 제공됩니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
                                 <c:if test="${detailList.ppossible != '0'}"><br><br>
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;상업적이용가능</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:300px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">최종 작업물을 상업적 용도로 사용하실 수 있습니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
                                 <c:if test="${detailList.pregist != '0'}"><br><br>
                                    <img src="${pageContext.request.contextPath}/resources/new/cap.png" alt="" width="20px" height="20px" style="float:left;position:relative;bottom:1px">
                                    <div style="font-weight:normal;font-size:14px;float:left">
                                    <div class="header__top__right2__language"><div>&nbsp;&nbsp;상표등록가능</div>
                                        <span class="arrow_carrot-right"></span><ul style="width:240px;position:absolute;left:160px"><li><a href="#" style="font-size:12px;pointer-events:none;cursor:default">최종 작업물에 상표를 등록할 수 있습니다.</a></li></ul>
                                       </div>
                                    </div>
                                 </c:if>
										</td>
										<td class="shoping__cart__quantity">
	                                        <div class="quantity" style="position:relative;bottom:6px">
	                                            <div class="pro-qty">
	                                                <input type="text" name="amount" value="1" onChange="change()">
	                                            </div>
	                                        </div>
	                                    </td>
										
											<td class="shoping__cart__total">
												<!-- <input type="text" name="amount2" value="4" size="3" readonly> -->
												<!-- value : sdate,ddate,pdate 中 1 -->
												<div class="checkout__input" style="position:relative;bottom:6px">
												    <input type="text" name="amount2" value="${detailList.pdate}" style="color:black;width:70px;height:40px;text-align:left" readonly>
												</div>
											</td>

										<td class="shoping__cart__total">
											<!-- <input type="text" name="sum" size="4" readonly>원 -->
											<!-- value : svat,dvat,pvat 中 1 -->
											<div class="checkout__input" style="position:relative;bottom:6px">
											    <input type="text" name="sum" value="4" style="color:black;width:100px;height:40px;text-align:left" readonly>
											</div>
										</td>
									</tr>
									</tbody>
								</table>
								</div>
								</c:if>
								<!-- -----------------------------------pr--------------------------------------------------- -->
                            </div>
                            
                            <div class="box" style="height:105px">
								<h5 style="font-weight:bold;font-size:22px">결제 방법</h5><p><hr>
								<div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px;float:left">
	                                <label for="a_check">
	                                    <input type="radio" id="a_check" name="?" value="신용카드"><div style="position:relative;right:20px">신용카드</div><span class="checkmark"></span>
	                                </label>
	                            </div>
	                            <div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px;float:left">
	                                <label for="b_check">
	                                    <input type="radio" id="b_check" name="?" value="실시간 계좌이체"><div style="position:relative;right:20px">실시간 계좌이체</div><span class="checkmark"></span>
	                                </label>
	                            </div>
								<div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px;float:left">
	                                <label for="c_check">
	                                    <input type="radio" id="c_check" name="?" value="무통장입금"><div style="position:relative;right:20px">무통장입금</div><span class="checkmark"></span>
	                                </label>
	                            </div>
	                            <div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px;float:left">
	                                <label for="d_check">
	                                    <input type="radio" id="d_check" name="?" value="휴대폰"><div style="position:relative;right:20px">휴대폰</div><span class="checkmark"></span>
	                                </label>
	                            </div>
								<div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px;float:left">
	                                <label for="e_check">
	                                    <input type="radio" id="e_check" name="?" value="페이나우"><div style="position:relative;right:20px">페이나우</div><span class="checkmark"></span>
	                                </label>
	                            </div>
                            </div>
                            
                            <div class="box">
                            	<font size="1.5px">
									· 개인 전문가이므로 세금 계산서 발행이 불가능합니다.<br>
									· 현금영수증(사업자 지출 증빙)/신용카드 매입 전표는 <strong>매입세액공제 사용이 불가능</strong>합니다. [매입세액공제 안내]<br>
									· 현금영수증/신용카드 영수증은 개인 소득 공제용으로만 사용하실 수 있습니다.
								</font>
                            </div>
                            
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <div class="checkout__order__total">결제금액 
	                                <span id="clone">
	                                $750.99
	                                </span>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="acc-or">
										<font size="1.5px">주문 내용을 확인하였으며, 결제에 동의합니다. (필수)</font>
                                        <input type="checkbox" id="acc-or">
                                        <span class="checkmark"></span>
                                    </label>
                                </div><p>
                                <button type="submit" class="site-btn" onClick="donate()">결제하기</button>
                                <br><br>
                                <font size="1.5px">에스크로 결제 시 안전한 거래 환경을 제공합니다. 결제 진행 시 관련 정책에 의해 보호 받을 수 있습니다.</font>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

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
                            <li>Email: hello@colorlib.com</li>
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