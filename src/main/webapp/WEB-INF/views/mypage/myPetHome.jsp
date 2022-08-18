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
				    	</a>님
				    </span>
			
			 </sec:authorize>
  			<a href="${pageContext.request.contextPath}/mypage/myPetEnroll">마이펫 등록하기&nbsp;&nbsp;&gt;</a>
			<hr class="dash1">
		</div>
	<div></div>
		<div id="pet-container">
                <div class="container">
                    <div class="text-center">
                        <h4 class="selection-title">MY PET LIST</h4>
                    </div>
                    <div class="row mb_30"> <!--flex-->
                    <sec:authentication property="principal" var="loginMember"/>
                        <div class="col-lg-3 col-sm-6">
                            <div class="accomodation_item text-center">
                                 <div class="pet_img">
                                    <img src="${pageContext.request.contextPath}/resources/images/mypage/유연응삼.jpg" alt="">
                                    <a href="#" class="btn theme_btn button_hover">수정하기</a>
                                </div>
                                 <h4 class="sec_h4">대분류 개/고양이/기타</h4>
                                <h5>펫이름<small>/성별</small></h5>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="accomodation_item text-center">
                                 <div class="pet_img">
                                    <img src="${pageContext.request.contextPath}/resources/images/mypage/유연응삼.jpg" alt="">
                                    <a href="#" class="btn theme_btn button_hover">수정하기</a>
                                </div>
                                 <h4 class="sec_h4">대분류 개/고양이/기타</h4>
                                <h5>펫이름<small>/성별</small></h5>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6">
                            <div class="accomodation_item text-center">
                                 <div class="pet_img">
                                    <img src="${pageContext.request.contextPath}/resources/images/mypage/유연응삼.jpg" alt="">
                                    <a href="#" class="btn theme_btn button_hover">수정하기</a>
                                </div>
                                 <h4 class="sec_h4">대분류 개/고양이/기타</h4>
                                <h5>펫이름<small>/성별</small></h5>
                           </div>
                      </div>
                 </div>
            </div>
     </div>
     <div></div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>