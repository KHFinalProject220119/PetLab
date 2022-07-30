<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/signIn.css" />
 <jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param value="로그인" name="title"/>
 </jsp:include>
	<article class="signIn">
		<div class="signInFrm-wrapper">
			<div class="signIn-title-wrapper">
				<h3>로그인</h3>
			</div>
			<form:form id="signInFrm" name="signInFrm" method="POST" class="form-area">
				<div class="input-wrapper">
					<div class="input-container" id="id-container">
						<input id="memberId" type="text" name="memberId" placeholder="아이디" required>
					</div>
					<div class="input-container" id="pw-container">
						<input id="password" type="password"  name="password"  placeholder="비밀번호" required>
					</div>
				</div>
				<div class="login-btn-wrapper">
					<button type="submit" id="btn-login">로그인</button>
				</div>
			</form:form>
				<div class="btn-wrapper">
					<div class="login-fn-collection">
						<div class="auto-login-wrapper">
							<input type="checkbox" class="auto-login" name="remember-me" id="remember-me" />
							<label for="remember-me" class="auto-login">자동로그인</label>
						</div>
						<div class="find-btn-wrapper">
							<button type="button" class="openButton" onclick="location.href='${pageContext.request.contextPath}/member/findAccountInfo?selectionTab=findId'">아이디 찾기</button>
							<button type="button" class="openButton" onclick="location.href='${pageContext.request.contextPath}/member/findAccountInfo?selectionTab=resetPassword'">비밀번호 재설정</button>
						</div>
					</div>
					<div class="social-login">
						<p>SNS계정으로 간편 로그인/회원가입</p>	
						<div class="social-site">
							<div id="kakaoLogin"><a id="custom-login-btn" href="javascript:loginWithKakao()"><img id="kakao-icon" src="${pageContext.request.contextPath}/resources/images/member/sign/kakao_login_medium_wide.png" alt="카카오 로그인 버튼" style="width:25rem;" /></a></div>
							<div id="naverIdLogin"></div>
							<div id="buttonDiv" class="google-btn-icon"></div>	
						</div>						
					</div>
				</div>
				<form action="${pageContext.request.contextPath}/member/socialSignUp" method="GET" name="socialSignUpFrm">
					<input type="hidden" name="memberId" />
					<input type="hidden" name="password" />
					<input type="hidden" name="email" />
					<input type="hidden" name="gender" />
					<input type="hidden" name="socialType" />
				</form>
		</div>
	</article>
	<script>
	// 카카오 로그인 초기화
		Kakao.init('22289034ae7ed5aa331cb59ea6ac1625'); 

	// 카카오로그인
	function loginWithKakao() {
	    Kakao.API.request({
		    url: '/v1/user/access_token_info',
		    success: function (response) {
		    	  const accessToken = response.access_token;
		    	  const aTokenExpiresTime = response.expires_in;
		    	  const refreshToken = response.refresh_token_expires_in;
		    	  const refTokenExpiresTime = response.refresh_token_expires_in;

		    	//액세스 토큰 확인 완료되어, 정보 가져오기
		    	  Kakao.API.request({
		              url: '/v2/user/me',
		              success: function (response) {
		            	  const kakaoAccount = response.kakao_account;
		            	  const socialType = "kakao";
		            	  const memberId = socialType + response.id;
		            	  const password = response.id;
		            	  const email = kakaoAccount.email;
		            	
		            	// 아이디 찾기   	  
		         	  $.ajax({
		            		  url : "${pageContext.request.contextPath}/member/memberIdCheckSocial",
		            		  method: "GET",
		            		  data : {"memberId" : memberId },
		            		  success : function(res){
		            		  // 로그인
		            		  console.log("success!2")
		            			  const {available} = res; 
	     			 			  if(available != true){
		            				  createHiddenSignForm(memberId, password);
		            			  }
		            			  else { 
		            		  // 사이트 연결은 하였으나 회원가입이 완료되지 않은 경우로 추가 정보 입력을 위한 회원가입 진행 
		            					 SubmitSignUpSocialForm(memberId, password, email, socialType);
		            			   } 
		            		  },
		            		  error : console.log
		            	  });
		              },
		              fail: function (error) {
		                console.log(error)
		              },
		            })
		    },
		    // 액세스 토큰 확인이 안 되는 경우(비회원/액세스토큰 만료)
		    fail: function(error){
		        // 로그인
		    	  Kakao.Auth.login({
		    	      success: function (response) {
		    	    	  const accessToken = response.access_token;
		    	    	  const aTokenExpiresTime = response.expires_in;
		    	    	  const refreshToken = response.refresh_token_expires_in;
		    	    	  const refTokenExpiresTime = response.refresh_token_expires_in;
		    	    	  Kakao.Auth.setAccessToken(accessToken); 
		    	    	 
		    		    	//액세스 토큰 확인 완료되어, 정보 가져오기
		    	    	  Kakao.API.request({
		    	              url: '/v2/user/me',
		    	              success: function (response) {
		    	            	  const kakaoAccount = response.kakao_account;
		    	            	  const socialType = "kakao";
		    	            	  const memberId = socialType + response.id;
		    	            	  const password = response.id + "";
		    	            	  const email = kakaoAccount.email;

		    	            	
		    	            	// 아이디 찾기   	  
		    	         	  $.ajax({
		    	            		  url : "${pageContext.request.contextPath}/member/memberIdCheckSocial",
		    	            		  method: "GET",
		    	            		  data : {"memberId" : memberId },
		    	            		  success : function(res){
		    	            		  // 로그인
		    	            			  const {available} = res; 
	     			  				  if(available != true){
		    	            			  createHiddenSignForm(memberId, password);
		    	            			  }
		    	            			  else { 
		    	            		  // 사이트 연결은 하였으나 회원가입이 완료되지 않은 경우로 추가 정보 입력을 위한 회원가입 진행 
		    	            					 SubmitSignUpSocialForm(memberId, password, email, socialType);
		    	            			   }  
		    	            		  },
		    	            		  error : console.log
		    	            	  });
		    	              },
		    	              fail: function (error) {
		    	                console.log(error)
		    	              },
		    	            })
		    	     },
		    	      fail: function (error) {
		    	        console.log(error)
		    	      },
		    	    }) 
		    },
		});
	 
	  }
	  // 구글 로그인 초기화 | 로그인
	  window.onload = function() {
	    google.accounts.id.initialize({
	      client_id: "699818403547-pvfigermmgeljtvqpjmol26uhist6t19.apps.googleusercontent.com",
	      callback: handleCredentialResponse
	    });
	    
	 	google.accounts.id.renderButton(
	      document.getElementById("buttonDiv"),
	      { theme: "outline", size: "large", width: 400, height: 60 } 
	    ); 
	  }
	  
	  function handleCredentialResponse(response) {
			 const responsePayload = parseJwt(response.credential);
		      const socialType = "google";
		 	  const memberId = socialType + responsePayload.sub;
		 	  const password = responsePayload.sub + "";
		 	  const email = responsePayload.email;
		 	  
		 	 $.ajax({
		 		  url : "${pageContext.request.contextPath}/member/memberIdCheckSocial",
		 		  method: "GET",
		 		  data : {"memberId" : memberId },
		 		  success : function(res){
		 			  const {available} = res; 
	     			  if(available != true){
		 				  createHiddenSignForm(memberId, password);
		 			  }
		 			  else { 
		 				  // 회원가입 
		 					 SubmitSignUpSocialForm(memberId, password, email, socialType);
		 			   } 
		 		  },
		 		  error : console.log
		 	  });
		  }
	  
	//네이버 로그인 초기화 || 로그인
	  const naverLogin = new naver.LoginWithNaverId({
	 				clientId: "KSurOBZGq_POfnJ3N5WS",
	  				callbackUrl: "http://localhost:9090/petlab/member/signIn",
	  				loginButton: {color: "green", type: 5, height: 60}
	  			} );
	  	naverLogin.init(); 

	  //네이버 로그인
	    naverLogin.getLoginStatus(function (status) {
	        if (status) {
	       	 const socialType = "naver";
	       	 const memberId = socialType + naverLogin.user.getId();
	       	 const password = naverLogin.user.getId() + "";
	         const email=naverLogin.user.getEmail();
	          
	          $.ajax({
	     		  url : "${pageContext.request.contextPath}/member/memberIdCheckSocial",
	     		  method: "GET",
	     		  data : {"memberId" : memberId },
	     		  success : function(res){
	     			  const {available} = res; 
	     			  if(available != true){		
	     				  createHiddenSignForm(memberId, password);
	     			  }
	     			  else {	  // 회원가입 
	     					 SubmitSignUpSocialForm(memberId, password, email, socialType);
	     			   } 
	     		  },
	     		  error : console.log
	     	  });
	           } 
	      });   	
	  
	  // 회원가입 함수
		function SubmitSignUpSocialForm(memberId, password, email, socialType){
			const frm = document.socialSignUpFrm;
			frm.memberId.value = memberId;
			frm.password.value = password;
			frm.email.value = email;
			frm.socialType.value = socialType;
			frm.submit(); 
		}

		// 소셜 로그인폼 
		function createHiddenSignForm(memberId, password){
			
			const frm = document.createElement('form');
			frm.setAttribute('method', 'POST');
			frm.setAttribute('action', '${pageContext.request.contextPath}/member/signIn?${_csrf.parameterName}=${_csrf.token}');
			const hiddenInputId = document.createElement('input');
			hiddenInputId.setAttribute('type','hidden');
			hiddenInputId.setAttribute('name', "memberId");
			hiddenInputId.setAttribute('value', memberId);
			const hiddenInputPw = document.createElement('input');
			hiddenInputPw.setAttribute('type','hidden');
			hiddenInputPw.setAttribute('name', "password");
			hiddenInputPw.setAttribute('value', password);
			frm.appendChild(hiddenInputId);
			frm.appendChild(hiddenInputPw);
			document.body.appendChild(frm);
			frm.submit();
		}
	  
	  
	  
	  	// 유효성 검사
	  	const frm = document.signInFrm;
	  	frm.addEventListener('submit', (e) => {
	  		e.preventDefault();
	  		
	  		const memberIdVal = document.querySelector("#memberId").value;
	  		const passwordVal = document.querySelector("#password").value;
	  		
	  	    if(!memberIdVal) {
	  		      alert("아이디를 작성해주세요.");
	  		      return false;
	  		    }
	  	    
	  	    if(!passwordVal) {
	  		      alert("패스워드를 작성해주세요.");
	  		      return false;
	  		    }
	  	    //1.아이디검사
	  	    //아이디의 길이는(5~16자 영문, 숫자포함)
	  	    if(!/^[a-zA-Z0-9]{5,16}$/.test(memberIdVal)){
	  	        alert('규칙에 맞게 아이디를 5-16자 사이의 숫자를 포함하는 영문자를 입력하세요.');
	  	        return false;
	  	    }

	  	    //2.비밀번호 확인 검사 
	  	    //숫자/문자/특수문자 포함 형태의 8~16자리 이내의 암호 정규식 
	  	    if(!/(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%&*])[a-z0-9!@#$%&*]{8,16}/i.test(passwordVal)){
	  	        alert('규칙에 맞게 비밀번호를 8-16자 사이의 영문, 숫자, 특수문자를 포함시켜 입력해주세요.');
	  	        return false;
	  	    }
	  	    
	  	    frm.submit();
	  	});	

	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>