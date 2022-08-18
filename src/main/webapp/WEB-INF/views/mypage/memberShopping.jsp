<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.petlab.member.model.dto.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage/" rel="stylesheet">

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원정보수정" name="title"/>
</jsp:include>
<div id="mypage-submenu" class="submenu">
	<h4 class="top-title">MY PAGE</h4>
	<ul id="sub">
		<li><a href="${pageContext.request.contextPath}/mypage/memberInfo" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원정보 수정</a></li>
		<li><a href="${pageContext.request.contextPath}/mypage/myBorad" onmouseover="mousein(this);" onmouseout="mouseout(this)">내가 쓴 글</a></li>
		<li><a href="${pageContext.request.contextPath}/mypage/mypet" onmouseover="mousein(this);" onmouseout="mouseout(this)">마이펫</a></li>
		<li><a href="${pageContext.request.contextPath}/mypage/closeMember" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원탈퇴</a></li>
	</ul>
</div>
<section class="pt-7 pb-12">
      <div class="container">
        <div class="row">
          <div class="col-12 text-center">

            <!-- Heading -->
            <h3 class="mb-10">My Account</h3>

          </div>
        </div>
        <div class="row">
          <div class="col-12 col-md-3">

            <!-- Nav -->
            <nav class="mb-10 mb-md-0">
              <div class="list-group list-group-sm list-group-strong list-group-flush-x">
                <a class="list-group-item list-group-item-action dropend-toggle active" href="account-orders.html">
                  Orders
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="account-wishlist.html">
                  Widhlist
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="account-personal-info.html">
                  Personal Info
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="account-address.html">
                  Addresses
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle " href="account-payment.html">
                  Payment Methods
                </a>
                <a class="list-group-item list-group-item-action dropend-toggle" href="#!">
                  Logout
                </a>
              </div>
            </nav>

          </div>
          <div class="col-12 col-md-9 col-lg-8 offset-lg-1">

            <!-- Order -->
            <div class="card card-lg mb-5 border">
              <div class="card-body pb-0">

                <!-- Info -->
                <div class="card card-sm">
                  <div class="card-body bg-light">
                    <div class="row">
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Order No:</h6>

                        <!-- Text -->
                        <p class="mb-lg-0 fs-sm fw-bold">
                          673290789
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Shipped date:</h6>

                        <!-- Text -->
                        <p class="mb-lg-0 fs-sm fw-bold">
                          <time datetime="2019-10-01">
                            01 Oct, 2019
                          </time>
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Status:</h6>

                        <!-- Text -->
                        <p class="mb-0 fs-sm fw-bold">
                          Awating Delivery
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Order Amount:</h6>

                        <!-- Text -->
                        <p class="mb-0 fs-sm fw-bold">
                          $259.00
                        </p>

                      </div>
                    </div>
                  </div>
                </div>

              </div>
              <div class="card-footer">
                <div class="row align-items-center">
                  <div class="col-12 col-lg-6">
                    <div class="row gx-5 mb-4 mb-lg-0">
                      <div class="col-3">

                        <!-- Image -->
                        <div class="ratio ratio-1x1 bg-cover" style="background-image: url(assets/img/products/product-5.jpg);"></div>

                      </div>
                      <div class="col-3">

                        <!-- Image -->
                        <div class="ratio ratio-1x1 bg-cover" style="background-image: url(assets/img/products/product-112.jpg);"></div>

                      </div>
                      <div class="col-3">

                        <!-- Image -->
                        <div class="ratio ratio-1x1 bg-cover" style="background-image: url(assets/img/products/product-7.jpg);"></div>

                      </div>
                      <div class="col-3">

                        <!-- Image -->
                        <div class="ratio ratio-1x1 bg-light">
                          <a class="ratio-item ratio-item-text text-reset" href="#!">
                            <div class="fs-xxs fw-bold">
                              +2 <br> more
                            </div>
                          </a>
                        </div>

                      </div>
                    </div>
                  </div>
                  <div class="col-12 col-lg-6">
                    <div class="row gx-5">
                      <div class="col-6">

                        <!-- Button -->
                        <a class="btn btn-sm w-100 btn-outline-dark" href="account-order.html">
                          Order Details
                        </a>

                      </div>
                      <div class="col-6">

                        <!-- Button -->
                        <a class="btn btn-sm w-100 btn-outline-dark" href="#!">
                          Track order
                        </a>

                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </div>

            <!-- Order -->
            <div class="card card-lg mb-5 border">
              <div class="card-body pb-0">

                <!-- Info -->
                <div class="card card-sm">
                  <div class="card-body bg-light">
                    <div class="row">
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Order No:</h6>

                        <!-- Text -->
                        <p class="mb-lg-0 fs-sm fw-bold">
                          871090437
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Shipped date:</h6>

                        <!-- Text -->
                        <p class="mb-lg-0 fs-sm fw-bold">
                          <time datetime="2019-09-25">
                            25 Sep, 2019
                          </time>
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Status:</h6>

                        <!-- Text -->
                        <p class="mb-0 fs-sm fw-bold">
                          In Processing
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Order Amount:</h6>

                        <!-- Text -->
                        <p class="mb-0 fs-sm fw-bold">
                          $75.00
                        </p>

                      </div>
                    </div>
                  </div>
                </div>

              </div>
              <div class="card-footer">
                <div class="row align-items-center">
                  <div class="col-12 col-lg-6">
                    <div class="row gx-5 mb-4 mb-lg-0">
                      <div class="col-3">

                        <!-- Image -->
                        <div class="ratio ratio-1x1 bg-cover" style="background-image: url(assets/img/products/product-11.jpg);"></div>

                      </div>
                    </div>
                  </div>
                  <div class="col-12 col-lg-6">
                    <div class="row gx-5">
                      <div class="col-6">

                        <!-- Button -->
                        <a class="btn btn-sm w-100 btn-outline-dark" href="account-order.html">
                          Order Details
                        </a>

                      </div>
                      <div class="col-6">

                        <!-- Button -->
                        <a class="btn btn-sm w-100 btn-outline-dark" href="#!">
                          Track order
                        </a>

                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </div>

            <!-- Order -->
            <div class="card card-lg mb-5 border">
              <div class="card-body pb-0">

                <!-- Info -->
                <div class="card card-sm">
                  <div class="card-body bg-light">
                    <div class="row">
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Order No:</h6>

                        <!-- Text -->
                        <p class="mb-lg-0 fs-sm fw-bold">
                          891230563
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Shipped date:</h6>

                        <!-- Text -->
                        <p class="mb-lg-0 fs-sm fw-bold">
                          <time datetime="2019-09-07">
                            07 Sep, 2019
                          </time>
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Status:</h6>

                        <!-- Text -->
                        <p class="mb-0 fs-sm fw-bold">
                          Delivered
                        </p>

                      </div>
                      <div class="col-6 col-lg-3">

                        <!-- Heading -->
                        <h6 class="heading-xxxs text-muted">Order Amount:</h6>

                        <!-- Text -->
                        <p class="mb-0 fs-sm fw-bold">
                          $69.00
                        </p>

                      </div>
                    </div>
                  </div>
                </div>

              </div>
              <div class="card-footer">
                <div class="row align-items-center">
                  <div class="col-12 col-lg-6">
                    <div class="row gx-5 mb-4 mb-lg-0">
                      <div class="col-3">

                        <!-- Image -->
                        <div class="ratio ratio-1x1 bg-cover" style="background-image: url(assets/img/products/product-14.jpg);"></div>

                      </div>
                      <div class="col-3">

                        <!-- Image -->
                        <div class="ratio ratio-1x1 bg-cover" style="background-image: url(assets/img/products/product-15.jpg);"></div>

                      </div>
                    </div>
                  </div>
                  <div class="col-12 col-lg-6">
                    <div class="row gx-5">
                      <div class="col-6">

                        <!-- Button -->
                        <a class="btn btn-sm w-100 btn-outline-dark" href="account-order.html">
                          Order Details
                        </a>

                      </div>
                      <div class="col-6">

                        <!-- Button -->
                        <a class="btn btn-sm w-100 btn-outline-dark" href="#!">
                          Track order
                        </a>

                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </div>

            <!-- Pagination -->
            <nav class="d-flex justify-content-center justify-content-md-end mt-10">
              <ul class="pagination pagination-sm text-gray-400">
                <li class="page-item">
                  <a class="page-link page-link-arrow" href="#">
                    <svg class="svg-inline--fa fa-caret-left" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="caret-left" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512" data-fa-i2svg=""><path fill="currentColor" d="M137.4 406.6l-128-127.1C3.125 272.4 0 264.2 0 255.1s3.125-16.38 9.375-22.63l128-127.1c9.156-9.156 22.91-11.9 34.88-6.943S192 115.1 192 128v255.1c0 12.94-7.781 24.62-19.75 29.58S146.5 415.8 137.4 406.6z"></path></svg><!-- <i class="fa fa-caret-left"></i> Font Awesome fontawesome.com -->
                  </a>
                </li>
                <li class="page-item active">
                  <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">4</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">5</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">6</a>
                </li>
                <li class="page-item">
                  <a class="page-link page-link-arrow" href="#">
                    <svg class="svg-inline--fa fa-caret-right" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="caret-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512" data-fa-i2svg=""><path fill="currentColor" d="M118.6 105.4l128 127.1C252.9 239.6 256 247.8 256 255.1s-3.125 16.38-9.375 22.63l-128 127.1c-9.156 9.156-22.91 11.9-34.88 6.943S64 396.9 64 383.1V128c0-12.94 7.781-24.62 19.75-29.58S109.5 96.23 118.6 105.4z"></path></svg><!-- <i class="fa fa-caret-right"></i> Font Awesome fontawesome.com -->
                  </a>
                </li>
              </ul>
            </nav>

          </div>
        </div>
      </div>
    </section>