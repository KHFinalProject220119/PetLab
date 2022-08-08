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

	<table id="sg-board" class="table table-striped table-hover text-center">
<jsp:include page="/WEB-INF/views/community/community_header.jsp">
	<jsp:param value="커뮤니티" name="title" />
</jsp:include>	
		<tr>
			<th id="small_hot" colspan="4">지금 가장 핫!한 모임</th>
		</tr>
		<tr>
			<th><img class="danzi" src="${pageContext.request.contextPath}/resources/images/community/yeoulmu.jpg" alt="" /></th>
			<th><img class="eungsam" src="${pageContext.request.contextPath}/resources/images/community/eungsam.jpg" alt="" /></th>
			<th><img class="danzi" src="${pageContext.request.contextPath}/resources/images/community/danzi.jpg" alt="" /></th>
			<th><img class="danzi" src="${pageContext.request.contextPath}/resources/images/community/commi.jpg" alt="" /></th>
		</tr>
		<tr>
			<th>멍냥이즈뭔들</th>
			<th>소모임어때</th>
			<th>소모임나도해</th>
			<th>니가해라소모임</th>
		</tr>
		<tr>
			<th>멤버 23</th>
			<th>멤버 15</th>
			<th>멤버 10</th>
			<th>멤버 3</th>
		</tr>
		<tr>
			<th id="count">총 0개</th>
			<th></th>
			<th></th>
			<th>최신순</th>
		</tr>
		<tr>
			<th colspan="4">
				<input type="button" value="새 모임 만들기" id="btn-add" class="btn btn-outline-success" onclick="goToBoardForm();"/>
			</th>
		</tr>
	</table>

</section>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</html>