<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypagehome.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>

<div id="signup-selection-cont">
	<div class="signup-selection-contents">
		<div class="signup-selection-wrapper">
			<h3 class="top-title">마이페이지</h3>
			<hr>
			<div class="selection-cont">
			<h4 class="top-title"></h4> <!-- 회원 아이디 들어가함 -->
				<div class="selections">
					<div class="selection">
						<h5 class="selection-title">나의 주문 내역</h5>
						<div class="selection-img-wrapper" style="padding-bottom: 8px;">
							<h1><span class="signup-btn">수량</span></h1>
						</div>
						<span class="signup-btn">결제 완료</span>
						<a href="${pageContext.request.contextPath}"></a>
							
						<span class="signup-btn">배송완료</span>
						<a href="${pageContext.request.contextPath}"></a>
							<span class="signup-btn">수량</span>
							<span class="signup-btn">수량</span>
					</div>
				</div>
				<div class="selections">
					<div class="selection">
						<h5 class="selection-title">나의 반려동물</h5>
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
						<h5 class="selection-title">문의 내역</h5>
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