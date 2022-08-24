<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/signup.css" />
 <jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param value="소셜 회원가입" name="title"/>
 </jsp:include>
    <div id="signup-normal">
		<div class="signup-normal-wrapper">
			<div class="signup-cont">
				<h3 class="top-title">펫오너 회원가입</h3>
				<div class="signup-top">	
					<h3 class="signup-title">회원가입</h3>
					<div class="signup-order-img">
						<img src="${pageContext.request.contextPath}/resources/images/member/sign/tab2.png" alt="">
					</div>
					<div class="signup-form-wrapper" >
						<form name="signupFrm" id="signupFrm" action="${pageContext.request.contextPath}/member/memberEnroll?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
								<input type="hidden" id="memberId" name="memberId" value="${memberId}"  required />
								<input type="hidden" id="password" name="password" value="${password}" required />
								<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="memberName">이름</label><span class="neccesary-star">*</span>
									</div>
									<input type="text" id="memberName" name="memberName" class="input-cont" placeholder="이름 입력(한글)" required />
								</div>
								<div class="info-wrapper-with-msg">
									<div class="inner-wrapper">
										<div class="label-wrapper">
											<label for="nickname">별명</label><span class="neccesary-star">*</span>
										</div>
										<input type="text" id="nickname" name="nickname" class="input-cont" placeholder="별명 입력(2~15자)" required />
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
									<input type="tel" id="phone" name="phone" class="input-cont"  placeholder="휴대폰 번호 입력(- 없이)"  required/>
								</div>
								<div class="info-wrapper-post">
									<div class="post-inner-wrapper">
										<div class="label-wrapper">
											<label for="postcode">우편번호</label><span class="neccesary-star">*</span>
										</div>
										<input type="email" id="postcode" name="postcode" class="input-cont-postcode" readonly required/>
										<button type="button" class="find-address-btn" onclick="findAddress();">주소 찾기</button>
									</div>
									<div class="post-inner-wrapper">
										<div class="label-wrapper">
											<label for="address">주소</label><span class="neccesary-star">*</span>
										</div>
										<input type="text" id="address" name="address" class="input-cont" readonly required/>
									</div>
									<div class="post-inner-wrapper">
										<div class="label-wrapper">
											<label for="addressDetail">상세주소</label><span class="neccesary-star">*</span>
										</div>
										<input type="text" id="addressDetail" name="addressDetail" class="input-cont"/>
									</div>
									<div class="post-inner-wrapper">
										<div class="label-wrapper">
											<label for="addressExt">추가사항</label><span class="neccesary-star">*</span>
										</div>
										<input type="text" id="addressExtra" name="addressExtra" class="input-cont" readonly/>
									</div>
								</div>
								<h3 class="optional-title">선택입력</h3>
								<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="birthday">생일</label>
										<input type="hidden" id="rawBirthday" name="rawBirthday"/>
									</div>
									<div class="birth-container">
										<input type="number" id="year" name="year" min="1900" max="" placeholder="년">
										<label for="year">년</label>
									</div>
									<div class="birth-container-">
										<select id="month" name="month">
											<option disabled selected>월</option>
											<option value="01">1</option>
											<option value="02">2</option>
											<option value="03">3</option>
											<option value="04">4</option>
											<option value="05">5</option>
											<option value="06">6</option>
											<option value="07">7</option>
											<option value="08">8</option>
											<option value="09">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
										</select>
										<label for="month">월</label>
									</div>
									<div class="birth-container">
										<input type="number" id="day" name="day" min = "1" max="31" placeholder="일">
										<label for="day">일</label>
									</div>
								</div>
								<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="gender">성별</label>
									</div>
									<div class="gender-wrapper">
										<input type="radio" name="gender" value="M" id="gender-male"> 
										<label for="gender-male">남</label>
										<input type="radio" name="gender" value="F" id="gender-female"> 
										<label for="gender-female">여</label>
									</div>
								</div>
								<div class="info-wrapper-with-msg">
									<div class="inner-wrapper">
										<div class="label-wrapper">
											<label for="recommendedId">추천인 아이디</label>
										</div>
										<input type="text" id="recommendedId" name="recommendedId" class="input-cont" placeholder="추천인 아이디 입력" />
										<input type="hidden" id="recommendedIdValid" value="0" />
									</div>
									<div class="msg-wrapper msg-recommendedId">
										<div class="void-space">&nbsp;</div>
										<span class="recommendedId-result ok">등록가능한 추천인입니다.</span>
										<span class="recommendedId-result fail">추천인 아이디가 확인되지 않습니다.</span>
									</div>
								</div>
								<div class="btn-wrapper">
									<input type="hidden" id="email" name="email" value="${email}"/>
									<input type="hidden" name="memberSocial" value="${memberSocial}"" />
									<input type="hidden" name="memberType" value="normal" />
									<input type="hidden" name="gradeNo" value="1" />
									<button type="button" class="back-btn" onclick="backBtn();">뒤로가기</button>
									<button type="submit" class="submit-btn">제출하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
