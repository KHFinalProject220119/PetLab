<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/maven-v4_0_0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>com.kh</groupId>
	<artifactId>petlab</artifactId>
	<name>petlab</name>
	<packaging>war</packaging>
	<version>1.0.0-BUILD-SNAPSHOT</version>
	<!-- #1. java-version 1.8 / servlet 4.0.1 / JSP 2.3.1 / spring 5.1.5.RELEASE -->
	<properties>
		<java-version>1.8</java-version>
		<org.springframework-version>5.1.5.RELEASE</org.springframework-version>
		<org.springframework.security-version>5.1.5.RELEASE</org.springframework.security-version>
		<org.aspectj-version>1.6.10</org.aspectj-version>
		<org.slf4j-version>1.6.6</org.slf4j-version>
	</properties>
	
	
	<dependencies>
		<!-- Spring -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context</artifactId>
			<version>${org.springframework-version}</version>
			<exclusions>
				<!-- Exclude Commons Logging in favor of SLF4j -->
				<exclusion>
					<groupId>commons-logging</groupId>
					<artifactId>commons-logging</artifactId>
				 </exclusion>
			</exclusions>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-webmvc</artifactId>
			<version>${org.springframework-version}</version>
		</dependency>
		
		<!-- #11. AOP 처리를 위한 의존 -->
		<!-- #13. 트랜잭션 처리를 위한 aop 의존 -->
		<!-- AspectJ -->
		<dependency>
			<groupId>org.aspectj</groupId>
			<artifactId>aspectjrt</artifactId>
			<version>${org.aspectj-version}</version>
		</dependency>	
		<dependency>
	        <groupId>org.aspectj</groupId>
	        <artifactId>aspectjweaver</artifactId>
	        <version>${org.aspectj-version}</version>
    	</dependency>
    	
		<!-- Logging -->
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>slf4j-api</artifactId>
			<version>${org.slf4j-version}</version>
		</dependency>
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>jcl-over-slf4j</artifactId>
			<version>${org.slf4j-version}</version>
			<scope>runtime</scope>
		</dependency>
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>slf4j-log4j12</artifactId>
			<version>${org.slf4j-version}</version>
			<scope>runtime</scope>
		</dependency>
		<dependency>
			<groupId>log4j</groupId>
			<artifactId>log4j</artifactId>
			<version>1.2.15</version>
			<exclusions>
				<exclusion>
					<groupId>javax.mail</groupId>
					<artifactId>mail</artifactId>
				</exclusion>
				<exclusion>
					<groupId>javax.jms</groupId>
					<artifactId>jms</artifactId>
				</exclusion>
				<exclusion>
					<groupId>com.sun.jdmk</groupId>
					<artifactId>jmxtools</artifactId>
				</exclusion>
				<exclusion>
					<groupId>com.sun.jmx</groupId>
					<artifactId>jmxri</artifactId>
				</exclusion>
			</exclusions>
		<!-- <scope>runtime</scope> -->
		</dependency>

		<!-- @Inject -->
		<dependency>
			<groupId>javax.inject</groupId>
			<artifactId>javax.inject</artifactId>
... (209줄 남음)
접기
pom.xml
12KB
우선
박민서 — 오늘 오후 2:06
김현우 — 오늘 오후 2:06
이걸로 덮어써보세요
박지수 — 오늘 오후 2:06
네
이제 인덱스 jsp가...
김현우 — 오늘 오후 2:09
잠시만요
박지수 — 오늘 오후 2:09
예ㅃ
김현우 — 오늘 오후 2:09
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
확장
index.jsp
7KB
﻿
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