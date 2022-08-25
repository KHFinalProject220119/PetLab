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


	<button id="cart-del" class="cart-del">장바구니 전체삭제</button>
	<form action="${path}/store/cart/deleteAllCart" id="deleteFrm">
	</form>



<script>
	$("#cart-del").click(function() {
		if (!confirm("장바구니 전체를 삭제하시겠습니까?"))
			return;
		$("#deleteFrm").submit();
	});
</script>

<section>
	<h3>장바구니 목록</h3>

	<c:if test="${empty cartList}">
		<p>장바구니가 비어있음</p>
	</c:if>
	
	
	<c:forEach items="${cartList}" var="cart">

	<div class="cartlists">
<%-- 	<span class="cart_no">[${cart.cartNo}]</span><br> --%>
	<span class="cart_product_no">상품번호: ${cart.productNo}</span><br>
	
	<span class="cart_product_price">
	상품가격: 
	<fmt:formatNumber value="${cart.productPrice}"
					pattern="#,###" /></b>원
	</span><br>
	
	<span class="cart_product_qty">수량: ${cart.productCount}</span><br>
	<span class="cart_product_name">상품명: ${cart.productName}</span><br><br>
	
	<span class="cart_product_total_price">총 결제금액: 
	<c:set var="total" value="${cart.productPrice * cart.productCount}"/>
	<c:set var="sum" value="${sum+total }" />
	
	<fmt:formatNumber value="${sum}"
					pattern="#,###" /></b>원
	
	</span>
	<br>

	</div>
	
	
	</c:forEach>


</section>




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>