// 현재 기준 연도 max 설정
window.onload = () =>{
	const today = new Date();
	const year = today.getFullYear();
	document.querySelector("#year").max = year;
}

const frm = document.signupFrm;

// 별명 중복검사
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

//추천인 아이디확인
document.querySelector("#recommendedId").addEventListener('keyup', (e) => {
	const recommendedIdVal = e.target.value;
	const ok = document.querySelector(".recommendedId-result.ok");
	const error = document.querySelector(".recommendedId-result.fail");
	const recommendedIdValid = document.querySelector("#recommendedIdValid");
	
	if(recommendedIdVal.length < 5) {
		error.style.display = "none";
		ok.style.display = "none";
		recommendedIdValid.value = 0;
		return;
	}
	console.log(recommendedIdVal);
	
	$.ajax({
		url : '${pageContext.request.contextPath}/member/recommendedId',
		data : {
			recommendedId : recommendedIdVal
		},
		success(response){
			console.log(response);
			const {recommendedId, available} = response;
			if(!available){
				error.style.display = "inline";
				ok.style.display = "none";
				recommendedIdValid.value = 1;
			}
			else {
				error.style.display = "none";
				ok.style.display = "inline";
				recommendedIdValid.value = 0;
			}
		},
		error(jqxhr, statusText, err){
			console.log(jqxhr, statusText, err);
			const {responseJSON : {error}} = jqxhr;
			alert(error); 
		}	
	});
});

// 현재 연도를 초과한 숫자 입력 시 올해로 변경
document.querySelector("#year").addEventListener('keyup', (e) => {
	const year = e.target.value;
	const today = new Date();
	const thisYear = today.getFullYear();
	if(year > thisYear){
		e.target.value = thisYear;
	}
	
});
/**
 * 회원가입폼 유효성 검사
 */

 frm.addEventListener('submit', (e) => {
	 	e.preventDefault();
		const memberNameVal = document.querySelector("#memberName").value;
	    const memberNicknameVal = document.querySelector("#nickname").value;
	    const memberPhoneVal = document.querySelector("#phone").value;
	    const memberAddressVal = document.querySelector("#address").value;
	  
	    const rawBirthday = document.querySelector("#rawBirthday");
	    const year = document.querySelector("#year").value;
	    const month = document.querySelector("#month").value;
	    const _day = document.querySelector("#day").value;
	    const day = (_day < 10) ? "0"+ _day : _day;

	    rawBirthday.value = year + "-" +month + "-" + day;
	    
	    
	    if(!memberNameVal) {
	      alert("이름을 작성해주세요.");
	      return false;
	    }
	    if(!memberNicknameVal) {
	      alert("닉네임을 작성해주세요.");
	      return false;
	    }
	    if(!memberPhoneVal) {
	      alert("전화번호를 작성해주세요.");
	      return false;
	    }
	    if(!memberAddressVal) {
	      alert("주소를 작성해주세요.");
	      return false;
	    }

	    //1.이름검사 : 한글2글자 이상만 허용. 
	    // 한글 검사
	    if(!/^[가-힣]{2,}$/.test(memberNameVal)){
	        alert('이름에는 2글자 이상의 한글만 사용할 수 있습니다.');
	        return false;
	    }
	    
	    //2. 닉네임 검사 : 한글2글자 이상만 허용. 
	    // 한글 검사
	    if(!/^[가-힣]{2,15}$/.test(memberNicknameVal)){
	        alert('별명에는 2글자 이상 15글자 이하의 한글만 사용할 수 있습니다.');
	        return false;
	    }

	    //3. 휴대폰 번호 검사
	    // 01x 시작, 총 10~11자리
	    // 숫자 여부 검사
	    
	    if(!/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/.test(memberPhoneVal)){
	        alert('전화번호에는 숫자만 입력해야 합니다.');
	        return false;
	    }
	    
	    frm.submit();
	});


const backBtn = (e) => {
	location.href="${pageContext.request.contextPath}/member/signIn";
}
</script>    
    
    
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>