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
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/hospital/hospitalDetail.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="동물병원 상세보기" name="title" />
</jsp:include>
<script type="text/javascript"	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22289034ae7ed5aa331cb59ea6ac1625&libraries=services,clusterer,drawing"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
	Kakao.init('22289034ae7ed5aa331cb59ea6ac1625');
</script>
<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="loginMember" scope="page"/>					
</sec:authorize>
<div id="hospital-detail-info-container">
	<div class="hospital-detail-info-wrapper">
		<div class="detail-info-title-cont">
			<div class="title-wrapper">
				<h3 class="top-title">${hospital.placeName}</h3>
			</div>
		</div>
		<div class="map-wrapper">
			<div id="map"></div>
		</div>
		<div class="hospital-detail-info">
			<div class="place-top-wrapper">
				<div class="img">
					<img class="location-img" src="${pageContext.request.contextPath}/resources/images/hospital/location.png" alt="">
				</div>
				<span class="address"> ${hospital.roadAddressName} </span>
					<a href="#" class="tel"><strong>TEL </strong><span class="telNo" > ${(hospital.tel).substring(0, 2)}-${(hospital.tel).substring(2, 5)}-${(hospital.tel).substring(5, 9)} </span></a>
			</div>
			<div class="place-body-wrapper">
				<article class="place-info-basic">
					<div class="inner">
						<div class="place-isparked">
							<ul class="place-info-list">
								<li>
									<span class="title">주차</span>
									<span class="text">${hospital.isparked eq 'T' ? '가능' : '불가'}</span>
								</li>
							</ul>
						</div>
						<div class="seperator">ㅣ</div>
						<div class="place-operation">
							<ul class="place-info-list">
								<li>
									<span class="title">영업시간</span>
									<span class="text">${hospital.operationHours}</span>
								</li>
							</ul>
						</div>
						<div class="seperator">ㅣ</div>
						<div class="place-function">
							<div class="function-cont" style="border: 0.15rem solid #FFE3A9;">
								<ul class="function-wrapper">
									<li>
										<a href="javascript:copyTxt('${(hospital.tel).substring(0, 2)}-${(hospital.tel).substring(2, 5)}-${(hospital.tel).substring(5, 9)}');" class="hospital-tel" value="${(hospital.tel).substring(0, 2)}-${(hospital.tel).substring(2, 5)}-${(hospital.tel).substring(5, 9)}">
											<img class="func-img" src="${pageContext.request.contextPath}/resources/images/hospital/calling.png" alt="전화번호">전화번호
										</a>
									</li>
									<li>
										<a href="javascript:openShareModal();" class="hospital-share">
											<img class="func-img"  src="${pageContext.request.contextPath}/resources/images/hospital/share.png" alt="공유하기">공유하기 
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</article>
			</div>
			<article class="place-info-detail">
				<div class="info-detail-cont">
					<div class="info-detail-wrapper">
						<ul class="detail-img-wrapper">
							<li>
								<span class="title">동물병원 사진</span>
								<span class="text">
									<div class="img-list">
									<c:if test="${not empty hospital.attachments }">
									  <c:forEach items="${hospital.attachments}" var="attachment" >
										<div class="hp-img-wrapper">
											<img src="${pageContext.request.contextPath}/resources/upload/hospital/hospital/${attachment.renamedFilename}" data-name="${attachment.originalFilename}" class="hospital-img" />
										</div>
									  </c:forEach>
									</c:if>
									</div>
								</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="hospital-modal">
					<div class="modal-contents">
						<div class="modal-header">
							<span class="modal-title"></span>
							<span class="close-modal">
								<img src="${pageContext.request.contextPath}/resources/images/hospital/cancel.png" alt="" class="close" />
							</span>
						</div>
						<div class="modal-body">
							<img class="modal-content-img" src="">
						</div>
					</div>
				</div>
			</article>
			<article class="place-review">
				<div class="review-container">
					<div class="review-total">
						<div class="top-btn-wrapper">
							<span><img class="review-icon" src="${pageContext.request.contextPath}/resources/images/hospital/dogwithapencil.png" alt="리뷰쓰기" /></span>
							<span class="review-title-top">멍냥 리뷰</span>
							<span class="review-text-top">
							<sec:authorize access="isAuthenticated()">
								<button type="button" class="write-btn" onclick="writeReview();">+ 리뷰 작성하기</button>
							</sec:authorize>
							</span>
						</div>
						<c:if test="${not empty hospital.reviews}">
							<c:forEach items="${hospital.reviews}" var="review"   begin="0" end="0" step="1">
								<div class="review-body">
									<div class="review-total">
										<div class="total-title">총점</div>
										<div class="total-rate"><span class="review-total-rate">${Math.round(review.totalAvg)}</span>점</div>
										<div class="rating" style=" height: 50%;">
											<c:forEach var="i" begin="1" end="${Math.round(review.totalAvg)}" step="1">
												<span class="fa fa-star detail-rate ${i le Math.round(review.totalAvg) ? 'checked' : ''}" data-no="${i}" style="font-size: 5rem;"></span>
											</c:forEach>
										</div>
									</div>
									<div class="review-detail-rate">
										<div class="detail-rate checked-wrapper">
											<div class="detail-rate-title">친절</div>
											<div class="rating-detail">
												<c:forEach var="i" begin="1" end="${Math.round(review.kindnessAvg)}" step="1">
													<span class="fa fa-star detail-rate ${i le Math.round(review.kindnessAvg) ? 'checked' : ''}" data-no="${i}"></span>
												</c:forEach> 
											</div>
										</div>
										<div class="detail-rate checked-wrapper">     
											<div class="detail-rate-title">설명</div>
											<div class="rating-detail">
												<c:forEach var="i" begin="1" end="${Math.round(review.descriptionAvg)}" step="1">
													<span class="fa fa-star detail-rate ${i le Math.round(review.descriptionAvg) ? 'checked' : ''}" data-no="${i}"></span>
												</c:forEach> 
											</div>
										</div>
										<div class="detail-rate checked-wrapper">
											<div class="detail-rate-title">진료</div>
											<div class="rating-detail">
												<c:forEach var="i" begin="1" end="${Math.round(review.diagnosisAvg)}" step="1">
													<span class="fa fa-star detail-rate ${i le Math.round(review.diagnosisAvg) ? 'checked' : ''}" data-no="${i}"></span>
												</c:forEach> 
											</div>
										</div>
										<div class="detail-rate checked-wrapper">
											<div class="detail-rate-title">시설</div>
											<div class="rating-detail">
												<c:forEach var="i" begin="1" end="${Math.round(review.facilityAvg)}" step="1">
													<span class="fa fa-star detail-rate ${i le Math.round(review.facilityAvg) ? 'checked' : ''}" data-no="${i}"></span>
												</c:forEach> 
											</div>
										</div>
										<div class="detail-rate checked-wrapper">
											<div class="detail-rate-title">가격</div>
											<div class="rating-detail">
												<c:forEach var="i" begin="1" end="${Math.round(review.priceAvg)}" step="1">
													<span class="fa fa-star detail-rate ${i le Math.round(review.priceAvg) ? 'checked' : ''}" data-no="${i}"></span>
												</c:forEach> 
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
					<div class="share-modal">
						<div class="share-modal-contents">
							<div class="share-modal-header">
								<span class="share-modal-title">공유하기</span>
								<span class="close-share">
									<img src="${pageContext.request.contextPath}/resources/images/hospital/cancel.png" alt="" class="share-close-img" />
								</span>
							</div>
							<div class="share-modal-body">
								<div class="share-btn-cont" id="kakao-share-wrapper">
									<a id="create-kakaotalk-sharing-btn" href="javascript:kakaoShare();">
										<img src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
									    alt="카카오톡 공유 보내기 버튼"/>
										<div class="share-btn-text">카카오톡 공유</div>
									</a>
								</div>
								<div class="share-btn-cont">
									<button type="button" onclick="copyUrl('${hospital.placeName}');" class="url-share-btn">
										<img class="share-modal-content-img" src="${pageContext.request.contextPath}/resources/images/common/favicon/favicon-96x96.png">
										<div class="share-btn-text">URL 복사</div>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="member-review-list">
							<hr style="width: 77%;border-top: 4px solid #FF9900;"/>
							<c:if test="${not empty hospital.reviews }">
								<c:forEach items="${hospital.reviews}" var="review" begin="0" end="0" step="1" >
									<div class="member-review-container">
										<div class="member-review-wrapper">
											<div class="member-review-content">
												<div class="member-review-top">
													<div class="member-review-top-img-wrapper">
														<img src="${pageContext.request.contextPath}/resources/upload/member/pet/cutecat.jpg" alt="" class="member-review-top-img" />
													</div>
													<div class="member-review-top-id-wrapper">${review.memberId}</div>
													<div class="member-review-top-date-wrapper">
		    											<fmt:formatDate value="${review.regDate}" pattern="yyyy.MM.dd."/> 
													</div>
												</div>
												<div class="member-review-star-rate">
												 	<c:forEach var="i" begin="1" end="${Math.round(review.average)}" step="1">
														<span class="fa fa-star member-rate ${i le Math.round(review.average) ? 'checked' : ''}" data-no="${i}"></span>
													</c:forEach> 
												</div>
												<div class="member-review-body">
													<textarea name="reviewContent" id="reviewContent" maxlength="500" rows="5" readonly>${review.content}</textarea>
												</div>	
											</div>
										</div>
										<div class="review-img-wrapper">
											<c:if test="${not empty review.attachments }">
												<c:forEach items="${review.attachments}" var="attachment" >
													<img src="${pageContext.request.contextPath}/resources/upload/hospital/review/${attachment.renamedFilename}" alt="" data-name="${attachment.originalFilename}" class="review-img" />
												</c:forEach>
											</c:if>
										</div>
									</div>
								</c:forEach>
							</c:if>	
						</div>
						<div class="member-review-list plus review-none">
							<c:if test="${not empty hospital.reviews }">
								<c:forEach items="${hospital.reviews}" var="review" begin="1" step="1" >
									<div class="member-review-container">
										<div class="member-review-wrapper">
											<div class="member-review-content">
												<div class="member-review-top">
													<div class="member-review-top-img-wrapper">
														<img src="${pageContext.request.contextPath}/resources/upload/member/pet/cutecat.jpg" alt="" class="member-review-top-img" />
													</div>
													<div class="member-review-top-id-wrapper">${review.memberId}</div>
													<div class="member-review-top-date-wrapper">
		    											<fmt:formatDate value="${review.regDate}" pattern="yyyy.MM.dd."/> 
													</div>
												</div>
												<div class="member-review-star-rate">
												 	<c:forEach var="i" begin="1" end="${Math.round(review.average)}" step="1">
														<span class="fa fa-star member-rate ${i le Math.round(review.average) ? 'checked' : ''}" data-no="${i}"></span>
													</c:forEach> 
												</div>
												<div class="member-review-body">
													<textarea name="reviewContent" id="reviewContent" maxlength="500" rows="5" readonly>${review.content}</textarea>
												</div>	
											</div>
										</div>
										<div class="review-img-wrapper">
											<c:if test="${not empty review.attachments }">
												<c:forEach items="${review.attachments}" var="attachment" >
													<img src="${pageContext.request.contextPath}/resources/upload/hospital/review/${attachment.renamedFilename}" alt="" data-name="${attachment.originalFilename}" class="review-img" />
												</c:forEach>
											</c:if>
										</div>
									</div>
								</c:forEach>
							</c:if>	
						</div>
					</div>
					<div class="bottom-btn-wrapper">
						<button type="button" class="review-btn">
							<span>리뷰 더보기 +</span>
						</button>
					</div>
				</div>
				<div class="review-modal">
					<div class="modal-content">
						<div class="review-modal-header">
							<div class="review-modal-title-wrapper">
								<span class="review-modal-title">멍냥 리뷰 작성</span>
							</div>
							<div class="review-close-wrapper">
								<span class="review-modal-close">
									<img src="${pageContext.request.contextPath}/resources/images/hospital/cancel.png" alt="" class="close" />
								</span>
							</div>
						</div>
						<div class="modal-body">
							<form name="reviewFrm" id="reviewFrm" method="POST" action="${pageContext.request.contextPath}/hospital/hospitalReviewEnroll?${_csrf.parameterName}=${_csrf.token}"  enctype='multipart/form-data' >
								<div class="review-rate-enroll">
									<div class="review-rate-enroll-wrapper">
										<div class="review-rate-enroll-title">친절</div>
										<div class="review-rate-enroll-kindness">
											<span class="fa fa-star enroll-rate-kindness checked" data-name="kindness" data-kindness-no="1"></span>
											<span class="fa fa-star enroll-rate-kindness checked" data-name="kindness" data-kindness-no="2"></span>
											<span class="fa fa-star enroll-rate-kindness checked" data-name="kindness" data-kindness-no="3"></span>
											<span class="fa fa-star enroll-rate-kindness checked" data-name="kindness" data-kindness-no="4"></span>
											<span class="fa fa-star enroll-rate-kindness checked" data-name="kindness" data-kindness-no="5"></span>
										</div>
										<input type="hidden" name="kindness" id="kindness" value="5" />
									</div>
									<div class="review-rate-enroll-wrapper">     
										<div class="detail-rate-title">설명</div>
										<div class="rating-detail">
											<span class="fa fa-star enroll-rate-description checked" data-name="description" data-description-no="1"></span>
											<span class="fa fa-star enroll-rate-description checked" data-name="description" data-description-no="2"></span>
											<span class="fa fa-star enroll-rate-description checked" data-name="description" data-description-no="3"></span>
											<span class="fa fa-star enroll-rate-description checked" data-name="description" data-description-no="4"></span>
											<span class="fa fa-star enroll-rate-description checked" data-name="description" data-description-no="5"></span>
										</div>
										<input type="hidden" name="description" id="description"  value="5"/>
									</div>
									<div class="review-rate-enroll-wrapper">
										<div class="detail-rate-title">진료</div>
										<div class="rating-detail">
											<span class="fa fa-star enroll-rate-diagnosis checked" data-name="diagnosis" data-diagnosis-no="1"></span>
											<span class="fa fa-star enroll-rate-diagnosis checked" data-name="diagnosis" data-diagnosis-no="2"></span>
											<span class="fa fa-star enroll-rate-diagnosis checked" data-name="diagnosis" data-diagnosis-no="3"></span>
											<span class="fa fa-star enroll-rate-diagnosis checked" data-name="diagnosis" data-diagnosis-no="4"></span>
											<span class="fa fa-star enroll-rate-diagnosis checked" data-name="diagnosis" data-diagnosis-no="5"></span>
										</div>
										<input type="hidden" name="diagnosis" id="diagnosis" value="5" />
									</div>
									<div class="review-rate-enroll-wrapper">
										<div class="detail-rate-title">시설</div>
										<div class="rating-detail">
											<span class="fa fa-star enroll-rate-facility checked" data-name="facility" data-facility-no="1"></span>
											<span class="fa fa-star enroll-rate-facility checked" data-name="facility" data-facility-no="2"></span>
											<span class="fa fa-star enroll-rate-facility checked" data-name="facility" data-facility-no="3"></span>
											<span class="fa fa-star enroll-rate-facility checked" data-name="facility" data-facility-no="4"></span>
											<span class="fa fa-star enroll-rate-facility checked" data-name="facility" data-facility-no="5"></span>
										</div>
										<input type="hidden" name="facility" id="facility" value="5" />
									</div>
									<div class="review-rate-enroll-wrapper">
										<div class="detail-rate-title">가격</div>
										<div class="rating-detail">
											<span class="fa fa-star enroll-rate-price checked" data-name="price" data-price-no="1"></span>
											<span class="fa fa-star enroll-rate-price checked" data-name="price" data-price-no="2"></span>
											<span class="fa fa-star enroll-rate-price checked" data-name="price" data-price-no="3"></span>
											<span class="fa fa-star enroll-rate-price checked" data-name="price" data-price-no="4"></span>
											<span class="fa fa-star enroll-rate-price checked" data-name="price" data-price-no="5"></span>
										</div>
										<input type="hidden" name="price" id="price" value="5" />
									</div>
								</div>
								<div class="review-enroll-text-wrapper">
									<textarea class="enroll-textarea" id="textarea" name="content" maxlength="300" cols="30" rows="5"></textarea>
									<span id="counter">0<!--  -->자 / 최대<!--  -->300<!--  -->자</span>
								</div>
								<div class="review-enroll-img-wrapper">
									<div class="info-wrapper">
					                    <div class="label-wrapper">
											<label for="file">리뷰 사진</label> 
					                    </div>
										<div id="file-wrapper">
											<input type="file" id='upfile1' name="upfile1" class="hospital-des-img" accept="image/*" hidden/>  
											<input type="file" id='upfile2' name="upfile2" class="hospital-des-img" accept="image/*" hidden/>  
	 										<button class="attach-btn" type="button" >
	 											<img class="attach-img" src="${pageContext.request.contextPath}/resources/images/hospital/add2.png" data-no="1">
	 										</button>
										</div>
	      							</div>
								</div>
								<div class="submit-btn-wrapper">
									<button type="submit" class="submit-btn">등록하기</button>
								</div>
							<sec:authorize access="isAuthenticated()">
								<input type="hidden" id="memberId" name="memberId" value='<sec:authentication property="principal.username"/>'/>
							</sec:authorize>
							<input type="hidden" name="title" value="리뷰${hospital.id}" />
							<input type="hidden" name="id" value="${hospital.id}" />
							</form>
						</div>
					</div>
				</div>
			</article>
		</div>
	</div>
