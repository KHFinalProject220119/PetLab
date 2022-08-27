<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="커뮤니티" name="title" />
</jsp:include>
<sec:authentication property="principal" var="loginMember" />
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>


	<section id="container">
		<div id="myboard2">
			<div>
				<h2>게시글 작성</h2>
				<form:form name="boardEnrollFrm" method="post"
					enctype="multipart/form-data">
					<table id="tbl-board-view">
						<tr>
							<th>제 목</th>
							<td><input type="text" name="pTitle" required></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="memberId"
								value="${loginMember.memberId}" readonly /></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td><input type="file" name="upFile"> <br> <!-- <input type="file" name="upFile2"> -->
							</td>
						</tr>
						<tr>
							<th>내 용</th>
							<td><textarea onkeyup="adjustHeight();" id="content"
									name="pContent"></textarea></td>
						</tr>
					</table>
					<button style="float: right;" id="btn-submit" class="btn"
						type="submit"
						onclick="location.href='${pageContext.request.contextPath}/community/enroll';">등록하기</button>
				</form:form>
			</div>
			<div></div>
		</div>
	</section>

</body>
</html>