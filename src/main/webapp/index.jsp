<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <fmt:requestEncoding value="utf-8" />
 <jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param value="멍냥연구소" name="title"/>
 </jsp:include>
		<article>
		<div class="main-visual-wrap" id="main-visual">
			<div class="main-visual">
				<div class="bx-wrapper">
					<div class="bx-viewport">
						<ul class="slider-box">
							<li class="visual" id="visual-image1" style="background-image: url(${pageContext.request.contextPath}/resources/images/common/carousel/carousel1.png);"></li>
							<li class="visual" id="visual-image2" style="background-image: url(${pageContext.request.contextPath}/resources/images/common/carousel/carousel2.png);"></li>
							<li class="visual" id="visual-image3" style="background-image: url(${pageContext.request.contextPath}/resources/images/common/carousel/carousel3.png);"></li>
							<li class="visual" id="visual-image4" style="background-image: url(${pageContext.request.contextPath}/resources/images/common/carousel/carousel4.png);"></li>
							<li class="visual" id="visual-image5" style="background-image: url(${pageContext.request.contextPath}/resources/images/common/carousel/carousel5.png);"></li>
						</ul>	
					 </div>
				</div>
			</div>
			<div class="bx-controls-wrapper">
				<div class="bx-controls">
					<button type="button" class="bx-prev" style="background-image: url(${pageContext.request.contextPath}/resources/images/common/carousel/prev.png);"></button>
					<div class="paginations"></div>
					<button type="button" class="bx-next" style="background-image: url(${pageContext.request.contextPath}/resources/images/common/carousel/next.png);"></button>
				</div> 
			</div>
		</article>
		<div id="center-img-wrapper">
			<img src="${pageContext.request.contextPath}/resources/images/common/header/CatWithAPencil.png" id="center-image" alt="스프링로고" class="d-block mx-auto mt-5"/>
		</div>
<script>
	//캐러셀
	const list = document.querySelector('.slider-box');
	const items = document.querySelectorAll('.visual');
	const btnPrev = document.querySelector('.bx-prev');
	const btnNext = document.querySelector('.bx-next');
	const paginations = document.querySelector('.paginations');
	const lastIndex = items.length - 1;
	let selected = 0;
	let interval;
	
	
	const setTransition = (value) => {
	  list.style.transition = value;
	};
	
	const setTranslate = ({ index, reset }) => {
	  if (reset) {
	    list.style.transform = `translate(-\${list.clientWidth}px, 0)`;
	  }
	  else {
	    list.style.transform = `translate(-\${(index + 1) * list.clientWidth}px, 0)`;
	  }  
	};
	
	const activePagination = (index) => {
	  [...paginations.children].forEach((pagination) => {
	    pagination.classList.remove('active');
	  });
	  paginations.children[index].classList.add('active');
	};
	
	const handlePagination = (e) => {
	  if (e.target.dataset.num) {
	    selected = parseInt(e.target.dataset.num);
	    setTransition('all 0.3s linear');
	    setTranslate({ index: selected });
	    activePagination(selected);
	  }
	};
	
	const makePagination = () => {
	  if (items.length > 1) {
	    for (let i = 0; i < items.length; i++) {
	      const button = document.createElement('li');
	      button.dataset.num = i;
	      button.style.backgroundImage = "url(${pageContext.request.contextPath}/resources/images/common/carousel/cat.png)";
	      button.classList.add('pagination');
	      if (i === 0) {
	        button.classList.add('active');
	      }
	      paginations.appendChild(button);
	      paginations.addEventListener('click', handlePagination);
	    }
	  }
	};
	
	
	const handlePrev = () => {
	  selected -= 1;
	  setTransition('transform 0.3s linear');
	  setTranslate({ index: selected });
	  if (selected < 0) {
	    selected = lastIndex;
	    setTimeout(() => {
	      setTransition('');
	      setTranslate({ index: selected });
	    }, 300);
	  }
	  if (selected >= 0) activePagination(selected);
	};
	
	const handleNext = () => {
	  console.log(selected);
	  selected += 1;
	  setTransition('transform 0.3s linear');
	  setTranslate({ index: selected });
	  if (selected > lastIndex) {
	    selected = 0;
	    setTimeout(() => {
	      setTransition('');
	      setTranslate({ index: selected });
	    }, 300);
	  }
	  if (selected <= lastIndex) activePagination(selected);
	};
	
	const clickButton = () => {
	  if (items.length > 1) {
	    btnPrev.addEventListener('click', handlePrev);
	    btnNext.addEventListener('click', handleNext);
	  }
	};
	
	
	const cloneElement = () => {
	  list.prepend(items[lastIndex].cloneNode(true));
	  list.append(items[0].cloneNode(true));
	  setTranslate({ reset: true });
	};
	
	
	const autoplayIterator = () => {
	  selected += 1;
	  setTransition('all 0.3s linear');
	  setTranslate({ index: selected });
	  if (selected > lastIndex) {
	    activePagination(0);
	    clearInterval(interval);
	    setTimeout(() => {
	      selected = 0;
	      setTransition('');
	      setTranslate({ reset: true });
	      autoplay({ duration: 4000 });
	    }, 300);
	  }
	  if (selected <= lastIndex) activePagination(selected);
	};
	
	const autoplay = ({ duration }) => {
	  interval = setInterval(autoplayIterator, duration);
	};
	    
	const render = () => {
	  clickButton();
	  makePagination();
	  cloneElement();
	  autoplay({ duration: 4000 });
	};
	render();		
	
</script>
<style>
#center-img-wrapper{width: 30%; margin: 10rem auto;}
</style>		
 <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
