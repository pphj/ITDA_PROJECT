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
  <title>신고 처리</title>
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
  <script src="${pageContext.request.contextPath}/resources/js/admin/problem.js"></script>
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
		<h3 style="text-align: center;">신고 목록</h3>
 		<c:if test="${listcount > 0}">
 		<div class="rows" style="width: 48px; float: right;">
	 		<span>줄보기</span>
	 		<select class="form-control" id="viewcount">
	 			<option value="1">1</option>
	 			<option value="3">3</option>
	 			<option value="5">5</option>
	 			<option value="7">7</option>
	 			<option value="10" selected>10</option>
	 		</select>
 		</div>
	 	<table class="table table-striped">
	 		<thead>
		 		<tr>
		 			<th colspan="4">관리자 목록</th>
		 			<th colspan="1" style="text-align: right;"><span>총 신고 수 : ${sumListCount}</span></th>
		 		</tr>
		 		<tr>
		 			<th class="text-center"><div>번호</div></th>
		 			<th class="text-center"><div>아이디</div></th>
		 			<th class="text-center"><div>신고 횟수</div></th>
		 			<th class="text-center"><div>현재 상태</div></th>
		 			<th class="text-center"><div>신고 처리</div></th>
		 		</tr>
	 		</thead>
	 		<tbody>
	 			<c:set var="num" value="${listcount-(page-1)*limit}" />
	 			<c:forEach var="p" items="${problemList}">
	 				<tr>
	 					<td class="text-center">
		 					<c:out value="${p.rnum}" />
	 					</td>
	 					<td class="text-center targetSickId">
		 					<a href="${pageContext.request.contextPath}/admin/problem/${p.sickId}" style="color: #1294FA; font-weight: bold;">
		 						<div name="sickId"><c:out value="${p.sickId}" /></div>
		 					</a>
	 					</td>
	 					<td class="text-center" style="color: red; font-weight: bold;">
	 						<div><c:out value="${p.sumCount}" /></div>
	 					</td>
	 					<c:choose>
						    <c:when test="${p.statusid == 1}">
						        <td class="text-center" style="color: #38CFD5; font-weight: bold;"><div>정상</div></td>
						    </c:when>
						    <c:when test="${p.statusid == 2}">
						        <td class="text-center" style="color: #38CFD5; font-weight: bold;"><div>일시 정지</div></td>
						    </c:when>
						    <c:when test="${p.statusid == 3}">
						        <td class="text-center" style="color: #38CFD5; font-weight: bold;"><div>정지</div></td>
						    </c:when>
						</c:choose>
		 				<td class="td-actions text-center">
				        	<button type="button" rel="tooltip"
				             class="btn btn-secondary btn-icon btn-sm Pause" data-original-title="" title="">
				            	<i class="fa fa-pause pt-1"></i>&nbsp;&nbsp;&nbsp;일시정지
				            </button>
				            <button type="button" rel="tooltip"
				             class="btn btn-danger btn-icon btn-sm Stop" data-original-title="" title="">
				            	<i class="fa fa-ban pt-1"></i>&nbsp;&nbsp;&nbsp;정지
				            </button>
				            <button type="button" rel="tooltip"
				             class="btn btn-success btn-icon btn-sm Clear" data-original-title="" title="">
				            	<i class="fa fa-heart pt-1"></i>&nbsp;&nbsp;&nbsp;해제
				            </button>
				        </td>
	 				</tr>
	 			</c:forEach>
	 		</tbody>
		 </table>
			<form action="problemUpdate" method="post" enctype="multipart/form-data" name="problemPauseForm">
				<input type="hidden" name="userId" class="selectUserId" value="">
				<input type="hidden" name="approve" value="2">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
			<form action="problemUpdate" method="post" enctype="multipart/form-data" name="problemStopForm">
				<input type="hidden" name="userId" class="selectUserId" value="">
				<input type="hidden" name="approve" value="3">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
			<form action="problemUpdate" method="post" enctype="multipart/form-data" name="problemClearForm">
				<input type="hidden" name="userId" class="selectUserId" value="">
				<input type="hidden" name="approve" value="1">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		 	<div class="center-block">
		 		<ul class="pagination justify-content-end">
		 			<c:if test="${page <= 1}">
		 				<li class="page-item">
		 					<a class="page-link gray"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
		 				</li>
		 			</c:if>
		 			<c:if test="${page > 1}">
		 				<li class="page-item">
		 					<a class="page-link" href="problem?page=${page-1}"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
		 				</li>
		 			</c:if>
		 			<c:forEach var="a" begin="${startpage}" end="${endpage}">
		 				<c:if test="${a == page}">
		 					<li class="page-item active">
		 						<a class="page-link">${a}</a>
		 					</li>
		 				</c:if>
		 				<c:if test="${a != page}">
		 					<li class="page-item">
		 						<a class="page-link" href="problem?page=${a}">${a}</a>
		 					</li>
		 				</c:if>
		 			</c:forEach>
		 			<c:if test="${page >= maxpage}">
		 				<li class="page-item">
		 					<a class="page-link gray"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
		 				</li>
		 			</c:if>
		 			<c:if test="${page < maxpage}">
		 				<li class="page-item">
		 					<a class="page-link" href="problem?page=${page+1}"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
		 				</li>
		 			</c:if>
		 		</ul>
		 	</div>
		 </c:if>
		 	
		 	<c:if test="${listcount == 0}">
		 		<h3 style="text-align: center">신고 기록이 없습니다.</h3>
		 	</c:if>
	 	</div>
	</div>
    </div>
  </main>
</body>
</html>