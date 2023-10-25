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
  <title>이용권 관리</title>
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
  <script src="${pageContext.request.contextPath}/resources/js/admin/product.js"></script>
<style>
.floatData1 {position: absolute;
    left: 40%;
    top: 10%;
    margin-left: -80px;
}
.floatData2 {position: absolute;
    left: 40%;
    top: 35%;
    margin-left: -80px;
}
.floatData3 {position: absolute;
    left: 90%;
    top: 55%;
    margin-left: -80px;
}
.floatData4 {position: absolute;
    left: 90%;
    top: 70%;
    margin-left: -80px;
}
.subProductData {
	display: -webkit-inline-box;
	margin-left: 10px;
}
.hideText {
	width: 150%;
	padding: 15px 20px;
    background-color: black;
    border-radius: 15px;
    color: white;
    position: absolute;
    display: none;
}
.floatData2:hover > .hideText {
	display: block;
}
.floatData2:hover + .floatData3 {
    display: none !important;
}
.floatData2:hover + .floatData3 + .floatData4 {
    display: none !important;
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
              	이용권 관리
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
	 		<div class="subProductData">
	 		<c:forEach var="c" items="${productList}">
		 	<div class="card text-center" style="width: 270px; border-radius: 30px; margin-left: 15px;">
			    <div class="card-item metal ar mx-auto">
			        <div class="product_img_container" style="background: white;">
			        	<img alt="" src="${pageContext.request.contextPath}/resources/assets/img/product.png">
			        	<a href="${pageContext.request.contextPath}/admin/product/${c.productName}"
			        	class="floatData1">
		 					<div name="productName"><c:out value="${c.productName}" /></div>
		 				</a>
			        	<span class="floatData2">
				            <c:choose>
				                <c:when test="${fn:length(c.productDetail) > 9}">
				                    <c:out value="${fn:substring(c.productDetail, 0, 9)}" />...
				                    <span class="hideText">${c.productDetail}</span>
				                </c:when>
				                <c:otherwise>
				                    <c:out value="${c.productDetail}" />
				                </c:otherwise>
				            </c:choose>
				        </span>
			        	<span class="floatData3">기간 : ${c.productTerm}일</span>
			        	<span class="floatData4">${c.productPrice}원</span>
			        </div>
			    </div>
			</div>
			</c:forEach>
	 		</div>
		 	<div class="center-block mt-5">
		 		<button type="button" id="productCreatebtn" class="btn btn-success
		 		 float-right btn-sm btn-round">이용권 생성하기</button>
		 		<ul class="pagination justify-content-end">
		 			<c:if test="${page <= 1}">
		 				<li class="page-item">
		 					<a class="page-link gray"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
		 				</li>
		 			</c:if>
		 			<c:if test="${page > 1}">
		 				<li class="page-item">
		 					<a class="page-link" href="product?page=${page-1}"><i class="fa fa-chevron-left" aria-hidden="true"></i>;</a>
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
		 						<a class="page-link" href="product?page=${a}">${a}</a>
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
		 					<a class="page-link" href="product?page=${page+1}"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
		 				</li>
		 			</c:if>
		 		</ul>
		 	</div>
		 	</c:if>
		 	
		 	<c:if test="${listcount == 0}">
		 		<h3 style="text-align: center">등록된 이용권이 없습니다.</h3>
		 	</c:if>
	 	</div>
    </div>
    </div>
  </main>
</body>
</html>