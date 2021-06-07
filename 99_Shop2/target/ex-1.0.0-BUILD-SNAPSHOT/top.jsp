<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="header__top__left">
                            <ul>
                            <c:if test="${loginInfo != null }">
                                <li><i class="fa fa-envelope"></i>${loginInfo.email }</li>
                                <li>${loginInfo.nickname }님 환영합니다.</li>
                            </c:if>
                            <c:if test="${loginInfo == null }">
                                <li><i class="fa fa-envelope"></i> <a href="login.mb">로그인</a>&nbsp;&nbsp;<a href="register.mb">회원가입</a></li>
                                <li>Free Shipping for all Order of $99</li>
                            </c:if>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                                <a href="#"><i class="fa fa-heart"></i></a>
                                <a href="#"><i class="fa fa-shopping-bag"></i></a>
                            </div>
                            
                            
                            
                            <!-- 프로필 ,, 마이페이지 -->
                            <div class="header__top__right__language">
                                <div>My</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="myPage.mb">프로필 관리</a></li>
                                    <li><a href="#">전문가 등록</a></li>
                                    <li><a href="#">친구 초대</a></li>
                                    <li><a href="#">찜한 서비스</a></li>
                                    <li><a href="#">계정 설정</a></li>
                                    <c:if test="${loginInfo == null }">
                                    <li><a href="#">로그인</a></li>
                                    </c:if>
                                    
                                    <c:if test="${loginInfo != null }">
                                    <li><a href="logout.jsp">로그아웃</a></li>
                                    </c:if>
                                </ul>
                                
                                <!-- 프로필 사진 or 흰 닉네임(구글식) -->
                                <div style="background: #BDBDBD;width: 30px;
								    height: 30px; 
								    border-radius: 70%;
								    overflow: hidden;
								    position: absolute;
								    top:-1px;
								    left:-12px">
			            			<img class="profile" src="${pageContext.request.contextPath}/resources/new/img/cmong2.png">
			            			
		            			</div>
                            </div>
                            
                            
                            <!-- 로그인 아이콘 -->
                            <!-- <div class="header__top__right__auth">
                                <a href="#"><i class="fa fa-user"></i> Login</a>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <!-- 로고 -->
                    <div class="header__logo">
                        <a href="result.fm"><img width="70" height="70" src="${pageContext.request.contextPath}/resources/new/img/cmong2.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="result.fm">Home</a></li>
                            <li class="active"><a href="./shop-grid.html">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">Blog</a></li>
                            <li><a href="list.brd">Community</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
     <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    
    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/new/css/style.css" type="text/css">
    
    <!-- Js Plugins -->
    <script src="<c:url value="/resources/new/js/jquery.slicknav.js"/>"></script>
    <script src="<c:url value="/resources/new/js/main.js"/>"></script>