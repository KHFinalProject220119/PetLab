// chat.js
document.querySelector("#sendMessageBtn").addEventListener('click', (e) => {
	const msg = document.querySelector("#chatTextarea").value;
	if(!msg) return;
	
	
	const now = new Date();
	let hour = "";
	if(now.getHours() == 0){
	    hour = "오전 " + now.getHours() + ":";
	}
	else if(now.getHours() < 12){
	    hour = "오전 " + now.getHours() + ":";
	}
	else if(now.getHours() == 12){
	    hour = "오후 " + now.getHours() + ":";
	}
	else{
	    hour = "오후 " + (now.getHours() - 12) + ":";
	}
	let minutes = "";
	if(now.getMinutes() < 10){
		minutes = "0" + now.getMinutes();
	}
	else{
		minutes = now.getMinutes();
	}
	
	const time = hour + minutes;
	
	
	const payload = {
		chatroomId,
		memberId,
		msg,
		time,
		timer: Date.now(),
		type : 'CHAT'
	};
	
	stompClient.send(`/app/chat/${chatroomId}`, {}, JSON.stringify(payload));
	document.querySelector("#chatTextarea").value = '';
});

const lastCheck = () => {
	console.log('lastCheck!!!');
	let payload = {
		chatroomId,
		memberId,
		lastCheck : Date.now(),
		type : "LAST_CHECK" 
	};
	
	stompClient.send("/app/lastCheck", {}, JSON.stringify(payload));
};

window.addEventListener('focus', () => {
	lastCheck();
});

setTimeout(() => {
	const container = document.querySelector('#msg-view');
	
	lastCheck();
	
	stompClient.subscribe(`/app/chat/${chatroomId}`, (message) => {
		console.log(`/app/chat/${chatroomId} : `, message);
		
		const {'content-type' : contentType} = message.headers;
		console.log('contentType : ', contentType);
		if(!contentType) return;
		
		const {memberId, msg, time} = JSON.parse(message.body);
		
		let html = "";
		
		if(memberId.includes("counsellor")){
			html = `<div class="msg-unit-cs">
						<div class="msg-thmb">
							<span class="thmb-img">
								<img class="sweet-talk-bot-img" src="${url}/resources/upload/member/profile/${profileName}" alt="프로필 이미지">
							</span>
						</div>
						<div class="msg-text-inner">
							<div class="msg-name counsellor-name">
								<strong>${counsellorName} 상담사</strong>
							</div>
							<div class="msg-bx">
							 	<div class="msg-bubble">
									<p class="msg-txt">
										${msg}
									</p>
								</div>
								<div class="msg-info">
									<span class="tx-time time-counsellor">${time}</span>
								</div> 
							</div>
						</div>
					</div>`;
		}
		else {
			html = `<div class="msg-unit-me">
						<div class="msg-text-inner">
							<div class="msg-name member-name">
								<strong>${memberName}님</strong>
							</div>
							<div class="msg-bx">
								<div class="msg-bubble">
									<p class="msg-txt">
										<span><span>${msg}</span></span>
									</p>
								</div>
								<div class="msg-info">
									<span class="tx-time time-member">${time}</span>
								</div> 
							</div>
						</div>
						<div class="msg-thmb">
							<span class="thmb-img">
								<img class="sweet-talk-bot-img" src="${url}/resources/images/customerservice/petlabTalk/bot.png" alt="프로필 이미지">
							</span>
						</div>
					</div>`;
		}
		container.insertAdjacentHTML('beforeend', html);
		container.scrollTo(0, container.scrollHeight);
	});
	
}, 500);
