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
 <%
	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	Member loginMember = (Member) authentication.getPrincipal();
	
 %> 
 
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/memberDetail.css"/>
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
			    		${loginMember.memberId}
				    	님
				    </span>
			
			 </sec:authorize>
  			<a href="/mypage/updateMember">회원정보수정&nbsp;&nbsp;&gt;</a>
			<hr class="dash1">
		</div>

  <div id="signup-normal">
		<div class="signup-normal-wrapper">
			<div class="signup-cont">
					<div class="signup-form-wrapper" >
						<form name="updageFrm" id="updageFrm" action="${pageContext.request.contextPath}/mypage/updateMember?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
							<div class="necessary-info">
								<div class="info-wrapper-with-msg">
									<div class="inner-wrapper">
										<div class="label-wrapper">
											<label for="memberId">아이디</label><span class="neccesary-star">*</span>
										</div>
										<input type="text" id="memberId" name="memberId" class="input-cont" value='${loginMember.memberId}' readonly required/>
									</div>
									<br>
								</div>
								<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="password">비밀번호</label><span class="neccesary-star">*</span>
									</div>
									<input type="password" id="password" name="password" class="input-cont" placeholder="숫자/문자/특수문자 8~16자리" />
								</div>
								<div class="info-wrapper-with-msg">
									<div class="inner-wrapper">
										<div class="label-wrapper">
											<label for="passwordCheck">비밀번호 확인</label><span class="neccesary-star">*</span>
										</div>
										<input type="password" id="passwordCheck" name="passwordCheck" class="input-cont" placeholder="비밀번호 확인" required/>
									</div>
									<div class="msg-wrapper msg-password">
										<div class="void-space">&nbsp;</div>
										<span class="password-result ok">비밀번호가 일치하지 않습니다.</span>
										<span class="password-result fail">사용가능한 비밀번호입니다.</span>
									</div>
								</div>
								<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="memberName">이름</label><span class="neccesary-star">*</span>
									</div>
									<input type="text" id="memberName" name="memberName" class="input-cont" value='${loginMember.memberName}'required/>
								</div>
								<div class="info-wrapper-with-msg">
									<div class="inner-wrapper">
										<div class="label-wrapper">
											<label for="nickname">별명</label><span class="neccesary-star">*</span>
										</div>
										<input type="text" id="nickname" name="nickname" class="input-cont" placeholder="별명 입력(2~15자)" value='${loginMember.nickname}'required/>
										<input type="hidden" id="nickValid" value="0" />
									</div>
									<div class="msg-wrapper msg-nickname">
										<div class="void-space">&nbsp;</div>
										<span class="nickname-result ok">사용가능한 별명입니다.</span>
										<span class="nickname-result fail">중복되는 별명입니다.</span>
									</div>
								</div>
								<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="phone">핸드폰</label><span class="neccesary-star">*</span>
									</div>
									<input type="tel" id="phone" name="phone" class="input-cont"  placeholder="휴대폰 번호 입력(- 없이)"  value='${loginMember.phone}'required/>
								</div>
								<div class="info-wrapper-with-msg email-wrapper">
									<div class="inner-wrapper">
										<div class="label-wrapper">
											<label for="email">이메일</label><span class="neccesary-star">*</span>
										</div>
										<input type="text" id="email" name="email" class="input-cont" placeholder="이메일 입력" value='${loginMember.email}'required/>
										<input type="hidden" name="emailValid" id="emailValid" value="0" />
										<button type="button" class="cert-btn" onclick="emailCert();">이메일 인증</button>
									</div>
			                    </div>
								<div class="info-wrapper-post">
									<div class="post-inner-wrapper">
										<div class="label-wrapper">
											<label for="postcode">우편번호</label><span class="neccesary-star">*</span>
										</div>
										<input type="email" id="postcode" name="postcode" class="input-cont-postcode" value='${address.postcode}' readonly required/>
										<button type="button" class="find-address-btn" onclick="findAddress();">주소 찾기</button>
									</div>
									<div class="post-inner-wrapper">
										<div class="label-wrapper">
											<label for="address">주소</label><span class="neccesary-star">*</span>
										</div>
										<input type="text" id="address" name="address" class="input-cont" value='${address.address}' readonly required/>
									</div>
									<div class="post-inner-wrapper">
										<div class="label-wrapper">
											<label for="addressDetail">상세주소</label><span class="neccesary-star">*</span>
										</div>
										<input type="text" id="addressDetail" name="addressDetail" class="input-cont" value='${address.addressDetail}'/>
									</div>
									<div class="post-inner-wrapper">
										<div class="label-wrapper">
											<label for="addressExt">추가사항</label><span class="neccesary-star">*</span>
										</div>
										<input type="text" id="addressExtra" name="addressExtra" class="input-cont" value='${address.addressExtra}' readonly/>
									</div>
									
								</div>
								<h3 class="optional-title">선택입력</h3>
								<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="birthday">생일</label>
										<input type="hidden" id="rawBirthday" name="rawBirthday"/>
									</div>
									<div class="birth-container">
									<fmt:parseDate value="${loginMember.birthday}" pattern="yyyy-MM-dd" var="birthday"/>
									<fmt:formatDate value="${birthday}" pattern="yyyy" var="yyyy"/>
									<fmt:formatDate value="${birthday}" pattern="MM" var="MM"/>
									<fmt:formatDate value="${birthday}" pattern="dd" var="dd"/>
								
										<input type="number" id="year" name="year" min="1900" max="" placeholder="년" value="${yyyy}">
										<label for="year">년</label>
									</div>
									<div class="birth-container-">
										<select id="month" name="month" >
											<option disabled selected >월</option>
											<option value="01" ${MM == '01' ? 'selected' : ''}>1</option>
											<option value="02" ${MM == '02' ? 'selected' : ''}>2</option>
											<option value="03" ${MM == '03' ? 'selected' : ''}>3</option>
											<option value="04" ${MM == '04' ? 'selected' : ''}>4</option>
											<option value="05" ${MM == '05' ? 'selected' : ''}>5</option>
											<option value="06" ${MM == '06' ? 'selected' : ''}>6</option>
											<option value="07" ${MM == '07' ? 'selected' : ''}>7</option>
											<option value="08" ${MM == '08' ? 'selected' : ''}>8</option>
											<option value="09" ${MM == '09' ? 'selected' : ''}>9</option>
											<option value="10" ${MM == '10' ? 'selected' : ''}>10</option>
											<option value="11" ${MM == '11' ? 'selected' : ''}>11</option>
											<option value="12" ${MM == '12' ? 'selected' : ''}>12</option>
										</select>
										<label for="month">월</label>
									</div>
									<div class="birth-container">
										<input type="number" id="day" name="day" min = "1" max="31" placeholder="일" value="${dd}"readonly/>
										<label for="day">일</label>
									</div>
								</div>
								<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="gender">성별</label>
									</div>
									<div class="gender-wrapper">
										<input type="radio" name="gender" value="M" id="gender-male" ${loginMember.gender eq 'M' ? 'checked' : ''} readonly required/>
										<label for="gender-male">남</label>
										<input type="radio" name="gender" value="F" id="gender-female" ${loginMember.gender eq 'F' ? 'checked' : ''} readonly required/>
										<label for="gender-female">여</label>
									</div>
								</div>
							</div>
						<div class="btn-wrapper">
						<input type="hidden" name="memberSocial" value="normal" />
						<input type="hidden" name="memberType" value="normal" />
						<input type="hidden" name="gradeNo" value="1" />
						<button type="button" class="back-btn" onclick="backBtn();">뒤로가기</button>
						<button type="submit" class="submit-btn">수정하기</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>