</div>
<script>
const plusReview = document.querySelector(".member-review-list.plus");
const reviewBtn = document.querySelector(".review-btn");

reviewBtn.onclick = () => {
	plusReview.classList.remove("review-none");
	plusReview.classList.add("review-block");
	reviewBtn.classList.add("review-none");
}

const frm = document.reviewFrm;


	// 카카오 지도 API 호출 
	const container = document.getElementById('map');
	let options = {
		center : new kakao.maps.LatLng(${hospital.y}, ${hospital.x}), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};
 
	let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	var markerPosition = new kakao.maps.LatLng(${hospital.y}, ${hospital.x});

	//마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
    contentOverlays  = '<div class="overlay-wrapper">' + 
    '    <div class="infos">' + 
    '        <div class="infos-title">' + 
    `            ${hospital.placeName}` + 
    '        </div>' + 
    '        <div class="infos-body">' + 
    '            <div class="infos-img">' +
    '                <img src="${pageContext.request.contextPath}/resources/images/common/header/Dr.Cat.png" width="73" height="70">' +
    '           </div>' + 
    '            <div class="infos-desc">' + 
    `                <div class="marker-road-address">${hospital.roadAddressName}</div>` + 
    `                <div class="marker-tel">${hospital.tel}</div>` + 
    '            </div>' + 
    '        </div>' + 
    '    </div>' +    
    '</div>';
    
    
    var overlay = new kakao.maps.CustomOverlay({
        content: contentOverlays,
        map: map,
        position: marker.getPosition()       
    });
	
	/* ================================= 모달 ================================= */

	
	// 모달창 오픈용
	// 동물병원 사진 모달
	document.querySelectorAll(".hospital-img").forEach((img) => {
		img.addEventListener('click', (e) => {
			modal = document.querySelector(".hospital-modal");
		
			const modalTitle = document.querySelector(".modal-title");
	        const modalBody = document.querySelector(".modal-content-img");
		    const filename = e.target.dataset.name;
	  
	        modalTitle.innerHTML= filename;
	        modalBody.src = `\${e.target.src}`;
			modal.style.display = 'block';
			
		});
	});
	
	// 리뷰 이미지 모달
	document.querySelectorAll(".review-img").forEach((img) => {
		img.addEventListener('click', (e) => {
			modal = document.querySelector(".hospital-modal");
			console.log(e.target.src);
			const modalTitle = document.querySelector(".modal-title");
	        const modalBody = document.querySelector(".modal-content-img");
	        const filename = e.target.dataset.name;
	        modalTitle.innerHTML= filename;
	        
	        modalTitle.innerHTML= filename;
	        modalBody.src = `\${e.target.src}`;
			modal.style.display = 'block';
			
		});
	});
	
	// 리뷰 영수증 모달
	document.querySelectorAll(".receipt-img").forEach((img) => {
		img.addEventListener('click', (e) => {
			modal = document.querySelector(".hospital-modal");
			console.log(e.target.src);
			const modalTitle = document.querySelector(".modal-title");
	        const modalBody = document.querySelector(".modal-content-img");
	        
	        modalTitle.innerHTML="파일명";
	        modalBody.src = `\${e.target.src}`;
			modal.style.display = 'block';
			
		});
	});
	
	document.querySelector(".close-modal").addEventListener('click', (e) => {
		modal = document.querySelector(".hospital-modal");
		const modalTitle = document.querySelector(".modal-title");
		const modalBody = document.querySelector(".modal-content-img");
		modalBody.src = "";
		modalTitle.innerHTML="";
		modal.style.display = 'none';
	});
	
	
	// 모달 외부 클릭 시 모달 종료
	window.onclick = function(e) {
		modal = document.querySelector(".hospital-modal");
		  if (e .target == modal) {
		    modal.style.display = "none";
		  }
		modal = document.querySelector(".review-modal");  
		  if (e .target == modal) {
				frm.reset();
			    modal.style.display = "none";
			  }
		  
		modal = document.querySelector(".share-modal");
		  if (e .target == modal) {
		    modal.style.display = "none";
		  }  
		}
	
	// 리뷰 작성용폼 모달 
	const writeReview = () => {
		modal = document.querySelector(".review-modal");
		modal.style.display = 'block';
	}
	
	// 리뷰 작성용폼 모달 종료
	document.querySelector(".review-modal-close").addEventListener('click', (e) => {
		modal = document.querySelector(".review-modal");
		const frm = document.reviewFrm;
		frm.reset();
		modal.style.display = 'none';
});
	
	const attachBtn = document.querySelector(".attach-btn");
	const fileWrapper = document.querySelector("#file-wrapper");
	const fileName = "";
	const popArr = [2, 1];
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
	
	// 텍스트에어리어 카운트 
	$(textarea).keyup((e) => {
	    const length = $(e.target).val().length;
	    const lengthText = $(e.target).val().length +"<!--  -->자 / 최대<!--  -->300<!--  -->자";
	  $(counter)
	  .html(0)
	  .html(lengthText);
	});

	// 별점 이벤트 리스너
	let starTypeName = "";
	let starClassName = "";
	let dataNo="";	

	document.querySelectorAll(".fa.fa-star").forEach((star) => {
		star.addEventListener('click', (e) => {
			let starIndex = "";
			starTypeName = star.dataset.name;
		
			switch(starTypeName){
			case "kindness" :
				starClassName = "fa fa-star enroll-rate-kindness checked";
				dataNo = "data-kindness-no";
				starIndex = star.dataset.kindnessNo;
				console.log(starIndex);
				break;
			case "description" :
				starClassName = "fa fa-star enroll-rate-description checked";
				dataNo = "data-description-no";
				starIndex = star.dataset.descriptionNo;
				break;
			case "diagnosis" :
				starClassName = "fa fa-star enroll-rate-diagnosis checked";
				dataNo = "data-diagnosis-no";
				starIndex = star.dataset.diagnosisNo;
				break;
			case "facility" :
				starClassName = "fa fa-star enroll-rate-facility checked";
				dataNo = "data-facility-no";
				starIndex = star.dataset.facilityNo;
				break;
			case "price" :
				starClassName = "fa fa-star enroll-rate-price checked";
				dataNo = "data-price-no";
				starIndex = star.dataset.priceNo;
				break;
			}
			
				if(star.className === starClassName){
					for(let i = 5; starIndex < i; i--){
						document.querySelector(`[\${dataNo}='\${i}']`).classList.remove('checked');
					}
					document.querySelector(`#\${starTypeName}`).value = starIndex;
				}
				else {
					for(let si = 1; si <= starIndex; si++){
						if(star.className !== starClassName){
							let starName = document.querySelector(`[\${dataNo}='\${si}']`);
							starName.classList.add('checked');
						}
					}
					document.querySelector(`#\${starTypeName}`).value = starIndex;
				}
		});
	}); 

