<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판 상세보기" name="title"/>
</jsp:include>
<style>
div#board-container{width:400px;}
input, button, textarea {margin-bottom:15px;}
button { overflow: hidden; }
</style>

<div id="fboard-container" class="mx-auto text-center">
	<input type="text" class="form-control" 
		   placeholder="제목" name="boardTitle" id="title" 
		   value="${communityFreeBoard.title}" required readonly>
	<input type="text" class="form-control" value="${communityFreeBoard.member.name} ${board.member.email}" readonly/>
	<input type="hidden" class="form-control" 
		   name="memberId" 
		   value="${communityFreeBoard.memberId}" readonly required>

	<c:if test="${not empty communityFreeBoard.attachments}">
		<c:forEach items="${communityFreeBoard.attachments}" var="attach" varStatus="vs">		
			<button 
				type="button" 
				class="btn btn-outline-success btn-block attach"
				value="${attachment.attachNo}">
				첨부파일${vs.count} - ${attachment.originalFilename}
			</button>
		</c:forEach>
	</c:if>
	
    <textarea class="form-control" name="content" 
    		  placeholder="내용" required readonly>${communityFreeBoard.content}</textarea>
    <input type="number" class="form-control" name="readCount" title="조회수"
		   value="${communityFreeBoard.readCount}" readonly>
	<input type="datetime-local" class="form-control" name="created_at" 
		   value='${communityFreeBoard.createdAt}' readonly>
	<c:if test="${not empty loginMember && loginMember.memberId eq board.memberId}">
		<button 
			type="button" 
			class="btn btn-outline-primary btn-block"
			onclick="location.href='${pageContext.request.contextPath}/board/boardUpdate.do?no=${board.no}';">수정</button>
	</c:if>
</div>
<script>
document.querySelectorAll(".attach").forEach((btn) => {
	btn.addEventListener("click", (e) => {
		const attachNo = e.target.value;
		console.log(attachNo);
		location.href = `${pageContext.request.contextPath}/community/upload?no=\${attachNo}`;
	});
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
