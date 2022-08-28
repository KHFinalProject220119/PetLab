<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22289034ae7ed5aa331cb59ea6ac1625&libraries=services,clusterer"></script>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/common/body.css" />
		<article>
		<div class="main-visual-wrap" id="main-visual">
			<div class="main-visual">
				<div class="bx-wrapper">
					<div class="bx-viewport">
						<ul class="slider-box">
							<li class="visual" id="visual-image1" style="background-image: url(${pageContext.request.contextPath}/resources/images/common/carousel/carousel1.png);"></li>
							<li class="visual" id="visual-image2" style="background-image: url(${pageContext.request.contextPath}/resources/images/common/carousel/carousel2.png);"></li>
							<li class="visual" id="visual-image3" style="background-image: url(${pageContext.request.contextPath}/resources/images/common/carousel/carousel3.png);"></li>
							<li class="visual" id="visual-image4" style="background-image: url(${pageContext.request.contextPath}/resources/images/common/carousel/carousel4.png);"></li>
							<li class="visual" id="visual-image5" style="background-image: url(${pageContext.request.contextPath}/resources/images/common/carousel/carousel5.png);"></li>
						</ul>	
					 </div>
				</div>
			</div>
			<div class="bx-controls-wrapper">
				<div class="bx-controls">
					<button type="button" class="bx-prev" style="background-image: url(${pageContext.request.contextPath}/resources/images/common/carousel/prev.png);"></button>
					<div class="paginations"></div>
					<button type="button" class="bx-next" style="background-image: url(${pageContext.request.contextPath}/resources/images/common/carousel/next.png);"></button>
				</div> 
			</div>
		</article>
		<article>
			<div id="center-product-container">
				<div class="product-cont">
					<a class="store-main-btn" href="${pageContext.request.contextPath}/store/storeMain">
						<div class="product-title-wrapper">
							<h2 class="product-title">멍냥 스토어 <span class="title-red">hit</span>상품</h2>
						</div>
					</a>
					<article class="product-item">
						<c:if test="${not empty productList}">
							<c:forEach items="${productList}" var="product" varStatus="i">
								<div class="product-cont-wrapper">		
									<a class="product-overlay" href="${pageContext.request.contextPath}/store/mall/ProductDetail?no=${product.productNo}">
										<c:forEach items="${product.attachments}" var="attach">
											<div class="product-image-wrapper">
												<img class="product-image" src="${pageContext.request.contextPath}/resources/upload/store/mall/${attach.renamedFilename} ">										
											</div>											
										</c:forEach>
										<div class="product-content">
											<div class="product-content-wrapper">
												<h1 class="product-header">
													<span class="product-header-name">${product.productName}</span>
												</h1>
												<span class="product-item-price">
													<span class="product-item-price">
														<fmt:formatNumber value="${product.productPrice}" pattern="#,###" />원
													</span>
												</span>
											</div>
										</div>
									</a>
								</div>
							</c:forEach>
						</c:if>
					</article>
				</div>
			</div>
			<div id="center-hospital-container">
				<a class="search-hospital-btn" href="${pageContext.request.contextPath}/hospital/searchHospital">
					<div class="hosptal-title-wrapper">
						<h2 class="hospital-title">동물병원 검색 바로가기</h2>
					</div>
				</a>
				<div class="map-container">
					<div class="map-wrapper">
						<div id="map"></div>
					</div>
					<div class="search-result-wrapper">
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
			</div>
			<div id="center-community-container">
				<a class="search-community-btn" href="${pageContext.request.contextPath}/community/photoList">
					<div class="community-title-wrapper">
						<h2 class="community-title">커뮤니티 바로가기</h2>
					</div>
				</a>
				<div class="photo-list-subtitle-wrapper">
					<h3 class="photo-list-subtitle">이 달의 멍냥이들</h3>
				</div>
					<div class="photo-list-container">
						<c:if test="${not empty photoList}"> 
						<c:forEach items="${photoList}" var="photo" varStatus="vs">
							<div class="photo-list-wrapper">
								<a href="${pageContext.request.contextPath}/community/photoList" class="photo-list-wrapper">
										<div class="photo-img-wrapper">
											<span class="medal-wrapper">
												<img class="medal-image" src="${pageContext.request.contextPath}/resources/images/common/body/${vs.count}.png" alt="" />
											</span>
											<img class="photo-list-img" src="${pageContext.request.contextPath}/resources/upload/community/${photo.attachment.renamedFilename}" />
										</div>		
									<div class="photo-text-wrapper">
										<div class="text-title">${photo.PTitle}</div>
										<div class="etc-text">
											<div><span class="pre-text-photo">조회수</span> ${photo.readCount}</div>
											<div><span class="pre-text-photo">좋아요</span> ${photo.likeCount}</div>
											<div>
												<span class="pre-text-photo">등록일</span>
												<fmt:parseDate value="${photo.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="regDate"  />
												<fmt:formatDate value="${regDate}" pattern="YYYY년 MM월 dd일"/>
											</div>
										</div>
									</div>
								</a>													
							</div>
						</c:forEach>
					</c:if> 
				</div>
			</div>
		</article>
