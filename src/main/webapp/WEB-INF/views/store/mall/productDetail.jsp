<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet"
	href="${ path }/resources/css/store/productDetail.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="상세보기" name="title" />
</jsp:include>

<sec:authorize access="hasRole('MALL')">

	<a href="${path}/store/mall/updateProduct?no=${product.productNo}"
		class="insert-update-btn"> <span class="update-btn">상품수정</span>
	</a>

	<button id="btn-delete" class="btn-delete">삭제</button>
	<form action="${path}/store/mall/deleteProduct" id="deleteFrm">
		<input type="hidden" name="productNo" value="${product.productNo}" />
	</form>

</sec:authorize>

<script>
	$("#btn-delete").click(function() {
		if (!confirm("상품을 삭제하시겠습니까?"))
			return;
		$("#deleteFrm").submit();
	});
</script>




<section class="content">

<!--상품 썸네일 시작 -->
	<div class="img-content">
		<c:forEach items="${ product.attachments }" var="attach">
			<img class="imgg"
				src="${path}/resources/upload/store/mall/${attach.renamedFilename}">
	</div>
	</c:forEach>
	<!--썸네일 끝-->
	
	<!--상품 기본정보 -->
		<br> <span class="product_name">${product.productName}<!--별점이 들어갈 공간-->
	</span>
	<div class="product_price">
		<b><fmt:formatNumber value="${product.productPrice}"
				pattern="#,###" /></b>원
	</div>
	<div class="product_des">${product.productDes}</div>
	<!--상품 기본정보 끝 -->
	
	
	<!--상품 상세 이미지 시작-->
		<c:if test="${empty productdes.att}">
		<p>상품 상세이미지 없음</p>
		</c:if>
		
				<c:if test="${not empty productdes.att}">
				<c:forEach items="${ productdes.att }" var="attach">
			<img class="img_des"
				src="${path}/resources/upload/store/mall/${attach.renamedFilename}">
	</div>
	</c:forEach>
		</c:if>
		<!--상세이미지 끝-->
	
</section>

<!--장바구니/ 결제-->
<div class="cart_and_buy">
	<div class="cart_add">
		<a href="${path}/store/cart/addCart" class="add-cart"> <img
			src="${path}/resources/images/store/cart.png" width=44px;> <!-- <span class="cart-btn">장바구니</span> -->
		</a>
	</div>

	<a href="${path}/store/pay" class="pay-product"> <span
		class="pay-btn">구매하기</span>
	</a>
</div>
<!--장바구니/ 결제 끝-->


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>