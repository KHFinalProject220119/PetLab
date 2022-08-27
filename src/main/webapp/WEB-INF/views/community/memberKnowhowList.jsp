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

<jsp:include page="/WEB-INF/views/community/community_header.jsp">
	<jsp:param value="커뮤니티" name="title" />
</jsp:include>	
  <div id="Pmypage-submenu" class="submenu">
    <ul id="sub">
         <li><a href="${pageContext.request.contextPath}/community/doctorKnowhowList" onmouseover="mousein(this);" onmouseout="mouseout(this)">전문가 노하우</a></li>
 	     <li><a href="${pageContext.request.contextPath}/community/memberKnowhowList" onmouseover="mousein(this);" onmouseout="mouseout(this)">일반인 노하우</a></li>
 	</ul>
 </div>
		<table id="mknowhow-board"
			class="table table-striped table-hover text-center">
		<tr>
			<th>총 0개</th>
			<th>최신순</th>
		</tr>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<!-- 첨부파일 있을 경우, /resources/images/file.png 표시 width: 16px-->
				<th>조회수</th>
			</tr>
			<c:forEach items="${list}" var="communityMknowBoard" varStatus="vs">
				<tr data-no="${communityMknowBoard.mknowbNo}">
					<td>${communityMknowBoard.mknowbNo}</td>
					<td>${communityMknowBoard.mknowbTitle}</td>
					<td>${communityMknowBoard.memberId}</td>
					<td>${communityMknowBoard.regDate}</td>
					<td>${communityMknowBoard.readCount}</td>
				</tr>
			</c:forEach>
		</table>
		<%-- 	<nav>${pagebar}</nav> --%>
		<button type="button" id="btn-add-free" class="btn_free">
			<a href="${pageContext.request.contextPath}/community/memberKhowEnroll">글쓰기
			</a>
		</button>
</section>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</html>