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
  <title>쿠폰 관리</title>
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
  <script src="${pageContext.request.contextPath}/resources/js/admin/coupon.js"></script>
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
		 	<table class="table">
	 		<thead >
	 		<tr>
	 			<th colspan="6">쿠폰 관리</th>
	 			<th colspan="1"><span>현재 쿠폰 갯수 : ${listcount}</span></th>
	 		</tr>
	 		<tr>
	 			<th class="text-center"><div>번호</div></th>
	 			<th class="text-center"><div>쿠폰 코드</div></th>
	 			<th class="text-center"><div>쿠폰명</div></th>
	 			<th class="text-center"><div>쿠폰 내용</div></th>
	 			<th class="text-center"><div>쿠폰 가격</div></th>
	 			<th class="text-center"><div>생성일</div></th>
	 			<th class="text-center"><div>만료일</div></th>
	 		</tr>
	 		</thead>
	 		<tbody>
	 			<c:set var="num" value="${listcount-(page-1)*limit}" />
	 			<c:forEach var="c" items="${couponList}">
	 				<tr>
	 					<td class="text-center">
	 						<c:out value="${num}" />
	 						<c:set var="num" value="${num-1}" />
	 					</td>
	 					<td class="text-center"><div>${c.couponCode}</div></td>
	 					<td class="text-center"><div>${c.couponName}</div></td>
	 					<td class="text-center"><div>${c.couponDetail}</div></td>
	 					<td class="text-center"><div>${c.couponPrice}</div></td>
	 					<c:choose>
						    <c:when test="${not empty c.couponCreate}">
						        <c:set var="Date" value="${fn:substring(c.couponCreate, 0, 10)}" />
						        <td class="text-center"><div><c:out value="${Date}" /></div></td>
						    </c:when>
						</c:choose>
						<c:choose>
						    <c:when test="${not empty c.couponExdate}">
						        <c:set var="Date" value="${fn:substring(c.couponCreate, 0, 10)}" />
						        <td class="text-center"><div><c:out value="${Date}" /></div></td>
						    </c:when>
						    <c:otherwise>
						    	<td class="text-center"><div>만료일 미정</div></td>
						    </c:otherwise>
						</c:choose>
	 				</tr>
	 			</c:forEach>
	 		</tbody>
		 	</table>
		 	<div class="center-block">
		 		<ul class="pagination justify-content-center">
		 			<c:if test="${page <= 1}">
		 				<li class="page-item">
		 					<a class="page-link gray">이전&nbsp;</a>
		 				</li>
		 			</c:if>
		 			<c:if test="${page > 1}">
		 				<li class="page-item">
		 					<a class="page-link" href="coupon?page=${page-1}">이전&nbsp;</a>
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
		 						<a class="page-link" href="coupon?page=${a}">${a}</a>
		 					</li>
		 				</c:if>
		 			</c:forEach>
		 			
		 			
		 			<c:if test="${page >= maxpage}">
		 				<li class="page-item">
		 					<a class="page-link gray">&nbsp;다음</a>
		 				</li>
		 			</c:if>
		 			<c:if test="${page < maxpage}">
		 				<li class="page-item">
		 					<a class="page-link" href="coupon?page=${page+1}">&nbsp;다음</a>
		 				</li>
		 			</c:if>
		 		</ul>
		 	</div>
		 	</c:if>
		 	
		 	<c:if test="${listcount == 0}">
		 		<h3 style="text-align: center">등록된 쿠폰이 없습니다.</h3>
		 	</c:if>
		 	
		 	<button type="button" id="couponCreatebtn" class="btn btn-success float-right btn-sm btn-round">쿠폰 생성하기</button>
	 	</div>
    </div>
    </div>
  </main>
</body>
</html>