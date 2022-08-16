<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.petlab.member.model.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	Member loginMember = (Member) authentication.getPrincipal();
 %>
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/memberDetail.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<jsp:param value="회원 정보" name="title"/>

<div id="mypage-submenu" class="submenu">
	<h4 class="top-title">MY PAGE</h4>
<% if(role.equals("ROLE_USER")){ %> 
	<ul id="sub">
		<li><a href="${pageContext.request.contextPath}/mypage/memberDetail?memberId" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보 수정</a></li>
		<li><a href="${pageContext.request.contextPath}/mypage/myBorad?memberId=" onmouseover="mousein(this);" onmouseout="mouseout(this)">내가 쓴 글</a></li>
		<li><a href="${pageContext.request.contextPath}/mypage/mypet?memberId=" onmouseover="mousein(this);" onmouseout="mouseout(this)">마이펫</a></li>
		<li><a href="${pageContext.request.contextPath}/mypage/closeMember" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
	      <% if(type.equals("update")){ %>
	      <li><a id="now_menu" class="current" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보 수정</a></li>
	      <li><a href="<%= request.getContextPath() %>/mypage/memberDetail?type=del&role=D" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
	      
	      <% } else { %>
	      <li><a href="<%= request.getContextPath() %>/mypage/memberDetail?type=update&role=" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보 수정</a></li>
	      <li><a id="now_menu" class="current" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
	      <% } %>
	    </ul>
	<% } if(role.equals("ROLE_HOSPITAL")) { %>
	    <ul id="sub">
	    <li><a href="${pageContext.request.contextPath}/mypage/memberDetail" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보</a></li>
	    <li><a href="${pageContext.request.contextPath}/mypage/hospitalDetail" onmouseover="mousein(this);" onmouseout="mouseout(this)">병원 정보</a></li>
		<li><a href="${pageContext.request.contextPath}/mypage/myBorad?memberId=" onmouseover="mousein(this);" onmouseout="mouseout(this)">내가 쓴 글</a></li>
		<li><a href="${pageContext.request.contextPath}/mypage/closeMember" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
	      
	      <% if(type.equals("update")){ %>
	      <li><a id="now_menu" class="current" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보 수정</a></li>
	      <li><a href="<%= request.getContextPath() %>/mypage/memberDetail?type=del&role=P" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
	      <% } else { %>
	      <li><a href="<%= request.getContextPath() %>/mypage/memberDetail?type=update&role=P" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보 수정</a></li>
	      <li><a id="now_menu" class="current" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
	      <% } %>
	    </ul>
	<% } else { %>
	<ul id="sub">
	     <li><a href="${pageContext.request.contextPath}/mypage/memberDetail" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보 수정</a></li>
		<li><a href="${pageContext.request.contextPath}/mypage/mallDetail=" onmouseover="mousein(this);" onmouseout="mouseout(this)">입점몰 정보</a></li>
		<li><a href="${pageContext.request.contextPath}/mypage/myBorad?memberId=" onmouseover="mousein(this);" onmouseout="mouseout(this)">내가 쓴 글</a></li>
		<li><a href="${pageContext.request.contextPath}/mypage/closeMember" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
	      
	      <% if(type.equals("update")){ %>
	      <li><a id="now_menu" class="current" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보 수정</a></li>
	      <li><a href="<%= request.getContextPath() %>/mypage/memberDetail?type=del&role=P" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
	      <% } else { %>
	      <li><a href="<%= request.getContextPath() %>/mypage/memberDetail?type=update&role=P" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보 수정</a></li>
	      <li><a id="now_menu" class="current" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
	      <% } %>
	    </ul>
	
  </div>
    <div id="pwck-container">
    <h2>비밀번호 확인</h2>
    <p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다. 비밀번호는 다른사람에게 노출되지 않도록 주의해주시기 바랍니다.</p>
    <div id="idpwbtn">
      <div id="idpw">
      	<div id="msg-div">
      		<span id="msg" style="display: none;">아이디 비밀번호가 일치하지 않습니다.</span>
      	</div>
        <div class="box">
          <label for="id">아이디</label>
          <input type="text" name="member_id" id="member_id" value="<%= loginMember.getMemberId() %>">
        </div>
        <div class="box">
          <label for="pw">비밀번호</label>
          <input type="password" name="pw" id="pw">
        </div>
      </div>
      <div id="btn-box">
        <button class="btn" onclick="ckidpw()">확인</button>
      </div>
    </div>
  </div>
  <form 
	name="memberDelFrm" 
	action="${pageContext.request.contextPath}/mypage/closeMember" 
	method="POST">
	<input type="text" name="member_id" id="member_id" value="<%= loginMember.getMemberId() %>">
  </form>
  
  <script>
  window.onload = () => {

	}
	
	const ckidpw = () => {
		const id = $('#member_id').val();
		const pw = $('#pw').val();
		const msg = "";
	
		if(!pw){
			alert('비밀번호를 입력하세요');
			return;
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/mypage/member/updateMember",
			method: "POST",
			dataType : "json",
			data : {
				"memberId" : id,
				"password" : pw
			},
			success(result) {
				console.log(result);
				
				if(result=="success"){
					if('<%= type %>'=="update"){
						location.href = `<%= request.getContextPath() %>/mypage/updateMember?memberId=<%= loginMember.getMemberId() %>`;  						
					}
					else {
						console.log('탈퇴처리해야함');
						const msg2 = "정말 탈퇴하시겠습니까?";
						
						if(confirm(msg2)){
							document.memberDelFrm.submit();
						}
						else{
							alert('취소되었습니다.');
						}
						
					}
					
				}
				else {
					$('#msg').css('display','');
				}
			},
			error : console.log
		})
	};

  </script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
