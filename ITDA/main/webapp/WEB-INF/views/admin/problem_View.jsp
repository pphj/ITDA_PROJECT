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
  <title>신고 상세 페이지</title>
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
                신고 처리
              </h5>
            </div>
          </div>
        </div>
      </div>
    </div>
	<div class="main-content" style="padding: 30px 25px;">
	<div class="card">
		<div class="card-body">
		<h3 style="text-align: center;">미처리 신고 목록</h3>
		<c:if test="${not empty boardProblemData}">
 		<table class="table boardProblemTable">
 		<thead>
	 		<tr>
	 			<th colspan="6" id="tabHead">신고된 게시글</th>
	 		</tr>
	 		<tr>
	 			<th class="text-center"><div>신고자</div></th>
	 			<th class="text-center"><div>피신고자</div></th>
	 			<th class="text-center"><div>게시물 번호</div></th>
	 			<th class="text-center"><div>신고사유</div></th>
	 			<th class="text-center"><div>신고일</div></th>
	 			<th class="text-center"><div>내용</div></th>
	 		</tr>
	 	</thead>
 		<c:forEach var="b" items="${boardProblemData}">
 			<tr>
 				<td class="text-center"><c:out value="${b.punchId}" /></td>
 				<td class="text-center"><c:out value="${b.sickId}" /></td>
 				<td class="text-center">
 					<a style="color: orange;"
 					 href="${pageContext.request.contextPath}/contents/${b.chNum}/${b.boardNum}" >
 					<c:out value="${b.boardNum}" />
 					</a>
 				</td>
 				<c:choose>
					<c:when test="${b.warnCateId == 1}">
						<td class="text-center"><div>홍보, 영리목적</div></td>
					</c:when>
					<c:when test="${b.warnCateId == 2}">
						<td class="text-center"><div>불법 정보</div></td>
					</c:when>
					<c:when test="${b.warnCateId == 3}">
						<td class="text-center"><div>음란, 청소년 유해</div></td>
					</c:when>
					<c:when test="${b.warnCateId == 4}">
						<td class="text-center"><div>욕설, 비방, 차별, 혐오</div></td>
					</c:when>
					<c:when test="${b.warnCateId == 5}">
						<td class="text-center"><div>도배, 스팸</div></td>
					</c:when>
					<c:when test="${b.warnCateId == 6}">
						<td class="text-center"><div>개인정보 노출, 거래</div></td>
					</c:when>
					<c:otherwise>
						<td class="text-center"><div>기타</div></td>
					</c:otherwise>
				</c:choose>
 				<td class="text-center"><c:out value="${b.warnDate}" /></td>
 				<td class="text-center" style="padding-right: 0px">
 				<textarea class="form-control" rows="5" style="resize: none;"
 				 readOnly>${b.warnReason}</textarea></td>
 			</tr>
 		</c:forEach>
 		</table>
 		</c:if>
 		<c:if test="${not empty replyProblemData}">
 		<table class="table replyProblemTable">
 		<thead>
	 		<tr>
	 			<th colspan="6" id="tabHead">신고된 댓글</th>
	 		</tr>
	 		<tr>
	 			<th class="text-center"><div>신고자</div></th>
	 			<th class="text-center"><div>피신고자</div></th>
	 			<th class="text-center"><div>댓글 번호</div></th>
	 			<th class="text-center"><div>신고사유</div></th>
	 			<th class="text-center"><div>신고일</div></th>
	 			<th class="text-center"><div>내용</div></th>
	 		</tr>
	 	</thead>
 		<c:forEach var="r" items="${replyProblemData}">
 			<tr>
 				<td class="text-center"><c:out value="${r.punchId}" /></td>
 				<td class="text-center"><c:out value="${r.sickId}" /></td>
 				<td class="text-center">
 					<a style="color: orange;"
 					 href="${pageContext.request.contextPath}/contents/${r.chNum}/${r.boardNum}" >
 					<c:out value="${r.replyNum}" />
 					</a>
 				</td>
 				<c:choose>
					<c:when test="${r.warnCateId == 1}">
						<td class="text-center"><div>홍보, 영리목적</div></td>
					</c:when>
					<c:when test="${r.warnCateId == 2}">
						<td class="text-center"><div>불법 정보</div></td>
					</c:when>
					<c:when test="${r.warnCateId == 3}">
						<td class="text-center"><div>음란, 청소년 유해</div></td>
					</c:when>
					<c:when test="${r.warnCateId == 4}">
						<td class="text-center"><div>욕설, 비방, 차별, 혐오</div></td>
					</c:when>
					<c:when test="${r.warnCateId == 5}">
						<td class="text-center"><div>도배, 스팸</div></td>
					</c:when>
					<c:when test="${r.warnCateId == 6}">
						<td class="text-center"><div>개인정보 노출, 거래</div></td>
					</c:when>
					<c:otherwise>
						<td class="text-center"><div>기타</div></td>
					</c:otherwise>
				</c:choose>
 				<td class="text-center"><c:out value="${r.warnDate}" /></td>
 				<td class="text-center" style="padding-right: 0px">
 				<textarea class="form-control" rows="5" style="resize: none;"
 				 readOnly>${r.warnReason}</textarea></td>
 			</tr>
 		</c:forEach>
 		</table>
 		</c:if>
 	  </div>	
 	</div>
 	</div>
 	<div class="text-center">
	 	<a href="${pageContext.request.contextPath}/admin/problem">
	 		<button class="btn btn-success btn-sm btn-round">
	 			<i class="ni ni-bullet-list-67"></i>&nbsp;목록
	 		</button>
	 	</a>
	 	<a href="${pageContext.request.contextPath}/admin/problem/${sickId}/all">
		 	<button class="btn btn-info btn-sm btn-round allProblem">
		 		<i class="ni ni-bullet-list-67"></i>&nbsp;모든 신고내용 보기
		 	</button>
	 	</a>
 	</div>
 	<input type="hidden" name="sickId" value="${sickId}">
</main>
</body>
</html>
