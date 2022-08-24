<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.title}</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/common/favicon/favicon.ico"> 
<link rel="apple-touch-icon" sizes="57x57" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath}/resources/images/common/favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/images/common/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/resources/images/common/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/common/favicon/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/resources/images/common/favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="${pageContext.request.contextPath}/resources/images/common/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.1.js" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/common.css" />

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="loginMember" scope="page"/>
<script>
const memberSocialType = "${loginMember.memberSocial}";	
// 소셜로그인 초기화
//구글
  window.onload = function() {
    google.accounts.id.initialize({
      client_id: "699818403547-pvfigermmgeljtvqpjmol26uhist6t19.apps.googleusercontent.com",
    
    });
}

// 네이버 로그아웃
const naverLogOut = new naver.LoginWithNaverId({
			clientId: "KSurOBZGq_POfnJ3N5WS",	
			} );	
naverLogOut.init(); 

// 카카오		
Kakao.init('22289034ae7ed5aa331cb59ea6ac1625'); 


// 카카오 로그아웃
function logoutWithKakao() {
	 Kakao.API.request({
		    url: '/v1/user/access_token_info',
		    success: function (response) {
				Kakao.Auth.logout();
		    },
		    fail: function (error) {
                console.log(error)
              }
	 });
}  
</script>
</sec:authorize>
</head>
<body>
<div id="container">
	<header>
			<div class="header-cont">
				<div class="header-right-nav-wrapper">
					<div class="header-right-nav">
						<div class="header-member-menu">
						<sec:authorize access="isAnonymous()">
							<ul class="header-member-menu-ul">
								<li><a href="${pageContext.request.contextPath}/adminnotice/adminNoticeList"><span>공지사항</span></a></li>							
								<li><a href="${pageContext.request.contextPath}/member/signIn"><span>로그인</span></a></li>
								<li><a href="${pageContext.request.contextPath}/member/signUpSelection"><span>회원가입</span></a></li>
								<li><a href="${pageContext.request.contextPath}/customerservice/csCenter">고객센터</a></li>
							</ul>
						</sec:authorize>
						 <sec:authorize access="isAuthenticated()">
							<ul class="header-member-menu-ul">
								<li><a href="${pageContext.request.contextPath}/mypage/mypageHome"><span>마이페이지</span></a></li>
								<li>
									<form:form name="signoutFrm" action="${pageContext.request.contextPath}/member/signOut" method="POST">
										<button type="submit" class="sign-out-btn">로그아웃</button>
				    				</form:form>
			    				</li>
								<li><a href="${pageContext.request.contextPath}/customerservice/csCenter">고객센터</a></li>
							</ul>
						</sec:authorize>
						
						<sec:authorize access="hasRole('ADMIN')">
						    <ul class="header-member-list-ul">
						    	<li><a class="nav-link" href="${pageContext.request.contextPath}/admin/memberList">회원관리</a></li>
						    </ul>
				    	</sec:authorize>
						
						</div>
					</div>
				</div>
				<div class="header-top">
					<div class="header-contents">
						<div class="header-menu">
							<ul class="header-menu-ul">
								<li class="header-menu-li">
									<a href="${pageContext.request.contextPath}/hospital/searchHospital" class="menu-link">
										<span><img class="menu-logo" src="${pageContext.request.contextPath}/resources/images/common/header/Dr.Dog.png" alt="" /></span>
										<h2>동물병원 찾기</h2>
									</a>
								</li>
								<li class="header-menu-li">
									<a href="${pageContext.request.contextPath}/community/photoList" class="menu-link">
										<span><img class="menu-logo" src="${pageContext.request.contextPath}/resources/images/common/header/CatWithAPencil.png" alt="" /></span>
										<h2>커뮤니티</h2>
									</a>
									<ul class="sub-menu">
										<li><a href="${pageContext.request.contextPath}/community/smallGroupList">소모임</a></li>
										<li><a href="${pageContext.request.contextPath}/community/photoList">멍냥이 갤러리</a></li>
										<li><a href="${pageContext.request.contextPath}/community/freeBoardList">자유게시판</a></li>
										<li><a href="${pageContext.request.contextPath}/community/knowhowList">노하우</a></li>
									</ul>
								</li>
								<li class="header-menu-li">
									<a href="${pageContext.request.contextPath}/" title="홈으로 이동">
										<span><img class="main-logo" src="${pageContext.request.contextPath}/resources/images/common/header/DogWithALaptop.png" alt="" /></span><span class="header-title">멍냥 연구소</span><span><img class="main-logo" src="${pageContext.request.contextPath}/resources/images/common/header/CatWithALaptop.png" alt="" /></span>
									</a>
								</li>
								<li class="header-menu-li">
									<a href="${pageContext.request.contextPath}/contest/contestList" class="menu-link">
										<h2>콘테스트</h2>
										<span><img class="menu-logo" src="${pageContext.request.contextPath}/resources/images/common/header/CatDecorated.png" alt="" /></span>
									</a>
								</li>
								<li class="header-menu-li">
									<a href="${pageContext.request.contextPath}/store/storeMain" class="menu-link">
										<h2>스토어</h2>
										<span><img class="menu-logo" src="${pageContext.request.contextPath}/resources/images/common/header/DogWithABone.png" alt="" /></span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div id="skyScraper">
				<div class="myView">
					<div class="myViewTit"><a href="javascript:;">장바구니<span class="count">3</span></a></div>
					<div class="itemList myCart">
						<ul>
							<li>
								<a href="#">
									<img src="" width="70" height="70">
										<span class="mOverWrap" style="display: none;">
										<span class="mOverTxtArea">
											<span class="mOverTit"> </span>
											<span class="mOverPrc"><span class="fontMont"></span>원</span>
										</span>
									</span>
								</a>
							</li>		
						</ul>
						<div class="skyBtnArea">
							<a href="javascript:;" class="prev"><img src="${pageContext.request.contextPath}/resources/images/common/carousel/prev.png" alt="prev"></a>
							<div class="pager"><span class="current">1</span>/<span class="total"></span></div>
							<a href="javascript:;" class="next"><img src="${pageContext.request.contextPath}/resources/images/common/carousel/next.png" alt="next"></a>
						</div>
						<a href="${pageContext.request.contextPath}" class="goCart">바로가기</a>
					</div>
				</div>
				<div class="directLink">
					<div class="talk">
						<div class= "talk-img-cont">
							<span class="talk-img-wrapper">1:1</span>
							<span class="talk-img-wrapper"><img src="${pageContext.request.contextPath}/resources/images/common/header/pettalk.gif" alt="pettalk" /></span> 
			 				<a href="javascript:goTalk();" class="btnRed" id="sweet-talk-btn">멍냥 Talk</a>			
						</div>
						<div class= "cs-talk-wrapper">
							<a class="cs-talk-inner" href="javascript: openChat();" style="padding: 0;">
								<span id="cs-talk-text"> 고객센터 톡</span>
								<span id="cs-talk-img-wrapper"><img id="cs-talk-img" src="${pageContext.request.contextPath}/resources/images/common/header/phone.png" alt="" /> </span>
							</a>
						</div>
					</div>			
				</div>
				<div class="skyBtnArea">
					<div class="move-btn-wrapper">
						<a href="javascript:goToTop();" class="top-btn"><img src="${pageContext.request.contextPath}/resources/images/common/header/up-arrow.png" alt="top"></a>
						<div class="btn-seperator">|</div>
						<a href="javascript:goToBottom();" class="down-btn"><img src="${pageContext.request.contextPath}/resources/images/common/header/down-arrow.png" alt="down"></a> 
					</div>
			
				</div>
			</div>

<script>
// 고객센터 1:1채팅 Sweet Talk
const openChat = () => {
	const title = "PetTalkPopup";
	const spec = "width=720px, height=660px";
	const addr = "${pageContext.request.contextPath}/customerservice/pettalk";
	const popup = open(addr, title, spec);
}
// top 버튼
const goToTop = (e) => {
	  document.body.scrollTop = 0;
	  document.documentElement.scrollTop = 0; 
}
// bottom 버튼
const goToBottom = (e) => {
	window.scrollTo(0,document.body.scrollHeight);
}
</script>
	</header>
	<section id="content">