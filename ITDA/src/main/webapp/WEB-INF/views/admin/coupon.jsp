<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<script>
$(function(){
	let result = "${result}";
	
	if (result == 'passFail') {
		alert("쿠폰이 DB에 없습니다. 다시 확인해주세요.");
	}
	if (result == 'deleteSuccess') {
		alert("쿠폰 삭제 완료");
	}
	if (result == 'updateSuccess') {
		alert("쿠폰 수정 완료");
	}

})
</script>
<style>
	form[name=couponDeleteForm] input {
		margin: 10px 0px;
	}
	form[name=couponUpdateForm] input {
		margin: 10px 0px;
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
	 			<th colspan="9">쿠폰 관리</th>
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
	 			<th class="text-center"><div>활성화 상태</div></th>
	 			<th class="text-center"><div>유효기간</div></th>
	 			<th class="text-center"><div>삭제</div></th>
	 		</tr>
	 		</thead>
	 		<tbody>
	 			<c:set var="num" value="${listcount-(page-1)*limit}" />
	 			<c:forEach var="c" items="${couponList}">
	 				<tr>
	 					<td class="text-center"><div>${c.couponNum}</div></td>
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
						<c:choose>
						    <c:when test="${c.couponState eq 'N'}">
						        <td class="text-center"><div>&nbsp;&nbsp;사용중지</div></td>
						    </c:when>
						    <c:when test="${c.couponState eq 'Y'}">
						        <td class="text-center"><div>&nbsp;&nbsp;사용중</div></td>
						    </c:when>
						</c:choose>
						<td class="text-center"><div>${c.couponTerm}</div></td>
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal" var="pinfo" />
							<c:choose>
							    <c:when test="${c.adminId == pinfo.username}">
							        <td class="text-center">
									<button type="button" class="couponDeletebtn btn btn-danger
									 float-right btn-sm btn-round">
									 <i class="fa fa-trash-o"></i>&nbsp;삭제</button>
									</td>
							    </c:when>
							    <c:otherwise>
							    	<td class="text-center"><div>작성자가 아님</div></td>
							    </c:otherwise>
							</c:choose>
						</sec:authorize>
	 				</tr>
	 			</c:forEach>
	 		</tbody>
		 	</table>
		 	<div class="center-block">
		 		<button type="button" id="couponCreatebtn"
		 	 	 class="btn btn-success float-right btn-sm btn-round">쿠폰 작성하기</button>
		 	 	<button type="button"
				 class="btn btn-info float-right btn-sm btn-round couponUpdatebtn">쿠폰 사용중지</button>
		 		<ul class="pagination justify-content-end">
		 			<c:if test="${page <= 1}">
		 				<li class="page-item">
		 					<a class="page-link gray"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
		 				</li>
		 			</c:if>
		 			<c:if test="${page > 1}">
		 				<li class="page-item">
		 					<a class="page-link" href="coupon?page=${page-1}"><i class="fa fa-chevron-left" aria-hidden="true"></i>;</a>
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
		 					<a class="page-link gray"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
		 				</li>
		 			</c:if>
		 			<c:if test="${page < maxpage}">
		 				<li class="page-item">
		 					<a class="page-link" href="coupon?page=${page+1}"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
		 				</li>
		 			</c:if>
		 		</ul>
		 	</div>
		 	</c:if>
		 	<%-- 삭제 모달 시작 --%>
 			<div class="modal" id="couponDeleteModal">
 				<div class="modal-dialog">
 					<div class="modal-content">
 						<div class="modal-body">
 							<form name="couponDeleteForm" action="${pageContext.request.contextPath}/admin/couponDelete" method="post">
 								<div class="form-group">
 									<label for="couponCheck">쿠폰 삭제 전 데이터 확인</label>
 									<input type="text" class="form-control" placeholder="Enter Coupon Number"
 									 name="couponNum" id="couponNum">
 									<input type="text" class="form-control" placeholder="Enter Coupon Code"
 									 name="couponCode" id="couponCode"><span class="message"></span>
 								</div>
 								<div style="text-align: center;">
 								<button type="submit" class="btn btn-primary btn-sm btn-round">삭제</button>
 								<button type="button" class="btn btn-danger btn-sm btn-round" data-dismiss="modal">취소</button>
 								</div>
 								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
 							</form>
 						</div>
 					</div>
 				</div>
 			</div>
 			<%-- 삭제 모달 끝 --%>
 			<%-- 수정 모달 시작 --%>
 			<div class="modal" id="couponUpdateModal">
 				<div class="modal-dialog">
 					<div class="modal-content">
 						<div class="modal-body">
 							<form name="couponUpdateForm" action="${pageContext.request.contextPath}/admin/couponUpdate" method="post">
 								<div class="form-group">
 									<label for="couponCheck">사용중지할 쿠폰의 정보를 입력하세요</label>
 									<input type="text" class="form-control" placeholder="Enter Coupon Code"
 									 name="couponCode" id="couponCode2"><span class="message2"></span>
 									 <input type="text" class="form-control" placeholder="Enter Coupon Price"
 									 name="couponPrice" id="couponPrice">
 									 <input type="text" class="form-control" placeholder="Enter Coupon Term"
 									 name="couponTerm" id="couponTerm">
 								</div>
 								<div style="text-align: center;">
 								<button type="submit" class="btn btn-primary btn-sm btn-round">수정</button>
 								<button type="button" class="btn btn-danger btn-sm btn-round" data-dismiss="modal">취소</button>
 								</div>
 								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
 							</form>
 						</div>
 					</div>
 				</div>
 			</div>
 			<%-- 수정 모달 끝 --%>
		 	<c:if test="${listcount == 0}">
		 		<h3 style="text-align: center">등록된 쿠폰이 없습니다.</h3>
		 	</c:if>
	 	</div>
    </div>
    </div>
  </main>
</body>
</html>