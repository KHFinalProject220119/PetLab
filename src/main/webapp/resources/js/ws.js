// ws.js


const ws = new SockJS(`http://${location.host}/petlab/stomp`);
const stompClient = Stomp.over(ws);

 