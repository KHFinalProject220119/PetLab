<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.petlab.member.model.dto.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage/mypetList.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이펫 등록" name="title" />
</jsp:include>

<sec:authentication property="principal" var="loginMember" />
<div id="mypage-submenu" class="submenu">
	<h4 class="top-title">
		<a href="${pageContext.request.contextPath}/mypage/mypageHome">MYPAGE </a>
	</h4>
	<ul id="sub">
			<li><a href="${pageContext.request.contextPath}/mypage/memberDetail" >회원정보</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/myBorad">내가 쓴 글</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/myPetList">마이펫</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/closeMember">회원탈퇴</a></li>
	</ul>
</div>
<div class="top_mypage">
	<sec:authorize access="isAuthenticated()">
		<%-- 로그인한 경우 --%>
		<span> ${member.memberName} 님 </span>
	</sec:authorize>
  	<a href="${pageContext.request.contextPath}/mypage/mypageHome">뒤로가기&nbsp;&nbsp;&gt;</a>
	<hr class="dash1">
</div>
<section id="container"><h2>MY PET LIST</h2>
	<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="goToPetEnrollForm();"/>
       	<table id="tbl-board" class="table table-striped table-hover text-center">
   				<tr>
	            	<th>no</th>
	           		<th>펫 이름</th>
               		<th>생일</th>
                	<th>성별</th>
                	<th>첨부파일</th>
				</tr>
                <c:forEach items="${list}" var="mypet" varStatus="vs">
                   <tr data-no="${mypet.petNo}">
                   		<td>${mypet.petNo}</td>
                   		<td>${mypet.petName}</td>
                   		<td>${mypet.birthday}</td>
                   		<td>${mypet.gender}</td>

                   </tr>
                </c:forEach>            
          </table>
          <nav>${pagebar}</nav>
</section>
<script>

function goToPetEnrollForm(){
	location.href = "${pageContext.request.contextPath}/mypage/myPetEnroll";
}
window.addEventListener('load', (e) => {
	document.querySelectorAll("tr[data-no]").forEach((tr) => {
		tr.addEventListener('click', (e) => {
			console.log(e.target);	
			const tr = e.target.parentElement;
			console.log(tr);
			
			// matches -> 특정 선택자와 일치여부 boolean형 반환
			if(tr.matches('tr')){
				const no = tr.dataset.no;
				location.href = '${pageContext.request.contextPath}/mypage/myPetDetail?petNo=' + no;
			}
		});	
	})
	
})

const backBtn = (e) => {
	location.href="${pageContext.request.contextPath}/member/agreement?selection=normal";
}
</script>
