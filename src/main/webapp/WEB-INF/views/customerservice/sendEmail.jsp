<%@page import="com.kh.petlab.member.model.dto.Member"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
<script type="text/javascript">
        (function(){
            emailjs.init("6JDUjWSlfrFiuWRp8");
        })();
</script>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/customerservice/sendEmail.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="고객센터 이메일 문의" name="title" />
</jsp:include>
	<div class="send-email-container">
		<div class="top-title-wrapper">
			<div class="top-title">멍냥연구소 이메일 문의하기</div>
		</div>
		<form name="emailFrm" id="emailFrm" action="${pageContext.request.contextPath}/customerservice/sendEmail?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
			<div class="body-content-wrapper">
				<div class="input-wrapper">
					<div class="label-wrapper">
						<label for="name">이름</label>
						<span class="necessary-star">*</span>
					</div>
					<input type="text" name="name" id="name" class="input-cont" />
				</div>
				<div class="input-wrapper">
					<div class="label-wrapper">
						<label for="email">이메일</label>
						<span class="necessary-star">*</span>
					</div>
					<input type="text" name="email" id="email" class="input-cont"  />
				</div>
				<div class="input-wrapper">
					<div class="label-wrapper">
						<label for="questionType">문의유형</label>
						<span class="necessary-star">*</span>
					</div>
					<select name="questionType" id="questionType" required>
						<option selected disabled>문의 유형</option>
						<option value="1" >회원정보 문의</option>
						<option value="2" >쿠폰/포인트 문의</option>
						<option value="3" >주문/결제 관련 문의</option>
						<option value="4" >취소/환불 관련 문의</option>
						<option value="5" >배송 관련 문의</option>
						<option value="6" >주문 전 상품 정보 문의</option>
						<option value="7" >서비스 개선 제안</option>
						<option value="8" >시스템 오류 제보</option>
						<option value="9" >불편 신고</option>
						<option value="10" >기타 문의</option>
					</select>
				</div>
				<div class="input-wrapper">
					<div class="label-wrapper">
						<label for="title">제목</label>
						<span class="necessary-star">*</span>
					</div>
					<input type="text" name="title" id="title" class="input-cont"  />
				</div>
				<div class="input-wrapper">
					<div class="label-wrapper">
						<label for="">문의내용</label>
						<span class="necessary-star">*</span>
					</div>
					<div class="textarea-wrapper">
						<textarea class="enroll-textarea" id="contentsText" name="content" maxlength="500" cols="30" rows="5"></textarea>
						<span id="counter">0<!--  -->자 / 최대<!--  -->500<!--  -->자</span>
					</div>
				</div>
				<div class="input-wrapper">
					<div class="label-wrapper">
						<label for="">사진첨부</label>
						<span class="necessary-star">*</span>
					</div>
					<div id="file-wrapper">
						<input type="file" id='upfile1' name="upfile1" class="hospital-des-img" accept="image/*" hidden/>  
						<input type="file" id='upfile2' name="upfile2" class="hospital-des-img" accept="image/*" hidden/>  
						<input type="file" id='upfile3' name="upfile3" class="hospital-des-img" accept="image/*" hidden/>  
							<button class="attach-btn" type="button" >
								<img class="attach-img" src="${pageContext.request.contextPath}/resources/images/hospital/add2.png" data-no="1">
							</button>
					</div>
				</div>
				<div class="button-wrapper">
					<button type="button" class="back-btn" onclick="backBtn()">뒤로가기</button>
					<button class="submit-btn">제출하기</button>
				</div>
			</div>
		</form>
	</div>
	<script>
	const backBtn = () => {
		location.href = "${pageContext.request.contextPath}/customerservice/csCenter";
	}
	
	// 제출
	const emailFrm = document.emailFrm;
	emailFrm.addEventListener('submit', (e) => {
		e.preventDefault();
		
		  const inputName =  document.querySelector("#name").value;
		  const inputEmail = document.querySelector("#email").value;
		  const inputContent = document.querySelector("#contentsText").value;
		  const inputTitle = document.querySelector("#title").value;
		  const questionType = document.querySelector("#questionType").value;
		  
		  let templateParams  = {
		      email : inputEmail,
		      title : inputTitle,
		      questionType : questionType,
		      name : inputName,
		      content : inputContent,
		  };

		  //이메일 전송
		   emailjs.send('service_k82xdzq', 'template_9haull8', templateParams)
		        .then(function(response){
		         }, function(error){
		    });   
		

		// 유효성 검사
	    const usernameVal = document.querySelector("#name").value;
	    const userTitleVal = document.querySelector("#title").value.replace(/ /g,"");
	    const useremailVal = document.querySelector("#email").value;
	    const contentVal =  document.querySelector("#contentsText").value.replace(/ /g,"");
		const questionTypeVal = document.querySelector("#questionType").value;
		
	    if(!questionTypeVal) {
	      alert("문의유형을 선택해주세요.");
	      return false;
	    }
	    
	    if(!usernameVal) {
	      alert("이름을 작성해주세요.");
	      return false;
	    }

	    if(!useremailVal) {
	      alert("이메일을 작성해주세요.");
	      return false;
	    }
	    
	    if(!userTitleVal) {
	      alert("제목을 작성해주세요.");
	      return false;
	    }
	    
	    //1. 문의 유형 검사
	    if($("#questionType").val() == null){
			alert("문의 유형을 선택해주세요.");
			return false;
		}
	    
	    //2.이름검사 : 한글2글자 이상만 허용. 
	    // 한글 검사
	    if(!/^[가-힣]{2,}$/.test(usernameVal)){
	        alert('이름에는 2글자 이상의 한글만 사용할 수 있습니다.');
	        return false;
	    }
	    
	    //3.이메일 검사
	    if(!/^[a-z0-9]{4,12}[@].+[.][a-zA-Z]{2,3}$/i.test(useremailVal)){
	        alert('이메일은 @가 포함되어야 하며, 아이디의 길이는 4~12자리이어야 합니다.');
	        return false;
	    }
	    
	    //4. 제목 검사
	    if(!/^[가-힣a-zA-Z0-9!?@#$%&*]{2,}$/.test(userTitleVal)){
	        alert('제목에는 2글자 이상 입력해야 합니다..');
	        return false;
	    }
	    
	   
	    // 5. 문의사항 검사
		if(!/^(.|\n)+$/.test(contentVal)){
			alert("문의사항 내용을 작성해주세요.");
			return false;
		}
	    
		emailFrm.submit();
	});
	
	
	const attachBtn = document.querySelector(".attach-btn");
	const fileWrapper = document.querySelector("#file-wrapper");
	const fileName = "";
	const popArr = [3, 2, 1];
	let pushArr = [];

		attachBtn.addEventListener("click", (e) =>{
			const pushArrCopy = [... pushArr];
			const popArrCopy = [... popArr];
			const noCpy = pushArrCopy.push(popArrCopy.pop());
			const fileName = "upfile" + noCpy;
			

		 	const upFile = document.querySelector(`#\${fileName}`);
		 	upFile.click();
			upFile.onchange = (en) => {
				
				const no = pushArr.push(popArr.pop());
				pushArr.sort();
				console.log(pushArr);	
				console.log(popArr);	
				const imgId = "imgId" + no;
				const thumbnailText = "thumbnail-text" + no;
				
		 	 	const imgThumbnail = `<div class="thumbnail-wrapper" id='\${fileName}thumbnail-wrapper'><div class="img-cancel-wrapper"><button type="button" class="cancel-btn" dataset-no='\${no}' onclick="closingImg(\${fileName}.id, \${no});"><img src="${pageContext.request.contextPath}/resources/images/hospital/cancel.png" class="img-cancel" /></button></div><div class="thumbnail-img-wrapper"><img id='\${imgId}' class="imgThumbnail" /></div><span id=\${thumbnailText} class="thumbnail-text"></span></div>`
				fileWrapper.insertAdjacentHTML('afterbegin', imgThumbnail);
				
			 	const imgid = document.querySelector(`#\${imgId}`);
				const filename = en.target.value.split('/').pop().split('\\').pop();
		
				const fr = new FileReader();
				fr.readAsDataURL(upFile.files[0]);
				fr.onload = (ee) => {
					imgid.src = ee.target.result;  
				}
	 		 
				document.querySelector(`#\${thumbnailText}`).innerHTML = filename;
				
				if(popArr && popArr.length === 0 ){
					attachBtn.style.display = "none";
					attachBtn.setAttribute("disabled", true);

				}
			};
		});
	 
	// 첨부파일 제거
	const closingImg = (filename, no) => {
		console.log(no);
		popArr.push(Number(no));
	    pushArr = pushArr.filter(v => v != no);
		popArr.sort().reverse();
		pushArr.sort();

		document.querySelector(`#\${filename}thumbnail-wrapper`).remove();
		document.querySelector(`#\${filename}`).value = "";
		
		if(popArr.length !== 0 && attachBtn.getAttribute("disabled")){
			attachBtn.style.display = "inline-block";
			attachBtn.removeAttribute("disabled");
		}
	}
	
	// 텍스트에어리어 카운트 
	$(contentsText).keyup((e) => {
	    const length = $(e.target).val().length;
	    const lengthText = $(e.target).val().length +"<!--  -->자 / 최대<!--  -->500<!--  -->자";
	  $(counter)
	  .html(0)
	  .html(lengthText);
	});
	

	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>