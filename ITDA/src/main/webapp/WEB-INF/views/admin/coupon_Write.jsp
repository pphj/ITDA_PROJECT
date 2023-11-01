<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/itda_logo.png">
  <title>쿠폰 작성</title>
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
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/admin/couponWrite.js"></script>
</head>
<body class="g-sidenav-show bg-gray-100">
  <jsp:include page="adminList.jsp" />
  <main class="main-content position-relative border-radius-lg ">
  <jsp:include page="adminNavbar.jsp" />  
    <!-- End Navbar -->
	<div class="card shadow-lg mx-4 card-profile-bottom">
      <div class="card-body p-3">
        <div class="row gx-4">
          <div class="col-auto my-auto">
            <div class="h-100">
              <h5 class="mb-1">
                쿠폰 관리
              </h5>
            </div>
          </div>
        </div>
      </div>
    </div>
	<div class="main-content" style="padding: 30px 25px;">
		<div class="card">
		<div class="card-body">
	 		<form action="couponInsert" method="post" enctype="multipart/form-data" name="couponform">
	 			<h1 style="margin-top: 30px; text-align: center;">쿠폰 작성</h1>
	 			<div class="form-group">
	 				<label for="adminId">작성자</label>
	 				<input name="adminId" id="adminId" value="${pinfo.username}" readOnly
	 					   type="text" class="form-control">
	 			</div>
	 			<div class="form-group">
	 				<label for="couponName">쿠폰 이름</label>
	 				<input name="couponName" id="couponName" type="text" maxlength="20"
	 					   class="form-control" placeholder="Enter CouponName">
	 			</div>
	 			<div class="form-group">
	 				<label for="couponDetail">쿠폰 내용</label>
	 				<textarea name="couponDetail" id="couponDetail"
	 					   rows="5" class="form-control"></textarea>
	 			</div>
	 			<div class="form-group">
	 				<label for="couponPrice">쿠폰 가격</label>
	 				<input name="couponPrice" id="couponPrice" type="text" maxlength="10"
	 					   class="form-control" placeholder="Enter CouponPrice">
	 			</div>
	 			<div class="form-group">
	 				<label for="couponTerm">쿠폰 이용기간</label>
	 				<input name="couponTerm" id="couponTerm" type="text" maxlength="10"
	 					   class="form-control" placeholder="Enter couponTerm">
	 			</div>
	 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	 			<div class="form-group" style="text-align: center;">
	 				<button type=submit class="btn btn-primary btn-sm btn-round">작성</button>
	 				<button type=reset class="btn btn-danger btn-sm btn-round" onClick="history.go(-1)">취소</button>
	 			</div>
	 		</form>
	 	</div>
 		</div>
 	</div>
</main>
</body>
</html>
