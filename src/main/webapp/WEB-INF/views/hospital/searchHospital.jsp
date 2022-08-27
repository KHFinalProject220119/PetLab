<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hospital/searchHospital.css" />
 <jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param value="동물병원 찾기" name="title"/>
 </jsp:include>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22289034ae7ed5aa331cb59ea6ac1625&libraries=services,clusterer"></script>
  
    <div id="hospital-search-container">
		<div class="hospital-search-wrapper">
			<div class="search-title-cont">
				<div class="title-wrapper">
					<h3 class="top-title">동물병원 찾기</h3>
				</div>
			</div>
			<div class="searchbox-wrapper">	
				<div class="border-box">
					<label for="keyword"></label>
					<input type="text" class="search-input" id="keyword" name="keyword" placeholder="병원명을 입력하세요." />
					<button type="button" class="search-btn">
						<img class="find-img" src="${pageContext.request.contextPath}/resources/images/hospital/finding.png" alt="" />
					</button>
				</div>
			</div>
			<div class="search-filter-wapper">
				<div class="search-btn-cont">
					<div class="search-btn-wrapper">
						<img class="find-img" src="${pageContext.request.contextPath}/resources/images/hospital/location.png" alt="" />
						<button type="button" class="current-location-btn" onclick="getCurrentPosBtn();">현위치</button>
						<button type="button" class="select-address-btn">주소 선택</button>
						<div class="addr-wrapper">
							<span class="current-address"></span>
							<button type="button" class="del-btn">
								<img class="del-img" src="${pageContext.request.contextPath}/resources/images/hospital/remove.png" alt="삭제버튼" />
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="map-wrapper">
				<div id="map"></div>
			</div>
			<div class="search-result-wrapper">
				<div class="result-img-wrapper">
					<img id="hospital-img" src="${pageContext.request.contextPath}/resources/images/hospital/hospital.gif" alt="" />
					<div class="img-title">내 주변 병원</div>
				</div>
				<div class="result-hospitals">
					<table class="hospital-list-wrapper">
						<thead class="hospital-list-desc">
							<tr>
								<th style="width: 15rem;">병원명</th>
								<th style="width: 20rem;">주소</th>
								<th style="width: 8rem;">거리</th>
								<th style="width: 8rem;">상세보기</th>
							</tr>
						</thead>
						<tbody id="tbody">
						</tbody>
					</table>	
				</div>
			</div>
		</div>
		<div class="hospital-modal">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title-wrapper">
						<span class="modal-title">주소 선택</span>
					</div>
					<span class="close-modal">
						<img src="${pageContext.request.contextPath}/resources/images/hospital/cancel.png" alt="" class="close" />
					</span>
				</div>
				<div class="modal-body">
					<div class="choose-address">
						<select name="" class="sido">
							<option value="" disabled="disabled" selected>시·도</option>
							<option>서울특별시</option>
							<option>부산광역시</option>
							<option>대구광역시</option>
							<option>인천광역시</option>
							<option>광주광역시</option>
							<option>대전광역시</option>
							<option>울산광역시</option>
							<option>세종특별자치시</option>
							<option>경기도</option>
							<option>강원도</option>
							<option>충청북도</option>
							<option>충청남도</option>
							<option>전라북도</option>
							<option>전라남도</option>
							<option>경상북도</option>
							<option>경상남도</option>
							<option>제주특별자치도</option>
						</select>
						<select name="" class="sigungu">
							<option value="" disabled="disabled" selected>시·군·구</option>
						</select>
					</div>
				</div>
 
				<div class="modal-foot">
					<div class="modal-button-wrap">
						<button type="button" class="select-btn">
							<span>선택하기</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
 <script>
 /* --------------------- 지도 호출 이벤트 --------------------------- */
  // 카카오 지도 API 호출 
 const container = document.getElementById('map'); 
 let options = { 
 	center: new kakao.maps.LatLng(37.57002838826, 126.97962084516), //지도의 중심좌표.
 	level: 3 //지도의 레벨(확대, 축소 정도)
 };
 

 
