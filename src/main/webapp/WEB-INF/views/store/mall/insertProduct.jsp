<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
    <c:set var="path" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet"
	href="${ path }/resources/css/store/insertProduct.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="상품 등록하기" name="title" />
</jsp:include>


<h1 style="text-align:center">상품 등록하기</h1>

<div class="insertpro">
<form id="insertFrm" name="insertFrm" method="POST" 
action="${pageContext.request.contextPath}/store/mall/insertProduct?${_csrf.parameterName}=${_csrf.token}" 
enctype="multipart/form-data">
<table class="product-enroll">
<!-- <tr>
<th>상품 ID  </th>
<td><input class="tbl-enroll-product"  type="text" name="productId" required></td>
</tr> -->
<tr>

<th><span class="menu">메인 카테고리</span> </th>
<td>
<div class="selectBox">
<select id="categoryId" name="categoryId" class="select">
<option value="feed">사료</option>
<option value="bath">목욕/위생/미용</option>
<option value="etc">기타용품</option>
</select></div>
</td></tr>

<tr>
<th><span class="menu">서브 카테고리</span> </th>
<td>
<div class="selectBox">
<select id="categorySubId" name="categorySubId" class="select">
<option value="feedd">사료</option>
<option value="snack">간식</option>
<option value="feeding">급식/급수기</option>
<option value="shampoo">샴푸/세정제</option>
<option value="pad">배변판/패드</option>
<option value="brush">브러쉬/가위</option>
<option value="toy">장난감/스크래쳐</option>
<option value="bag">이동가방</option>
</select></div>
</td>
</tr>

<!-- <tr>
<th>첨부파일 그룹 입력</th>
<td>
<select id="attachgroupId" name="attachgroupId">
<option value="store_feed">사료</option>
<option value="store_bath">목욕/위생/미용</option>
<option value="store_etc">기타</option>
</select>

</td>
</tr>
 -->
<tr>
<th><span class="menu">상품 썸네일</span> </th>
<td>			
<input type="file" class="input-file-btn" name="upFile">
</td>
</tr>


<tr>
<th><span class="menu">상품 상세 이미지</span> </th>
<td>			
			<input type="file" class="input-file-btn" name="desFile">
</td>
</tr>




<tr>
<th><span class="menu">상품명</span> </th>
<td><input class="tbl-input"  id="productName" type="text" name="productName"></td>
</tr>


<tr>
<th><span class="menu">상품가격</span> </th>
<td><input class="tbl-input"  id="productprice" type="text" name="productPrice"></td>
</tr>
<tr>
<th><span class="menu">상품설명</span> </th>
<td><input class="tbl-input"  id="productdes" type="text" name="productDes"></td>
</tr>

</td></tr>

</table>
<button type="submit" class="btn-enroll">등록하기</button>
</form>
</div>


<script>
/* categorySubId.addEventListener('change', (e) => {
	const{value}  = e.target;
	console.log(value);
});
 */
 
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>