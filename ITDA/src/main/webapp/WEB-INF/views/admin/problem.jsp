<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/admin/list.js"></script>
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
                신고 처리
              </h5>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid py-4">
    	<div class="container">
 		<c:if test="${listcount > 0}">
 		<div class="rows">
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
	 			<th colspan="3">게시판 - list</th>
	 			<th colspan="2"><span>글 개수 : ${listcount}</span></th>
	 		</tr>
	 		<tr>
	 			<th><div>번호</div></th>
	 			<th><div>제목</div></th>
	 			<th><div>작성자</div></th>
	 			<th><div>날짜</div></th>
	 			<th><div>조회수</div></th>
	 		</tr>
	 		</thead>
	 		<tbody>
	 			<c:set var="num" value="${listcount-(page-1)*limit}" />
	 			<c:forEach var="b" items="${boardlist}">
	 				<tr>
	 					<td>		<%-- 번호 부분 --%>
	 						<c:out value="${num}" />					<%-- num 출력 --%>
	 						<c:set var="num" value="${num-1}" />		<%-- num = num - 1 의미 --%>
	 					</td>
	 					<td>		<%-- 제목 부분 --%>
	 						<div>
	 							<c:if test="${b.board_re_lev != 0}">	<%-- 답글인 경우 (boardlist의 데이터를 b로 선언해 불러올때는 대문자로 써줘야 한다) --%>
	 								<c:forEach var="a" begin="0" end="${b.board_re_lev*2}" step="1">
	 								&nbsp;		
	 								</c:forEach>
	 								<img src="${pageContext.request.contextPath}/resources/image/line.gif">
	 							</c:if>
	 							
	 							<c:if test="${b.board_re_lev == 0}">	<%-- 원문인 경우--%>
	 								&nbsp;			<%-- 원문글을 나타내기 위해 살짝 여백을 줌 --%>
	 							</c:if>
	 							
	 							<a href="detail?num=${b.board_num}">
	 								<c:if test="${b.board_subject.length() >= 20}">
	 									<c:out value="${b.board_subject.substring(0,20)}..." escapeXml="true" />
	 								</c:if>
	 								<c:if test="${b.board_subject.length() < 20}">
	 									<c:out value="${b.board_subject}" escapeXml="true" />
	 								</c:if>
	 							</a>
	 							<span class="small">[${b.cnt}]</span>
	 						</div>
	 					</td>
	 					<td><div>${b.board_name}</div></td>
	 					<td><div>${b.board_date}</div></td>
	 					<td><div>${b.board_readcount}</div></td>
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
		 	
		 	<button type="button" class="btn btn-info float-right">글 쓰 기</button>
	 	</div>
    </div>
  </main>
</body>
</html>