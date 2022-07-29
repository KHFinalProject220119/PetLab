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
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.1.js" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/common.css" />
<script>
// 소셜로그인 초기화
//구글
  window.onload = function() {
    google.accounts.id.initialize({
      client_id: "699818403547-pvfigermmgeljtvqpjmol26uhist6t19.apps.googleusercontent.com",
      callback: handleCredentialResponse
    });
}

// 네이버 로그인
const naverLogOut = new naver.LoginWithNaverId({
			clientId: "KSurOBZGq_POfnJ3N5WS",	
			} );
naverLogOut.init(); 
// 카카오		
Kakao.init('22289034ae7ed5aa331cb59ea6ac1625'); 	
</script>
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
								<li><a href="${pageContext.request.contextPath}/member/signIn"><span>로그인</span></a></li>
								<li><a href="${pageContext.request.contextPath}/member/signUpSelection"><span>회원가입</span></a></li>
								<li><a href="${pageContext.request.contextPath}/customerservice/csCenter">고객센터</a></li>
							</ul>
						</sec:authorize>
						 <sec:authorize access="isAuthenticated()">
							<ul class="header-member-menu-ul">
								<li><a href="${pageContext.request.contextPath}/member/signUpSelection"><span>마이페이지</span></a></li>
								<li>
									<form action="${pageContext.request.contextPath}/member/signIn" method="POST">
										<button type="submit" class="sign-out-btn">로그아웃</button>
			    	   					<input type="hidden" name= "${_csrf.parameterName}" value="${_csrf.token}" />
				    				</form>
			    				</li>
								<li><a href="${pageContext.request.contextPath}/customerservice/csCenter">고객센터</a></li>
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
									<a href="/hospital/searchHospital" class="menu-link">
										<span><img class="menu-logo" src="${pageContext.request.contextPath}/resources/images/common/header/Dr.Dog.png" alt="" /></span>
										<h2>동물병원 찾기</h2>
									</a>
								</li>
								<li class="header-menu-li">
									<a href="${pageContext.request.contextPath}/community/communityMain" class="menu-link">
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

	</header>
	<section id="content">