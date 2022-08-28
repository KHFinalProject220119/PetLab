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
<script src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="회원 정보" name="title"/>
</jsp:include>
<sec:authentication property="principal" var="loginMember"/>
<div id="mypage-submenu" class="submenu">
	<h4 class="top-title"> <a href="${pageContext.request.contextPath}/mypage/mypageHome">MY PAGE </a></h4>
		<ul id="sub">
			<li><a href="${pageContext.request.contextPath}/mypage/memberDetail" >회원정보</a></li>
			<sec:authorize access="hasRole('HOSPITAL')">
			<li><a href="${pageContext.request.contextPath}/hospital/hospitalEnroll">병원정보 등록</a></li>
			</sec:authorize>
			<li><a href="${pageContext.request.contextPath}/mypage/myBorad">내가 쓴 글</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/myPetList">마이펫</a></li>
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

  <div id="signup-normal">
		<div class="signup-normal-wrapper">
			<div class="signup-cont">
					<div class="signup-form-wrapper" >
						<form name="updateFrm" id="updateFrm" action="${pageContext.request.contextPath}/mypage/updateMember?${_csrf.parameterName}=${_csrf.token}" method="POST">
							<div class="necessary-info">
								<div class="info-wrapper-with-msg">
									<div class="inner-wrapper">
										<div class="label-wrapper">
											<label for="memberId">아이디</label><span class="neccesary-star">*</span>
										</div>
										<input type="text" id="memberId" name="memberId" class="input-cont" value='${member.memberId}' readonly required/>
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
									<input type="text" id="memberName" name="memberName" class="input-cont" value='${member.memberName}'required/>
								</div>
								<div class="info-wrapper-with-msg">
									<div class="inner-wrapper">
										<div class="label-wrapper">
											<label for="nickname">별명</label><span class="neccesary-star">*</span>
										</div>
										<input type="text" id="nickname" name="nickname" class="input-cont" placeholder="별명 입력(2~15자)" value='${member.nickname}'required/>
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
									<input type="tel" id="phone" name="phone" class="input-cont"  placeholder="휴대폰 번호 입력(- 없이)"  value='${member.phone}'required/>
								</div>
								<div class="info-wrapper-with-msg email-wrapper">
									<div class="inner-wrapper">
										<div class="label-wrapper">
											<label for="email">이메일</label><span class="neccesary-star">*</span>
										</div>
										<input type="text" id="email" name="email" class="input-cont" placeholder="이메일 입력" value='${member.email}'required/>
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
									<fmt:parseDate value="${member.birthday}" pattern="yyyy-MM-dd" var="birthday"/>
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
										<input type="radio" name="gender" value="M" id="gender-male" ${member.gender eq 'M' ? 'checked' : ''} readonly required/>
										<label for="gender-male">남</label>
										<input type="radio" name="gender" value="F" id="gender-female" ${member.gender eq 'F' ? 'checked' : ''} readonly required/>
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
// 현재 기준 연도 max 설정
window.onload = () =>{
	const today = new Date();
	const year = today.getFullYear();
	document.querySelector("#year").max = year;
}



// 아이디 중복검사
document.querySelector("#memberId").addEventListener('keyup', (e) => {
	const memberIdVal = e.target.value;
	const ok = document.querySelector(".dupliacate-result.ok");
	const error = document.querySelector(".dupliacate-result.fail");
	const idValid = document.querySelector("#idValid");
	
	if(memberIdVal.length < 5) {
		error.style.display = "none";
		ok.style.display = "none";
		idValid.value = 0;
		return;
	}
	
	$.ajax({
		url : '${pageContext.request.contextPath}/member/duplicateId',
		data : {
			memberId : memberIdVal
		},
		success(response){
			const {memberId, available} = response;
			
			if(available){
				error.style.display = "none";
				ok.style.display = "inline";
				idValid.value = 1;
			}
			else {
				error.style.display = "inline";
				ok.style.display = "none";
				idValid.value = 0;
			}
		},
		error(jqxhr, statusText, err){
			console.log(jqxhr, statusText, err);
			const {responseJSON : {error}} = jqxhr;
			alert(error); 
		}	
	});
});

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

// 비밀번호 확인 함수
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

