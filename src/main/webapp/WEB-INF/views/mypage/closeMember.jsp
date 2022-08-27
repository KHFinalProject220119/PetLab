<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.petlab.member.model.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/memberDetail.css"/>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="회원 정보" name="title"/>
</jsp:include>
<sec:authentication property="principal" var="loginMember"/>
<div id="mypage-submenu" class="submenu">
	<h4 class="top-title"> <a href="${pageContext.request.contextPath}/mypage/mypageHome">MY PAGE </a></h4>
		<ul id="sub">
			<li><a href="${pageContext.request.contextPath}/mypage/memberDetail" >회원정보</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/myBorad">내가 쓴 글</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/myPetHome">마이펫</a></li>
			<sec:authorize access="hasRole('HOSPITAL')">
			<li><a href="${pageContext.request.contextPath}/hospital/hospitalEnroll">병원 상세정보 등록</a></li>
			</sec:authorize>
			<li><a href="${pageContext.request.contextPath}/mypage/closeMember">회원탈퇴</a></li>
		</ul>
	 
</div>
<div class="top_mypage">
  			<sec:authorize access="isAuthenticated()">
			    	<%-- 로그인한 경우 --%>
			    	<span>
			    		${member.memberName}
				    	님
				    </span>
			
			 </sec:authorize>
  			<a href="${pageContext.request.contextPath}/mypage/mypageHome">뒤로가기&nbsp;&nbsp;&gt;</a>
			<hr class="dash1">
		</div>
		
<table>
	<c:forEach items="${list}" var="memberList" varStatus="vs">
		<tr>
			<td>${member.memberId}</td>
			<td>${member.memberName}</td>
			<td>
				<div id="close btn wrapp">
					<button type="submit" class="btn btn-prymary"
							data-bs-target="#exampleModal" onclick="closeMemeber();"
							id="closeBtn">회원 탈퇴
					</button>
				</div>
			</td>
		</tr>
     </c:forEach> 
</table>
<script>
$(document).on('click', '#closeBtn', function(){
	var
})
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>