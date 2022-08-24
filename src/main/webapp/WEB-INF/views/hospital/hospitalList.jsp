<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hospital/hospitalList.css" />

 <jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param value="동물병원 목록" name="title"/>
 </jsp:include>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22289034ae7ed5aa331cb59ea6ac1625&libraries=services"></script>
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
			<div class="search-result-wrapper">
				<div class="result-hospitals">
					<table class="hospital-list-wrapper">
						<thead class="hospital-list-desc">
							<tr>
								<th style="width: 22rem;">병원명</th>
								<th style="width: 22rem;">주소</th>
								<th style="width: 8rem;">거리</th>
								<th style="width: 12rem;">상세 보기</th>
							</tr>
						</thead>
						<tbody id="tbody">
						</tbody>
					</table>
					 <div class="pagination-container">
					    <button class="pagination-button" type="button" id="prev-button" aria-label="Previous page" title="Previous page">&lt;</button>
					    <div id="pagination-numbers"></div>
					    <button class="pagination-button"  id="next-button" aria-label="Next page" title="Next page">&gt;</button>
	 				 </div>	
				</div>
			</div>
		</div>
	</div>
	<div id="map" style="display:none;"></div>

 <script>
 const tbody = document.querySelector("#tbody");
 let searchTitle = "";    
 const paginationNumbers = document.getElementById("pagination-numbers");
 const nextButton = document.getElementById("next-button");
 const prevButton = document.getElementById("prev-button");

 
 const paginationLimit = 4;
 let pageCount;
 let currentPage = 1;
 let totalCount;

 const disableButton = (button) => {
   button.classList.add("disabled");
   button.setAttribute("disabled", true);
 };

 const enableButton = (button) => {
   button.classList.remove("disabled");
   button.removeAttribute("disabled");
 };

 const handlePageButtonsStatus = () => {
   if (currentPage === 1) {
     disableButton(prevButton);
   } else {
     enableButton(prevButton);
   }

   if (pageCount === currentPage) {
     disableButton(nextButton);
   } else {
     enableButton(nextButton);
   }
 };

		
 const handleActivePageNumber = () => {
	 let numbertest = 0;
	 console.log("numbertest = ", numbertest );
	 console.log("currentPage = ", currentPage);
	 document.querySelectorAll(".pagination-number").forEach((btn) => {
		   btn.classList.remove("active");
		    const pageIndex = Number(btn.getAttribute("page-index"));

		    if(pageIndex === currentPage){
		        btn.classList.add("active");
		    }
	 numbertest += 1;
	 console.log("numbertest = ", numbertest );
		});
	};
 
 const appendPageNumber = (index) => {
   const pageNumber = document.createElement("button");
   pageNumber.classList.add("pagination-number");
   pageNumber.innerHTML = index;
   pageNumber.setAttribute("type", "button");
   pageNumber.setAttribute("page-index", index);
   pageNumber.setAttribute("aria-label", "Page " + index);

   paginationNumbers.appendChild(pageNumber);
 };
 const getPaginationNumbers = (pageCount) => {
    let pageStart = Math.floor((currentPage - 1) / paginationLimit) * paginationLimit + 1;  
	let pageEnd = pageStart + paginationLimit - 1;
	if(pageCount < 4){
		pageEnd = pageCount;
	}
   for (let i = pageStart; i <= pageEnd; i++) {
     appendPageNumber(i);
   }

 };

 const setCurrentPage = (pageNum) => {

   currentPage = pageNum;
   handleActivePageNumber();
   handlePageButtonsStatus();
 }; 
 

 
 prevButton.onclick = () => {
   setCurrentPage(currentPage - 1);
   selectListLoad(currentPage);

 };
 
 nextButton.onclick = () => {
	  
   setCurrentPage(currentPage + 1);
   selectListLoad(currentPage);
  
 };


 document.querySelectorAll(".pagination-number").forEach((button) => {
	    let pageIndex = Number(button.getAttribute("page-index"));
	    if(pageIndex) {
	      button.onclick = () => {
	        setCurrentPage(pageIndex); 
	      };
	    }
	  });

 const defaultListLoad = () =>{
		// 현재 위치 받아오기
		navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
		
		function locationLoadError(pos){
			    alert('위치 정보를 가져오는데 실패했습니다.');
			};
		 function locationLoadSuccess(pos){
			    // 현재 위치 받아오기
			let currentPos = new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude);
			  
			 $.ajax({
			    	url: "https://dapi.kakao.com/v2/local/search/keyword.json",
			    	headers :  { 'Authorization' : 'KakaoAK 276da24fd02798fcbaf90b9a3d64acbb'	},
			    	dataType : "json",
			    	type : "GET",
			    	data : {
			    		'query' : searchTitle,
			    		'category_group_code' : "HP8",
			    		'x' : currentPos.La,
			    		'y' : currentPos.Ma,
			    		'page' : currentPage,
			    		'size' : paginationLimit,
			    		'sort' : "distance"
			    	},
			    	success: function(res){
			    		loadHospitalList(res);	    		
			    	},
			    	fail: function(error){
			    		console.log(error);
			    	}
			    });	
		 }
	}

	const selectListLoad = (currentPage) => {
		navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
		
		function locationLoadError(pos){
			    alert('위치 정보를 가져오는데 실패했습니다.');
			};
		 function locationLoadSuccess(pos){
			    // 현재 위치 받아오기
			let currentPos = new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude);
		 $.ajax({
		    	url: "https://dapi.kakao.com/v2/local/search/keyword.json",
		    	headers :  { 'Authorization' : 'KakaoAK 276da24fd02798fcbaf90b9a3d64acbb'	},
		    	dataType : "json",
		    	type : "GET",
		    	data : {
		    		'query' : searchTitle,
		    		'category_group_code' : "HP8",
		    		'x' : currentPos.La,
		    		'y' : currentPos.Ma,
		    		'sort' : "distance",
		    		'page' : currentPage,
		    		'size' : paginationLimit
		    	},
		    	success:function(res){
		    		loadHospitalList(res);
		    		
		    	},
		    	fail: function(error){
		    		console.log(error);
		    	}
		    });	
	}
	};

	const loadHospitalList = (res) =>{
		tbody.innerHTML = "";
		const hospitalArr = res.documents;
		totalCount = res.meta.total_count;
		pageCount = Math.ceil(totalCount / paginationLimit);
		if(pageCount > 12){
			pageCount = 12;
		}
		paginationNumbers.innerHTML = "";
	//	


		// 병원 목록 생성
		for(let i = 0; i < paginationLimit; i++){
			const {place_name, road_address_name, distance, id, x, y} = hospitalArr[i];

			const tr = document.createElement("tr");
			tr.classList.add("hospital-list");
			tr.dataset.id = id;
			
			const tdName = document.createElement("td");
			tdName.classList.add("hp-title");
			tdName.style.width = "22rem";
			tdName.append(place_name);
			
			const tdAddress = document.createElement("td");
			tdAddress.classList.add("hp-location");
			tdAddress.style.width = "22rem";
			tdAddress.append(road_address_name);
			
			const tdDistance = document.createElement("td");
			tdDistance.classList.add("hp-distance");
			tdDistance.style.width = "8rem";
			
			if(distance < 1000){
				tdDistance.append(distance+"m");			
			}
			else {
				tdDistance.append((distance / 1000)+"km");						
			}
			
			const tdBtn = document.createElement("td");
			tdBtn.classList.add("hospital-btn-wrapper");
			tdBtn.style.width = "13rem";
			
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
		getPaginationNumbers(pageCount);
		setCurrentPage(currentPage);
	}
 

	
/* --------------------- window.onload --------------------------- */
window.onload =() =>{
 searchTitle = "${keyword}" + " 동물병원"
 const cont = document.getElementById('map'); 
 let options = { 
 	center: new kakao.maps.LatLng(37.57002838826, 126.97962084516), //지도의 중심좌표.
 	level: 3 //지도의 레벨(확대, 축소 정도)
 };
 
//지도 생성 및 객체 리턴
 let map = new kakao.maps.Map(cont, options); 	
 
 defaultListLoad();


	   
	 };	
 

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