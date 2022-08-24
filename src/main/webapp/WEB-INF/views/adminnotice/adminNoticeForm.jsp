<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminnotice/adminNoticeForm.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공지사항 게시글 작성" name="title"/>
</jsp:include>
<style>
div#adminNotice-container{width:400px; margin:0 auto; text-align:center;}
div#adminNotice-container input{margin-bottom:15px;}
/* 부트스트랩 : 파일라벨명 정렬*/
div#adminNotice-container label.custom-file-label{text-align:left;}
</style>

<div id="adminNotice-container">
	<form 
		name="adminNoticeForm" 
		action="${pageContext.request.contextPath}/adminnotice/adminNoticeEnroll?${_csrf.parameterName}=${_csrf.token}" 
		method="post"
		enctype="multipart/form-data">
		<input type="text" class="form-control" placeholder="제목" name="noticetitle" id="noticetitle" required>
		<input type="text" class="form-control" name="memberId" value="${member.memberId}" readonly required>
		<!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
		<div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">첨부파일1</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
		    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
		  </div>
		</div>
		<div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">첨부파일2</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile2" multiple>
		    <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
		  </div>
		</div>
		
	    <textarea class="form-control" name="content" placeholder="내용" required></textarea>
		<br />
		<input type="submit" class="btn btn-outline-success" value="저장" >
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


document.adminNoticeFrm.addEventListener('submit', (e) => {
	const title = document.querySelector("#title");
	const content = document.querySelector("#content");
	
	if(!/^.+$/.test(title.value)){
		e.preventDefault();
		alert("제목을 작성해주세요.");
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
