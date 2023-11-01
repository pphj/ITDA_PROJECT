<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/itda_logo.png">
  <title>이용권 생성</title>
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
  <script src="${pageContext.request.contextPath}/resources/js/admin/productWrite.js"></script>
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
                이용권 관리
              </h5>
            </div>
          </div>
        </div>
      </div>
    </div>
	<div class="main-content" style="padding: 30px 25px;">
		<div class="card">
		<div class="card-body">
	 		<form action="productInsert" method="post" enctype="multipart/form-data" name="productform">
	 			<h3 style="margin-top: 30px; text-align: center;">이용권 내용 작성</h3>
	 			<div class="form-group">
	 				<label for="productWriter">작성자</label>
	 				<input name="productWriter" id="productWriter" value="${pinfo.username}" readOnly
	 					   type="text" class="form-control">
	 			</div>
	 			<div class="form-group">
	 				<label for="productName">이용권 이름</label>
	 				<input name="productName" id="productName" type="text" maxlength="20"
	 					   class="form-control" placeholder="Enter Coupon Name">
	 			</div>
	 			<div class="form-group">
	 				<label for="productDetail">이용권 내용</label>
	 				<textarea name="productDetail" id="productDetail"
	 				 style="resize: none;" rows="5" class="form-control"></textarea>
	 			</div>
	 			<div class="form-group">
	 				<label for="productPrice">이용권 가격</label>
	 				<input name="productPrice" id="productPrice" type="text" maxlength="10"
	 					   class="form-control" placeholder="Enter Coupon Price">
	 			</div>
	 			<div class="form-group">
	 				<label for="productTerm">이용권 기간</label>
	 				<input name="productTerm" id="productTerm" type="text" maxlength="10"
	 					   class="form-control" placeholder="Enter Coupon Price">
	 			</div>
	 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	 			<div class="form-group" style="text-align: center;">
	 				<button type=submit class="btn btn-primary btn-sm btn-round">등록</button>
	 				<button type=reset class="btn btn-danger btn-sm btn-round" onClick="history.go(-1)">취소</button>
	 			</div>
	 		</form>
	 	</div>
 		</div>
 	</div>
</main>
</body>
</html>
