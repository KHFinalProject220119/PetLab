<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="상품 등록하기" name="title" />
</jsp:include>
<h1 style="text-align:center">상품 등록하기</h1>
<form id="insertFrm" name="insertFrm" method="POST" 
action="${pageContext.request.contextPath}/store/mall/insertProduct?${_csrf.parameterName}=${_csrf.token}" 
enctype="multipart/form-data">
<table class="product-enroll">
<!-- <tr>
<th>상품 ID  </th>
<td><input class="tbl-enroll-product"  type="text" name="productId" required></td>
</tr> -->
<tr>
<th>메인 카테고리 </th>
<td>
<select id="categoryId" name="categoryId">
<option value="feed">사료</option>
<option value="bath">목욕/위생/미용</option>
<option value="etc">기타용품</option>
</select>
<select id="categorySubId" name="categorySubId">
<option value="feed">사료</option>
<option value="snack">간식</option>
<option value="feeding">급식/급수기</option>
<option value="shampoo">샴푸/세정제</option>
<option value="pad">배변판/패드</option>
<option value="brush">브러쉬/가위</option>
<option value="toy">장난감/스크래쳐</option>
<option value="bag">이동가방</option>
</select>
</td>
</tr>
<tr>
<th>상품 썸네일</th>
<td><input type="file" name="attachNo" id="thumbnail" title="thumbnail" /></td>
<th>상세 사진</th>
<td><input type="file" multiple="multiple" name="attachNo" id="descimg" title="descimg" /></td>
</tr>
<!-- <tr>
<th>브랜드 ID</th>
<td><input class="tbl-enroll-brand"  id="brandId" name="brandId"></td>
</tr> -->
<tr>
<th>상품명</th>
<td><input class="tbl-enroll-name"  id="productName" type="text" name="productName"></td>
</tr>
<tr>
<th>상품가격</th>
<td><input class="tbl-enroll-price"  id="productprice" type="text" name="productPrice"></td>
</tr>
<tr>
<th>상품설명</th>
<td><input class="tbl-enroll-des"  id="productdes" type="text" name="productDes"></td>
</tr>

<button type="submit" id="btn-enroll">등록</button>
</table>
</form>


<script>
categorySubId.addEventListener('change', (e) => {
	const{value}  = e.target;
	console.log(value);
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>