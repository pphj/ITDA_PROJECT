<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/itda_logo.png">
  <title>관리자 회원정보</title>
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
  <script src="${pageContext.request.contextPath}/resources/js/admin/adminUpdate.js"></script>
<style>
	form[name=adminUpdateForm] {
		width: 50% !important;
	    margin: 0 auto !important;
	    display: block !important;
	}
	.table td input {
		width: 100%;
		border: none;
		border-bottom: 1px solid #d1d1d1;
		outline: none;
		background: #353535;
		color: white;
	}
	
	.table tr {
		height: 70px;
	}
	
	.table tr:last-child td {
		border: 1px solid #e6e6e6 !important;
	}
	
	.table tr td:first-child {
		background: #C0FCF7 !important;
	}
	
	.table tr td:last-child {
		background: #e3fffd !important;
	}
</style>
</head>
<body>
<jsp:include page="adminList.jsp" />
<main class="main-content position-relative border-radius-lg ">
<jsp:include page="adminNavbar.jsp" />
<div class="card shadow-lg mx-4 card-profile-bottom">
	<div class="card-body p-3">
        <div class="row gx-4">
          	<div class="col-auto my-auto">
            	<div class="h-100">
              		<h5 class="mb-1">
                		관리자 정보 수정
              		</h5>
            	</div>
        	</div>
    	</div>
	</div>
</div>
<div class="main-content" style="padding: 30px 25px;">
	<div class="card">
		<div class="card-body" style="width: 100%;">
		<h1 style="visibility: hidden;">empty</h1>
		<form action="updateProcess" method="post" name="adminUpdateForm">
			<table class="table table-bordered">
				<tr>
					<td class="text-center">아이디</td>
					<td><input type="text" name="adminId"
					 class="adminId" value="${admin.adminId}" required>
					<br>
					<span class="message1" style="color: red; margin-top: 5px;"></span>
					</td>
				</tr>
				<tr>
					<td class="text-center">비밀번호</td>
					<td><input type="password" name="adminPw"
					 class="adminPw" value="${admin.adminPw}" readOnly></td>
				</tr>
				<tr>
					<td class="text-center">이름</td>
					<td><input type="text" name="adminName"
					 class="adminName" value="${admin.adminName}" required>
					 <br>
					 <span class="message2" style="color: red; margin-top: 5px;"></span>
					 </td>
				</tr>
				<tr>
					<td class="text-center">부서</td>
					<td><input type="text" name="adminDept"
					 class="adminDept" value="${admin.adminDept}" required>
					 <br>
					 <span class="message3" style="color: red; margin-top: 5px;"></span>
					 </td>
				</tr>
				<tr>
					<td class="text-center">직급</td>
					<td><input type="text" name="adminClass"
					 class="adminClass" value="${admin.adminClass}" required>
					 <br>
					 <span class="message4" style="color: red; margin-top: 5px;"></span>
					 </td>
				</tr>
				<tr>
					<td class="text-center">이메일</td>
					<td><input type="text" name="adminEmail"
					 class="adminEmail" value="${admin.adminEmail}" required>
					 <br>
					 <span class="message5" style="color: red; margin-top: 5px;"></span>
					 </td>
				</tr>
			</table>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<div class="form-group" style="text-align: center; margin-top: 30px;">
				<button type=submit class="btn btn-primary btn-sm btn-round">변경</button>
	 			<button type=reset class="btn btn-danger btn-sm btn-round" onClick="history.go(-1)">취소</button>
			</div>
		</form>
		</div>
	</div>
</div>
</main>
</body>
</html>