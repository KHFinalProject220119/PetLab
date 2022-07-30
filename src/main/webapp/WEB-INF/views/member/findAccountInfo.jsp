<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
</script>
<script type="text/javascript">
   	(function(){
      	emailjs.init("iiBUjT4gKhsdLuwTY");
  	})();
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/findAccountInfo.css" />
 <jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param value="아이디/비밀번호 확인" name="title"/>
 </jsp:include>
<div class="find-info-cont">
	<div class="find-info-top-wrapper">
		<h3><span class="top-title">아이디 / 비밀번호 재설정</span></h3>
		<p class="advice-txt">
            <span>아이디 또는 비밀번호가 생각나지 않으세요?<br>회원정보를 입력 하신 후 확인 버튼을 클릭해주세요.</span>
		</p>
	</div>
	<div class="tap-cont">
		<div class="tab-wrapper">
			<button type="button" id="find-id-tab-btn" class="tab-btn">아이디 찾기</button>
			<button type="button" id="find-password-tab-btn" class="tab-btn">비밀번호 재설정</button>
		</div>
		<div class="tap-find-wrapper">
			<div id="find-id-wrapper">
					<div class="findIdFrm" name="findIdFrm" >
						<h3>본인인증 - 아이디 찾기</h3>
							<div class="info-wrapper">
								<div class="label-wrapper">
									<label for="memberName">이름</label><span class="neccesary-star">*</span>
								</div>
								<input type="text" id="memberName" name="memberName" class="input-cont" placeholder="이름 입력(한글)" required />
							</div>
							<div class="info-wrapper-with-msg email-wrapper">
								<div class="inner-wrapper">
									<div class="label-wrapper">
										<label for="emailValid">이메일</label><span class="neccesary-star">*</span>
									</div>
									<input type="text" id="email" name="email" class="input-cont" placeholder="이메일 입력" required/>
									<input type="hidden" name="emailValid" id="emailValid" value="0" />
									<button type="button" class="cert-btn" onclick="emailCert();">이메일 인증</button>
								</div>
								<div class="pop-wrapper id-pop">
				                    <div class="pop-cert-inner">
				                        <label for="certificationCode"><strong>인증코드</strong></label>	
				                        <input type="text" id="certificationCode" placeholder="인증코드 6자리" name="certificationCode" >
				                        <button type="button" class="cert-btn" onclick="checkCertCode();">인증코드 확인</button>
				                    </div>
				                    <div class="pop-cert-timer">
					                    <p class="timer-text">* 3분 이내로 인증번호를 입력해주세요.</p>
					                    <div class="btn-inner">
					                    	<div class="timer-wrapper">
							                    <span>남은 시간 </span>
							                    <span class="timer" style="width: 3rem;"></span>
					                    	</div>
						                    <button type="button" class="refresh-btn" onclick="refreshAuthTime();">시간 초기화(최대 1회)</button>
					                    </div>
					                    <input type="hidden" id="timer-valid" value="0" />
				                    </div>
			                    </div>
		                    </div>
		                    <div class="id-result">
			                    <p>회원님의 아이디는</p>
			                    <p class="id-result-txt">[ <span id="memberIdResult"></span> ] 입니다.</p>
			                    <div class="copy-btn-wrapper">
			                   		<button type="button" class="copy-btn" onclick="copyId();">복사하기</button>
			                    </div>
								<div class="btn-wrapper">
									<button type="button" onclick="location.href='${pageContext.request.contextPath}/member/signIn';" class="submit-btn">확인</button>
								</div>
		                    </div>
					</div>
				</div>
			<div id="find-password-wrapper">
				<form:form class="resetPasswordFrm" name="resetPasswordFrm" method="POST">
					<h3>본인인증 - 비밀번호 재설정</h3>
						<div class="info-wrapper">
							<div class="label-wrapper">
								<label for="id">아이디</label><span class="neccesary-star">*</span>
							</div>
							<input type="text" id="id" name="id" class="input-cont" placeholder="아이디 입력" required />
						</div>
						<div class="info-wrapper-with-msg email-wrapper">
							<div class="inner-wrapper">
								<div class="label-wrapper">
									<label for="emailPw">이메일</label><span class="neccesary-star">*</span>
								</div>
								<input type="text" id="emailPw" name="email" class="input-cont" placeholder="이메일 입력" required/>
								<input type="hidden" name="emailValidPw" id="emailValidPw" value="0" />
								<button type="button" class="cert-btn" onclick="emailCert();">이메일 인증</button>
							</div>
							<div class="pop-wrapper pw-pop">
			                    <div class="pop-cert-inner">
			                        <label for="certificationCodePW"><strong>인증코드</strong></label>	
			                        <input type="text" id="certificationCodePW" placeholder="인증코드 6자리" name="certificationCodePW" >
			                        <button type="button" class="cert-btn" onclick="checkCertCode();">인증코드 확인</button>
			                    </div>
			                    <div class="pop-cert-timer pw">
				                    <p class="timer-text pw">* 3분 이내로 인증번호를 입력해주세요.</p>
				                    <div class="btn-inner pw">
				                    	<div class="timer-wrapper pw">
						                    <span>남은 시간 </span>
						                    <span class="timer pw" style="width: 3rem;"></span>
				                    	</div>
					                    <button type="button" class="refresh-btn pw" onclick="refreshAuthTimePw();">시간 초기화(최대 1회)</button>
				                    </div>
				                    <input type="hidden" id="timer-valid-pw" value="0" />
			                    </div>
		                    </div>
	                    </div>
	                   	<div class="password-wrapper">
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
	                	</div>
					<div class="btn-wrapper">
						<button type="submit" class="submit-btn">확인</button>
					</div>
				</form:form>
			</div>
		</div>	
	</div>
