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
  <title>관리자 승인</title>
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
  <script src="${pageContext.request.contextPath}/resources/js/admin/adminApprove.js"></script>
<style>
	#adminList_Form {
		width: 100%;
	}
	#adminList_Form > div {
		display: flex;
	    width: 30%;
	    height: 40px;
	    margin: auto;
	}
	#viewcount2 {
		height: 25px;
	}
	#adminList_Form > div > input {
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
                관리자 승인
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
	 	<table class="table table-striped">
	 		<thead>
	 		<tr>
	 			<th colspan="6">관리자 목록</th>
	 			<th colspan="1"><span>총 관리자 수 : ${listcount}</span></th>
	 		</tr>
	 		<tr>
	 			<th class="text-center"><div>번호</div></th>
	 			<th class="text-center"><div>아이디</div></th>
	 			<th class="text-center"><div>이름</div></th>
	 			<th class="text-center"><div>부서</div></th>
	 			<th class="text-center"><div>직급</div></th>
	 			<th class="text-center"><div>권한 등급</div></th>
	 			<th class="text-center"><div>권한 변경</div></th>
	 		</tr>
	 		</thead>
	 		<tbody>
	 			<c:set var="num" value="${listcount-(page-1)*limit}" />
	 			<c:forEach var="a" items="${adminApproveList}">
	 				<tr>
	 					<td class="text-center">
	 						<c:out value="${num}" />
	 						<c:set var="num" value="${num-1}" />
	 					</td>
	 					<td class="text-center targetAdminId"><div><c:out value="${a.adminId}" /></div></td>
	 					<td class="text-center"><div>${a.adminName}</div></td>
	 					<td class="text-center"><div>${a.adminDept}</div></td>
	 					<td class="text-center"><div>${a.adminClass}</div></td>
	 					<td class="text-center"><div>${a.authName}</div></td>
	 					<td class="td-actions text-center">
			              <button type="button" rel="tooltip"
			               class="btn btn-info btn-icon btn-sm authUpdate" data-original-title="" title="">
			                <i class="fa fa-pencil-square-o pt-1"></i>&nbsp;&nbsp;&nbsp;변경
			              </button>
			            </td>
	 				</tr>
	 			</c:forEach>
	 		</tbody>
		 	</table>
		 	<!-- 변경 모달 -->
			<div class="modal fade" id="authSelect" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">권한을 선택해주세요</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"
			        style="border: none; border-radius: 12px; width: 25px; height: 25px;">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<form action="authApproveUpdate" method="post" enctype="multipart/form-data" name="authApproveForm">
				      	<div>
				      		<input type="hidden" name="adminId" class="selectAdminId" value="">
				      	</div>
				      	<div class="custom-control custom-radio mb-3">
				      		<input class="custom-control-input" value="ROLE_ADMIN" name="authName" type="radio">
				      		<label class="custom-control-label" for="ROLE_ADMIN">
				      			<span>ROLE_ADMIN</span>
				      		</label>
				      	</div>
				      	<div class="custom-control custom-radio mb-3">
				      		<input class="custom-control-input" value="ROLE_SUPER" name="authName" type="radio">
				      		<label class="custom-control-label" for="ROLE_SUPER">
				      			<span>ROLE_SUPER</span>
				      		</label>
				      	</div>
					  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				  	</form>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-primary approveOK">변경</button>
			        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- 모달 끝 -->
		 	<div class="center-block">
		 		<ul class="pagination justify-content-end">
		 			<c:if test="${page <= 1}">
		 				<li class="page-item">
		 					<a class="page-link gray"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
		 				</li>
		 			</c:if>
		 			<c:if test="${page > 1}">
		 				<li class="page-item">
		 					<a class="page-link" href="adminApprove?page=${page-1}"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
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
		 						<a class="page-link" href="adminApprove?page=${a}">${a}</a>
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
		 					<a class="page-link" href="adminApprove?page=${page+1}"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
		 				</li>
		 			</c:if>
		 			
		 		</ul>
		 	</div>
		 	</c:if>
		 	
		 	<c:if test="${listcount == 0}">
		 		<h3 style="text-align: center">등록된 관리자가 없습니다.</h3>
		 	</c:if>
		 	
		 	<div class="searchBoxArea" style="margin-top: 30px;">
				<form action="adminApprove" method="post" id="adminList_Form">
					<div class="form-group">
						<select id="viewcount2" name="search_field">
							<option value="0" selected>아이디</option>
							<option value="1">이름</option>
							<option value="2">부서</option>
							<option value="3">직급</option>
							<option value="4">권한 등급</option>
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
  </main>
</body>
</html>