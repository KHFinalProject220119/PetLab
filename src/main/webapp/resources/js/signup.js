/**
 * kakao API 도로명 주소 찾기
 */
 
const findAddress = () => {
    const width = 500;
    const height = 600;
    new daum.Postcode({
        width: width,
        height: height,
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            let addr = ''; // 주소 변수
            let extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("addressExtra").value = extraAddr;
                
            } else {
                document.getElementById("addressExtra").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addressDetail").focus();
        }
    }).open({
        left: (window.screen.width /2 ) -(width / 2 ),
        height: (window.screen.height /2 ) -(height / 2 )
    });
}

    // 인증코드 생성
    const generateRandomCode = () => {
        const characters ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz01234567890123456789012345678901234567890123456789';
        let resultCode= '';
        const charLen = characters.length;
        for(let i = 0; i < 6; i++ ){
            resultCode += characters.charAt(Math.floor(Math.random() * charLen));
        }
        return resultCode;
    }
    
    let timer;
    let isRunning = false; 
    let leftSec;

    function sendAuthTime(){    
    	isRunning = true;	
    	// 남은 시간	
    	const display = document.querySelector('.timer');
    	leftSec = 180;	
    	// 이미 타이머가 작동중이면 중지	
    	if (isRunning){	   
    		clearInterval(timer);
    	}	
    	// 타이머를 화면에 출력
    	startTimer(leftSec, display);
    } 
    
    function sendAuthTimePw(){    
    	isRunning = true;	
    	// 남은 시간	
    	const display = document.querySelector('.timer.pw');
    	leftSec = 180;	
    	// 이미 타이머가 작동중이면 중지	
    	if (isRunning){	   
    		clearInterval(timer);
    	}	
    	// 타이머를 화면에 출력
    	startTimerPw(leftSec, display);
    } 

    function refreshAuthTime(){   
    	let timerVal = document.querySelector("#timer-valid").value;
    	if(timerVal == 0){
    	document.querySelector("#timer-valid").value = 1;	
    	clearInterval(timer);
    	sendAuthTime();		
    	}	
    } 
    
    function refreshAuthTimePw(){   
    	let timerVal = document.querySelector("#timer-valid-pw").value;
    	if(timerVal == 0){
    	document.querySelector("#timer-valid-pw").value = 1;	
    	clearInterval(timer);
    	sendAuthTimePw();		
    	}	
    } 

    function startTimer(count, display) { 
    	document.querySelector(".pop-cert-timer").style.visibility= "visible";	
    		let minutes;
    		let seconds;        
    		timer = setInterval(function () {       
    			minutes = parseInt(count / 60, 10);       
    			seconds = parseInt(count % 60, 10);       
    			minutes = minutes < 10 ? "0" + minutes : minutes;       
    			seconds = seconds < 10 ? "0" + seconds : seconds;         
    			display.textContent = minutes + ":" + seconds;         
    			// 타이머 끝       
    			if (--count < 0) {	     
    				clearInterval(timer);	     
    				display.textContent = "";	    
    				isRunning = false;
    				alert("제한 시간을 초과하였습니다. 다시 시도해주세요.")
					const popCertFrm = document.querySelector(".pop-wrapper");
					document.querySelector("#timer-valid").value = 0;
			    	document.querySelector("#emailValid").value = 0;
			    	popCertFrm.style.display = "none";
    				clearInterval(timer);

    			} 
    		}, 1000);
    	}
    	
    function startTimerPw(count, display) { 
    	document.querySelector(".pop-cert-timer.pw").style.visibility= "visible";	
    		let minutes;
    		let seconds;        
    		timer = setInterval(function () {       
    			minutes = parseInt(count / 60, 10);       
    			seconds = parseInt(count % 60, 10);       
    			minutes = minutes < 10 ? "0" + minutes : minutes;       
    			seconds = seconds < 10 ? "0" + seconds : seconds;         
    			display.textContent = minutes + ":" + seconds;         
    			// 타이머 끝       
    			if (--count < 0) {	     
    				clearInterval(timer);	     
    				display.textContent = "";	    
    				isRunning = false;
    				alert("제한 시간을 초과하였습니다. 다시 시도해주세요.")
					const popCertFrm = document.querySelector(".pop-wrapper.pw");
					document.querySelector("#timer-valid-pw").value = 0;
			    	document.querySelector("#emailValidPw").value = 0;
			    	popCertFrm.style.display = "none";
    				clearInterval(timer);

    			} 
    		}, 1000);
    	}