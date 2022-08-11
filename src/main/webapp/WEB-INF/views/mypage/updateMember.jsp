<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.petlab.member.model.dto.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link type="text/css" href="/resources/css/mypage/" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원정보수정" name="title"/>
</jsp:include>


<div id="_my_order_list">

	<h1 class="title1 p_pt40 p_pb25 m_pt10 m_pb40">회원정보수정</h1>

	<div class="clearfix">

		<!-- // left -->
		<div class="p_flt p_wp45 inputfix">

			<div class="tpl_title1">
				<h1>회원정보</h1>
			</div>

			<hr class="solid">

			<form id="frm1" action="/my/account/modify" method="post">
			<table class="tpl_form inputfix p_mb20">
				<tbody><tr>
					<th class="w110">이름</th>
					<td>${member.memberName}</td>
				</tr>
				<tr>
					<th class="w110">아이디</th>
					<td>
					<label type="text" name="text" title="dkdlel" value="${MemberEntity.id}" class="w340 m_w175 required email" placeholder="petlab@naver.com">
					</label>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="email" title="이메일" value="${MemberEntity.email}" class="w340 m_w175 required email" placeholder="petlab@naver.com">
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td>
						<input type="text" id="phone1" name="phone1" title="휴대전화" value="${MemberEntity.phone}" class="w340 m_w175 required phone" placeholder="010-1234-5678" readonly="" onclick="showidenetityCertPopup('modify');"> &nbsp;
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td>
						<input type="text" id="phone1" name="phone1" title="휴대전화" value="${MemberEntity.phone}" class="w340 m_w175 required phone" placeholder="010-1234-5678" readonly="" onclick="showidenetityCertPopup('modify');"> &nbsp;
					</td>
				</tr>
			</tbody>
			</table>

			<!-- 선택입력사항 -->
			<div class="p_frt p_wp45 m_pt40">

			<div class="tpl_title1">
				<h1>비밀번호 변경</h1>
			</div>

			<hr class="solid">

			<form id="frm2" action="/my/account/password" method="post">

			<table class="tpl_form inputfix">
				<tbody><tr>
					<th class="p_w110 m_w80">현재 비밀번호</th>
					<td>
						<input type="password" name="password_old" title="현재 비밀번호" class="w340 m_w180 required">
					</td>
				</tr>
				<tr>
					<th>새 비밀번호</th>
					<td>
						<input id="firstPw" type="password" name="password" title="새 비밀번호" class="w340 m_w180 password required" placeholder="8~15자 이내, 영문, 숫자, 특수문자를 혼합하여 입력해 주세요.">
						<p id="pw1" style="color:red">&nbsp;</p>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td class="p_w110">
						<input id="secondPw" type="password" name="password_chk" title="비밀번호 확인" class="w340 m_w180 required" placeholder="&nbsp; 비밀번호 확인을 위해 다시 한번 입력하세요.">
						<p id="pw2" style="color:red">&nbsp;</p>
					</td>
				</tr>
			</tbody></table>

			<input class="btn1" onclick="onSubmit_password()" value="비밀번호 변경">

			</form>

		</div>
		<!-- // left -->

		<!-- // right -->
		<div class="p_frt p_wp45 m_pt40">

			<div class="tpl_title1">
				<h1>주소지 변경</h1>
			</div>

			<hr class="solid">

			<form id="frm2" action="/my/account/password" method="post">

			<table class="tpl_form inputfix">
				<tbody><tr>
					<th class="p_w110 m_w80">현재 비밀번호</th>
					<td>
						<input type="password" name="password_old" title="현재 비밀번호" class="w340 m_w180 required">
					</td>
				</tr>
				<tr>
					<th>새 비밀번호</th>
					<td>
						<input id="firstPw" type="password" name="password" title="새 비밀번호" class="w340 m_w180 password required" placeholder="8~15자 이내, 영문, 숫자, 특수문자를 혼합하여 입력해 주세요.">
						<p id="pw1" style="color:red">&nbsp;</p>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td class="p_w110">
						<input id="secondPw" type="password" name="password_chk" title="비밀번호 확인" class="w340 m_w180 required" placeholder="&nbsp; 비밀번호 확인을 위해 다시 한번 입력하세요.">
						<p id="pw2" style="color:red">&nbsp;</p>
					</td>
				</tr>
			</tbody></table>

			<input class="btn1" onclick="onSubmit_password()" value="비밀번호 변경">

			</form>

		</div>
		<!-- // right -->

	</div>

	<p class="h30"></p>

	<p class="h100"></p>

</div> <!-- // contents -->
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>