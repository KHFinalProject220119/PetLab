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


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/memberDetail.css" />
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
	<a href="${pageContext.request.contextPath}/mypage/myPetList">뒤로가기&nbsp;&nbsp;&gt;</a>
	<hr class="dash1">
</div>

 	<form name="updatePetFrm" method="post">
   	  	<table class="table table-hover">
       		 <tbody> 
          		  <tr>
              		  <th rowspan="9" id="img-th">대표사진</th>
              		  <td rowspan="9">
               		   <c:if test="${not empty mypet.attachments}">
							<c:forEach items="${mypet.attachments}" var="attach" varStatus="vs">
								<div class="img-container">
									<div class=img-wrapper>
										<img class="attach-img" src="${pageContext.request.contextPath}/resources/upload/adminNotice/${attach.renamedFilename}">
									</div>			
									<button type="button" 
											class="btn btn-outline-success btn-block attach"
											value="${attach.attachNo}">첨부파일${vs.count} - ${attach.originalFilename}</button>
								</div>
							</c:forEach>
						</c:if>
           		 </tr>
           		 <tr>
             		 <th style="text-align: left;">분류</th> 
           				 <td colspan="3"> ${mypet.typeId}</td>
             		 <th style="text-align: left;">품종</th>
           			 	<td colspan="3">${mypet.breed}</td>
         		 </tr>
         		 <tr>
          			<th style="text-align: left;">이름</th>
               			<td colspan="3">${mypet.petName}</td>
            		<th style="text-align: left;">생일</th>    
            			<td colspan="3">${mypet.birthday}</td>
          		</tr>
         		<tr>
            		<th style="text-align: left;">성별</th>
            			<td colspan="3">${mypet.gender}</td>
            		<th style="text-align: left;">중성화 여부</th>
           				<td colspan="3">${mypet.neutering}</td>
         		</tr>
         		<tr>
           			<th style="text-align: left;">인식 칩 번호</th>
            			<td colspan="3">${mypet.petId}</td>
           			<th style="text-align: left;">체중</th>
            			<td colspan="3">${mypet.weight} kg</td>
         		</tr>
       			<tr>
           			<td><br></td>
          		</tr>
        </tbody>
    </table>
</form>
<button type="button"  class="btn btn-outline-primary btn-block"
		onclick="location.href='${pageContext.request.contextPath}/mypage/myPetUpdate?no=${mypet.petNo}';">수정</button>
		
<script>
document.querySelectorAll(".attach").forEach((btn) => {
	btn.addEventListener("click", (e) => {
		const attachNo = e.target.value;
		console.log(attachNo);
		location.href = `${pageContext.request.contextPath}/attachment/fileDownload?no=\${attachNo}`;
	});
});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
