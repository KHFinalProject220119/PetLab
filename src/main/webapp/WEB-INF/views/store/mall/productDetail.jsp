<%@page import="com.kh.petlab.member.model.dto.Member"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

	<form method="post"
		action="<c:url value='/store/cart/addCart?${_csrf.parameterName}=${_csrf.token}' />">

		<!--상품 썸네일 시작 -->
		<div class="img-content">
			<c:forEach items="${ product.attachments }" var="attach">
				<img class="imgg"
					src="${path}/resources/upload/store/mall/${attach.renamedFilename}">
		</div>
		</c:forEach>
		<!--썸네일 끝-->

		<!--상품 기본정보 -->
		<div class="inform">
		<br> <span class="product_name">${product.productName}
		</span>
		<div class="product_price">
			<b><fmt:formatNumber value="${product.productPrice}"
					pattern="#,###" /></b>원
		</div>
		<div class="product_des">${product.productDes}</div>
		</div>
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

<%
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    Member loginMember = (Member) authentication.getPrincipal(); 
%>
<sec:authentication property="principal" var="loginMember" scope="page"/>
<!--장바구니/ 결제-->
<div class="cart_and_buy">
    <div class="cart_add">
    <sec:authorize access="isAuthenticated()">
   <input type="text" name="memberId" value="${loginMember.memberId}" hidden readonly/>

<c:if test="${not empty loginMember.memberId}">
	<input type="hidden" name="productNo" value="${product.productNo}" />
	<input type="hidden" name="productName" value="${product.productName}" />
	<input type="hidden" name="productPrice" value="${product.productPrice}" />
                                    <input type="submit" id="insertCart" value="장바구니에 담기">
                                  <!--   <input type="button" id="insertOrder" value="바로 주문하기"> -->
                              </c:if>
                              
    </sec:authorize>

</div>
</div>

</form>
<!--장바구니/ 결제 끝-->

<script>
	/* function cartSubmit(){
	 if($("#memberId").val()){
	 $("#cart").attr("action", "${ pageContext.request.contextPath }/store/cart/addCart")
	 .submit();
	 } */
	$("#btn-cart").click(function() {
		if (!confirm("상품을 추가?"))
			return;
		$("#cartFrm").submit();
	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>