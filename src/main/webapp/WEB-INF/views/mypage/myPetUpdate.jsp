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
	href="${pageContext.request.contextPath}/resources/css/mypage/memberDetail.css" />
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

<div id="signup-normal">
	<div class="signup-normal-wrapper">
		<div class="signup-cont">
			<div class="signup-form-wrapper">
				<form name="updateFrm" id="updateFrm"
					action="${pageContext.request.contextPath}/mypage/myPetUpdate?${_csrf.parameterName}=${_csrf.token}"
					method="POST">
						<div class="info-wrapper-with-msg">
							<div class="birth-container-">
							
							<input type="hidden" name="petNo" value="${mypet.petNo}" />
								<label for="breed">동물 대 분류</label><span class="neccesary-star">*</span>
								<select id="typeId" name="typeId">
									<option disabled selected>동물 분류</option>
									<option value="dog" ${mypet.typeId eq '강아지' ? 'selected' : ''}>강아지</option>
									<option value="cat" ${mypet.typeId eq '고양이' ? 'selected' : ''}>고양이</option>
									<option value="etc" ${mypet.typeId eq 'etc' ? 'selected' : ''}>기타</option>
								</select>
							</div>
							<div class="info-wrapper-with-msg">
								<div class="inner-wrapper">
									<div class="label-wrapper">
										<label for="breed">동물 소 분류</label><span
											class="neccesary-star">*</span>
											
									</div>
									<input type="text" id="breed" name="breed"
										class="input-cont" placeholder="ex) 푸들" value="${mypet.breed}"
										required />
								</div>
								<br>
							</div>
							<div class="info-wrapper-with-msg">
								<div class="inner-wrapper">
									<div class="label-wrapper">
										<label for="petName">이름</label><span class="neccesary-star">*</span>
									</div>
									<input type="text" id="petName" name="petName"
										class="input-cont" value="${mypet.petName}" required />
								</div>
								<br>
							</div>

							<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="birthday">생일</label><span class="neccesary-star">*</span>
										<input type="hidden" id="rawBirthday" name="rawBirthday"/>
									</div>
									<div class="birth-container">
									<input id="birthday" name="birthday" type="date" value="${mypet.birthday}">
									</div>
							</div>
							<div class="info-wrapper">
								<div class="label-wrapper">
									<label for="gender">성별</label><span class="neccesary-star">*</span>
								</div>
								<div class="gender-wrapper">
									<input type="radio" name="gender" value="M" id="gender-male"
										${mypet.gender eq 'M' ? 'checked' : ''} required /> 
										<label for="gender-male">남</label> 
									<input type="radio" name="gender"
										value="F" id="gender-female"
										${mypet.gender eq 'F' ? 'checked' : ''} required /> 
										<label for="gender-female">여</label>
								</div>
							</div>
							<div class="info-wrapper">
								<div class="label-wrapper">
									<label for="neutering">중성화 여부</label><span
										class="neccesary-star">*</span>
								</div>
								<div class="gender-wrapper">
									<input type="radio" name="neutering" value="T" id="neutering-y"
										${mypet.neutering eq 'Y' ? 'checked' : ''} readonly required />
									<label for="neutering-y">Y</label> 
									<input type="radio"	name="neutering" value="F" id="neutering-n"
										${mypet.neutering eq 'N' ? 'checked' : ''} readonly required />
									<label for="neutering-n">N</label>
								</div>
							</div>

							<h3 class="optional-title">선택입력</h3>
							<div class="info-wrapper">
								<div class="label-wrapper">
									<label for="weight">몸무게</label>
								</div>
								<input type="text" id="weight" name="weight" class="input-cont"
									placeholder="몸무게 입력" value="${mypet.weight}" />
							</div>
							<div class="info-wrapper">
								<div class="label-wrapper">
									<label for="petId">인식표 번호</label>
								</div>
								<input type="text" id="petId" name="petId" class="input-cont"
									placeholder="인식표 번호 등록" value="${mypet.petId}" />
							</div>
						</div>
					<div class="btn-wrapper">
						<button type="button" class="back-btn" onclick="backBtn();">뒤로가기</button>
						<button type="submit" class="submit-btn">저장하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<script>
//현재 기준 연도 max 설정
window.onload = () =>{
	const today = new Date();
	const year = today.getFullYear();
	document.querySelector("#year").max = year;
}

function setDetailImage(event){
	for(var image of event.target.files){
		var reader = new FileReader();
		
		reader.onload = function(event){
			var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				img.setAttribute("class", "col-lg-6");
				document.querySelector("div#images_container").appendChild(img);
				};
				
			console.log(image);
			reader.readAsDataURL(image);
			}
		}

document.querySelector("#year").addEventListener('keyup', (e) => {
	const year = e.target.value;
	const today = new Date();
	const thisYear = today.getFullYear();
	if(year > thisYear){
		e.target.value = thisYear;
	}
	
});

/**
 * 유효성 검사
 */

 const updateFrm = updateFrm.addEventListener('submit', (e) => {
	 	e.preventDefault();
	    const typeIdVal = document.querySelector("#typeId").value;
	    const breedVal = document.querySelector("#breed").value;
		const petNameVal = document.querySelector("#petName").value;
	    const rawBirthday = document.querySelector("#rawBirthday");
	    const year = document.querySelector("#year").value;
	    const month = document.querySelector("#month").value;
	    const _day = document.querySelector("#day").value;
	    const day = (_day < 10) ? "0"+ _day : _day;

	    rawBirthday.value = year + "-" +month + "-" + day;
	    	  	    
	    if(!typeIdVal) {
	      alert("동물 대 분류 선택해주세요");
	      return false;
	    }
	    if(!breedVal) {
	      alert("동물 소 분류를 입력해주세요.");
	      return false;
	    }
	    if(!petNameVal) {
	      alert("마이펫 이름을 입력해주세요.");
	      return false;
	    }
	    if(!rawBirthday) {
	      alert("생일을 입력해주세요.");
	      return false;
	    }
	    if ($("input[name=gender]:radio:checked").length < 1){
	    	  alert("성별을 입력해주세요.");
	    	return false};
	    
	    if ($("input[name=neutering]:radio:checked").length < 1){
	      alert("중성화 여부를 선택해주세요.");
	      return false;
	    }
	    //3.이름검사 : 한글2글자 이상만 허용. 
	    // 한글 검사
	    if(!/^[가-힣]{2,}$/.test(petNameVal)){
	        alert('이름에는 2글자 이상의 한글만 사용할 수 있습니다.');
	        return false;
	    }
	    updateFrm.submit();
	});
	
 document.querySelectorAll("[name=upFile]").forEach((input) => {
		input.addEventListener('change', (e) => {
			const [file] = e.target.files;
			console.log(file);
			const label = e.target.nextElementSibling;
			console.log(label);
			
			if(file) {
				const {name} = file;
				label.innerText = name;
			}
			else {
				label.innerText = "파일을 선택하세요.";
			}
		});
	});
 
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
