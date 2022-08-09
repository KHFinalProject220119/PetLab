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
	<table id="photo-board" class="table table-striped table-hover text-center">
		<tr>
			<th id="photo_best" colspan="6">가장 인기있는 사진 명예의 전당</th>
		</tr>
		<tr>
			<th colspan="2" class="prize1">1등</th>
			<th colspan="2" class="prize2">2등</th>
			<th colspan="2" class="prize3">3등</th>
		</tr>
		<tr>
			<th colspan="2"><img class="pet" src="${pageContext.request.contextPath}/resources/images/community/yeoulmu.jpg" alt="" /></th>
			<th colspan="2"><img class="pet" src="${pageContext.request.contextPath}/resources/images/community/eungsam.jpg" alt="" /></th>
			<th colspan="2"><img class="pet" src="${pageContext.request.contextPath}/resources/images/community/danzi.jpg" alt="" /></th>
		</tr>
		<tr>
			<th id="content">율무 원하면 다해~</th>
			<th id="best_count"><img class="best" src="${pageContext.request.contextPath}/resources/images/community/like.png" alt="" />32</th>
			<th id="content">이쁘죠~</th>
			<th id="best_count"><img class="best" src="${pageContext.request.contextPath}/resources/images/community/like.png" alt="" />22</th>
			<th id="content">뭐시랑가~</th>
			<th id="best_count"><img class="best" src="${pageContext.request.contextPath}/resources/images/community/like.png" alt="" />19</th>
		</tr>
		<tr>
			<th id="writer">박양</th>
			<th id="enroll_date">2022.08.10</th>
			<th id="writer">멍멍</th>
			<th id="enroll_date">2022.08.10</th>
			<th id="writer">캣짱</th>
			<th id="enroll_date">2022.08.10</th>
		</tr>
		<tr>
			<th id="count">총 0개</th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th>최신순</th>
		</tr>
		<tr>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th>
				<button type="button" id="btn-add-photo" class="btn_photo" onclick="goToBoardForm();">사진 올리기</button>
				<!-- 마우스를 가져갈 시 커서 뿐 아니라 그라데이션 물결 효과를 얻고싶다아아...왜안되니.... -->
			</th>
		</tr>
	</table>
</section>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</html>