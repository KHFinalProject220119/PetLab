<%@page import="com.kh.petlab.member.model.dto.Member"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hospital/hospitalEnroll.css" />
 <jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param value="동물병원 등록" name="title"/>
 </jsp:include> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22289034ae7ed5aa331cb59ea6ac1625&libraries=services"></script>
<%
	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	Member loginMember = (Member) authentication.getPrincipal(); 
%>
<sec:authentication property="principal" var="loginMember" scope="page"/>
    <div id="signup-normal">
		<div class="signup-normal-wrapper">
			<div class="signup-cont">
				<h3 class="top-title">동물병원 등록</h3>
				<div class="signup-top">	
					<div class="signup-form-wrapper" >
						<form name="enrollFrm" id="enrollFrm" action="${pageContext.request.contextPath}/hospital/hospitalEnroll?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
							<div class="necessary-info">
								<input type="hidden" id="id" name="id" />
								<input type="hidden" id="x" name="x" />
								<input type="hidden" id="y" name="y" />
								<input type="hidden" id="distance" name="distance" />
								<input type="hidden" id="addressName" name="addressName" />
								<div class="info-wrapper">
									<div class="inner-wrapper">
										<div class="label-wrapper">
											<label for="placeName">병원명</label> 
										</div>
										<input type="text" id="placeName" name="placeName" class="input-cont" placeholder="병원명 입력(2~15자)" value="${loginMember.nickname}" required />
										<button type="button" class="find-hospital-btn">병원 검색</button>
									</div>
								</div>
								<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="chiefVeterinarian">대표 수의사</label> 
									</div>
									<input type="text" id="chiefVeterinarian" name="chiefVeterinarian" class="input-cont" placeholder="대표 수의사 입력(한글)" value="${loginMember.memberName}" required />
								</div>
								<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="cntVeterinarian">수의사수</label> 
									</div>
									<input type="text" id=cntVeterinarian name="cntVeterinarian" class="input-cont" placeholder="수의사 수" required />
								</div>
								<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="placeUrl">홈페이지</label> 
									</div>
									<input type="text" id="placeUrl" name="placeUrl" class="input-cont-url" placeholder="홈페이지" required />
								</div>
								<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="gender">주차 여부</label>
									</div>
									<div class="isparked-wrapper">
										<input type="radio" name="isparked" value="T" id="isparked-true"> 
										<label for="isparked-true">가능</label>
										<input type="radio" name="isparked" value="F" id="isparked-false"> 
										<label for="isparked-false">불가능</label>
									</div>
								</div>
								<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="operationHours">영업시간</label> 
										<input type="hidden" name="operationHours" id="operationHours" />
									</div>
									<div>
										<div>
											<span class="hour-txt">평일</span>
											<select name="weekdayHour1" id="weekdayHour1" class="operation-hour">
												<option value="" disabled="disabled" selected>시</option>
												<option>06</option>
												<option>07</option>
												<option>08</option>
												<option>09</option>
												<option>10</option>
												<option>11</option>
												<option>12</option>
												<option>13</option>
												<option>15</option>
												<option>16</option>
												<option>17</option>
											</select> : 
											<select name="weekdayMinute1" id="weekdayMinute1" class="operation-hour">
												<option value="" disabled="disabled" selected>분</option>
												<option>00</option>
												<option>10</option>
												<option>20</option>
												<option>30</option>
												<option>40</option>
												<option>50</option>
											</select> -
											<select name="weekdayHour2" id="weekdayHour2" class="operation-hour">
												<option value="" disabled="disabled" selected>시</option>
												<option>06</option>
												<option>07</option>
												<option>08</option>
												<option>09</option>
												<option>10</option>
												<option>11</option>
												<option>12</option>
												<option>13</option>
												<option>15</option>
												<option>16</option>
												<option>17</option>
												<option>18</option>
												<option>19</option>
												<option>20</option>
												<option>21</option>
												<option>22</option>
												<option>23</option>
												<option>24</option>
											</select> : 
											<select name="weekdayMinute2" id="weekdayMinute2" class="operation-hour">
												<option value="" disabled="disabled" selected>분</option>
												<option>00</option>
												<option>10</option>
												<option>20</option>
												<option>30</option>
												<option>40</option>
												<option>50</option>
											</select>
										</div>
										<div>
											<span class="hour-txt">주말</span>
											<select name="holidayHour1" id="holidayHour1" class="operation-hour">
												<option value="" disabled="disabled" selected>시</option>
												<option>06</option>
												<option>07</option>
												<option>08</option>
												<option>09</option>
												<option>10</option>
												<option>11</option>
												<option>12</option>
												<option>13</option>
												<option>14</option>
												<option>15</option>
												<option>16</option>
												<option>17</option>
											</select> : 
											<select name="holidayMinute1" id="holidayMinute1" class="operation-hour">
												<option value="" disabled="disabled" selected>분</option>
												<option>00</option>
												<option>10</option>
												<option>20</option>
												<option>30</option>
												<option>40</option>
												<option>50</option>
											</select> -
											<select name="holidayHour2" id="holidayHour2" class="operation-hour">
												<option value="" disabled="disabled" selected>시</option>
												<option>06</option>
												<option>07</option>
												<option>08</option>
												<option>09</option>
												<option>10</option>
												<option>11</option>
												<option>12</option>
												<option>13</option>
												<option>14</option>
												<option>15</option>
												<option>16</option>
												<option>17</option>
												<option>18</option>
												<option>19</option>
												<option>20</option>
												<option>21</option>
												<option>22</option>
												<option>23</option>
												<option>24</option>
											</select> : 
											<select name="holidayMinute2" id="holidayMinute2" class="operation-hour">
												<option value="" disabled="disabled" selected>분</option>
												<option>00</option>
												<option>10</option>
												<option>20</option>
												<option>30</option>
												<option>40</option>
												<option>50</option>
											</select>
										</div>
									</div>
								</div>
								<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="tel">병원 대표번호</label> 
									</div>
									<input type="tel" id="tel" name="tel" class="input-cont"  placeholder="업체 대표번호 입력(- 없이)" value="${loginMember.phone}" required/>
								</div>
								
								<div class="info-wrapper-post">
									<div class="post-inner-wrapper">
										<div class="label-wrapper">
											<label for="roadAddressName">병원 주소</label> 
										</div>
										<input type="text" id="roadAddressName" name="roadAddressName" class="input-cont-addr"  required/>
									</div>
								</div>
								<div class="info-wrapper">
									<div class="label-wrapper">
										<label for="content">병원 소개</label> 
									</div>
									<div class="enroll-text-wrapper">
										<textarea class="enroll-textarea" id="contentsText" name="content" maxlength="500" cols="30" rows="5"></textarea>
										<span id="counter">0<!--  -->자 / 최대<!--  -->500<!--  -->자</span>
									</div>
								</div>
			                    <div class="info-wrapper">
				                    <div class="label-wrapper">
										<label for="file">병원 사진</label> 
				                    </div>
									<div id="file-wrapper">
										<input type="file" id='upfile1' name="upfile1" class="hospital-des-img" accept="image/*" hidden/>  
										<input type="file" id='upfile2' name="upfile2" class="hospital-des-img" accept="image/*" hidden/>  
										<input type="file" id='upfile3' name="upfile3" class="hospital-des-img" accept="image/*" hidden/>  
										<input type="file" id='upfile4' name="upfile4" class="hospital-des-img" accept="image/*" hidden/>  
										<input type="file" id='upfile5' name="upfile5" class="hospital-des-img" accept="image/*" hidden/>  
 										<button class="attach-btn" type="button" >
 											<img class="attach-img" src="${pageContext.request.contextPath}/resources/images/hospital/add2.png" data-no="1">
 										</button>
									</div>
      							</div>
							</div>
						<div class="btn-wrapper">
							<button type="button" class="back-btn" onclick="backBtn();">뒤로가기</button>
							<button type="submit" class="submit-btn">제출하기</button>
						</div>
						</form >
					</div>
					<div class="hospital-modal">
						<div class="modal-content">
							<div class="modal-header">
								<div class="modal-title-wrapper">
									<span class="modal-title">병원 선택</span>
								</div>
								<span class="close-modal">
									<img src="${pageContext.request.contextPath}/resources/images/hospital/cancel.png" alt="" class="close" />
								</span>
							</div>
							<div class="modal-body">
								<table class="hospital-list-wrapper">
									<thead class="hospital-list-desc">
										<tr>
											<th style="width: 20rem;">병원명</th>
											<th style="width: 25rem;">주소</th>
											<th style="width: 9rem;">선택하기</th>
										</tr>
									</thead>
									<tbody id="tbody">
									</tbody>
								</table>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="map" style="display:none;"></div>
