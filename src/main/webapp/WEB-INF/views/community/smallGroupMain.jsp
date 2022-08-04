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
	href="${pageContext.request.contextPath}/resources/css/community/smallGroupMain.css" />

<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<section id="community-container" class="container">


			<span><img class="menu-logo" src="${pageContext.request.contextPath}/resources/images/common/header/CatWithAPencil.png" alt="" /></span>
			커뮤니티

	<table id="sg-board" class="table table-striped table-hover text-center">

		<tr id="top_menu">
			<th><a href="${pageContext.request.contextPath}/community/smallGroupMain">소모임</a></th>
			<th><a href="${pageContext.request.contextPath}/community/knowhowList">노하우</a></th>
			<th><a href="${pageContext.request.contextPath}/community/freeBoardList">자유게시판</a></th>
			<th><a href="${pageContext.request.contextPath}/community/photoList">멍냥이 갤러리</a></th>
		</tr>
		<tr id="small_hot">
			<br><br><br><br>
			<th colspan="4">지금 가장 핫!한 모임</th>
		</tr>
		<tr>
			<th>총 0개</th>
			<th>최신순</th>
		</tr>
		<tr>
			<th>
				<input type="button" value="새 모임 만들기" id="btn-add" class="btn btn-outline-success" onclick="goToBoardForm();"/>
			</th>
		</tr>
	</table>

</section>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</html>