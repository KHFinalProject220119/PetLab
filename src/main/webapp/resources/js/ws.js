// ws.js

// const ws = new WebSocket(`ws://${location.host}/spring/echo`);
// const ws = new SockJS(`http://${location.host}/spring/echo`);

// ws.addEventListener('open', (e) => console.log('open :', e));
// ws.addEventListener('message', (e) => console.log('message :', e));
// ws.addEventListener('error', (e) => console.log('error :', e));
// ws.addEventListener('close', (e) => console.log('close :', e));


const ws = new SockJS(`http://${location.host}/petlab/stomp`);
const stompClient = Stomp.over(ws);

stompClient.connect({}, (frame) => {
	console.log('open :', frame);
	
	// 구독신청
	/*
	stompClient.subscribe("/topic/abc", (message) => {
		console.log("/topic/abc : ", message);
	});
	
	stompClient.subscribe("/app/def", (message) => {
		console.log("/app/def : ", message);
	});
	*/
	
	stompClient.subscribe("/app/notice", (message) => {
		console.log("/app/notice", message);
		const {from, to, msg, time, type} = JSON.parse(message.body);
		console.log(from, to, msg, time, type);
		alert(`관리자 공지
---------------------------------
${msg}`);
	});
	
	

	
});