<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="커뮤니티" name="title" />
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/community/communityMain.css" />

<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/community/bootstrap.min.css" />

<meta charset="UTF-8">
<title></title>
</head>
<body>
	<section id="community-container" class="container">
		<jsp:include page="/WEB-INF/views/community/community_header.jsp">
			<jsp:param value="커뮤니티" name="title" />
		</jsp:include>
		<table id="photo-board"
			class="table table-striped table-hover text-center">
			<tr>
				<th id="photo_best" colspan="6">가장 인기있는 사진 명예의 전당</th>
			</tr>
			<tr>
				<th colspan="2" class="prize1">1등</th>
				<th colspan="2" class="prize2">2등</th>
				<th colspan="2" class="prize3">3등</th>
			</tr>

			<c:if test="${not empty bestList}">
				<c:forEach items="${bestList}" var="photo">
					<c:forEach items="${photo.attachments}" var="attachment">
						<tr>
							<th colspan="2"><img class="attach_photo"
								src="${pageContext.request.contextPath}/resources/upload/community/${attachment.renamedFilename}"
								alt="" data-name="${attachment.originalFilename}"
								<%-- 							data-memberId="${list.memberId}" data-content="${list.pContent}"
							data-title="${list.pTitle}" data-likeCnt="${list.likeCount}"
							data-readCnt="${list.readCount}" data-photoNo="${list.photoNo}" --%>
							class="review-img" /></th>
							<th colspan="2"><img class="attach_photo"
								src="${pageContext.request.contextPath}/resources/upload/community/${attachment.renamedFilename}"
								alt="" data-name="${attachment.originalFilename}"
								<%-- 							data-memberId="${list.memberId}" data-content="${list.pContent}"
							data-title="${list.pTitle}" data-likeCnt="${list.likeCount}"
							data-readCnt="${list.readCount}" data-photoNo="${list.photoNo}" --%>
							class="review-img" /></th>
							<th colspan="2"><img class="attach_photo"
								src="${pageContext.request.contextPath}/resources/upload/community/${attachment.renamedFilename}"
								alt="" data-name="${attachment.originalFilename}"
								<%-- 							data-memberId="${list.memberId}" data-content="${list.pContent}"
							data-title="${list.pTitle}" data-likeCnt="${list.likeCount}"
							data-readCnt="${list.readCount}" data-photoNo="${list.photoNo}" --%>
							class="review-img" /></th>
						</tr>

						<tr>
							<th>제목</th>
							<th>좋아요</th>
							<th>제목</th>
							<th>좋아요</th>
							<th>제목</th>
							<th>좋아요</th>
						</tr>
						<tr>
							<th>${photo.PTitle}</th>
							<th>좋아요</th>
							<th>${photo.PTitle}</th>
							<th>좋아요</th>
							<th>${photo.PTitle}</th>
							<th>좋아요</th>
						</tr>
						<tr>
							<th>작성자</th>
							<th>작성일</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
						<tr>
							<th>${photo.memberId}</th>
							<th>작성일</th>
							<th>${photo.memberId}</th>
							<th>작성일</th>
							<th>${photo.memberId}</th>
							<th>작성일</th>
						</tr>
					</c:forEach>

					<%-- 
					<tr data-no="${photo.photoNo}">
						<td colspan="2">${photo.photoNo}</td> --%>
				</c:forEach>
			</c:if>
			<tr>
				<!-- 첨부파일 있을 경우, /resources/images/file.png 표시 width: 16px-->
				<!-- 				<th>조회수</th> -->
			</tr>
			<%-- 			<c:forEach items="${list}" var="board" varStatus="vs">
				<tr data-no="${board.no}">
					<td>${board.no}</td>
					<td>${board.title}</td>
					<td>${board.memberId}</td>
					<td><fmt:parseDate value="${board.createdAt}"
							pattern="yyyy-MM-dd'T'HH:mm" var="createdAt" /> <fmt:formatDate
							value="${createdAt}" pattern="MM-dd HH:mm" /></td>
					<td><c:if test="${board.attachCount gt 0}">
							<img
								src="${pageContext.request.contextPath}/resources/images/file.png"
								width="16px" />
						</c:if></td>
					<td>${board.readCount}</td>
				</tr>
			</c:forEach> --%>



			<tr>
				<th id="count">총 0개</th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th>최신순</th>
			</tr>
		</table>
		<table id="photo-board2"
			class="table table-striped table-hover text-center">
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th id="btn_photo_add">
					<button type="button" id="btn-add-photo" class="btn_photo">
						<a href="${pageContext.request.contextPath}/community/enroll">사진 올리기 
					</button> <!-- 마우스를 가져갈 시 커서 뿐 아니라 그라데이션 물결 효과를 얻고싶다아아...왜안되니.... -->
				</th>
			</tr>
		</table>

	</section>
	<!-- //<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">상세보기</button> -->
	<!-- Modal -->
	<div class="modal" id="petModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"></h5>
					<button type="button" type="button" class="btn-close"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="pContent">
						<span class="textTitle">내용 : 이것은
							내용입니다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</span>
					</div>
					<div class="memberId">
						<span class="textId"></span>
					</div>
					<div class="attach">
						<img class="modal_image" alt=""
							src="${pageContext.request.contextPath}/resources/upload/community/${attachment.renamedFilename}">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" type="button" class="btn btn-secondary">닫기</button>
				</div>
			</div>
		</div>
	</div>


	<script>
	document.querySelectorAll(".attach_photo").forEach((petmodal) => {
		petmodal.addEventListener('click', (e) => {
			modals = document.querySelector("#petModal");
			const modalTitle = document.querySelector(".modal-title");
			const memberId = document.querySelector(".textId");
			const text = document.querySelector(".textTitle")
			const attach = document.querySelector(".modal_image");
			modals.style.display = "block";
			
			const fileName = e.target.dataset.name;
			
			modalTitle.innerHTML = fileName;
			
			text.value = document.querySelector("#image_text").value;
			memberId.innerHTML = "honggd";
			
			attach.src=`\${e.target.src}`;
			attach.style.width= "10rem";
			attach.style.height= "10rem";
			
		});
	});
	
	window.onclick = function(e) {
		modals = document.querySelector("#petModal");
		if(e.target == modals){
			modals.style.display = "none";
		}	
	}
	
	document.querySelector(".btn-close").addEventListener('click', (e) => {
		modals = document.querySelector("#petModal");
		modals.style.display = "none";
	});
	document.querySelector(".btn.btn-secondary").addEventListener('click', (e) => {
		modals = document.querySelector("#petModal");
		modals.style.display = "none";
	});
	

</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</html>