<script>
const attachBtn = document.querySelector(".attach-btn");
const fileWrapper = document.querySelector("#file-wrapper");
const fileName = "";
const popArr = [5, 4, 3, 2, 1];
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

const enrollFrm = document.enrollFrm;
const idValue = document.querySelector("#id");
const xValue = document.querySelector("#x");
const yValue = document.querySelector("#y");
const placeNameValue = document.querySelector("#placeName");
const placeUrlValue = document.querySelector("#placeUrl");
const distanceValue = document.querySelector("#distance");
const addressNameValue = document.querySelector("#addressName");
const roadAddressNameValue = document.querySelector("#roadAddressName");
const telValue = document.querySelector("#tel");
const tbody = document.querySelector("#tbody");

/* 병원 검색 모달 */
	// 모달 외부 클릭 시 모달 종료
	window.onclick = function(e) {
		modal = document.querySelector(".hospital-modal");
		  if (e.target == modal) {
		    modal.style.display = "none";
		  }
		}
	
	// 모달 활성화 
	document.querySelector(".find-hospital-btn").addEventListener('click', (e) => {
			modal = document.querySelector(".hospital-modal");
			modal.style.display = 'block';
			const hospitalName = document.querySelector("#placeName").value
			selectListLoad(hospitalName);
	});
	
	// 모달 비활성화
	document.querySelector(".close-modal").addEventListener('click', (e) => {
		modal = document.querySelector(".hospital-modal");
		modal.style.display = 'none';
});

