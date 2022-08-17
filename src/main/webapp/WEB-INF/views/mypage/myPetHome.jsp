<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypetDetail.css"/>
 <jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>
<div class="flex">
		<div id="mypage-submenu" class="submenu">
			<h4 class="top-title"> <a href="${pageContext.request.contextPath}/mypage/mypageHome">MY PAGE </a></h4>
			<ul id="sub">
				<li><a href="${pageContext.request.contextPath}/mypage/memberDetail" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/myBorad" onmouseover="mousein(this);" onmouseout="mouseout(this)">내가 쓴 글</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/myPetHome" onmouseover="mousein(this);" onmouseout="mouseout(this)">마이펫</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/closeMember" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
			</ul>
		</div>
		<div class="top_mypage">
  			<sec:authorize access="isAuthenticated()">
			    	<%-- 로그인한 경우 --%>
			    	<span>
			    		<sec:authentication property="principal.username"/>
				    	</a>님의 마이펫
				    </span>
			
			 </sec:authorize>
			<hr class="dash1">
		</div>
	<div></div>
		<div id="pet-container">
                <div class="container">
                    <div class="text-center">
                        <h2 class="title_color"></h2>
                    </div>
                    <div class="row mb_30"> <!--flex-->
                        <div class="col-lg-3 col-sm-6">
                            <div class="accomodation_item text-center">
                                <div class="pet_img">
                                    <img src="${pageContext.request.contextPath}/resources/images/mypage/유연응삼.jpg" alt="">
                                    <a href="#" class="btn theme_btn button_hover">수정하기</a>
                                </div>
								<h2 class="sec_h4">애기이름</h2>
                                <h5>$250<small>/night</small></h5>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="accomodation_item text-center">
                                 <div class="pet_img">
                                    <img src="${pageContext.request.contextPath}/resources/images/mypage/유연응삼.jpg" alt="">
                                    <a href="#" class="btn theme_btn button_hover">수정하기</a>
                                </div>
                                <a href="#">
                                <h4 class="sec_h4">Single Deluxe Room</h4>
                                </a>
                                <h5>$200<small>/night</small></h5>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="accomodation_item text-center">
                                 <div class="pet_img">
                                    <img src="${pageContext.request.contextPath}/resources/images/mypage/유연응삼.jpg" alt="">
                                    <a href="#" class="btn theme_btn button_hover">수정하기</a>
                                </div>
                                <h4 class="sec_h4">Honeymoon Suit</h4>
                                
                                <h5>$750<small>/night</small></h5>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="accomodation_item text-center">
                                 <div class="pet_img">
                                    <img src="${pageContext.request.contextPath}/resources/images/mypage/유연응삼.jpg" alt="">
                                    <a href="#" class="btn theme_btn button_hover">수정하기</a>
                                </div>
                                <a href="#">
                                <h4 class="sec_h4">Economy Double</h4>
                                </a>
                                <h5>$200<small>/night</small></h5>
                            </div>
                       </div>
                 </div>
            </div>
     </div>
     <div></div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>