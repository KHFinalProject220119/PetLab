<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/community/community_header.css" />
<head>
<body>
	<div id="commu">
			커뮤니티
	</div>
	<div class="btn-group" role="group" aria-label="...">
  		<button type="button" id="b1" class="btn btn-outline-primary" onclick = "click1()">소모임</button>
  		<button type="button" class="btn btn-outline-primary" onclick ="location.href ='${pageContext.request.contextPath}/community/knowhowList'">노하우</button>
  		<button type="button" class="btn btn-outline-primary" onclick ="location.href ='${pageContext.request.contextPath}/community/freeBoardList'">자유게시판</button>
  		<button type="button" class="btn btn-outline-primary" onclick ="location.href ='${pageContext.request.contextPath}/community/photoList'">멍냥이 갤러리</button>
	</div>

<script>
	function click1() {
		document.getElementById("b1").style.background="skyblue";
		location.href ='${pageContext.request.contextPath}/community/smallGroupMain'
		
/*  		var push1 = document.getElementById("b1");
		push1.style=.background="skyblue";  */
	}

</script>

</body>
</html>