/**
 * 유효성 검사
 */

 enrollFrm.addEventListener('submit', (e) => {
	 	e.preventDefault();
	 	
	 	const idVal = document.querySelector("#id").value;
	    const xVal = document.querySelector("#x").value;
	    const yVal = document.querySelector("#y").value;
	    const placeNameVal = document.querySelector("#placeName").value;
		const distanceVal = document.querySelector("#distance").value;
	    const addressNameVal = document.querySelector("#addressName").value;
	    const roadAddressNameVal = document.querySelector("#roadAddressName").value;
	    const telVal = document.querySelector("#tel").value;
	    const chiefVeterinarianVal = document.querySelector("#chiefVeterinarian").value;
	    const cntVeterinarianVal = document.querySelector("#cntVeterinarian").value;
	    const contentVal = document.querySelector("#contentsText").value;
	    const placeUrlVal = document.querySelector("#placeUrl").value;
	    const cntVeterinarian = document.querySelector("#cntVeterinarian").value;

	    const operationHours = document.querySelector("#operationHours");
	    const weekdayHour1 = document.querySelector("#weekdayHour1").value;
	    const weekdayHour2 = document.querySelector("#weekdayHour2").value;
	    const weekdayMinute1 = document.querySelector("#weekdayMinute1").value;
	    const weekdayMinute2 = document.querySelector("#weekdayMinute2").value;
	    const holidayHour1 = document.querySelector("#holidayHour1").value;
	    const holidayHour2 = document.querySelector("#holidayHour2").value;
	    const holidayMinute1 = document.querySelector("#holidayMinute1").value;
	    const holidayMinute2 = document.querySelector("#holidayMinute2").value;
	    operationHours.value = "평일" + weekdayHour1 + ":" + weekdayMinute1 + "~" + weekdayHour2 + ":" + weekdayMinute2 + " / 토요일(,공휴일) " + holidayHour1 + ":" + holidayMinute1 + "~" + holidayHour2 + ":" + holidayMinute2;
	    
	    
	  
	    if(!idVal) {
	      return false;
	    }
	    
	    if(!xVal) {
	      return false;
	    }
	    if(!yVal) {
	      return false;
	    }
	    if(!distanceVal) {
	      return false;
	    }
	   
	    if(!placeNameVal) {
	      alert("주소를 작성해주세요.");
	      return false;
	    }
	    if(!addressNameVal) {
	      return false;
	    }
	    if(!roadAddressNameVal) {
	      alert("주소를 작성해주세요.");
	      return false;
	    }
	    if(!telVal) {
	      alert("전화번호를 작성해주세요.");
	      return false;
	    }
	    if(!chiefVeterinarianVal) {
	      alert("대표 수의사를 작성해주세요.");
	      return false;
	    }
	    if(!cntVeterinarianVal) {
	      alert("수의사의 수를 작성해주세요.");
	      return false;
	    }
	    if(!contentVal) {
	      alert("소개글을 작성해주세요.");
	      return false;
	    }
	    if(!cntVeterinarian) {
	      alert("주소를 작성해주세요.");
	      return false;
	    }
	     
  
	  enrollFrm.submit();
	});


