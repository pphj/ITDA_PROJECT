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
<script>
	let result = "${result}";
	if (result == 'passFail') {
		alert("비밀번호가 일치하지 않습니다.");
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
 				<td><div>글쓴이</div></td>
 				<td><div>${faqdata.faqWriter}</div></td>
 			</tr>
 			<tr>
 				<td><div>제목</div></td>
 				<td><c:out value="${faqdata.faqTitle}" /></td>
 			</tr>
 			<tr>
 				<td><div>내용</div></td>
 				<td style="padding-right: 0px">
 				<textarea class="form-control" rows="5" readOnly>${faqdata.faqContent}</textarea></td>
 			</tr>
 			<tr>
 				<td colspan="2" class="center">
 					<sec:authorize access="isAuthenticated()">
 						<sec:authentication property="principal" var="pinfo" />
		 				<c:if test="${id == faqWriter}">	<%-- 작성자거나 관리자일때 권한 부여 --%>
		 					<a href="FAQmodify?num=${faqdata.faqNum}">			<%-- Controller와 주소가 동일해야 한다. 다르면 500에러 --%>
		 						<button class="btn btn-warning">수정</button>			<%-- 수정 클릭시 BoardModifyView 실행 --%>
		 					</a>
		 				</c:if>
 					</sec:authorize>
 					<a href="FAQ">
 						<button class="btn btn-success">FAQ 목록</button>				<%-- 목록 클릭시 BoardList 실행 --%>
 					</a>
 				</td>
 			</tr>
 		</table>
 	</div>
</body>
</html>
