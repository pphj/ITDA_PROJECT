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
  <title>이용권 상세 페이지</title>
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
	width: 100% !important;
}

.table th {
	width: 40% !important;
}
.table td {
	width: 60% !important;
}
.table tr:last-child td {
	border-bottom: 1px solid #f3f0f0 !important;
}
</style>
</head>
<body class="g-sidenav-show bg-gray-100">
  <jsp:include page="adminList.jsp" />
  <main class="main-content position-relative border-radius-lg ">
  <jsp:include page="adminNavbar.jsp" />
	<div class="card shadow-lg mx-4 card-profile-bottom">
      <div class="card-body p-3">
        <div class="row gx-4">
          <div class="col-auto my-auto">
            <div class="h-100">
              <h5 class="mb-1">
                이용권 관리
              </h5>
            </div>
          </div>
        </div>
      </div>
    </div>
	<div class="main-content" style="padding: 30px 25px;">
		<div class="card">
			<div class="card-body mx-auto">
		 		<table class="table boardProblemTable" style="width: 550px;">
		 			<c:if test="${not empty productData}">
		 			<c:forEach var="p" items="${productData}">
			 		<tr>
			 			<th class="text-center" colspan="2">
			 			<h3>이용권 상세 정보</h3></th>
			 			<td></td>
			 		</tr>
			 		<tr>
			 			<th class="text-center"><div>이용권 ID</div></th>
			 			<td class="text-center"><c:out value="${p.productId}" /></td>
			 		</tr>
			 		<tr>
			 			<th class="text-center"><div>이용권 이름</div></th>
			 			<td class="text-center"><c:out value="${p.productName}" /></td>
			 		</tr>
			 		<tr>
			 			<th class="text-center"><div>이용권 설명</div></th>
			 			<td class="text-center" style="padding-right: 0px">
		 				<textarea class="form-control" rows="3"
		 				 style="resize: none;" readOnly>${p.productDetail}</textarea></td>
			 		</tr>
			 		<tr>
			 			<th class="text-center"><div>이용권 가격</div></th>
			 			<td class="text-center"><c:out value="${p.productPrice}" /></td>
			 		</tr>
			 		<tr>
			 			<th class="text-center"><div>이용권 표시기간</div></th>
			 			<td class="text-center"><c:out value="${p.productTerm}" /></td>
			 		</tr>
			 		<tr>
			 			<th class="text-center"><div>이용권 생성자</div></th>
			 			<td class="text-center"><c:out value="${p.productWriter}" /></td>
			 		</tr>
			 		<tr>
			 			<th class="text-center"><div>이용권 수정자</div></th>
			 			<td class="text-center">
						<c:choose>
			                <c:when test="${p.productUpdater != null}">
			                	<c:out value="${p.productUpdater}" />
			                </c:when>
			                <c:otherwise>해당사항 없음</c:otherwise>
			            </c:choose>
						</td>
			 		</tr>
			 		<tr>
			 			<th class="text-center"><div>이용권 생성일</div></th>
			 			<td class="text-center"><c:out value="${p.productCreDate}" /></td>
			 		</tr>
			 		<tr>
			 			<th class="text-center"><div>이용권 수정일</div></th>
			 			<td class="text-center">
		 				<c:choose>
			                <c:when test="${p.productUpdateDate != null}">
			                    <c:out value="${p.productUpdateDate}" />
			                </c:when>
			                <c:otherwise>해당사항 없음</c:otherwise>
			            </c:choose>
		 				</td>
			 		</tr>
			 		<tr>
			 			<th class="text-center"><div>삭제 여부</div></th>
			 			<td class="text-center"><c:out value="${p.productDelete}" /></td>
			 		</tr>
			 		</c:forEach>
			 		</c:if>
		 		</table>
	 		</div>
	 	</div>
	 	<div class="text-center" style="margin-top: 20px;">
		 	<a href="${pageContext.request.contextPath}/admin/product">
		 		<button class="btn btn-success btn-sm btn-round">
		 			<i class="ni ni-bullet-list-67"></i> 목록
		 		</button>
		 	</a>
	 	</div>
 	</div>
</main>
</body>
</html>
