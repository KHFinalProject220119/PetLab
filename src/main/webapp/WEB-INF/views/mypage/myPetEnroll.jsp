<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypetEnroll.css"/>
 <jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이펫등록" name="title"/>
</jsp:include>

<div class="top-logo">
  <span>MYPAGE</span>
</div>
<section id="container">
		<div id="mypage-submenu" class="submenu">
			<ul id="sub">
				<li><a href="${pageContext.request.contextPath}/mypage/updateMember" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보 수정</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/myBoard" onmouseover="mousein(this);" onmouseout="mouseout(this)">내가 쓴 글</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/myPetHome" onmouseover="mousein(this);" onmouseout="mouseout(this)">마이펫</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/closeMember" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
			</ul>
		</div> 

    
  
  
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>