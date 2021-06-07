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
	<style>
	select {-moz-appearance: none;-webkit-appearance: none;appearance: none;opacity:0.5;font-family: "Noto Sansf KR", sans-serif;font-size: 16px;font-weight: 400;line-height: 1.5;color: #444;background-color: #fff;padding: .6em 1.4em .5em .8em;margin: 0;border: 1px solid #FFFFFF;border-radius: .5em;box-shadow: 0 1px 0 1px rgba(0,0,0,.04);}
	select:hover {border-color: #FFFFFF;}
	select:focus {border-color: #aaa;box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);box-shadow: 0 0 0 3px -moz-mac-focusring;color: #222;outline: none;}
	select:disabled {opacity: 0.5;}
	.box {border-radius: 4px;border: solid 1px #c9c9c9;margin-bottom: 2em;padding: 1.5em;}
	.box > :last-child,.box > :last-child > :last-child,.box > :last-child > :last-child > :last-child {margin-bottom: 0;}
	.box.alt {border: 0;border-radius: 0;padding: 0;}
	textarea {-moz-appearance: none;-webkit-appearance: none;-ms-appearance: none;appearance: none;color: #585858;font-family: "Source Sans Pro", Helvetica, sans-serif;font-size: 14pt;font-weight: 300;line-height: 1.75;background-color: transparent;border: none;border-radius: 0;border-bottom: solid 1px #c9c9c9;color: inherit;display: block;outline: 0;padding: 0;text-decoration: none;width: 100%;padding: 0;min-height: 3.75em;resize:none}
	textarea:invalid {box-shadow: none;}
	textarea:focus {border-bottom-color: #f2849e;box-shadow: inset 0 -1px 0 0 #f2849e;}
	textarea::placeholder {opacity:0.5;}
	.toggle_cursor {cursor:pointer;text-align:center;}
	#toggle_button, #toggle_contents {height:0;position:absolute;overflow:hidden;border-radius: 4px;border: solid 1px #c9c9c9;margin-bottom: 2em;padding: 1.5em;}
	#toggle_button:checked + #toggle_contents {height:auto;position:relative;border-radius: 4px;border: solid 1px #c9c9c9;margin-bottom: 2em;padding: 1.5em;}
	</style>
    <script type="text/javascript">
   	f_selarr = ['디자인','IT·프로그래밍','영상·사진·음향','마케팅','번역·통역','문서·글쓰기','비즈니스컨설팅','취업·투잡','운세·상담','레슨·실무교육','주문제작'];
   	s_selarr = [
   			   ['로고·브랜딩','상세·이벤트페이지','인쇄·홍보물','제품·패키지','PPT·인포그래픽','웹·모바일디자인','블로그·SNS·썸네일','일러스트·캐리커쳐','웹툰·캐릭터·이모티콘','공간디자인','포토샵·파일변환','북·앨범디자인','캘리그라피·폰트','게임·VR','의류디자인','간판·시공','기타','파견·상주'],
   			   ['워드프레스','웹사이트개발','쇼핑몰·커머스','모바일앱','임베디드HW·SW','게임','데이터베이스','데이터분석·리포트','블록체인·보안','서버·기술지원','QA·테스트','파일변환','챗봇','기타','파견·상주'],
   			   ['영상촬영·편집','유튜브제작','애니메이션','3D·VR','인트로·로고','사진촬영','더빙·녹음','음악·사운드','모델·MC','기타'],
   			   ['종합광고대행','블로그·카페','SNS마케팅','쇼핑몰·스토어','체험단,기자단','유튜브 크리에이터','지도등록·홍보','포털질문·답변','앱마케팅','검색최적화·SEO','웹 트래픽','키워드·배너광고','언론홍보','영상마케팅','오프라인광고','해외마케팅','브랜드마케팅','마케팅컨설팅','기타'],
   			   ['산업별 전문번역','일반 번역','통역','영상번역','감수','번역공증대행'],
   			   ['기업명·네이밍','제품 카피라이팅','광고 카피라이팅','마케팅 글작성','보도자료','산업별 전문 글작성','타이핑(영상)','타이핑(문서)','책·시나리오','논문','교정·교열첨삭','맞춤양식','기타'],
   			   ['사업계획서·투자제안서','창업컨설팅','업종별 컨설팅','쇼핑몰·스토어 창업','크라우드펀딩','해외사업 컨설팅','리서치·설문조사','법률·법무','인사·노무','특허·IP','세무회계','자산관리·재테크','업무지원·CS','기타'],
   			   ['직무 멘토링','자소서·이력서(국내기업)','자소서·이력서(외국계)','자소서(입시·기타)','인적성·NCS필기','면접·커리어 컨설팅','유학생 국내취업 컨설팅','투잡·부업 강의','전자책·노하우'],
   			   ['신점','사주·운세','타로','작명','심리상담','연애상담','여행·생활','기타'],
   			   ['유튜브·영상','사진','프로그래밍','데이터분석','마케팅','그래픽디자인','외국어(영어)','외국어(기타 언어)','PPT·프레젠테이션','입시·학업','취미·라이프','기타'],
   			   ['인쇄','간판','3D프린팅','가게용품 제작','기념품 제작','모형 제작','제품 제작','시스템 제작','인테리어 시공','패키지 제작','기타']
   			   ];
   	function init(f){
   		var f_sel = f.first;
   		var s_sel = f.second;
   		for(var i=0;i<f_selarr.length;i++){
   			f_sel[i+1] = new Option(f_selarr[i] , f_selarr[i]);
   		}
   	}
   	function firstChange(f){
   		var f_sel = f.first;
   		var s_sel = f.second;
   		var sel = f_sel.selectedIndex;
   		var sel_val= f_sel[sel].value; 
   		for(var i=s_sel.length;i>0;i--){
   			s_sel.options[i] = null;
   		}
   		if(sel != 0){
   			for(var i=0;i<s_selarr[sel-1].length;i++){
   				s_sel.options[i+1] = new Option(s_selarr[sel-1][i],s_selarr[sel-1][i]);
   			}
   		}
   	}
    </script>
</head>

<body onLoad="init(myform)">
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
                        <h2>서비스 등록하기</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
    <!-- <div class="checkout__input"><div style="text-size:15px"><p>'<span>*</span>' 는 필수 입력 사항입니다.<p></div></div> -->
        <div class="container">
            <div class="checkout__form">
            	<h4>1. 기본정보입력 <div class="checkout__input" style="float:right;position:relative;right:775px;top:2px"><div style="text-size:15px"><p style="font-size:14px">[ '<span>*</span>' 는 필수 입력 사항입니다. ]</p></div></div></h4>
                <form action="insert.fm" method="post" name="myform" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-16 col-md-12">
                        	<div class="row">
								<div class="checkout__input" style="position:relative;left:15px;width:225px">
								    <p>서비스이름<span>*</span></p>
								    <input type="text" name="pname" placeholder="서비스 이름을 입력하세요" style="color:black">
								</div>
								<div class="checkout__input" style="position:relative;left:45px">
								    <p>1차카테고리<span>*</span></p>
								    <select name="ref1" id="first" style="height:46px;width:100%;" onChange="firstChange(myform)">
								    	<option value="">1차 카테고리를 선택하세요</option>
								    </select>
								</div>
								<div class="checkout__input" style="position:relative;left:77.5px">
								    <p>2차카테고리<span>*</span></p>
								    <select name="ref2" id="second" style="height:46px;width:100%;">
								    	<option value="">2차 카테고리를 선택하세요</option>
								    </select>
								</div>
                            </div>
                        	<br><br><br><br><br>
                        	<h4>2. 가격설정</h4>
                            <div class="row">
                            <table class="table table-striped" style="font-size:16px;position:relative;left:15px">
								<tr>
									<td></td>
									<td><b><%for(int i=0;i<25;i++){%>&nbsp;<%}%>STANDARD</b></td>
									<td><b><%for(int i=0;i<28;i++){%>&nbsp;<%}%>DELUXE</b></td>
									<td><b><%for(int i=0;i<26;i++){%>&nbsp;<%}%>PREMIUM</b></td>
								</tr>
								<tr>	
									<td width="15%"><div style="position:relative;top:12.5px" class="checkout__input"><p>제목<span>*</span></p></div></td>
									<td>
										<div class="checkout__input" style="width:80%;position:relative;top:12.5px">
								    		<input type="text" name="smain" placeholder="제목을 입력하세요" style="width:100%;float:left;position:relative;bottom:10px;color:black">
										</div>
									</td>
									<td>
										<div class="checkout__input" style="width:80%;position:relative;top:12.5px">
								    		<input type="text" name="dmain" placeholder="제목을 입력하세요" style="width:100%;float:left;position:relative;bottom:10px;color:black">
										</div>
									</td>
									<td>
										<div class="checkout__input" style="width:80%;position:relative;top:12.5px">
								    		<input type="text" name="pmain" placeholder="제목을 입력하세요" style="width:100%;float:left;position:relative;bottom:10px;color:black">
										</div>
									</td>
								</tr>
								<tr>
									<td width="14%"><div style="position:relative;top:12.5px" class="checkout__input"><p>설명<span>*</span></p></div></td>
									<td>
										<div class="checkout__input" style="width:80%;position:relative;top:12.5px">
								    		<input type="text" name="scontent" placeholder="설명을 입력하세요" style="width:100%;float:left;position:relative;bottom:10px;color:black">
										</div>
									</td>
									<td>
										<div class="checkout__input" style="width:80%;position:relative;top:12.5px">
								    		<input type="text" name="dcontent" placeholder="설명을 입력하세요" style="width:100%;float:left;position:relative;bottom:10px;color:black">
										</div>
									</td>
									<td>
										<div class="checkout__input" style="width:80%;position:relative;top:12.5px">
								    		<input type="text" name="pcontent" placeholder="설명을 입력하세요" style="width:100%;float:left;position:relative;bottom:10px;color:black">
										</div>
									</td>
								</tr>
								<tr>	
									<td width="14%"><div style="position:relative;top:12.5px" class="checkout__input"><p>금액(VAT 포함)<span>*</span></p></div></td>
									<td>
										<div class="checkout__input" style="width:80%;position:relative;top:12.5px">
										<input type="text" name="svat" value="" placeholder="금액을 입력하세요" style="width:75%;float:left;position:relative;bottom:10px;color:black"/>
										&nbsp;&nbsp;(원)
										</div>
									</td>
									<td>
										<div class="checkout__input" style="width:80%;position:relative;top:12.5px">
										<input type="text" name="dvat" value="" placeholder="금액을 입력하세요" style="width:75%;float:left;position:relative;bottom:10px;color:black"/>
										&nbsp;&nbsp;(원)
										</div>
									</td>
									<td>
										<div class="checkout__input" style="width:80%;position:relative;top:12.5px">
										<input type="text" name="pvat" value="" placeholder="금액을 입력하세요" style="width:75%;float:left;position:relative;bottom:10px;color:black"/>
										&nbsp;&nbsp;(원)
										</div>
									</td>
								</tr>
								<tr>
									<td width="14%"><div style="position:relative;top:12.5px" class="checkout__input"><p>작업기간<span>*</span></p></div></td>
									<td>
										<select name="sdate" style="width:70%;position:relative;top:3px">
											<option value="" disabled selected>작업기간을 선택하세요</option>
											<%for(int i=1; i<=30; i++) {%>
											<option value="<%=i%>"><%=i%>일</option>
											<%}%>
										</select>
									</td>
									<td>
										<select name="ddate" style="width:70%;position:relative;top:3px">
											<option value="" disabled selected>작업기간을 선택하세요</option>
											<%for(int i=1; i<=30; i++) {%>
											<option value="<%=i%>"><%=i%>일</option>
											<%}%>
										</select>
									</td>
									<td>
										<select name="pdate" style="width:70%;position:relative;top:3px">
											<option value="" disabled selected>작업기간을 선택하세요</option>
											<%for(int i=1; i<=30; i++) {%>
											<option value="<%=i%>"><%=i%>일</option>
											<%}%>
										</select>
									</td>
								</tr>
								<tr>
									<td width="14%"><div style="position:relative;top:12.5px" class="checkout__input"><p>수정횟수<span>*</span></p></div></td>
									<td>
										<select name="scountsu" style="width:70%;position:relative;top:3px">
											<option value="" disabled selected>수정횟수를 선택하세요</option>
											<%for(int i=0; i<=15; i++) {%>
											<option value="<%=i%>"><%=i%>회</option>
											<%}%>
											<option value="제한없음">제한없음</option>
										</select>
									</td>
									<td>
										<select name="dcountsu" style="width:70%;position:relative;top:3px">
											<option value="" disabled selected>수정횟수를 선택하세요</option>
											<%for(int i=0; i<=15; i++) {%>
											<option value="<%=i%>"><%=i%>회</option>
											<%}%>
											<option value="제한없음">제한없음</option>
										</select>
									</td>
									<td>
										<select name="pcountsu" style="width:70%;position:relative;top:3px">
											<option value="" disabled selected>수정횟수를 선택하세요</option>
											<%for(int i=0; i<=15; i++) {%>
											<option value="<%=i%>"><%=i%>회</option>
											<%}%>
											<option value="제한없음">제한없음</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="14%"><div style="position:relative;top:12.5px" class="checkout__input"><p>시안개수(선택)</p></div></td>
									<td>
										<select name="scountsi" style="width:70%;position:relative;top:3px">
											<option value="" disabled selected>시안개수를 선택하세요</option>
											<%for(int i=1; i<=20; i++) {%>
											<option value="<%=i%>"><%=i%>개</option>
											<%}%>
											<option value="제한없음">제한없음</option>
										</select>
									</td>
									<td>
										<select name="dcountsi" style="width:70%;position:relative;top:3px">
											<option value="" disabled selected>시안개수를 선택하세요</option>
											<%for(int i=1; i<=20; i++) {%>
											<option value="<%=i%>"><%=i%>개</option>
											<%}%>
											<option value="제한없음">제한없음</option>
										</select>
									</td>
									<td>
										<select name="pcountsi" style="width:70%;position:relative;top:3px">
											<option value="" disabled selected>시안개수를 선택하세요</option>
											<%for(int i=1; i<=20; i++) {%>
											<option value="<%=i%>"><%=i%>개</option>
											<%}%>
											<option value="제한없음">제한없음</option>
										</select>
									</td>
								</tr>
								<%String[] isChecked = {"true","false"};%>
								<tr>
									<td><div style="position:relative;top:12.5px" class="checkout__input"><p>원본파일제공(선택)</p></div></td>
									<td>
										<div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px">
			                                <label for="a_check">
			                                    <input type="checkbox" id="a_check" name="sorigin">
			                                    <!-- <input type="hidden" id="a_unchecked" name="sorigin" value="0"> -->
			                                    <span class="checkmark"></span>
			                                </label>
			                            </div>
									</td>
									<td>
										<div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px">
			                                <label for="b_check">
			                                    <input type="checkbox" id="b_check" name="dorigin">
			                                    <!-- <input type="hidden" id="b_unchecked" name="dorigin" value="0"> -->
			                                    <span class="checkmark"></span>
			                                </label>
			                            </div>
									</td>
									<td>
										<div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px">
			                                <label for="c_check">
			                                    <input type="checkbox" id="c_check" name="porigin">
			                                    <!-- <input type="hidden" id="c_unchecked" name="porigin" value="0"> -->
			                                    <span class="checkmark"></span>
			                                </label>
			                            </div>
									</td>
								</tr>
								<tr>
									<td><div style="position:relative;top:12.5px" class="checkout__input"><p>응용디자인(선택)</p></div></td>
									<td>
										<div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px">
			                                <label for="d_check">
			                                    <input type="checkbox" id="d_check" name="sdesign">
			                                    <!-- <input type="hidden" id="d_unchecked" name="sdesign" value="0"> -->
			                                    <span class="checkmark"></span>
			                                </label>
			                            </div>
									</td>
									<td>
										<div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px">
			                                <label for="e_check">
			                                    <input type="checkbox" id="e_check" name="ddesign">
			                                    <!-- <input type="hidden" id="e_unchecked" name="ddesign" value="0"> -->
			                                    <span class="checkmark"></span>
			                                </label>
			                            </div>
									</td>
									<td>
										<div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px">
			                                <label for="f_check">
			                                    <input type="checkbox" id="f_check" name="pdesign">
			                                    <!-- <input type="hidden" id="f_unchecked" name="pdesign" value="0"> -->
			                                    <span class="checkmark"></span>
			                                </label>
			                            </div>
									</td>
								</tr>
								<tr>
									<td><div style="position:relative;top:12.5px" class="checkout__input"><p>상업적이용여부(선택)</p></div></td>
									<td>
										<div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px">
			                                <label for="g_check">
			                                    <input type="checkbox" id="g_check" name="spossible">
			                                    <!-- <input type="hidden" id="g_unchecked" name="spossible" value="0"> -->
			                                    <span class="checkmark"></span>
			                                </label>
			                            </div>
									</td>
									<td>
										<div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px">
			                                <label for="h_check">
			                                    <input type="checkbox" id="h_check" name="dpossible">
			                                    <!-- <input type="hidden" id="h_unchecked" name="dpossible" value="0"> -->
			                                    <span class="checkmark"></span>
			                                </label>
			                            </div>
									</td>
									<td>
										<div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px">
			                                <label for="i_check">
			                                    <input type="checkbox" id="i_check" name="ppossible">
			                                    <!-- <input type="hidden" id="i_unchecked" name="ppossible" value="0"> -->
			                                    <span class="checkmark"></span>
			                                </label>
			                            </div>
									</td>
								</tr>
								<tr>
									<td><div style="position:relative;top:12.5px" class="checkout__input"><p>상표등록여부(선택)</p></div></td>
									<td>
										<div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px">
			                                <label for="j_check">
			                                    <input type="checkbox" id="j_check" name="sregist">
			                                    <!-- <input type="hidden" id="j_unchecked" name="sregist" value="0"> -->
			                                    <span class="checkmark"></span>
			                                </label>
			                            </div>
									</td>
									<td>
										<div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px">
			                                <label for="k_check">
			                                    <input type="checkbox" id="k_check" name="dregist">
			                                    <!-- <input type="hidden" id="k_unchecked" name="dregist" value="0"> -->
			                                    <span class="checkmark"></span>
			                                </label>
			                            </div>
									</td>
									<td>
										<div class="checkout__input__checkbox" style="position:relative;bottom:-1.5px">
			                                <label for="l_check">
			                                    <input type="checkbox" id="l_check" name="pregist">
			                                    <!-- <input type="hidden" id="l_unchecked" name="pregist" value="0"> -->
			                                    <span class="checkmark"></span>
			                                </label>
			                            </div>
									</td>
								</tr>
								
							</table>
							</div>
                            <br><br><br><br><br>
                        	<h4>3. 서비스 정보 입력 <div class="checkout__input" style="float:right;position:relative;right:925px;top:2px"><div style="text-size:15px"><p style="font-size:18px"><b><span>*</span></b></p></div></div> </h4>
							<div class="box">
								<textarea name="servicecontent" id="demo-message" cols="85" rows="100" style="border-bottom-color:white;box-shadow: inset 0 -1px 0 0 white;height:400px">· 전문가 소개(경력과 이력), 구매 대상 의뢰인, 패키지 추가 설명, 견적 산정 방법 등에 대해서 의뢰인이 이해하기 쉽도록 정확하게 작성해주세요.&#13;&#10;· 외부 연락처(전화번호, 카톡ID, 이메일, 외부링크 등)는 노출하실 수 없습니다.</textarea>
							</div>
							<a href="#" class="primary-btn cart-btn" data-toggle="modal" data-target="#myModal">취소 및 환불 규정 보기</a>
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content" style="width:600px">
										<div class="modal-header">
											<b class="modal-title" id="myModalLabel" style="font-size:20px;font-family:'나눔 고딕';position:relative;left:210px">취소 및 환불 규정</b>
											<hr>
										</div>
										<div class="modal-body" style="font-size:20px;letter-spacing:0.1px;line-height:30px;opacity:0.7;margin:10px">
											가. 기본 환불 규정<br>
											1. 전문가와 의뢰인의 상호 협의하에 청약 철회 및 환불이 가능합니다.<br>
											2. 작업이 완료된 이후 또는 자료, 프로그램 등 서비스가 제공된 이후에는 환불이 불가합니다.<br>
											(소비자보호법 17조 2항의 5조. 용역 또는 「문화산업진흥 기본법」 제2조 제5호의 디지털콘텐츠의 제공이 개시된 경우에 해당)<br><br>
											나. 전문가 책임 사유<br>
											1. 전문가의 귀책사유로 당초 약정했던 서비스 미이행 혹은 보편적인 관점에서 심각하게 잘못 이행한 경우 결제 금액 전체 환불이 가능합니다.<br><br>
											다. 의뢰인 책임 사유<br>
											1. 서비스 진행 도중 의뢰인의 귀책사유로 인해 환불을 요청할 경우, 사용 금액을 아래와 같이 계산 후 총 금액의 10%를 공제하여 환불합니다.<br>
											총 작업량의 1/3 경과 전 : 이미 납부한 요금의 2/3해당액<br>
											총 작업량의 1/2 경과 전 : 이미 납부한 요금의 1/2해당액<br>
											총 작업량의 1/2 경과 후 : 반환하지 않음<br>
										</div>
										<div>
											<a href="#" class="primary-btn cart-btn" data-dismiss="modal" style="width:95%;margin:15px;text-align:center">닫기</a>
										</div>
									</div>
								</div>
							</div>
                            <br><br><br><br><br>
                        	<h4>4. 사진/영상 파일 첨부</h4>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="checkout__input">
                                        <p>메인이미지<span>*</span></p>
                                        <label class="primary-btn cart-btn toggle_cursor" for="mupload">메인이미지 파일을 선택하세요</label>
                                        <input type="file" name="mupload" id="mupload" style="display:inline;">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="checkout__input">
                                        <p>서브이미지<span>*</span></p>
                                        <label class="primary-btn cart-btn toggle_cursor" for="supload">서브이미지 파일을 선택하세요</label>
                                        <input type="file" name="supload" id="supload" style="display:inline">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="checkout__input">
                                        <p>소개동영상(선택)<span></span></p>
                                        <label class="primary-btn cart-btn toggle_cursor" for="vupload">소개동영상 파일을 선택하세요</label>
                                        <input type="file" name="vupload" id="vupload" style="display:inline">
                                    </div>
                                </div>
                            </div>
                            <br><br><br><br>
                        	<h4>5. 기타요청사항</h4>
							<div class="col-lg-7" style="position:relative;left:-15px">
	                            <div class="checkout__input">
	                            	<p>Q. 요청사항<span>*</span></p>
                        			<div class="box">
									<textarea name="subcontent" id="demo-message" cols="57" rows="50" style="border-bottom-color:white;box-shadow: inset 0 -1px 0 0 white;height:100px;width:100%" placeholder="의뢰인에게 요청할 질문을 입력해주세요"></textarea>
									</div>
	                            </div>
	                        </div>
							<br><br><br>
						    <a style="opacity:0.5;font-size:5px;position:relative;left:-15px"> 
							&#33;작업 시작 전 의뢰인으로부터 전달받아야 하는 필수 정보 및 파일들을 미리 작성해두면, 결제 직후 해당 요청사항이 자동으로 의뢰인에게 발송되어 빠른 거래가 가능합니다.<br>
							&#33;결제를 완료한 의뢰인에게만 보여지며, 작성된 답변은 거래화면에서 확인 가능합니다.<br>
							&#33;결제 후, 요청사항에 답하지 않은 의뢰인의 거래 건은 진행되지 않습니다.<br>
							</a><br>&nbsp;
							<div style="text-align:center;position:relative;bottom:12.5px;right:20px"><button type="submit" class="site-btn">모두 저장 후 등록하기</button></div>
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
    <%-- <script src="<c:url value="/resources/new/js/jquery-ui.min.js"/>"></script> --%>
    <script src="<c:url value="/resources/new/js/jquery.slicknav.js"/>"></script>
    <script src="<c:url value="/resources/new/js/mixitup.min.js"/>"></script>
    <script src="<c:url value="/resources/new/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/new/js/main.js"/>"></script>

</body>

</html>