<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/signupselection.css" />
 <jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param value="회원가입 유형 선택" name="title"/>
 </jsp:include>
<div id="signup-selection-cont">
	<div class="signup-selection-contents">
		<div class="signup-selection-wrapper">
			<h3 class="top-title">회원가입</h3>
			<div class="selection-cont">
				<div class="selections">
					<div class="selection">
						<h4 class="selection-title">펫오너</h4>
						<p class="pr">주변의 동물병원, 반려펫들의 사진,<br class="pc">펫용품 등 다양한 혜택이 있는<br class="pc"><span id="highlight-txt">멍냥연구소</span>에 <br class="pc">지금 바로 가입하세요.<br class="pc">
						</p>
						<div class="selection-img-wrapper" style="padding-bottom: 8px;">
							<img class="selection-img" src="${pageContext.request.contextPath}/resources/images/member/sign/withpet.png" alt="">
						</div>
						<a href="${pageContext.request.contextPath}/member/agreement?selection=normal" class="signup-btn-wrapper"><span class="signup-btn">펫오너로 가입</span></a>
						<div class="social">
							<span class="sns-text">SNS로 간편 가입하기</span>
							<span class="link">
								<a href="${pageContext.request.contextPath}/member/signIn"><img class="sns-img-sign" src="${pageContext.request.contextPath}/resources/images/member/sign/kakao.png" alt=""></a>
								<a href="${pageContext.request.contextPath}/member/signIn"><img class="sns-img-sign" src="${pageContext.request.contextPath}/resources/images/member/sign/naver.png" alt=""></a>
								<a href="${pageContext.request.contextPath}/member/signIn"><img class="sns-img-sign" src="${pageContext.request.contextPath}/resources/images/member/sign/google.png" alt=""></a>
							</span>
						</div>
					</div>
				</div>
				<div class="selections">
					<div class="selection">
						<h4 class="selection-title">펫병원</h4>
						<p class="pr">위치기반으로 동물병원을 <br class="pc">홍보할 수 있으니,<br class="pc"><span id="highlight-txt">멍냥연구소</span>에 <br class="pc">지금 바로 가입하세요.<br class="pc">
						</p>
						<div  class="selection-img-wrapper" style="padding-bottom: 8px;">
							<img class="selection-img" src="${pageContext.request.contextPath}/resources/images/member/sign/pethospital.png" alt="">
						</div>
						<a href="${pageContext.request.contextPath}/member/agreement?selection=hospital" class="signup-btn-wrapper">
							<span class="signup-btn">펫병원으로 가입</span>
						</a>
					</div>
				</div>
				<div class="selections">
					<div  class="selection">
						<h4 class="selection-title">반려펫 상품</h4>
						<p class="pr">
							반려펫을 위한 상품 업체이시면<br class="pc"><span id="highlight-txt">멍냥연구소</span>에 <br class="pc">지금 바로 가입 후, <br class="pc">홍보해
							보세요.<br class="pc">
						</p>
						<div class="selection-img-wrapper" style="padding-bottom: 8px;">
							<img class="selection-img" src="${pageContext.request.contextPath}/resources/images/member/sign/petshop.png" alt="">
						</div>
						<a href="${pageContext.request.contextPath}/member/agreement?selection=mall" class="signup-btn-wrapper">
							<span class="signup-btn">쇼핑몰로 가입</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>