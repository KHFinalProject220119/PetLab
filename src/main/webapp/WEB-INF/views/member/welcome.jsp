<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/welcome.css" />
 <jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param value="환영합니다~" name="title"/>
 </jsp:include>
  
    <div id="sign-up-welcome-container">
		<div class="sign-welcome-wrapper">
			<div class="welcome-title-cont">
				<h3 class="top-title">회원가입</h3>
				<div class="join-top">	
					<h3 class="welcome-sub-title">가입 완료</h3>
					<div class="signup-order-img">
						<img src="${pageContext.request.contextPath}/resources/images/member/sign/tab3.png" alt="">
					</div>s
				</div>
			</div>
			<div class="welcome-body-wrapper">
				<div class="img-wrapper">
					<img class="celebration-img" src="${pageContext.request.contextPath}/resources/images/member/sign/celebration.png" alt="">
					<div class="celebration-title">
						<p>🎉🎉Welcome🎉🎉</p>
						<h3>멍냥 연구소</h3>
					</div>
					<img class="celebration-img" src="${pageContext.request.contextPath}/resources/images/member/sign/celebration.png" alt="">
				</div>
				<div class="celebration-text">
					<h3><span id="nickname-txt">${nickname}</span>님</h3>
					<p>웰컴 기프트로 멤버십포인트를</p>
					<p>1,000점 드렸습니다.</p>
					<p>앞으로 많은 활동 부탁드릴게요~</p>
				</div>
				<div class="button-wrapper">
					<button type="button" class="enroll-pet-btn" onclick="enrollPet();">반려펫 등록</button>
					<button type="button" class="home-btn" onclick="goToHome();">홈으로</button>
				</div>
			</div>
		</div>
	</div>
    <script>
    const enrollPet = (e) =>{
    	location.href = "${pageContext.request.contextPath}/member/enrollPet"
    }
    const goToHome = (e) =>{
    	location.href = "${pageContext.request.contextPath}/"
    }
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>