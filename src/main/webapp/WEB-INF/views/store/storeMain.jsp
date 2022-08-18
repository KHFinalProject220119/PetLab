<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="스토어" name="title" />
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/store/storeMain.css" />

<sec:authorize access="hasRole('MALL')">
<a href="${pageContext.request.contextPath}/store/mall/insertProzduct" class="insert-pro-btn">
<span class="insert-btn">상품등록</span>
</a>
</sec:authorize>

<div class="category-feed-container">
	<input id="check-btn1" type="checkbox" /> <label for="check-btn1">
		<img
		src="${pageContext.request.contextPath}/resources/images/store/menu.png"
		width="12px" class="menu" /> <a
		href="#"><span class="cate">사료</span></a>
	</label>
	<ul class="menubars1">
		<li><a href="${pageContext.request.contextPath}/store/mall/productFeed">사료</a></li>
		<li><a href="${pageContext.request.contextPath}/store/mall/productSnack">간식</a></li>
		<li><a href="${pageContext.request.contextPath}/store/mall/productFeeding">급식/급수기</a></li>
	</ul>
	<br> <input id="check-btn2" type="checkbox" /> <label
		for="check-btn2"> <img
		src="${pageContext.request.contextPath}/resources/images/store/menu.png"
		width="12px" class="menu" /> <a
		href="#"><span class="cate">목욕·위생·미용</span></a>
	</label>
	<ul class="menubars2">
		<li><a href="${pageContext.request.contextPath}/store/mall/productShampoo">샴푸/세정제</a></li>
		<li><a href="${pageContext.request.contextPath}/store/mall/productPad">배변판/패드</a></li>
		<li><a href="${pageContext.request.contextPath}/store/mall/productBrush">브러쉬/가위</a></li>
	</ul>
	<br> <input id="check-btn3" type="checkbox" /> <label
		for="check-btn3"> <img
		src="${pageContext.request.contextPath}/resources/images/store/menu.png"
		width="12px" class="menu" /> <a
		href="#"><span class="cate">기타용품</span></a>
	</label>
	<ul class="menubars3">
		<li><a href="${pageContext.request.contextPath}/store/mall/productToy">장난감/스크래쳐</a></li>
		<li><a href="${pageContext.request.contextPath}/store/mall/productBag">이동가방</a></li>
	</ul>


	<div class="slideshow-container">

		<div class="mySlides fade">
			<div class="numbertext">1 / 4</div>
			<img
				src="${pageContext.request.contextPath}/resources/images/store/storemain1.JPG"
				style="width: 100%">
		</div>

		<div class="mySlides fade">
			<div class="numbertext">2 / 4</div>
			<img
				src="${pageContext.request.contextPath}/resources/images/store/storemain2.JPG"
				style="width: 100%">
		</div>

		<div class="mySlides fade">
			<div class="numbertext">3 / 4</div>
			<img
				src="${pageContext.request.contextPath}/resources/images/store/storemain3.JPG"
				style="width: 100%">
		</div>

		<div class="mySlides fade">
			<div class="numbertext">4 / 4</div>
			<img
				src="${pageContext.request.contextPath}/resources/images/store/storemain4.JPG"
				style="width: 100%">
		</div>

		<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
			onclick="plusSlides(1)">&#10095;</a>


		<div style="text-align: center">
			<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
				onclick="currentSlide(2)"></span> <span class="dot"
				onclick="currentSlide(3)"></span> <span class="dot"
				onclick="currentSlide(4)"></span>
		</div>

	</div>
</div>

<script>
	var slideIndex = 1;
	showSlides(slideIndex);

	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	function currentSlide(n) {
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
