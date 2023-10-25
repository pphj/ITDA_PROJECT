<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/itda_logo.png">
  <title>FAQ 작성 페이지</title>
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
  <script src="${pageContext.request.contextPath}/resources/js/admin/faqWrite.js"></script>
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
                Q&A/FAQ
              </h5>
            </div>
          </div>
        </div>
      </div>
    </div>
	<div class="main-content" style="padding: 30px 25px;">
	<div class="card">
		<div class="card-body">
 		<form action="faqInsert" method="post" enctype="multipart/form-data" name="FAQform">
 			<h3 style="text-align: center;">FAQ 작성 페이지</h3>
 			<div class="form-group">
 				<label for="adWriter">작성자</label>
 				<input name="adWriter" id="adWriter" value="${pinfo.username}" readOnly
 					   type="text" class="form-control"">
 			</div>
 			<div class="form-group">
 				<label for="adPassword">비밀번호</label>
 				<input name="adPassword" id="adPassword" type="password" maxlength="30"
 					   class="form-control" placeholder="Enter Password">
 			</div>
 			<div class="form-group">
 				<label for="adTitle">제목</label>
 				<input name="adTitle" id="adTitle" type="text" maxlength="100"
 					   class="form-control" placeholder="Enter Title">
 			</div>
 			<div class="form-group">
 				<label for="adContent">내용</label>
 				<textarea name="adContent" id="adContent"
 					   rows="10" class="form-control"></textarea>
 			</div>
 			<div class="form-group">
			  <label for="QcateId">FAQ 카테고리</label>
			  <select name="QcateId" id="QcateId">
			    <option value="1">구매, 환불</option>
			    <option value="2">회원</option>
			    <option value="3">상품</option>
			    <option value="4">채널</option>
			    <option value="5">서비스 소개, 이용 방법</option>
			    <option value="6">오류, 피해 접수</option>
			    <option value="7">기타</option>
			  </select>
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
