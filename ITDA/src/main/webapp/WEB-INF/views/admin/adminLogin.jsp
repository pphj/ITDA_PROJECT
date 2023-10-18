<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/itda_logo.png">
  <title>ITDA 관리자 로그인 페이지</title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="${pageContext.request.contextPath}/resources/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- CSS Files -->
  <link id="pagestyle" href="${pageContext.request.contextPath}/resources/assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
    <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/resources/assets/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/core/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/core/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/argon-dashboard.js"></script>
</head>
<body class="g-sidenav-show bg-darkgray-100">
	<div class="container-fluid mt-5 py-4">
		<div class="row">
			<div class="row mt-5 d-flex justify-content-center mx-auto" style="width: 1000px;">
			<div class="col-lg-7 mb-lg-0 mb-4">
				<div class="card z-index-2 h-300" style="background: #00c6be5e">
					<div class="card-header pb-0 pt-3 bg-transparent">
						<h2 class="text-capitalize text-center">로그인 페이지</h2>
	            	</div>
		            <div class="card-body p-3">
		            	<form role="form" action="${pageContext.request.contextPath}/adMember/loginProcess"
		                       method="post" name="adLoginForm">
		                        <div class="form-group mb-3">
		                          <div class="input-group input-group-alternative">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text" style="width: 40px; height: 41px;
		                               border-radius: 10px 0px 0px 10px;">
		                              <i class="ni ni-circle-08"></i></span>
		                            </div>
		                            <input class="form-control" placeholder="	Id" type="text"
		                             name="adminId" id="adminId" style="outline: none !important;">
		                          </div>
		                        </div>
		                        <div class="form-group">
		                          <div class="input-group input-group-alternative">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text" style="width: 40px; height: 40px;
		                               border-radius: 10px 0px 0px 10px;">
		                              <i class="ni ni-lock-circle-open"></i></span>
		                            </div>
		                            <input class="form-control" placeholder="	Password" type="password"
		                             name="adminPw" id="adminPw" style="outline: none !important;">
		                          </div>
		                        </div>
		                        <div class="form-group">
		                        	<label>
										<input type="checkbox" name="remember-me"
										 style="margin-bottom: 15px;"> 로그인 유지하기
									</label>
		                        </div>
		                        <div class="text-center">
		                          <button type='submit' class="btn btn-primary my-4">로그인</button>
		                        </div>
		                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		                      </form>
		            </div>
				</div>
	         </div>
	         </div>
	      </div>
	</div>
</body>
</html>