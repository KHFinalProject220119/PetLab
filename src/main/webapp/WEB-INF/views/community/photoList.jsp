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

	<table id="photo-board" class="table table-striped table-hover text-center">
<jsp:include page="/WEB-INF/views/community/community_header.jsp">
	<jsp:param value="커뮤니티" name="title" />
</jsp:include>	
		<tr>
			<th>가장 인기있는 사진 명예의 전당</th>
		</tr>
		<tr>
			<th>1등</th>
			<th>2등</th>
			<th>3등</th>
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