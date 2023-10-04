<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/itda_logo.png">
  <title>Q&A/FAQ</title>
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
  <script src="${pageContext.request.contextPath}/resources/js/FAQ.js"></script>
  <script>

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
    <div class="container-fluid py-4" style="background: white;">
    <ul style="list-style: none; padding: 0; text-align: center; display: flex; justify-content: center;">
     <li>
      <button id="Q&A" style="border: none; border-bottom: 1px solid black;
       width: 60px; height: 35px;">Q&A</button>
     </li>
     <li>
      <button id="FAQ" style="border: none; margin-left: 3px;
       width: 60px; height: 35px;">FAQ</button>
     </li>
    </ul>
    	<div class="container">
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
	 		<thead>
	 		<tr>
	 			<th colspan="3">Q&A</th>
	 			<th colspan="3"><span>글 개수 : ${listcount}</span></th>
	 		</tr>
	 		<tr>
	 			<th><div>번호</div></th>
	 			<th><div>제목</div></th>
	 			<th><div>카테고리</div></th>
	 			<th><div>작성자</div></th>
	 			<th><div>날짜</div></th>
	 		</tr>
	 		</thead>
	 		<tbody>
	 			<c:set var="num" value="${listcount-(page-1)*limit}" />
	 			<c:forEach var="F" items="${FAQList}">
	 				<tr>
	 					<td>		<%-- 번호 부분 --%>
	 						&nbsp;&nbsp;&nbsp;&nbsp;
	 						<c:out value="${num}" />					<%-- num 출력 --%>
	 						<c:set var="num" value="${num-1}" />		<%-- num = num - 1 의미 --%>
	 					</td>
	 					<td>		<%-- 제목 부분 --%>
	 						<div>
	 							<a href="FAQdetail?num=${F.adNum}">
	 								<c:if test="${F.adTitle.length() >= 20}">
	 									<c:out value="${F.adTitle.substring(0,20)}..." escapeXml="true" />
	 								</c:if>
	 								<c:if test="${F.adTitle.length() < 20}">
	 									<c:out value="${F.adTitle}" escapeXml="true" />
	 								</c:if>
	 							</a>
	 						</div>
	 					</td>
	 					<c:choose>
						    <c:when test="${F.qcateId == 1}">
						        <td><div>&nbsp;&nbsp;홍보, 영리목적</div></td>
						    </c:when>
						    <c:when test="${F.qcateId == 2}">
						        <td><div>&nbsp;&nbsp;불법 정보</div></td>
						    </c:when>
						    <c:when test="${F.qcateId == 3}">
						        <td><div>&nbsp;&nbsp;음란, 청소년 유해</div></td>
						    </c:when>
						    <c:when test="${F.qcateId == 4}">
						        <td><div>&nbsp;&nbsp;욕설, 비방, 차별, 혐오</div></td>
						    </c:when>
						    <c:when test="${F.qcateId == 5}">
						        <td><div>&nbsp;&nbsp;도배, 스팸</div></td>
						    </c:when>
						    <c:when test="${F.qcateId == 6}">
						        <td><div>&nbsp;&nbsp;개인정보 노출, 거래</div></td>
						    </c:when>
						    <c:otherwise>
						        <td><div>&nbsp;&nbsp;기타</div></td>
						    </c:otherwise>
						</c:choose>
	 					<td><div>&nbsp;&nbsp;&nbsp;${F.adWriter}</div></td>
	 					<td><div><c:out value="${F.adDate}" /></div></td>
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
		 					<a class="page-link" href="list?page=${page-1}">이전&nbsp;</a>
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
		 						<a class="page-link" href="list?page=${a}">${a}</a>
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
		 					<a class="page-link" href="list?page=${page+1}">&nbsp;다음</a>
		 				</li>
		 			</c:if>
		 		</ul>
		 	</div>
		 	</c:if>
		 	
		 	<c:if test="${listcount == 0}">
		 		<h3 style="text-align: center">등록된 글이 없습니다.</h3>
		 	</c:if>
		 	
		 	<button type="button" id="faqwbtn" class="btn btn-success float-right">FAQ 작성</button>
	 	</div>
    </div>
  </main>
</body>
</html>