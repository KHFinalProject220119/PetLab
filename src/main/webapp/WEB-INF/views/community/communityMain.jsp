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
<meta charset="UTF-8">
<title></title>
</head>
<body>
<section id="community-container" class="container">
<!-- 	<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="goToBoardForm();"/> -->
	<table id="cm-board" class="table table-striped table-hover text-center">
		<tr>
			<span><img class="menu-logo" src="${pageContext.request.contextPath}/resources/images/common/header/CatWithAPencil.png" alt="" /></span>
			커뮤니티
		</tr>
		<tr>
			<th><a href="${pageContext.request.contextPath}/community/smallGroupMain">소모임</a></th>
			<th><a href="${pageContext.request.contextPath}/community/knowhowList">노하우</a></th>
			<th><a href="${pageContext.request.contextPath}/community/freeBoardList">자유게시판</a></th>
			<th><a href="${pageContext.request.contextPath}/community/photoList">멍냥이 갤러리</a></th>
		</tr>
		<c:forEach items="${list}" var="board" varStatus="vs">
			<tr data-no="${board.no}">
				<td>${board.no}</td>
				<td>${board.title}</td>
				<td>${board.memberId}</td>
				<td>
					<fmt:parseDate value="${board.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt"/>
					<fmt:formatDate value="${createdAt}" pattern="MM-dd HH:mm"/>
				</td>
				<td>
					<c:if test="${board.attachCount gt 0}">
						<img src="${pageContext.request.contextPath}/resources/images/file.png" width="16px" />
					</c:if>
				</td>
				<td>${board.readCount}</td>
			</tr>
		</c:forEach>
	</table>
	<nav>${pagebar}</nav>
</section> 


</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</html>