<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet"
	href="${ path }/resources/css/store/cartList.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="장바구니" name="title" />
</jsp:include>




<section>
	<h3>장바구니 목록</h3>

	<c:if test="${empty cartList}">
		<p>장바구니가 비어있음</p>
	</c:if>
	
	
	<c:forEach items="${cartList}" var="cart">
	

	</c:forEach>


</section>




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>