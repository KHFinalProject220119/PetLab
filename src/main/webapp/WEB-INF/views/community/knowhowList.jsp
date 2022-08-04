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
	href="${pageContext.request.contextPath}/resources/css/community/knowhow.css" />

<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<section id="community-container" class="container">
<!-- 	<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="goToBoardForm();"/> -->
	<table id="knowhow-board" class="table table-striped table-hover text-center">
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
		<tr>
			<th>전문가 노하우</th>
			<th>일반인 노하우</th>
		</tr>
		<tr>
			<th>총 0개</th>
			<th>최신순</th>
		</tr>
		<tr>
			<th>
				<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="goToBoardForm();"/>
			</th>
		</tr>
	</table>
</section>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</html>