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

 <jsp:include page="/WEB-INF/views/common/body.jsp"></jsp:include>

 <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>