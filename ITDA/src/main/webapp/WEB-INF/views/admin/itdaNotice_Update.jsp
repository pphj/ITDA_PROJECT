<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/itda_logo.png">
  <title>사내 공지 수정 페이지</title>
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
  <script src="${pageContext.request.contextPath}/resources/js/admin/itdaNoticeUpdate.js"></script>
<script>
	if ('${result}' == 'passFail') {
		alert("비밀번호가 다릅니다");
	}
</script>
</head>
<body class="g-sidenav-show   bg-gray-100">
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
                사내 공지사항
              </h5>
            </div>
          </div>
        </div>
      </div>
    </div>
	<div class="container">
 		<form action="${pageContext.request.contextPath}/admin/itdaNoticeUpdateAction" method="post" enctype="multipart/form-data" name="itdaNoticeUpdate">
 			<input type="hidden" name="adNum" value="${itdaNoticeData.adNum}">
 			<h1>사내 공지 수정</h1>
 			<div class="form-group">
 				<label for="adWriter">작성자</label>
 				<input type="text" name="adWriter" class="form-control" value="${itdaNoticeData.adWriter}" readOnly>
 			</div>
 			<div class="form-group">
 				<label for="adTitle">제목</label>
 				<textarea name="adTitle" id="adTitle" rows="1" maxlength="100"
 						class="form-control">${itdaNoticeData.adTitle}</textarea>
 			</div>
 			<div class="form-group">
 				<label for="adContent">내용</label>
 				<textarea name="adContent" id="adContent"
 					   rows="10" class="form-control">${itdaNoticeData.adContent}</textarea>
 			</div>
 			<div class="form-group">
 				<label for="adPassword">비밀번호</label>
 				<input name="adPassword" id="adPassword" type="password" maxlength="30"
 					   class="form-control" placeholder="Enter adPassword">
 			</div>
 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
 			<div class="form-group">
	 			<button type="submit" class="btn btn-primary">수정</button>
	 			<button type="reset" class="btn btn-danger" onClick="history.go(-1)">취소</button>
 			</div>
 		</form>
 	</div>
</body>
</html>