</div>
<script>
let tabVal = "${selectionTab}"
//페이지 로딩 시 이전 화면 선택에 따라 탭메뉴 노출
window.onload = () => {
		const idTab = document.querySelector("#find-id-wrapper");
		const passwordTab = document.querySelector("#find-password-wrapper");
		const idBtn = document.querySelector("#find-id-tab-btn");
		const passwordBtn = document.querySelector("#find-password-tab-btn"); 
		switch(tabVal){
		case "findId" :  
			passwordTab.style.visible = "none";
			idTab.style.display = "block";
			passwordBtn.style.backgroundColor = "#FF9900";
			idBtn.style.backgroundColor = "#FF5B00";
			break;
		case "resetPassword" :  
			idTab.style.display = "none";
			passwordTab.style.display = "block";
			idBtn.style.backgroundColor = "#FF9900";
			passwordBtn.style.backgroundColor = "#FF5B00";
			break;
		}  
	};

// 탭메뉴 변환
document.querySelectorAll(".tab-btn").forEach((button) => {
	button.addEventListener('click', (e) =>{
		const idTab = document.querySelector("#find-id-wrapper");
		const passwordTab = document.querySelector("#find-password-wrapper");
		const idBtn = document.querySelector("#find-id-tab-btn");
		const passwordBtn = document.querySelector("#find-password-tab-btn"); 
		
		idTab.style.display = "none";
		passwordTab.style.display = "none";
		let targetId = e.target.id;
		console.log(targetId);
		switch(targetId){
		case "find-id-tab-btn" :  
			tabVal = "findId";
			idTab.style.display = "block";
			idBtn.style.backgroundColor = "#FF5B00";
			passwordBtn.style.backgroundColor = "#FF9900";
			break;
		case "find-password-tab-btn" : 
			tabVal = "resetPassword";
			passwordTab.style.display = "block";
			idBtn.style.backgroundColor = "#FF9900";
			passwordBtn.style.backgroundColor = "#FF5B00";
			break;
		}  
	});
});

// 비밀번호 재설정 폼 제출
const frmPassword = document.resetPasswordFrm;
resetPasswordFrm.addEventListener('submit', (e) => {
 	e.preventDefault();
 	
 	// 유효성 검사
 	const memberPasswordVal = document.querySelector("#password").value;
	const memberPasswordChVal = document.querySelector("#passwordCheck").value;
 	
	 if(!memberPasswordVal) {
	      alert("비밀번호를 작성해주세요.");
	      return false;
	    }
    if(!memberPasswordChVal) {
      alert("비밀번호 확인을 작성해주세요.");
      return false;
    }
	    
    //비밀번호 확인 검사 
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
    
    const memberId = document.querySelector("#id").value;
    const csrfHeader = '${_csrf.headerName}';
	const csrfToken = '${_csrf.token}';
	const headers = {};
	headers[csrfHeader] = csrfToken;
	
    $.ajax({
    	url: "${pageContext.request.contextPath}/member/resetPassword",
    	method: "POST",
    	data: {password : memberPasswordVal,
    			memberId : memberId},
    	headers,
    	success(response){
    		alert("정상적으로 비밀번호가 변경되었습니다.");
    		location.href ="${pageContext.request.contextPath}/";
    	},
    	error: console.log
    });
});


//이메일 인증
let certificationCodeId;
let certificationCodePw;