frm.addEventListener('submit', (e) => {
		e.preventDefault();
		const memberId = document.querySelector("#memberId").value;;
		const kindnessVal = document.querySelector("#kindness").value;
		const descriptionVal = document.querySelector("#description").value;
		const diagnosisVal = document.querySelector("#diagnosis").value;
		const facilityVal = document.querySelector("#facility").value;
		const priceVal = document.querySelector("#price").value;
		const content = document.querySelector("#textarea").value;
		
	
		if(!content){
			return false;
		}
		
		frm.submit();
});

const kakaoShare = () => {
Kakao.Share.createDefaultButton({
    container: '#create-kakaotalk-sharing-btn',
    objectType: 'location',
    address: '${hospital.roadAddressName}',
    addressTitle: '${hospital.placeName}',
    content: {
      title: '멍냥연구소 동물병원 공유하기!',
      description: '${hospital.placeName} 공유',
      imageUrl:
        '${pageContext.request.contextPath}/resources/images/common/favicon/favicon-96x96.png',
      link: {
        mobileWebUrl: '${pageContext.request.contextPath}/hospital/hospitalDetail?id=${hospital.id}',
        webUrl: '${pageContext.request.contextPath}/hospital/hospitalDetail?id=${hospital.id}',
      },
    },
    buttons: [
      {
        title: '웹으로 보기',
        link: {
        	 mobileWebUrl: '${pageContext.request.contextPath}/hospital/hospitalDetail?id=${hospital.id}',
             webUrl:  '${pageContext.request.contextPath}/hospital/hospitalDetail?id=${hospital.id}',
        },
      },
    ],
  })
}


const copyTxt = (tel) =>{
  	const copyText = document.createElement("textarea");
  	const textVal = tel;
    document.body.appendChild(copyText);
    copyText.value = textVal;
    copyText.select();
    document.execCommand('copy');
    document.body.removeChild(copyText);
    alert('전화번호를 복사하였습니다.');
}

const copyUrl = (hospitalName) =>{
  	const copyText = document.createElement("textarea");
  	const url = window.document.location.href;
    document.body.appendChild(copyText);
    copyText.value = url;
    copyText.select();
    document.execCommand('copy');
    document.body.removeChild(copyText);
	alert(`\${hospitalName}의 url을 복사하였습니다.`);
}

// 공유 모달 
  const openShareModal = () => {
	modal = document.querySelector(".share-modal");
	modal.style.display = 'block';
}

// 공유 모달 종료
document.querySelector(".close-share").addEventListener('click', (e) => {
	modal = document.querySelector(".share-modal");
	modal.style.display = 'none';
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>