<script>
// 카카오 지도 API 호출 
const container = document.getElementById('map'); 
let options = { 
	center: new kakao.maps.LatLng(37.57002838826, 126.97962084516), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};



//지도 생성 및 객체 리턴
let map = new kakao.maps.Map(container, options); 

window.onload = () => {

//마커 생성
createMarker(37.57002838826, 126.97962084516);

//마커 기준 병원 목록 가져오기
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
       `                <div><a href="${pageContext.request.contextPath}/hospital/hospitalDetail?id=10437790"  class="infos-link">상세보기</a></div>` + 
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
			location.href = `${pageContext.request.contextPath}/hospital/hospitalDetail?id=10437790`;
		};
		tdBtn.append(btn);
		tr.append(tdName, tdAddress, tdDistance, tdBtn);
		tbody.append(tr);
	
	}
	


}
</script>
<script>
	//캐러셀
	const list = document.querySelector('.slider-box');
	const items = document.querySelectorAll('.visual');
	const btnPrev = document.querySelector('.bx-prev');
	const btnNext = document.querySelector('.bx-next');
	const paginations = document.querySelector('.paginations');
	const lastIndex = items.length - 1;
	let selected = 0;
	let interval;
	
	
	const setTransition = (value) => {
	  list.style.transition = value;
	};
	
	const setTranslate = ({ index, reset }) => {
	  if (reset) {
	    list.style.transform = `translate(-\${list.clientWidth}px, 0)`;
	  }
	  else {
	    list.style.transform = `translate(-\${(index + 1) * list.clientWidth}px, 0)`;
	  }  
	};
	
	const activePagination = (index) => {
	  [...paginations.children].forEach((pagination) => {
	    pagination.classList.remove('active');
	  });
	  paginations.children[index].classList.add('active');
	};
	
	const handlePagination = (e) => {
	  if (e.target.dataset.num) {
	    selected = parseInt(e.target.dataset.num);
	    setTransition('all 0.3s linear');
	    setTranslate({ index: selected });
	    activePagination(selected);
	  }
	};
	
	const makePagination = () => {
	  if (items.length > 1) {
	    for (let i = 0; i < items.length; i++) {
	      const button = document.createElement('li');
	      button.dataset.num = i;
	      button.style.backgroundImage = "url(${pageContext.request.contextPath}/resources/images/common/carousel/cat.png)";
	      button.classList.add('pagination');
	      if (i === 0) {
	        button.classList.add('active');
	      }
	      paginations.appendChild(button);
	      paginations.addEventListener('click', handlePagination);
	    }
	  }
	};
	
	
	const handlePrev = () => {
	  selected -= 1;
	  setTransition('transform 0.3s linear');
	  setTranslate({ index: selected });
	  if (selected < 0) {
	    selected = lastIndex;
	    setTimeout(() => {
	      setTransition('');
	      setTranslate({ index: selected });
	    }, 300);
	  }
	  if (selected >= 0) activePagination(selected);
	};
	
	const handleNext = () => {
	  console.log(selected);
	  selected += 1;
	  setTransition('transform 0.3s linear');
	  setTranslate({ index: selected });
	  if (selected > lastIndex) {
	    selected = 0;
	    setTimeout(() => {
	      setTransition('');
	      setTranslate({ index: selected });
	    }, 300);
	  }
	  if (selected <= lastIndex) activePagination(selected);
	};
	
	const clickButton = () => {
	  if (items.length > 1) {
	    btnPrev.addEventListener('click', handlePrev);
	    btnNext.addEventListener('click', handleNext);
	  }
	};
	
	
	const cloneElement = () => {
	  list.prepend(items[lastIndex].cloneNode(true));
	  list.append(items[0].cloneNode(true));
	  setTranslate({ reset: true });
	};
	
	
	const autoplayIterator = () => {
	  selected += 1;
	  setTransition('all 0.3s linear');
	  setTranslate({ index: selected });
	  if (selected > lastIndex) {
	    activePagination(0);
	    clearInterval(interval);
	    setTimeout(() => {
	      selected = 0;
	      setTransition('');
	      setTranslate({ reset: true });
	      autoplay({ duration: 4000 });
	    }, 300);
	  }
	  if (selected <= lastIndex){
		  activePagination(selected);
	  }
	};
	
	const autoplay = ({ duration }) => {
	  interval = setInterval(autoplayIterator, duration);
	};
	    
	const render = () => {
	  clickButton();
	  makePagination();
	  cloneElement();
	  autoplay({ duration: 4000 });
	};
	render();		
	
</script>