//지도 생성 및 객체 리턴
 let map = new kakao.maps.Map(container, options); 
 
 window.onload = () => {

// 마커 생성
createMarker(37.57002838826, 126.97962084516);

// 마커 기준 병원 목록 가져오기
defaultList();	 
 }

 // 마커 생성 함수
 const createMarker = (x, y) => {
	 var markerPosition  = new kakao.maps.LatLng(x, y); 

	//마커를 생성합니다
	var marker = new kakao.maps.Marker({
	 position: markerPosition
	});

	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(null);
	marker.setMap(map);

 }

 /* --------------------- 현위치 버튼 클릭 시 이벤트 --------------------------- */
 
 function locationLoadSuccess(pos){
	    // 현재 위치 받아오기

	    let currentPos = new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude);
	
	    createMarker(currentPos.Ma, currentPos.La);
		map.panTo(currentPos); 
	    $.ajax({
	    	url: "https://dapi.kakao.com/v2/local/search/keyword.json",
	    	headers :  { 'Authorization' : 'KakaoAK 276da24fd02798fcbaf90b9a3d64acbb'	},
	    	dataType : "json",
	    	type : "GET",
	    	data : {
	    		'query' : "동물병원",
	    		'category_group_code' : "HP8",
	    		'x' : currentPos.La,
	    		'y' : currentPos.Ma, 
	    		'radius' : "5000",
	    		'sort' : "distance"
	    	},
	    	success: function(res){
	    		loadHospitalList(res);
	    	},
	    	fail: function(error){
	    		console.log(error);
	    	}
	    });	 
	    
	};
	
	function locationLoadError(pos){
	    alert('위치 정보를 가져오는데 실패했습니다.');
	};

	// 위치 가져오기 버튼 클릭시
const getCurrentPosBtn = () => {
	    navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
	};
 

const defaultList = () => {
	 $.ajax({
	    	url: "https://dapi.kakao.com/v2/local/search/keyword.json",
	    	headers :  { 'Authorization' : 'KakaoAK 276da24fd02798fcbaf90b9a3d64acbb'	},
	    	dataType : "json",
	    	type : "GET",
	    	data : {
	    		'query' : "동물병원",
	    		'category_group_code' : "HP8",
	    		'x' : "126.97962084516",
	    		'y' : "37.57002838826", 
	    		'radius' : "5000",
	    		'sort' : "distance"
	    	},
	    	success:function(res){
	    		loadHospitalList(res);
 
	    	},
	    	fail: function(error){
	    		console.log(error);
	    	}
	    });	
}

const loadHospitalList = (res) =>{
	 const positions = [];
	let tbody = document.querySelector("#tbody");
	tbody.innerHTML = "";
	const hospitalArr = res.documents;

	let contentOverlays = "";


	
	// 마커 생성
	for(let i = 0; i < hospitalArr.length; i++){
		const {x, y, place_name, road_address_name, phone, id} = hospitalArr[i];
		let place = {
				title: `\${place_name}`,
				content: `\${place_name}`,
				address: `\${road_address_name}`,
				tel: `\${phone}`,
				id: `\${id}`,
				latlng: new kakao.maps.LatLng(y, x),
				x: `\${x}`,
				y: `\${y}`
		};
		positions.push(place);
		
	}
	
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

	for (var i = 0; i < positions.length; i ++) {
		  // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커의 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        content : positions[i].content,
	        image : markerImage, // 마커 이미지 
	    });
	    contentOverlays  = '<div class="overlay-wrapper">' + 
        '    <div class="infos">' + 
        '        <div class="infos-title">' + 
        `            \${positions[i].title}` + 
        '        </div>' + 
        '        <div class="infos-body">' + 
        '            <div class="infos-img">' +
        '                <img src="${pageContext.request.contextPath}/resources/images/common/header/Dr.Cat.png" width="73" height="70">' +
        '           </div>' + 
        '            <div class="infos-desc">' + 
        `                <div class="marker-road-address">\${positions[i].address}</div>` + 
        `                <div class="marker-tel">\${positions[i].tel}</div>` + 
        `                <div><a href="${pageContext.request.contextPath}/hospital/hospitalDetail?id=\${positions[i].id}"  class="infos-link">상세보기</a></div>` + 
        '            </div>' + 
        '        </div>' + 
        '    </div>' +    
        '</div>';
        
        
	    var overlay = new kakao.maps.CustomOverlay({
	        content: contentOverlays,
	        map: map,
	        position: marker.getPosition()       
	    });
	}


	// 병원 목록 생성
	for(let i = 0; i < 4; i++){
		const {place_name, road_address_name, distance, id, x, y} = hospitalArr[i];
		const tr = document.createElement("tr");
		tr.classList.add("hospital-list");
		tr.dataset.id = id;
		const tdName = document.createElement("td");
		tdName.style.width = "15rem";
		tdName.append(place_name);
		const tdAddress = document.createElement("td");
		tdAddress.style.width = "20rem";
		tdAddress.append(road_address_name);
		const tdDistance = document.createElement("td");
		tdDistance.style.width = "8rem";
		tdDistance.append(distance+"m");
		const tdBtn = document.createElement("td");
		tdBtn.classList.add("hospital-btn-wrapper");
		tdBtn.style.width = "8rem";
		const btn = document.createElement("button");
		btn.classList.add("detail-btn");
		btn.textContent = "자세히";
		btn.onclick = (e) =>{
			e.stopPropagation();
			location.href = `${pageContext.request.contextPath}/hospital/hospitalDetail?id=\${id}`;
		};
		tdBtn.append(btn);
		tr.append(tdName, tdAddress, tdDistance, tdBtn);
		tbody.append(tr);
	
	}
	


}