function emailCert() {
	let timerValid = "";
	let inputId = document.querySelector("#id").value;
	let inputName = document.querySelector("#memberName").value;
	let inputEmail = "";
	let emailValId = 0;
	let emailValPw = 0;
	let popCertFrm = "";
	let templateParams ={};
	switch(tabVal){
	case "findId" :
		timerValid = document.querySelector("#timer-valid").value = 0;
		emailValId = document.querySelector("#emailVal");
		inputEmail = document.querySelector("#email").value;
		popCertFrm = document.querySelector(".pop-wrapper.id-pop");
	    if(!inputName) {
	        alert("이름을 먼저 작성해주세요.");
	        return false;
	      }
	    if(!inputEmail){
	    	alert("이메일을 작성해주세요.");
	     return false;
	    }
	    certificationCodeId = generateRandomCode();
	    
    	popCertFrm.style.display = "block";
    	templateParams = {
            name : inputName,
            email :inputEmail,
            message : certificationCodeId,
        }

        //인증 타이머 시작
        sendAuthTime();    
        
        // 이메일 전송
        emailjs.send('service_q105rgm', 'template_rzfxw6f', templateParams).then(function(response){
            alert("이메일을 보냈습니다. 확인해주세요.");
        }, function(error){
			console.log
        });
		break;
		
	case "resetPassword" : 
		timerValid = document.querySelector("#timer-valid-pw").value = 0;
		emailValPw = document.querySelector("#emailValPw");
		inputEmail = document.querySelector("#emailPw").value;
		popCertFrm = document.querySelector(".pop-wrapper.pw-pop");
	    if(!inputId) {
	        alert("아이디를 먼저 작성해주세요.");
	        return false;
	      }
	    if(!inputEmail){
	    	alert("이메일을 작성해주세요.");
	     return false;
	    }
	    certificationCodePw = generateRandomCode();
    	popCertFrm.style.display = "block";
        templateParams  = {
            name : inputName,
            email :inputEmail,
            message : certificationCodePw,
        }

        //인증 타이머 시작
	        sendAuthTimePw();   
        
        // 이메일 전송
        emailjs.send('service_q105rgm', 'template_rzfxw6f', templateParams).then(function(response){
            alert("이메일을 보냈습니다. 확인해주세요.");
        }, function(error){
			console.log
        });
		break;
	}
}

const checkCertCode = () => {
	let inputEmail = "";
	let emailValId = "";
	let emailValPw = "";
	let popCertFrm = "";
	let inputCode = "";
	let certCode;
	const resultWrapper = document.querySelector(".id-result");
	const passwordWrapper = document.querySelector(".password-wrapper");

	switch(tabVal){
	case "findId":
		inputEmail = document.querySelector("#email").value;
		emailValId = document.querySelector("#emailValid");
		popCertFrm = document.querySelector(".pop-wrapper.id-pop");
		inputCode = document.querySelector("#certificationCode").value;
		certCode = certificationCodeId;
		break;
	case "resetPassword" :
		inputEmail = document.querySelector("#emailPw").value;
		emailValPw = document.querySelector("#emailValidPw");
		popCertFrm = document.querySelector(".pop-wrapper.pw-pop");
		inputCode = document.querySelector("#certificationCodePW").value;		
		certCode = certificationCodePw;	
		break;
	}

    if(inputCode && (certCode === inputCode)){
    	$.ajax({
			url : "${pageContext.request.contextPath}/member/findMemberByEmail",
			method : "GET",
			data : {
				email : inputEmail
			},
			success(resp) {
				const {memberId} = resp;
				if(memberId && memberId != ""){	
					 clearInterval(timer);
					 popCertFrm.style.display = "none";

					 switch(tabVal){
						case "findId" :
							 emailValId.value = "1";
							 resultWrapper.style.display = "block";
							 document.querySelector("#memberIdResult").innerHTML = memberId;
							 break;
							
						case "resetPassword" : 				
							 emailValPw.value = "1";
							 passwordWrapper.style.display = "block";
							 break;
					}	
				}
				else{
					alert("확인된 회원이 없습니다. 신규 가입을 해주세요.");
					location.href="${pageContext.request.contextPath}/member/signUpSelection";
					
				}
			},
			error : console.log
		});
       }
    else{
        alert("인증코드가 일치하지 않습니다. 다시 시도해 주세요.");
    }
}

const copyId = (e) =>{
	  	const memberId = document.createElement("textarea");
	  	const idVal = document.querySelector("#memberIdResult").innerHTML;
	    document.body.appendChild(memberId);
	    memberId.value = idVal;
	    memberId.select();
	    document.execCommand('copy');
	    document.body.removeChild(memberId);
		alert("아이디가 복사되었습니다.");
}

//비밀번호 확인 함수
const passwordValidator = () => {
	const password = document.querySelector("#password");	
	const passwordCheck = document.querySelector("#passwordCheck");
	if(password.value !== passwordCheck.value){
		alert("두 비밀번호가 일치하지 않습니다.");
		password.select();
	}
};

//비밀번호 확인 이벤트리스너
document.querySelector("#passwordCheck").addEventListener('blur', passwordValidator);

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>