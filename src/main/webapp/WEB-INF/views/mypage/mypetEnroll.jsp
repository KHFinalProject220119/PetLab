<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.petlab.member.model.dto.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이펫 등록" name="title"/>
</jsp:include>

<div class="top-logo">
  <span>MYPAGE</span>
</div>
<section id="container">
  <div id="Pmypage-submenu" class="submenu">
    <ul id="sub">
      <li><a href="#" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보 수정</a></li>
      <li><a href="<%= request.getContextPath() %>/mypage/ckpw?type=update&role=P" id="now_menu" class="current" onmouseover="mousein(this);" onmouseout="mouseout(this)">내가 쓴 글</a></li>
      <li><a href="<%= request.getContextPath() %>/mypage/applylist" onmouseover="mousein(this);" onmouseout="mouseout(this)">마이펫</a></li>
      <li><a href="<%= request.getContextPath() %>/mypage/ckpw?type=del&role=P" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
    </ul>
  </div>
	  <div id="portfolio-container">
    <div id="portfolio_head">
      <h2>MY PET</h2>
    </div>
    <div id="portfolio-container">
      <div id="text-div">
        <p id="head-p">반려동물을 등록해보세요</p>
      </div>
      <div id="btn-div">
        <button type="button" id="btn-apply" onclick="mypetEnroll();">마이펫 간편등록</button>
      </div>
      <form action="">
        <input type="hidden" name="porttype" id="porttype">
      </form>
    </div>
  </div>
  <form name="enrollWorkFrm" action="<%= request.getContextPath() %>/mypage/gotoEditMyPet">
  	<input type="hidden" name="portType" value="New"/>
  	<input type="hidden" name="attachNo" value="130">
  </form>
  
  <script>
   
	const enrollPort = () => {
		
		document.enrollWorkFrm.submit();
  	}
	
 
  
    const mousein = (menu) => {
      now_menu.classList.remove('current');
      menu.classList.add('current');
    };
  
    const mouseout = (menu) => {
      now_menu.classList.add('current');
      menu.classList.remove('current');
    }
    
    /**
     * 스크롤기능 안쳐먹음ㅠㅠ 
     * let currentPosition = $("#Pmypage-submenu").css("top"); 
     * 이새끼가 auto나옴 시부럴
     */
     let currentPosition = $("#Pmypage-submenu").css("top");
     console.log(currentPosition); 
     $(window).scroll(function(){   
        let position = $(window).scrollTop();
        $("#Pmypage-submenu").stop().animate({"top":position+currentPosition+"px"},1000);
      });
  </script>
  
  
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>