<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminnotice/adminNoticeDetail.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판 상세보기" name="title"/>
</jsp:include>
<style>
input, button, textarea {margin-bottom:15px;}
button { overflow: hidden; }
</style>

<div id="adminNoticeDetail-container">
	<div class="top-title-wrapper">
		<div class="top-title">공지사항 게시글</div>
	</div>
	<div class="body-content-wrapper">
		<div class="input-wrapper">
			<input type="text" class="form-control" 
				   placeholder="제목" name="adminNoticeTitle" id="title" 
				   value="${adminNotice.noticeTitle}" required readonly>

			<input type="hidden" class="form-control" 
				   name="memberId" 
				   value="${adminNotice.memberId}" readonly required>
		</div>
		
			<c:if test="${not empty adminNotice.attachments}">
				<c:forEach items="${adminNotice.attachments}" var="attach" varStatus="vs">
					<div class="img-container">
						<div class=img-wrapper>
							<img class="attach-img" src="${pageContext.request.contextPath}/resources/upload/adminNotice/${attach.renamedFilename}">
						</div>			
						<button 
							type="button" 
							class="btn btn-outline-success btn-block attach"
							value="${attach.attachNo}">
							첨부파일${vs.count} - ${attach.originalFilename}
						</button>
					</div>
				</c:forEach>
			</c:if>
			
		    <textarea class="form-control" name="content" 
		    		  placeholder="내용" required readonly>${adminNotice.content}</textarea>
			<input type="datetime-local" class="form-control" name="created_at" 
				   value='${adminNotice.regDate}' readonly>
			<c:if test="${not empty loginMember && loginMember.memberId eq adminNotice.memberId}">
				<button 
					type="button" 
					class="btn btn-outline-primary btn-block"
					onclick="location.href='${pageContext.request.contextPath}/adminnotice/adminNoticeUpdate?no=${adminNotice.notice_no}';">수정</button>
			</c:if>
	</div>
</div>
<script>
document.querySelectorAll(".attach").forEach((btn) => {
	btn.addEventListener("click", (e) => {
		const attachNo = e.target.value;
		console.log(attachNo);
		location.href = `${pageContext.request.contextPath}/attachment/fileDownload?no=\${attachNo}`;
	});
});
</script>

<style>
	textarea {
		width: 80%;
		hight: 100 rem;
		padding: 10px;
		box-sizing: border-box;
		border: 2px solid #FF9900;
		border-radius: 5px;
		font-size: 16px;
		resize: both;
	}
		
	input {
	  	width: 80%;
		padding: 10px;
		box-sizing: border-box;
		border: 2px solid #FF9900;
		border-radius: 5px;
		font-size: 16px;
		resize: both;
}
	</style>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>