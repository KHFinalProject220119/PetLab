<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:include page="/WEB-INF/views/common/header.jsp">
 	<jsp:param value="스토어" name="title"/>
 </jsp:include>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/store/storeMain.css" />
 <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
    />
     <style>

   
    </style>


    <input id="check-btn1" type="checkbox" />
    <label for="check-btn1">
    	<img src="${pageContext.request.contextPath}/resources/images/store/menu.png" width="12px"/>
     <a href="#">사료</a>
    </label>
      <ul class="menubars1">
				 <li><a href="#" id="bookshelf" class="sub_category">사료</a></li>
				 <li><a href="#" id="desk" class="sub_category">영양제</a></li>
				 <li><a href="#" id="table" class="sub_category">간식</a></li>
      </ul> 
      <br>  
      
    <input id="check-btn2" type="checkbox" />
    <label for="check-btn2">
    	<img src="${pageContext.request.contextPath}/resources/images/store/menu.png" width="12px"/>
     <a href="#">미용·목욕</a>
    </label>
      <ul class="menubars2">
	          <li><a href="#" id="tv" class="sub_category">샴푸/비누</a></li>
			  <li><a href="#" id="air_conditioner" class="sub_category">브러쉬/빗</a></li>
			  <li><a href="#" id="refrigerator" class="sub_category">미용가위/클리퍼</a></li>
      </ul>    
<br>

 <input id="check-btn3" type="checkbox" />
    <label for="check-btn3">
    	<img src="${pageContext.request.contextPath}/resources/images/store/menu.png" width="12px"/>
     <a href="#">기타용품</a>
    </label>
      <ul class="menubars3">
	 <li><a href="#" id="led_lighting" class="sub_category">장난감/캣닢</a></li>
				 <li><a href="#" id="fluorescent_lamp" class="sub_category">스크래쳐/캣타워</a></li>
      </ul>    
<br>

<aside>
<div class="swiper mySwiper">
      <div class="swiper-wrapper">
        
        <div class="swiper-slide" >
        <img src="${pageContext.request.contextPath}/resources/images/store/storemain1.JPG" ></div>
        
        <div class="swiper-slide" >
        <img src="${pageContext.request.contextPath}/resources/images/store/storemain2.JPG" ></div>
 
        <div class="swiper-slide" >
        <img src="${pageContext.request.contextPath}/resources/images/store/storemain3.JPG" ></div>

        <div class="swiper-slide" >
        <img src="${pageContext.request.contextPath}/resources/images/store/storemain4.JPG" ></div>
      </div>

<!--       <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div> -->
      <div class="swiper-pagination"></div>
    </div>
</aside>


    
    
    
    
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev"
        }
      });
    </script>
 <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>