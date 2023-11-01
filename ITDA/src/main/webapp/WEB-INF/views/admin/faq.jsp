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
  <title>Q&A/FAQ</title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- CSS Files -->
  <link id="pagestyle" href="${pageContext.request.contextPath}/resources/assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
    <!--   Core JS Files   -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/core/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/admin/faq.js"></script>
<style>
  	.container{
  		width: 100%;
  	}
	.button-active {
	  border: none;
	  border-bottom: 1px solid black;
	}
	
	.button-inactive {
	  border: none;
	}
	#FAQ, #QNA {
		width: 100px;
    	height: 40px;
	}
	#faqList_Form {
		width: 100%;
	}
	#faqList_Form > div {
		display: flex;
	    width: 30%;
	    height: 40px;
	    margin: auto;
	}
	#viewcount2 {
		height: 25px;
	}
	#faqList_Form > div > input {
		width: 240px;
	    height: 25px;
	    border-radius: 0;
	    border: 1px solid black;
	}
	#search_but {
		height: 25px;
	    font-size: 8px;
	    border-radius: 0;
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
    <div class="container-fluid py-4" style="background: white;">
    <ul style="list-style: none; padding: 0; text-align: center; display: flex; justify-content: center;">
     <li>
      <button id="FAQ" class="button-active">FAQ</button>
     </li>
     <li>
      <button id="QNA" class="button-inactive">Q&A</button>
     </li>
    </ul>
    <div class="main-content" style="padding: 0px 25px 30px 25px;">
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
	 		<thead>
	 		<tr>
	 			<th colspan="4" id="tabHead">FAQ</th>
	 			<th colspan="1" class="text-center"><span>글 개수 : ${listcount}</span></th>
	 		</tr>
	 		<tr>
	 			<th class="text-center"><div>번호</div></th>
	 			<th class="text-center"><div>제목</div></th>
	 			<th class="text-center"><div>카테고리</div></th>
	 			<th id="tabUser" class="text-center"><div>질문자</div></th>
	 			<th id="tabWriter" class="text-center"><div>작성자</div></th>
	 			<th class="text-center"><div>날짜</div></th>
	 		</tr>
	 		</thead>
	 		<tbody>
	 			<c:set var="num" value="${listcount-(page-1)*limit}" />
	 			<c:forEach var="F" items="${FAQList}">
	 				<tr>
	 					<td class="text-center">
	 						<c:out value="${num}" />
	 						<c:set var="num" value="${num-1}" />
	 					</td>
	 					<td class="text-center">
	 						<div>
	 							<a href="${pageContext.request.contextPath}/admin/FAQ/${F.adNum}">
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
						        <td class="text-center"><div>&nbsp;&nbsp;구매, 환불</div></td>
						    </c:when>
						    <c:when test="${F.qcateId == 2}">
						        <td class="text-center"><div>&nbsp;&nbsp;회원</div></td>
						    </c:when>
						    <c:when test="${F.qcateId == 3}">
						        <td class="text-center"><div>&nbsp;&nbsp;상품</div></td>
						    </c:when>
						    <c:when test="${F.qcateId == 4}">
						        <td class="text-center"><div>&nbsp;&nbsp;채널</div></td>
						    </c:when>
						    <c:when test="${F.qcateId == 5}">
						        <td class="text-center"><div>&nbsp;&nbsp;서비스 소개, 이용 방법</div></td>
						    </c:when>
						    <c:when test="${F.qcateId == 6}">
						        <td class="text-center"><div>&nbsp;&nbsp;오류, 피해 접수</div></td>
						    </c:when>
						    <c:otherwise>
						        <td class="text-center"><div>&nbsp;&nbsp;기타</div></td>
						    </c:otherwise>
						</c:choose>
	 					<td class="text-center"><div>${F.adWriter}</div></td>
	 					<c:choose>
						    <c:when test="${not empty F.adDate}">
						        <c:set var="Date" value="${fn:substring(F.adDate, 0, 10)}" />
						        <td class="text-center"><div><c:out value="${Date}" /></div></td>
						    </c:when>
						</c:choose>
	 				</tr>
	 			</c:forEach>
	 		</tbody>
		 	</table>
		 	<div class="center-block">
		 		<button type="button" id="faqwbtn" class="btn btn-success
		 		 float-right btn-sm btn-round">FAQ 작성</button>
		 		<ul class="pagination justify-content-end">
		 			<c:if test="${page <= 1}">
		 				<li class="page-item">
		 					<a class="page-link gray"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
		 				</li>
		 			</c:if>
		 			<c:if test="${page > 1}">
		 				<li class="page-item">
		 					<a class="page-link" href="FAQ?page=${page-1}"><i class="fa fa-chevron-left" aria-hidden="true"></i>;</a>
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
		 						<a class="page-link" href="FAQ?page=${a}">${a}</a>
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
		 					<a class="page-link" href="FAQ?page=${page+1}"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
		 				</li>
		 			</c:if>
		 		</ul>
		 	</div>
		 	</c:if>
		 	<c:if test="${listcount == 0}">
		 		<h3 style="text-align: center">등록된 글이 없습니다.</h3>
		 	</c:if>
		 	<div class="searchBoxArea" style="margin-top: 30px;">
				<form action="FAQ" method="post" id="faqList_Form">
					<div class="form-group">
						<select id="viewcount2" name="search_field">
							<option value="0" selected>제목</option>
							<option value="1">카테고리</option>
							<option value="2">질문자</option>
							<option value="3">작성자</option>
							<option value="4">날짜</option>
						</select>
						<input name="search_word" type="text" class="form-control"
						 placeholder="검색어를 입력하세요" value="${search_word}">
						<button class="btn btn-primary btn-sm" type="submit"
						 id="search_but"><i class="fa fa-search" aria-hidden="true"></i></button>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
			</div>
	 	</div>
    </div>
    </div>
	</div>
  </main>
</body>
</html>