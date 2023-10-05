<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/itda_logo.png">
  <title>FAQ 상세 페이지</title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="${pageContext.request.contextPath}/resources/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="${pageContext.request.contextPath}/resources/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="${pageContext.request.contextPath}/resources/assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
    <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/resources/assets/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/core/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                Q&A/FAQ
              </h5>
            </div>
          </div>
        </div>
      </div>
    </div>
	<div class="container">
 		<table class="table">
 			<tr>
 				<th colspan="2">&nbsp;</th>
 			</tr>
 			<tr>
 				<td><div>질문자</div></td>
 				<td><div>${qnadata.userId}</div></td>
 			</tr>
 			<tr>
 				<td><div>제목</div></td>
 				<td><c:out value="${qnadata.adTitle}" /></td>
 			</tr>
 			<tr>
 				<td><div>카테고리</div></td>
 				<c:choose>
					<c:when test="${qnadata.qcateId == 1}">
						<td><div>홍보, 영리목적</div></td>
					</c:when>
					<c:when test="${qnadata.qcateId == 2}">
						<td><div>불법 정보</div></td>
					</c:when>
					<c:when test="${qnadata.qcateId == 3}">
						<td><div>음란, 청소년 유해</div></td>
					</c:when>
					<c:when test="${qnadata.qcateId == 4}">
						<td><div>욕설, 비방, 차별, 혐오</div></td>
					</c:when>
					<c:when test="${qnadata.qcateId == 5}">
						<td><div>도배, 스팸</div></td>
					</c:when>
					<c:when test="${qnadata.qcateId == 6}">
						<td><div>개인정보 노출, 거래</div></td>
					</c:when>
					<c:otherwise>
						<td><div>기타</div></td>
					</c:otherwise>
				</c:choose>
 			</tr>
 			<tr>
 				<td><div>내용</div></td>
 				<td style="padding-right: 0px">
 				<textarea class="form-control" rows="5" readOnly>${qnadata.adContent}</textarea></td>
 			</tr>
 			<tr>
 				<td colspan="2" class="center">
 					<a href="${pageContext.request.contextPath}/admin/FAQ">
 						<button class="btn btn-success">목록</button>
 					</a>
 				</td>
 			</tr>
 		</table>
 	</div>
</body>
</html>
