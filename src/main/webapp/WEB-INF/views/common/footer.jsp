<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	</section>
	<footer>
		<div class="footer-cont">
			<div class="footer-left">
				<p><strong>멍냥연구소</strong>&nbsp;&nbsp;대표 1석 6조&nbsp;&nbsp;사업자 등록번호 000-00-00000</p>
				<p>서울시 강남구 테헤란로 10길 9 그랑프리빌딩 5F</p>
				<p>TEL. 02-111-1111&nbsp;&nbsp;&nbsp;&nbsp;Email: CSCenter@PetLab.com</p>
				<p>&lt;Copyright 2022. ©<strong>멍냥연구소</strong>. All Rights reserved.&gt;</p>
			</div>
			<div class="footer-right">
				<div class="footer-link-wrapper">
					<ul class="footer-link">
						<li><a href="${pageContext.request.contextPath}/common/about">회사소개</a></li>
						<li><a href="${pageContext.request.contextPath}/common/term">이용약관</a></li>
						<li><a href="${pageContext.request.contextPath}/common/privacy">개인정보처리방침</a></li>
						<li><a href="${pageContext.request.contextPath}/store/ads">광고문의·관리</a></li>
						<li><a href="${pageContext.request.contextPath}/customerservice/sendEmail">고객의소리</a></li>
					</ul>
				</div>
				<div class="footer-sns-wrapper">
					<ul class="footer-sns">
						<li><a href="#"><img class="sns-img" src="${pageContext.request.contextPath}/resources/images/common/footer/footer-sns-0.png" alt=""></a></li>
						<li><a href="#"><img class="sns-img" src="${pageContext.request.contextPath}/resources/images/common/footer/footer-sns-1.png" alt=""></a></li>
						<li><a href="#"><img class="sns-img" src="${pageContext.request.contextPath}/resources/images/common/footer/footer-sns-2.png" alt=""></a></li>
						<li><a href="#"><img class="sns-img" src="${pageContext.request.contextPath}/resources/images/common/footer/footer-sns-3.png" alt=""></a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</div>
</body>

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="loginMember" scope="page"/>
<script>
// 로그아웃 핸들러
const signoutFrm = document.signoutFrm;
signoutFrm.addEventListener('submit', (e) => {
	e.preventDefault();

	const memberSocialTyped = "${loginMember.memberSocial}";	
	const kakao = "kakao";
	const google = "google";
	const naver = "naver";
	
	//카카오로그아웃  
	if(kakao === memberSocialType){
		console.log(memberSocialType);
		logoutWithKakao();			
	}
	
	// 구글 로그아웃
	else if(google === memberSocialType){
		console.log(memberSocialType);
		location.href = "https://mail.google.com/mail/u/0/?logout&hl=en";
	}
	
	// 네이버 로그아웃
	else if(naver === memberSocialType){
		naverLogOut.logout();
		location.href = "http://nid.naver.com/nidlogin.logout";	 
		

	}
 
	signoutFrm.submit();
});
</script>
</sec:authorize>
</html> 