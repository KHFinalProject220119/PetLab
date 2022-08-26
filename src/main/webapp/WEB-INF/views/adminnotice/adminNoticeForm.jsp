<%@page import="com.kh.petlab.member.model.dto.Member"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adminnotice/adminNoticeForm.css" />
<%
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    Member loginMember = (Member) authentication.getPrincipal(); 
%>
<sec:authentication property="principal" var="loginMember" scope="page"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공지사항 게시글 작성" name="title"/>
</jsp:include>


<div id="adminNoticeForm-container">
	<div class="top-title-wrapper">
			<div class="top-title">공지사항 게시</div>
	</div>

	<form 
		name="adminNoticeForm" 
		action="${pageContext.request.contextPath}/adminnotice/adminNoticeEnroll?${_csrf.parameterName}=${_csrf.token}" 
		method="post"
		enctype="multipart/form-data">
		<input type="text" class="form-control" placeholder="제목" name="noticeTitle" id="noticeTitle" required>
		<input type="text" class="form-control" name="memberId" value="${loginMember.memberId}" readonly required>
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
		
		<div class="input-wrapper">
			<div class="textarea-wrapper">
	    <textarea class="form-control" id="contentsText" name="content" maxlength="500" cols="30" placeholder="내용" required></textarea>
	    </div>
		<br />
		<div class="button-wrapper">
			<input type="submit" class="btn btn-outline-success" value="게시하기" >
		</div>
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

const adminNoticeFrm = document.adminNoticeForm;
adminNoticeFrm.addEventListener('submit', (e) => {
	e.preventDefault();
	const notice_title = document.querySelector("#noticeTitle");
	const content = document.querySelector("#content");
	
	if(!/^.+$/.test(notice_title.value)){
		e.preventDefault();
		alert("제목을 작성해주세요.");
		return;
	}
	
	if(!/^(.|\n)+$/.test(content.value)){
		e.preventDefault();
		alert("내용을 작성해주세요.");
		return;
	}
	adminNoticeFrm.submit();
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
