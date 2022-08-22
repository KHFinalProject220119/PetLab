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
<!-- <%
	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	Member loginMember = (Member) authentication.getPrincipal();
	
 %> -->
 
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/memberDetail.css"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="회원 정보" name="title"/>
</jsp:include>
<sec:authentication property="principal" var="loginMember"/>
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
			    		${loginMember.memberName}
				    	님
				    </span>
			
			 </sec:authorize>
  			<a href="${pageContext.request.contextPath}/mypage/myPetHome">뒤로가기&nbsp;&nbsp;&gt;</a>
			<hr class="dash1">
		</div>