const selectOpt = document.querySelector(".sido")
const delBtn = document.querySelector(".del-btn");

// 시-도에 따른 시군구 
selectOpt.addEventListener('change', (e) => {
	const sido = e.target.value;
	let sigungu = [];
	switch(sido){
	case "서울특별시":
		sigungu = ['강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구'];
		break;
	case "부산광역시":
		sigungu = ['강서구', '금정구', '남구', '동구', '동래구', '부산진구', '북구', '사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구'];
		break;
	case "대구광역시":
		sigungu = ['남구', '달서구', '달성군', '동구', '북구', '서구', '수성구', '중구'];
		break;
	case "인천광역시":
		sigungu = ['강화군', '계양구', '남동구', '동구', '미추홀구', '부평구', '서구', '연수구', '옹진군', '중구'];
		break;
	case "광주광역시":
		sigungu = ['광산구', '남구', '동구', '북구', '서구'];
		break;
	case "대전광역시":
		sigungu = ['대덕구', '동구', '서구', '유성구', '중구'];
		break;
	case "울산광역시":
		sigungu = ['남구', '동구', '북구', '울주군', '중구'];
		break;
	case "세종특별자치시":
		sigungu = [];
		break;
	case "경기도":
		sigungu = ['가평군', '고양시 덕양구', '고양시 일산동구', '고양시 일산서구', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시', '성남시 분당구', '성남시 수정구', '성남시 중원구', '수원시 권선구', '수원시 영통구', '수원시 장안구', '수원시 팔달구', '시흥시', '안산시 단원구', '안산시 상록구', '안성시', '안양시 동안구', '안양시 만안구', '양주시', '양평군', '여주시', '연천군', '오산시', '용인시 기흥구', '용인시 수지구', '용인시 처인구', '의왕시', '의정부시', '이천시', '파주시', '평택시', '포천시', '하남시', '화성시'];  
		break;
	case "강원도":
		sigungu = ['강릉시', '고성군', '동해시', '삼척시', '속초시', '양구군', '양양군', '영월군', '원주시', '인제군', '정선군', '철원군', '춘천시', '태백시', '평창군', '홍천군', '화천군', '횡성군'];
		break;
	case "충청북도":
		sigungu = ['괴산군', '단양군', '보은군', '영동군', '옥천군', '음성군', '제천시', '증평군', '진천군', '청주시 상당구', '청주시 서원구', '청주시 청원구', '청주시 흥덕구', '충주시'];
		break;
	case "충청남도":
		sigungu = ['계룡시', '공주시', '금산군', '논산시', '당진시', '보령시', '부여군', '서산시', '서천군', '아산시', '예산군', '천안시 동남구', '천안시 서북구', '청양군', '태안군', '홍성군'];
		break;
	case "전라북도":
		sigungu = ['고창군', '군산시', '김제시', '남원시', '무주군', '부안군', '순창군', '완주군', '익산시', '임실군', '장수군', '전주시 덕진구', '전주시 완산구', '정읍시', '진안군'];
		break;
	case "전라남도":
		sigungu = ['강진군', '고흥군', '곡성군', '광양시', '구례군', '나주시', '담양군', '목포시', '무안군', '보성군', '순천시', '신안군', '여수시', '영광군', '영암군', '완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군'];
		break;
	case "경상북도":
		sigungu = ['경산시', '경주시', '고령군', '구미시', '군위군', '김천시', '문경시', '봉화군', '상주시', '성주군', '안동시', '영덕군', '영양군', '영주시', '영천시', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군', '칠곡군', '포항시 남구', '포항시 북구'];
		break;
	case "경상남도":
		sigungu = ['거제시', '거창군', '고성군', '김해시', '남해군', '밀양시', '사천시', '산청군', '양산시', '의령군', '진주시', '창녕군', '창원시 마산합포구', '창원시 마산회원구', '창원시 성산구', '창원시 의창구', '창원시 진해구', '통영시', '하동군', '함안군', '함양군', '합천군'];
		break;
	case "제주특별자치도":
		sigungu = ['서귀포시', '제주시'];
		break;        
	}
	let sigunguOpt = document.querySelector(".sigungu");
	for(let i = 0; i < sigungu.length; i++){
		const opt = `<option>\${sigungu[i]}</option>`;
		sigunguOpt.insertAdjacentHTML('beforeend', opt);
	}
});

	// 모달 외부 클릭 시 모달 종료
	window.onclick = function(e) {
		modal = document.querySelector(".hospital-modal");
		  if (e.target == modal) {
		    modal.style.display = "none";
		  }
		}
	
	// 모달 활성화 
	document.querySelector(".select-address-btn").addEventListener('click', (e) => {
			modal = document.querySelector(".hospital-modal");
			modal.style.display = 'block';
	});
	
	// 모달 비활성화
	document.querySelector(".close-modal").addEventListener('click', (e) => {
		modal = document.querySelector(".hospital-modal");
		modal.style.display = 'none';
});
	// 주소 선택 시
	const selectBtn = document.querySelector(".select-btn");
	const curAddr = document.querySelector(".current-address");
	let sidoOpt = document.querySelector(".sido");
	let sigunguOpt = document.querySelector(".sigungu");

	
	selectBtn.addEventListener('click', (e) => {
		curAddr.innerHTML = "";
		curAddr.innerHTML = sidoOpt.value + " " + sigunguOpt.value;
		const keywordAddr = curAddr.innerHTML + " 동물병원";
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch( curAddr.innerHTML, function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			 $.ajax({
			    	url: "https://dapi.kakao.com/v2/local/search/keyword.json",
			    	headers :  { 'Authorization' : 'KakaoAK 276da24fd02798fcbaf90b9a3d64acbb'	},
			    	dataType : "json",
			    	type : "GET",
			    	data : {
			    		'query' : keywordAddr,
			    		'category_group_code' : "HP8",
			    		'x' : coords.La,
			    		'y' :coords.Ma, 
			    		'radius' : "20000"
			    	},
			    	success:function(res){

			    		loadHospitalList(res);
			    		map.panTo(coords);
			    		modal = document.querySelector(".hospital-modal");
			    		modal.style.display = 'none';
			    		sidoOpt.value = "";
			    		sigunguOpt.value = "";
			    		delBtn.style.display = "block";
		 
			    	},
			    	fail: function(error){
			    		console.log(error);
			    	}
			    });	
		     }
		});

	});
	

	delBtn.addEventListener('click', (e) =>{
		curAddr.innerHTML = "";
		delBtn.style.display ="none";
	});
	
	/*--------------------------  검색 이벤트핸들러  -------------------------------------------*/
	/*---------- 클릭 시 --------------------  */
	const searchBtn = document.querySelector(".search-btn");
	const keyword = document.querySelector("#keyword");
	searchBtn.addEventListener('click', (e) =>{
		const keywordVal = keyword.value;
		location.href = `${pageContext.request.contextPath}/hospital/hospitalList?keyword=\${keywordVal}`;
	});
	/* --------- enter 입력 시------------------  */
	keyword.addEventListener('keyup', (e) =>{
		if(e.keyCode === 13){
			e.preventDefault();
			searchBtn.click();
		}
	});
	
 </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>