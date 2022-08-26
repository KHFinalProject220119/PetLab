<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/common/favicon/favicon.ico"> 
<link rel="apple-touch-icon" sizes="57x57" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/images/common/favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="${pageContext.request.contextPath}/resources/images/common/favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/images/common/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/resources/images/common/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/common/favicon/favicon-16x16.png">
<link rel="manifest" href="${pageContext.request.contextPath}/resources/images/common/favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="${pageContext.request.contextPath}/resources/images/common/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/customerservice/petlabTalk.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<!-- WebSocket:sock.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
<!-- WebSocket: stomp.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ws.js"></script>
</head>
<body>
	<aside id="sweet-talk-top">
		<div id="title-wrapper">
			<span id="top-title">1:1 PetLab TALK</span>
		</div>
	</aside>
	<aside id="sweet-talk-aside">
		<div id="wrap" class="wrap">
			<div id="content" class="content" style="top: 60px; bottom: 0px;">
				<div class="msg_aside_box">
					<div class="aside-img-wrapper"><img id="chat-img-icon" src= "${pageContext.request.contextPath}/resources/images/customerservice/petlabTalk/comments.png" alt="채팅 이미지"/> </div>
					<div class="msg_aside_imgbx">
						기다리지 말고 <img src="" alt="" /><br>
						<strong>PetLab Talk</strong><br>해보세요
					</div>
					<div class="msg_aside_type">
						<div class="msg_aside_chat">
							<span class="ico_people"><img class="sweet-talk-bot-img" src="${pageContext.request.contextPath}/resources/upload/member/profile/${counsellorAattach.renamedFilename}" alt=""></span><strong>고객상담사</strong><span class="inner-txt">꼼꼼한 답변이
								필요하다면 상담사 연결</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</aside>
			<section id="sweet-talk-section">
				<div class="cs-talk-profile">
					<div class="thmb">
					 	<span class="thmb_img "><span><img class="sweet-talk-bot-img" src="${pageContext.request.contextPath}/resources/upload/member/profile/${counsellorAattach.renamedFilename}" alt="프로필 이미지"></span></span>
					</div>
					<div class="detail">
						<div>
							<p>고객센터톡</p>
						</div>
						<div class="desc">
							고객상담사 연결가능시간<span class="bar"> | </span>평일
								09:00~18:00
						</div>
					</div>
				</div>
 
			<div id="sweet-talk-content" class="sweet-talk-content">
				<div id="msg-view" class="msg-view" style= "bottom: 64px;">
					<div class="msg-date">
						<fmt:parseDate value="${openTime}" pattern="yyyy-MM-dd'T'HH:mm" var="firstTime"  />
						<em><fmt:formatDate value="${firstTime}" pattern="YYYY년 MM월 dd일 E요일"/></em>
					</div>
					<div class="msg-unit-cs">
						<div class="msg-thmb">
							<span class="thmb-img">
								<img class="sweet-talk-bot-img" src="${pageContext.request.contextPath}/resources/upload/member/profile/${counsellorAattach.renamedFilename}" alt="프로필 이미지">
							</span>
						</div>
						<div class="msg-text-inner">
							<div class="msg-name counsellor-name">
								<strong>${counsellor.memberName} 상담사</strong>
							</div>
							<div class="msg-bx">
							 	<div class="msg-bubble">
									<p class="msg-txt">
										<span><span><b></b>안녕하세요?</span></span>
										<span><br><span><strong>멍냥연구소</strong> 고객센터 <br /><strong>PetLab Talk</strong> 상담사 ${counsellor.memberName}입니다. <br />무엇을 도와드릴까요? </span></span>
									</p>
								</div>
								<div class="msg-info">
									<span class="tx-time time-counsellor"> <fmt:formatDate value="${firstTime}" pattern="a h:mm"/> </span>
								</div> 
							</div>
						</div>
					</div>
					<c:if test="${not empty chatLogList}">
						<c:forEach items="${chatLogList}" var="chatLog">
							<c:if test="${(chatLog.memberId).contains('counsellor') }">
								<div class="msg-unit-cs">
									<div class="msg-thmb">
										<span class="thmb-img">
											<img class="sweet-talk-bot-img" src="${pageContext.request.contextPath}/resources/upload/member/profile/${counsellorAattach.renamedFilename}" alt="프로필 이미지">
										</span>
									</div>
									<div class="msg-text-inner">
										<div class="msg-name counsellor-name">
											<strong>${counsellor.memberName} 상담사</strong>
										</div>
										<div class="msg-bx">
										 	<div class="msg-bubble">
												<p class="msg-txt">
													${chatLog.msg}
												</p>
											</div>
											<div class="msg-info">
												<span class="tx-time time-counsellor"> ${chatLog.time} </span>
											</div> 
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${!(chatLog.memberId).contains('counsellor') }">
								<div class="msg-unit-me">
									<div class="msg-text-inner">
										<div class="msg-name member-name">
											<strong>${member.memberName}님</strong>
										</div>
										<div class="msg-bx">
											<div id="1924699448_text" class="msg-bubble ty-txt">
												<p class="msg-txt">
													${chatLog.msg}
												</p>
											</div>
											<div class="msg-info">
												<span class="tx-time time-member"> ${chatLog.time} </span>
											</div> 
										</div>
									</div>
									<div class="msg-thmb">
										<span class="thmb-img">
											<img class="sweet-talk-bot-img" src="${pageContext.request.contextPath}/resources/images/customerservice/petlabTalk/bot.png" alt="프로필 이미지">
										</span>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:if>
				</div>
				<div class="msg-input-bx">
					<div class="col-group">
						<div class="col-input">
							<div class="inp-tx">
								<textarea name="chatTextarea" autocomplete="off" id="chatTextarea" rows="1" data-min-rows="1" maxlength="200" placeholder="메시지를 입력하세요."></textarea>
							</div>
						</div>
						<div class="txt-send-btn">
							<div class="bta">
								<button id="sendMessageBtn" type="button" class="btn-submit-send" style="background-image: url(${pageContext.request.contextPath}/resources/images/customerservice/petlabTalk/send.png)"></button>
							</div>
						</div>
					</div>
				</div>
			</div>
			</section>
			<footer id="sweet-talk-footer" class="footer">
				<div id="setting_wrap" class="pop_wrap bg ty_drawer v2">
				
					<div id="setting_content" class="content">
						<div class="chatroom_info">
							<div class="chatroom_profile_img">
							<img class="sweet-talk-bot-img" src="${pageContext.request.contextPath}/resources/upload/member/profile/${counsellorAattach.renamedFilename}" alt="프로필 이미지">
							</div>
							<p class="chatroom_txt">
								상담사 연결 가능 시간<br>평일 09:00~18:00
							</p>
							<div class="chatroom_controls">
								<a href="tel:1111 1111" class="chatroom_tel">
									<span><img class="sweet-talk-bot-img" src="${pageContext.request.contextPath}/resources/images/customerservice/calling.png" alt="프로필 이미지"></span>
								</a>
								<a	class="chatroom_tel_num">
									<span>02-111-1111</span>
								</a>
							</div>
						</div>
						<div class="btn-leave-area">
							<button type="button" class="btn-leave-chatroom" onclick="closeChat()">채팅방 나가기</button>
						</div>
					</div>
				</div>
			</footer>
<script>
const chatroomId = '${chatroomId}';
const profileName = '${counsellorAattach.renamedFilename}';
const counsellorName = '${counsellor.memberName}';
const memberId = '${memberId}';
const memberName = '${member.memberName}';
let firstTime = '${openTime}';
const url = "http://localhost:9090${pageContext.request.contextPath}";
</script>

<script src="${pageContext.request.contextPath}/resources/js/chat.js"></script>
</body>
<script>
const closeChat = () => {
	self.close();
}
/*--------------------------  검색 이벤트핸들러  -------------------------------------------*/
/* --------- enter 입력 시------------------  */

const textMsg = document.querySelector("#chatTextarea");
const sendBtn = document.querySelector("#sendMessageBtn");
textMsg.addEventListener('keyup', (e) =>{
	if(e.keyCode === 13){
		e.preventDefault();
		sendBtn.click();
	}
});

window.onload = () => {
	const cont = document.querySelector("#msg-view");
	cont.scrollTo(0, cont.scrollHeight);
}
</script>
</html>