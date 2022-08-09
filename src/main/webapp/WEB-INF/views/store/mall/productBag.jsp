<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet"
	href="${ path }/resources/css/store/productMain.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="이동가방" name="title" />
</jsp:include>

<h1>이동가방</h1>



<section class="lists">

<!--썸네일띄우기 -->

<!--썸네일 이미지 부분 끝-->


<!--상품 정보 시작-->
<div class="product-cover-list">
	<c:if test="${empty list}">
		<tr>
			<td colspan="6" class="text-center">등록된 상품이 없습니다.</td>
		</tr>
	</c:if>

	<c:if test="${not empty list}">
		<c:forEach items="${list}" var="product" varStatus="vs">
			<c:set var="product.categorySubId" value="bag" />
			<c:if test="${product.categorySubId eq 'bag' }">
			
			
			<div class="pro_cate_name">
			<a href="${path}/store/mall/ProductDetail?no=${product.productNo}" >
	<c:forEach items="${attlist}" var="attlist">
									<img class="img_des"
											src="${path}/resources/upload/store/mall/${attlist.renamedFilename}"><br>
												</c:forEach>
															

			<span class="product_sub_catgory">[${product.categorySubId}]</span>
			<span class="product_name">${product.productName}</span>
			</div>
			<span class="product_price"><b><fmt:formatNumber value="${product.productPrice}"
								pattern="#,###" /></b>원</span></a>				
			</c:if>

		</c:forEach>
	</c:if>
<!--상품정보끝-->
</div>


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>