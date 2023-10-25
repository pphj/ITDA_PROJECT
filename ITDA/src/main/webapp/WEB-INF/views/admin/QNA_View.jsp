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
  <title>Q&A 상세 페이지</title>
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
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/admin/qnaView.js"></script>
  <script> var contextPath = "<%=request.getContextPath()%>";</script>
<style>
	.table {
		width: 100%;
	}
</style>
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
 		<table class="table">
 			<tr>
 				<th colspan="2">
					<h3 style="text-align: center;">Q&A 내용</h3>
				</th>
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
						<td><div>구매, 환불</div></td>
					</c:when>
					<c:when test="${qnadata.qcateId == 2}">
						<td><div>회원</div></td>
					</c:when>
					<c:when test="${qnadata.qcateId == 3}">
						<td><div>상품</div></td>
					</c:when>
					<c:when test="${qnadata.qcateId == 4}">
						<td><div>채널</div></td>
					</c:when>
					<c:when test="${qnadata.qcateId == 5}">
						<td><div>서비스 소개, 이용 방법</div></td>
					</c:when>
					<c:when test="${qnadata.qcateId == 6}">
						<td><div>오류, 피해 접수</div></td>
					</c:when>
					<c:otherwise>
						<td><div>기타</div></td>
					</c:otherwise>
				</c:choose>
 			</tr>
 			<tr>
 				<td><div>내용</div></td>
 				<td style="padding-right: 0px">
 				<textarea class="form-control" rows="5"
 				 readOnly style="resize: none;">${qnadata.adContent}</textarea></td>
 			</tr>
 			<tr>
 				<td colspan="2" class="center" style="text-align: center;">
 					<button class="btn btn-primary btn-sm btn-round">
	 					<i class="fa fa-question-circle">
	 					</i><span id="count">&nbsp;&nbsp;${count}</span>
 					</button>
 					<a href="${pageContext.request.contextPath}/admin/FAQ">
 						<button class="btn btn-success btn-sm btn-round">
 							<i class="ni ni-bullet-list-67"></i> 목록
 						</button>
 					</a>
 				</td>
 			</tr>
 		</table>
 		<%-- 댓글 --%>
 		<div id="qnaReply">
 			<table class="table">
	 			<thead>
	 				<tr>
	 					<td colspan="1" class="text-center">번호</td>
	 					<td colspan="1">답변자</td>
	 					<td colspan="2">내용</td>
	 					<td colspan="1" class="text-right">날짜</td>
	 				</tr>
	 			</thead>
	 			<tbody>
	 			</tbody>
	 		</table>
	 		<div id="message" style="margin-bottom: 30px;"></div>
	 		<button class="btn btn-info float-left btn-sm btn-round">총 1000자까지 가능합니다.</button>
	 		<button id="qnaWrite" class="btn btn-info btn-sm btn-round" style="float: right;">답변 등록</button>
	 		<textarea rows="3" class="form-control" id="qnaReplyContent" maxLength="1000"
	 			style="margin-bottom: 30px; resize: none;">
	 		</textarea>
	 		<form name="forNum">
	 			<input type="hidden" name="num" value="${qnadata.adNum}" id="adNum">
	 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	 		</form>
	 	</div>
 	</div>
 	</div>
	</div>
</main>
</body>
</html>
