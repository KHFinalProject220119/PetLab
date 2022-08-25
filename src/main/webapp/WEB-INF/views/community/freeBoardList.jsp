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
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<section id="community-container" class="container">
		<jsp:include page="/WEB-INF/views/community/community_header.jsp">
			<jsp:param value="커뮤니티" name="title" />
		</jsp:include>
		<table id="free-board"
			class="table table-striped table-hover text-center">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<!-- 첨부파일 있을 경우, /resources/images/file.png 표시 width: 16px-->
				<th>조회수</th>
			</tr>
			<c:forEach items="${list}" var="communityFreeBoard" varStatus="vs">
				<tr data-no="${communityFreeBoard.freebNo}">
					<td>${communityFreeBoard.freebNo}</td>
					<td>${communityFreeBoard.freebTitle}</td>
					<td>${communityFreeBoard.memberId}</td>
					<td>${communityFreeBoard.regDate}</td>
					<td>${communityFreeBoard.readCount}</td>
				</tr>
			</c:forEach>
		</table>
		<%-- 	<nav>${pagebar}</nav> --%>
		<button type="button" id="btn-add-free" class="btn_free">
			<a href="${pageContext.request.contextPath}/community/freebEnroll">글쓰기
			</a>
		</button>
	</section>

	<!-- 			<table>
				<tr>
					<th>총 0개</th>
					<th>최신순</th>
				</tr>

			</table> -->
	<script>
	window.addEventListener('load', (e) => {
		document.querySelectorAll("tr[data-no]").forEach((tr) => {
			tr.addEventListener('click', (e) => {
				// console.log(e.target);	
				const tr = e.target.parentElement;
				// console.log(tr);
				// 특정 선택자와 일치여부 boolean형 반환
				if(tr.matches('tr[data-no]')){
					const no = tr.dataset.no;
					location.href = '${pageContext.request.contextPath}/community/communityFreeBoardDetail.do?no=' + no;
				}
			});
		});
		
	});		
	</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</html>