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
  <title>사내 공지 상세 페이지</title>
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
<script>
	$(function(){
		$("#itdaNoticeDelete").click(function(){
			$("#itdaNoticeModal").modal("show");
		})
	})
	
	let result = "${result}";
	if (result == 'passFail') {
		alert("비밀번호가 일치하지 않습니다.");
	}
	
	$(function() {
		$("form[name=itdaNoticeDeleteForm]").submit(function() {
			if ($("#adPassword").val() == '') {
				alert("비밀번호를 입력하세요");
				$("#adPassword").focus();
				return false;
			}
		})
	})
</script>
<style>
	.table {
		width: 100%;
	}
</style>
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
	<div class="main-content" style="padding: 30px 25px;">
	<div class="card">
		<div class="card-body">
 		<table class="table">
 			<tr>
 				<th colspan="2"><h3 style="text-align: center;">사내 공지 상세 내용</h3></th>
 			</tr>
 			<tr>
 				<td><div>작성자</div></td>
 				<td><div>${itdaNoticeData.adWriter}</div></td>
 			</tr>
 			<tr>
 				<td><div>제목</div></td>
 				<td><c:out value="${itdaNoticeData.adTitle}" /></td>
 			</tr>
 			<tr>
 				<td><div>내용</div></td>
 				<td style="padding-right: 0px">
 				<textarea class="form-control" rows="20" style="resize: none;"
 				 readOnly>${itdaNoticeData.adContent}</textarea></td>
 			</tr>
 			<tr>
 				<td colspan="2" class="center" style="text-align: center;">
 					<a href="${pageContext.request.contextPath}/admin/itdaNotice">
 						<button class="btn btn-success btn-sm btn-round">
 							<i class="ni ni-bullet-list-67"></i>&nbsp;목록
 						</button>
 					</a>
 					<sec:authorize access="isAuthenticated()">
 						<sec:authentication property="principal" var="pinfo" />
 						<c:if test="${id == adWriter}">
		 					<a href="${pageContext.request.contextPath}/admin/itdaNoticeUpdate/${itdaNoticeData.adNum}">
		 						<button class="btn btn-warning btn-sm btn-round">
		 							<i class="fa fa-pencil-square-o"></i>&nbsp;수정
		 						</button>
		 					</a>
		 					<a href="#">
		 						<button class="btn btn-danger btn-sm btn-round" id="itdaNoticeDelete"
		 						data-toggle="modal" data-target="#itdaNoticeModal">
		 						<i class="fa fa-trash-o"></i>&nbsp;삭제</button>	
		 					</a>
	 					</c:if>
 					</sec:authorize>
 				</td>
 			</tr>
 			<%-- 삭제 모달 시작 --%>
 			<div class="modal" id="itdaNoticeModal">
 				<div class="modal-dialog">
 					<div class="modal-content">
 						<div class="modal-body">	<%-- 모달 바디 --%>
 							<form name="itdaNoticeDeleteForm" action="${pageContext.request.contextPath}/admin/itdaNoticeDelete" method="post">
 								<input type="hidden" name="num" value="${itdaNoticeData.adNum}" id="adNum">
 								<div class="form-group">
 									<label for="adPassword">비밀번호</label>
 									<input type="password" class="form-control" placeholder="Enter password"
 									name="adPassword" id="adPassword">
 								</div>
 								<button type="submit" class="btn btn-primary">전송</button>
 								<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
 								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
 							</form>
 						</div>
 					</div>
 				</div>
 			</div><%-- 삭제 모달 끝 --%>
 		</table>
 		</div>
	</div>
 	</div>
</body>
</html>