<script>
document.memberUpdateFrm.addEventListener("submit", (e) => {
	e.preventDefault();
	
	console.log($(e.target).serialize());
	
	// 비동기 처리할 때 security 땜시 token 보내야 함. 
	const csrfHeader = '${_csrf.headerName}';
	const csrfToken = '${_csrf.token}';
	const headers = {};
	headers[csrfHeader] = csrfToken;
	
	console.log(headers);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/mypage/updateMember",
		method : "POST",
		data : $(e.target).serialize(),
		headers,
		success(response) {
			console.log(response);
			const {msg} = response;
			alert(msg);
			
			// 페이지 새로고침
			location.reload();
		},
		error : console.log
	});
});
document.memberUpdateFrm.addEventListener("submit", (e) => {
	// 유효성검사
});

}

//별명 중복검사
document.querySelector("#nickname").addEventListener('keyup', (e) => {
	const nicknameVal = e.target.value;
	const ok = document.querySelector(".nickname-result.ok");
	const error = document.querySelector(".nickname-result.fail");
	const nickValid = document.querySelector("#nickValid");
	
	if(nicknameVal.length < 2) {
		error.style.display = "none";
		ok.style.display = "none";
		nickValid.value = 0;
		return;
	}
	
	$.ajax({
		url : '${pageContext.request.contextPath}/member/duplicateNickname',
		data : {
			nickname : nicknameVal
		},
		success(response){
			const {nickname, available} = response;
			if(available){
				error.style.display = "none";
				ok.style.display = "inline";
				nickValid.value = 1;
			}
			else {
				error.style.display = "inline";
				ok.style.display = "none";
				nickValid.value = 0;
			}
		},
		error(jqxhr, statusText, err){
			console.log(jqxhr, statusText, err);
			const {responseJSON : {error}} = jqxhr;
			alert(error); 
		}	
	});
});

//비밀번호 확인 함수
const passwordValidator = () => {
	const password = document.querySelector("#password");	
	const passwordCheck = document.querySelector("#passwordCheck");
	if(password.value !== passwordCheck.value){
		alert("두 비밀번호가 일치하지 않습니다.");
		password.select();
	}
};

// 비밀번호 확인 이벤트리스너
document.querySelector("#passwordCheck").addEventListener('blur', passwordValidator);


</script>  
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