const frmSingup = document.updateFrm;
/**
 * 회원가입폼 유효성 검사
 */

 frmSingup.addEventListener('submit', (e) => {
	 	e.preventDefault();
	 	const memberIdVal = document.querySelector("#memberId").value;
	    const memberPasswordVal = document.querySelector("#password").value;
	    const memberPasswordChVal = document.querySelector("#passwordCheck").value;
		const memberNameVal = document.querySelector("#memberName").value;
	    const memberNicknameVal = document.querySelector("#nickname").value;
	    const memberPhoneVal = document.querySelector("#phone").value;
	    const memberEmailVal = document.querySelector("#email").value;
	    const memberAddressVal = document.querySelector("#address").value;
	  
	    const rawBirthday = document.querySelector("#rawBirthday");
	    const year = document.querySelector("#year").value;
	    const month = document.querySelector("#month").value;
	    const _day = document.querySelector("#day").value;
	    const day = (_day < 10) ? "0"+ _day : _day;

	    rawBirthday.value = year + "-" +month + "-" + day;
	    
	    
	    if(!memberIdVal) {
	      alert("아이디를 작성해주세요.");
	      return false;
	    }
	    if(!memberPasswordVal) {
	      alert("비밀번호를 작성해주세요.");
	      return false;
	    }
	    if(!memberPasswordChVal) {
	      alert("비밀번호 확인을 작성해주세요.");
	      return false;
	    }
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
	    if(!memberEmailVal) {
	      alert("이메일을 작성해주세요.");
	      return false;
	    }
	    if(!memberAddressVal) {
	      alert("주소를 작성해주세요.");
	      return false;
	    }

	    //2.비밀번호 확인 검사 
	    //숫자/문자/특수문자 포함 형태의 8~16자리 이내의 암호 정규식 
	    if(!/(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%&*])[a-z0-9!@#$%&*]{8,16}/i.test(memberPasswordVal)){
	        alert('규칙에 맞게 비밀번호를 8-16자 사이의 영문, 숫자, 특수문자를 포함시켜 만들어 주세요.');
	        return false;
	    }

	    //비밀번호일치여부 검사
	    if(!(memberPasswordVal === memberPasswordChVal)){
	        alert('비밀번호가 비밀번호 재입력에 입력된 값과 일치하지 않습니다. 다시 입력해주세요.');
	        return false;
	    }

	    //3.이름검사 : 한글2글자 이상만 허용. 
	    // 한글 검사
	    if(!/^[가-힣]{2,}$/.test(memberNameVal)){
	        alert('이름에는 2글자 이상의 한글만 사용할 수 있습니다.');
	        return false;
	    }
	    
	    //4. 닉네임 검사 : 한글2글자 이상만 허용. 
	    // 한글 검사
	    if(!/^[가-힣]{2,15}$/.test(memberNicknameVal)){
	        alert('별명에는 2글자 이상 15글자 이하의 한글만 사용할 수 있습니다.');
	        return false;
	    }

	    //4. 휴대폰 번호 검사
	    // 01x 시작, 총 10~11자리
	    // 숫자 여부 검사
	    
	    if(!/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/.test(memberPhoneVal)){
	        alert('전화번호에는 숫자만 입력해야 합니다.');
	        return false;
	    }

	    //5.이메일 검사
	    if(!/^[a-z0-9]{4,12}[@].+[.][a-zA-Z]{2,3}$/i.test(memberEmailVal)){
	        alert('이메일은 @가 포함되어야 하며, 아이디의 길이는 4~12자리이어야 합니다.');
	        return false;
	    }
	    
	    frmSingup.submit();
	});


const backBtn = (e) => {
	location.href="${pageContext.request.contextPath}/mypage/mypageHome";
}

//이메일 인증
let certificationCode;


function emailCert() {
	document.querySelector("#timer-valid").value = 0;
	let inputId = document.querySelector("#memberId").value;
	let inputName = document.querySelector("#memberName").value;
	let inputEmail = document.querySelector("#email").value;
	let emailValid = document.querySelector("#emailValid");
	certificationCode = generateRandomCode();
    if(!inputId  || !inputName) {
      alert("아이디 혹은 이름을 먼저 작성해주세요.");
      return false;
    }
    else if(!inputEmail){
    	alert("이메일을 작성해주세요.");
     return false;
    }
    else {
    	const popCertFrm =  document.querySelector(".pop-wrapper");
    	emailValid.value = 0;
    	popCertFrm.style.display = "block";
    	const certcode = certificationCode;
    	
        let templateParams  = {
            name : inputName,
            email :inputEmail,
            message : certcode,
        }
        
        //인증 타이머 시작
        sendAuthTime();  
        
        emailjs.send('service_q105rgm', 'template_xtqu1tv', templateParams).then(function(response){
            alert("이메일을 보냈습니다. 확인해주세요.");
        }, function(error){
			console.log
        });
    }
}

const checkCertCode = () => {
	const popCertFrm =  document.querySelector(".pop-wrapper");
    let inputCode = document.querySelector("#certificationCodeId").value;
    let certcode = certificationCode;
	let inputEmail = document.querySelector("#email").value;
	let emailValid = document.querySelector("#emailValid");
    if(inputCode && certcode === inputCode){
    	$.ajax({
			url : "${pageContext.request.contextPath}/member/findMemberByEmail",
			method : "GET",
			data : {
				email : inputEmail
			},
			success(resp) {
				const {memberId} = resp;
					console.log(memberId);
				if(memberId && memberId != ""){
					 alert("이미 가입된 이메일입니다.");
					 location.href="${pageContext.request.contextPath}/member/signIn";
				}
				else{
					alert("본인인증이 완료되었습니다.");
					emailValid.value = 1;
					clearInterval(timer);
					popCertFrm.style.display = "none";
				}
			},
			error : console.log
		});
       }
    else{
        alert("인증코드가 일치하지 않습니다. 다시 시도해 주세요.");
    }
}
</script>    

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>