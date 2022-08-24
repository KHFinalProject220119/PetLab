<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminnotice/adminNoticeList.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공지사항" name="title"/>
</jsp:include>
<style>
/*글쓰기버튼*/
input#btn-add {float:right; margin: 0 0 15px;}
tr[data-no] {cursor: pointer;}
</style>
<script>
function goToadminNoticeForm(){
	location.href = "${pageContext.request.contextPath}/adminnotice/adminNoticeForm";
}

window.addEventListener('load', (e) => {
	document.querySelectorAll("tr[data-no]").forEach((tr) => {
		tr.addEventListener('click', (e) => {
			// console.log(e.target);	
			const tr = e.target.parentElement;
			// console.log(tr);
			// 특정 선택자와 일치여부 boolean형 반환
			if(tr.matches('tr[data-no]')){
				const no = tr.dataset.no;
				location.href = '${pageContext.request.contextPath}/adminnotice/adminNoticeDetail?no=' + no;
			}
		});
	});
	
});
</script>
	<section id="adminNotice-container" class="container">
		<sec:authorize access="hasRole('ADMIN')">	
			<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="goToadminNoticeForm();"/>
		</sec:authorize>
		<table id="tbl-adminNotice" class="table table-striped table-hover text-center">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>첨부파일</th> <!-- 첨부파일 있을 경우, /resources/images/file.png 표시 width: 16px-->
				<th>조회수</th>
			</tr>
			<c:forEach items="${list}" var="adminNotice" varStatus="vs">
				<tr data-no="${adminNotice.notice_no}">
					<td>${adminNotice.noticeNo}</td>
					<td>${adminNotice.noticeTitle}</td>
					<td>${adminNotice.memberId}</td>
					<td>
						<fmt:parseDate value="${adminNotice.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt"/>
						<fmt:formatDate value="${createdAt}" pattern="MM-dd HH:mm"/>
					</td>
					<td>
						<c:if test="${adminNotice.attachCount gt 0}">
							<img src="${pageContext.request.contextPath}/resources/images/file.png" width="16px" />
						</c:if>
					</td>
					<td>${adminNotice.readCount}</td>
				</tr>
			</c:forEach>
		</table>
		<nav>${pagebar}</nav>
	</section> 


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
