<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypageHome.css" />
 <jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>

<section id="container">
	<h3 id="title">MY PAGE</h3>
		<div id="mypage-submenu" class="submenu">
			<ul id="sub">
				<li><a href="updateMember.html" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보 수정</a></li>
				<li><a href="myBorad.html" onmouseover="mousein(this);" onmouseout="mouseout(this)">내가 쓴 글</a></li>
				<li><a href="mypet.html" onmouseover="mousein(this);" onmouseout="mouseout(this)">마이펫</a></li>
				<li><a href="closeMember.html" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
			</ul>
		</div> 
			<div class="top_mypage">
				<c:forEach var="item" items="${list}"> 
					<span class="memberUDT">LoginMember</span>
				</c:forEach>
				<span class="memberUD"><a href="updateMember.html">회원정보변경 &gt;</a></span>
			</div>
			<div class="tpl_mypage clearfix">
				<dl class="no1">
				<h4>MY ORDER</h4>
					<dt class="dtselection">
						<div>
							<h4>나의 주문 내역</h4>
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
							<a href="shop.html"><span class="clearfix">계속 쇼핑하기 &gt;</span></a>
						</div>
					</dt>
				</dl>
				<dl class="no2">
				<h4>MY PET</h4>
					<dt class="selection">
						<div>
							<h4>마이펫 목록</h4>
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
						<a href="myPetEnroll.html"><span class="clearfix">계속 등록하기 &gt;</span></a>
						</div>
					</dt>
				</dl>
				<dl class="no3 last">
				<h4>Q&A</h4>
					<dt class="selection">
						<div>
							<h4>문의 내역</h4>
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
						<a href=""><span class="clearfix">계속 문의하기 &gt;</span></a>
						</div>
					</dt>
				</dl>
			</div>
			<div class="close_mypage">
				<span class="memberUDT">CloseMember</span>
				<span class="memberUD"><a href="closeMember.html">회원 탈퇴 &gt;</a></span>
			</div>
</section>
