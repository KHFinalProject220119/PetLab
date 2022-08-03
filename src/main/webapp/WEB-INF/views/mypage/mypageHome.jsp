<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.petlab.member.model.dto.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypageMain copy.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>

<div id="title">
	<dl>
		<dt>
		<a href="${pageContext.request.contextPath}/mypage/mypageHome"><span>마이페이지</span></a>
		</dt>
	</dl>
</div>
<div id="container" class="wrap1000 m_wrap15">
		<div class="top_mypage">
			<c:forEach items="${list}" var="member">
			<span>${member.memberId}</span>
			</c:forEach>
			<span class="p_para12 m_para12" style="float: right;">
			<a href="${pageContext.request.contextPath}">회원정보변경 &gt;</a></span>
		</div>
		<div class="tpl_mypage clearfix">
			<dl class="no1">
				<p>MY ORDER</p>
				<dt>
					<div>
						<p class="title_totalCnt">나의 주문 내역</p>
						<h1 class="totalCnt">00</h1>
					</div>
					<div>
						<span>
							<p>결제완료</p>
							<h1>00</h1>
						</span> 
						<span>
							<p>배송완료</p>
							<h1>00</h1>
						</span>
					</div>
					<div>
						<a href="${pageContext.request.contextPath}/store/storeMain"><span class="clearfix">계속 쇼핑하기 &gt;</span></a>
					</div>
				</dt>
			</dl>
			<dl class="no2">
				<p>MY PET</p>
				<dt>
					<div>
						<p class="title_totalCnt">마이펫 목록</p>
						<h1 class="totalCnt">00</h1>
					</div>
					<div>
						<span>
							<p>강아지</p>
							<h1>00</h1>
						</span> 
						<span>
							<p>고양이</p>
							<h1>00</h1>
						</span>
					</div>
					<div>
						<a href="${pageContext.request.contextPath}/mypage/mypetEnroll"><span class="clearfix">계속 등록하기 &gt;</span></a>
					</div>
				</dt>
			</dl>
			<dl class="no3 last">
				<p>Q&nbsp;&amp;&nbsp;A</p>
				<dt>
					<div>
						<p class="title_totalCnt">1:1 문의 내역</p>
						<h1 class="totalCnt">00</h1>
					</div>
					<div>
						<span>
							<p>답변대기</p>
							<h1>00</h1>
						</span> 
						<span>
							<p>답변완료</p>
							<h1>00</h1>
						</span>
					</div>
					<div>
						<a href="${pageContext.request.contextPath}/support/qna"> <span class="clearfix">1:1 문의하기 &gt;</span></a>
					</div>
				</dt>
			</dl>
		</div>
		<hr class="solid">
		<div class="close_mypage">
			<span class="close_account">CLOSE ACCOUNT</span>
			<span class="p_para12 m_para12" style="float: right;"><a href="/my/account/close">회원탈퇴&nbsp;&nbsp;&gt;</a></span>
		</div>
		<hr class="dash">
		<div class="p_h100 m_h100"></div>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>