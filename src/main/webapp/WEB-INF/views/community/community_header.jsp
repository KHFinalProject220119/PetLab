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
	href="${pageContext.request.contextPath}/resources/css/community/community_header.css" />
<head>
<body>

<div class="section-tab-container">
	<ul class="tab-list tab-list--block">
		<li class="on">
			<a href="${pageContext.request.contextPath}/community/smallGroupMain">소모임</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/community/knowhowList">노하우</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/community/freeBoardList">자유게시판</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/community/photoList">멍냥이 갤러리</a>
		</li>
		</ul>
	</div>

</body>
</html>