const backBtn = (e) => {
	location.href="${pageContext.request.contextPath}/";
}

 
/* const changeValue = (e) => {
	let filename = document.querySelector("#file").value.split('/').pop().split('\\').pop();

	//document.querySelector("#box-file-text").innerHTML = filename;
} */

const selectListLoad = (hospitalName) => {
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
	    		'query' : hospitalName,
	    		'category_group_code' : "HP8",
	    		'x' : currentPos.La,
	    		'y' : currentPos.Ma,
	    		'sort' : "distance",
	    		'page' : 1,
	    		'size' : 4
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
	console.log(hospitalArr);
/* 	totalCount = res.meta.total_count;
	pageCount = Math.ceil(totalCount / paginationLimit);
	if(pageCount > 12){
		pageCount = 12;
	}
	paginationNumbers.innerHTML = ""; */
//	


	// 병원 목록 생성
	for(let i = 0; i < 4; i++){
 		const {place_name, place_url, address_name, road_address_name, distance, id, x, y, phone} = hospitalArr[i];

		const tr = document.createElement("tr");
		tr.classList.add("hospital-list");
		tr.dataset.id = id;
		
		const tdName = document.createElement("td");
		tdName.classList.add("hp-title");
		tdName.style.width = "20rem";
		tdName.append(place_name);
		
		const tdAddress = document.createElement("td");
		tdAddress.classList.add("hp-location");
		tdAddress.style.width = "25rem";
		tdAddress.append(road_address_name);
		
		const tdBtn = document.createElement("td");
		tdBtn.classList.add("hospital-btn-wrapper");
		tdBtn.style.width = "9rem";
		
		const btn = document.createElement("button");
		btn.classList.add("select-hospital-btn");
		btn.textContent = "선택하기";
		btn.onclick = (e) =>{
			e.stopPropagation();
			console.log()
			idValue.value = id; 
			xValue.value = x; 
			yValue.value = y;
			placeNameValue.value = place_name; 
			placeUrlValue.value = place_url; 
			distanceValue.value = distance;
			addressNameValue.value = address_name; 
			roadAddressNameValue.value = road_address_name; 
			telValue.value = phone.replace(/\-/g, "");;
			tbody.innerHTML = "";
			modal = document.querySelector(".hospital-modal");
			modal.style.display = 'none';
		};
		tdBtn.append(btn);
		tr.append(tdName, tdAddress, tdBtn);
		tbody.append(tr);
	
	}
/* 	getPaginationNumbers(pageCount); */
}



/* --------------------- window.onload --------------------------- */
window.onload =() =>{

const cont = document.getElementById('map'); 
let options = { 
	center: new kakao.maps.LatLng(37.57002838826, 126.97962084516), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

//지도 생성 및 객체 리턴
let map = new kakao.maps.Map(cont, options); 	

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