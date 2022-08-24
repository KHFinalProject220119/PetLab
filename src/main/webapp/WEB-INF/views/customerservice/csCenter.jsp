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
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/customerservice/csCenter.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="고객센터 메인" name="title" />
</jsp:include>
	<div class="customerservice-container">
		<div class="top-wrapper">
           <div class="top-left-wrapper">
           	   <div class="title-wrapper">
	               <img src="${pageContext.request.contextPath}/resources/images/common/favicon/favicon-96x96.png" alt="" class="logo-img" />
	               <h3 class="top-title">멍냥연구소 고객센터</h3>
           	   </div>
               <ul>
                   <li class="cs-list">
                       <span class="list-no">1.</span>
                       <div class="cs-list-detail">
	                       <strong>FAQ 검색하기</strong>
	                       <span>자주 묻는 질문을 확인하세요.</span>
                       </div>
                   </li>
                   <li class="cs-list">
                       <span class="list-no">2.</span>
                       <div class="cs-list-detail">
	                       <strong>1:1문의하기</strong>
	                       <span>채팅 혹은 이메일로 문의하세요.</span>
                       </div>
                   </li>
                   <li class="cs-list">
                       <span class="list-no">3.</span>
                       <div class="cs-list-detail">
	                       <strong>전화 상담하기</strong>
	                       <span>친절한 상담원의 도움을 받으세요.</span>
                       </div>
                   </li>
               </ul>
           </div>
           <div class="top-right-wrapper">
           		<div class="right-title-wrapper">
					<h2 class="top-title">운영시간</h2>
					<span class="cs-time">평일 09:00 ~ 18:00 </span><span class="holiday-text">주말/공휴일 휴무</span>
           		</div>
				<div class="tel-wrapper">
					<div class="call-img-wrapper"><img src="${pageContext.request.contextPath}/resources/images/customerservice/calling.png" alt="전화기 아이콘" id="call-img" /></div>
					<strong class="contact-us">02-111-1111</strong>
				</div>
				<div id="btn-wrapper">
					<button id="chat-btn" onclick="openChat();">1:1 채팅 상담하기</button>
					<a href="${pageContext.request.contextPath}/customerservice/sendEmail" id="email-send">이메일 문의하기</a>
					<button id="email-copy-btn" onclick="copyEmail();">이메일 주소 복사하기</button>
				</div>
		  </div>
       </div>
       <div class="faq-container">
       		<div class="faq-list" data-no ="1">
	       		<div class="question-container"  data-no ="1">
	       			<div class="question-icon"  data-no ="1">Q</div>
	       			<div class="question-content"  data-no ="1"> 멍냥연구소는 어떤 서비스인가요? </div>
	       			<div><img class="question-img"  data-no ="1" src="${pageContext.request.contextPath}/resources/images/customerservice/down.png" alt="" /></div>
	       		</div>
	       		<div class="answer-container closed"  id="answer-container1"  data-no ="1">
	       			<p data-no>멍냥연구소는 전국 동물병원 정보를 제공하는 동시에 반려동물 상품도 함께 판매하고 있으며,</p>
	       			<p data-no>반려동물 정보와 사진을 나눌 수 있는 종합적인 서비스를 제공합니다.</p>
	       		</div>
       		</div>
       		<div class="faq-list"  data-no ="2">
	       		<div class="question-container"  data-no ="2">
	       			<div class="question-icon"  data-no ="2">Q</div>
	       			<div class="question-content"  data-no ="2"> 멍냥연구소 서비스는 무료인가요?</div>
	       			<div><img class="question-img"  data-no ="2" src="${pageContext.request.contextPath}/resources/images/customerservice/down.png" alt="" /></div>
	       		</div>
	       		<div class="answer-container closed"  id="answer-container2" data-no ="2">
	       			<p  data-no ="2">기본적인 병원검색이나 커뮤니티 기능들은 모두 무료이며,</p>
	       			<p  data-no ="2">상품의 경우 구매가 필요합니다.</p>
	       		</div>
       		</div>
       		<div class="faq-list"  data-no ="3">
	       		<div class="question-container" data-no ="3">
	       			<div class="question-icon" data-no ="3">Q</div>
	       			<div class="question-content" data-no ="3">회원정보 수정이 가능한가요?</div>
	       			<div><img class="question-img"  data-no ="3" src="${pageContext.request.contextPath}/resources/images/customerservice/down.png" alt="" /></div>
	       		</div>
	       		<div class="answer-container closed"  id="answer-container3" data-no ="3">
	       			<p>마이페이지에서 회원정보를 수정할 수 있습니다.</p>
	       		</div>
       		</div>
       		<div class="faq-list" data-no ="4">
	       		<div class="question-container" data-no ="4">
	       			<div class="question-icon" data-no ="4">Q</div>
	       			<div class="question-content" data-no ="4">회원 탈퇴 후 재가입이 가능한가요?</div>
	       			<div><img class="question-img" data-no ="4" src="${pageContext.request.contextPath}/resources/images/customerservice/down.png" alt="" /></div>
	       		</div>
	       		<div class="answer-container closed" id="answer-container4" data-no ="4">
	       			<p data-no ="4">멍냥연구소 재강비은 언제든지 가능합니다.</p>
	       		</div>
       		</div>
       		<div class="faq-list" data-no ="5">
	       		<div class="question-container" data-no ="5">
	       			<div class="question-icon" data-no ="5">Q</div>
	       			<div class="question-content" data-no ="5">회원탈퇴가 가능한가요?</div>
	       			<div><img class="question-img" data-no ="5" src="${pageContext.request.contextPath}/resources/images/customerservice/down.png" alt="" /></div>
	       		</div>
	       		<div class="answer-container closed" id="answer-container5" data-no ="5">
	       			<p data-no ="5">마이페이지에서 회원탈퇴를 하실 수 있습니다.></p>
	       		</div>
       		</div>
       </div>
	</div>
	   <script>
    	const answerAll = document.querySelectorAll(".answer-container");
    	const copyEmail = () => {
    		  const emailAddr = document.createElement("textarea");
    		    document.body.appendChild(emailAddr);
    		    emailAddr.value = "cscenter@PetLab.com";
    		    emailAddr.select();
    		    document.execCommand('copy');
    		    document.body.removeChild(emailAddr);
    			alert("이메일 주소가 복사되었습니다.");
    	}
    	
    	// faq 메뉴 open, close 
    	document.querySelectorAll(".faq-list").forEach((list) => {  
    		list.addEventListener('click', (e) => {
    	
    			let no = e.target.dataset.no;
    			let answerWrapper = "answer-container" + no;
    			let questionArrow = document.querySelectorAll(".question-img");
    			let answer = document.querySelector(`#\${answerWrapper}`);
    			
    			// open
    		 	if(answer.className === "answer-container closed"){
	    		   	document.querySelectorAll(".answer-container").forEach((cont) => {
	     				if(cont.className === "answer-container opened"){
		     				cont.classList.remove("opened");
		     				cont.classList.add("closed");     					
	     				}
	     				answer.classList.remove("closed");
	     				answer.classList.add("opened");  
	     			}); 
	    		   	
			     	questionArrow.forEach((img) => {
		     			img.classList.remove("rotated");     					
		     			img.classList.add("reverse");    
	     				if(img.dataset.no === no){
	     					img.classList.remove("reverse");    
		     				img.classList.add("rotated");     					
	     				}
	     			}); 
    			} 
    			// close
    			else{
    				document.querySelectorAll(".answer-container").forEach((cont) => {
		     				cont.classList.remove("opened");
		     				cont.classList.add("closed");     					
	     			});
    				
			     	questionArrow.forEach((img) => {
		     			img.classList.remove("rotated");     					
		     			img.classList.add("reverse");     					

	     			}); 
    		 	} 
    		});
    	});
    </script> 
       
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>