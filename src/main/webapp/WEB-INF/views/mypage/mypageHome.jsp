<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypageHome.css"/>
 <jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>
<div class="flex">
<div id="mypage-submenu" class="submenu">
	<h4 class="top-title">MY PAGE</h4>
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
  			<a href="/mypage/updateMember">회원정보수정&nbsp;&nbsp;&gt;</a>
			<hr class="dash1">
		</div>
	<div></div>
			<div id="mypage_con">
				<div class="mypage_con1">
					<div class="wrapper">
						<div class="selection-cont">
							<div class="selections">
								<h4 class="selection-title">MY ORDER</h4>
									<div class="selection">
										<div>
											<h4 class="selection2">주문 내역</h4>
											<h1 class="totalCnt">00</h1>
										</div>
										<div>
											<span class="ph">
												<p>결제완료</p>
												<h1>00</h1>
											</span> 
											<span class="ph">
												<p>배송완료</p>
												<h1>00</h1>
											</span>
										</div>
										<div>
										<a href="${pageContext.request.contextPath}/store/storeMain">
										<span class="clearfix">계속 쇼핑하기 &gt;</span></a>
										</div>
								</div>
							</div>
							<div class="selections">
								<h4 class="selection-title">MY PET</h4>
									<div class="selection">
										<div>
											<h4 class="selection2">마이펫 목록</h4>
											<h1 class="totalCnt">00</h1>
										</div>
										<div>
											<span class="ph">
												<p>강아지</p>
												<h1>00</h1>
											</span> 
											<span class="ph">

												<p>고양이</p>
												<h1>00</h1>
											</span>
										</div>
										<div>
										<a href="${pageContext.request.contextPath}/mypage/mypetEnroll"><span class="clearfix">계속 등록하기 &gt;</span></a>
										</div>
								</div>
							</div>
							<div class="selections">
									<h4 class="selection-title">Q&A</h4>
								<div  class="selection">
										<div>
											<h4 class="selection2">문의 내역</h4>
											<h1 class="totalCnt">00</h1>
										</div>
										<div>
											<span class="ph">
												<p>답변대기</p>
												<h1>00</h1>
											</span> 
											<span class="ph">
												<p>답변완료</p>
												<h1>00</h1>
											</span>
										</div>
										<div>
										<a href="${pageContext.request.contextPath}/mypage/qna"><span class="clearfix">계속 문의하기 &gt;</span></a>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			 <hr class="dash2">
  				<div class="close_mypage">
   				<span class="close_account">CLOSE ACCOUNT</span>
   				<a href="/mypage/closeMember">회원탈퇴&nbsp;&nbsp;&gt;</a>
 				</div>
		    <div></div>
</div>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>