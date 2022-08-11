<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


 <jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>
<section id="container">
		<div id="mypage-submenu" class="submenu">
			<ul id="sub">
				<li><a href="${pageContext.request.contextPath}/mypage/updateMember" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보 수정</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/myBoard" onmouseover="mousein(this);" onmouseout="mouseout(this)">내가 쓴 글</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/mypet" onmouseover="mousein(this);" onmouseout="mouseout(this)">마이펫</a></li>
				<li><a href="${pageContext.request.contextPath}/mypage/closeMember" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
			</ul>
		</div> 
		<div id="pet-container">
    <div id="pet_head">
      <h2>MY PET</h2>
    </div>
    <div id="pet-container">
      <div id="btn-div">
        <button type="button" id="btn-apply" onclick="myPetEnroll();">마이펫 등록</button>
      </div>
      <form action="">
        <input type="hidden" name="pettype" id="pettype">
      </form>
    </div>
  </div>
  <form name="enrollWorkFrm" action="<%= request.getContextPath() %>/mypage/myPetEnroll">
  	<input type="hidden" name="memberId"/>
  	<input type="hidden" name="petType" value="New"/>
  	<input type="hidden" name="attachNo" value="130">
  </form>
  
  <script>
   
	const enrollPet = () => {
		
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
    

  </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>