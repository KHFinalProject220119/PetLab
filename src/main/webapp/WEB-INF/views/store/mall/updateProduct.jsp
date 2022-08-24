<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
 <link rel="stylesheet"
	href="${ path }/resources/css/store/updateProduct.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="상품 수정하기" name="title" />
</jsp:include>

<div id="board-container">
<h2>상품 수정하기</h2>
	<form 
		name="boardFrm" 
		action="${path}/store/mall/updateProduct?${_csrf.parameterName}=${_csrf.token}" 
		method="post"
		enctype="multipart/form-data">
		
<span class="menu">상품명</span>
<input type="text" class="form-control" name="productName" id="productName" value="${product.productName}" >
<br>


<span class="menu">상품가격</span>
<input type="text" class="form-control" name="productPrice" id="productPrice" value="${product.productPrice}" >
<br>
<span class="menu">상품설명</span>
<input type="text" class="form-control" name="productDes" id="productDes" value="${product.productDes}" >
<br>
<%-- 		<c:if test="${ not empty product.attachments}">
			<c:forEach items="${ product.attachments }" var="attach" varStatus="vs">

		
	            	<label class="btn-block" title="${attach.originalFilename} 삭제">
	                	<input type="checkbox" id="delFile${vs.count}" name="delFile" value="${attach.No}">
						<c:if test="${fn:length(attach.originalFilename) ge 30}">
							${fn:substring(attach.originalFilename, 0, 30)}... 삭제
						</c:if> 
						<c:if test="${fn:length(attach.originalFilename) lt 30}">
							${attach.originalFilename} 삭제
						</c:if>
	            	</label>
			</c:forEach>
		</c:if> --%>
		
<!-- 		<div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">첨부파일</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
		    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
		  </div>
		</div>
		 -->
		<br />
	<input type="hidden" name="productNo" value="${product.productNo}" />
		<input type="submit" class="update-btn" value="수정" >
		
		<a href="${path}/store/mall/ProductDetail?no=${product.productNo}"> 
		<span class="back-btn">취소</span>
	</a>
	</form>
	
	
</div>		

<script>
document.querySelectorAll("[name=upFile]").forEach((input) => {
	input.addEventListener('change', (e) => {
		const [file] = e.target.files;
		console.log(file);
		const label = e.target.nextElementSibling;
		console.log(label);
		
		if(file) {
			const {name} = file;
			label.innerText = name;
		}
		else {
			label.innerText = "파일을 선택하세요.";
		}
	});
});


document.boardFrm.addEventListener('submit', (e) => {
	const title = document.querySelector("#title");
	const content = document.querySelector("#content");
	
	if(!/^.+$/.test(title.value)){
		e.preventDefault();
		alert("상품명을 작성해주세요.");
		return;
	}
	
	if(!/^(.|\n)+$/.test(content.value)){
		e.preventDefault();
		alert("내용을 작성해주세요.");
		return;
	}
	
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>