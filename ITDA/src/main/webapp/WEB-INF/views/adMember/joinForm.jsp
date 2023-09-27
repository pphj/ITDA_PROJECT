<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/itda_logo.png">
  <title>관리자 회원가입</title>
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
<style>
input[name=adminId],
input[name=adminPw],
input[name=adminName],
input[name=adminEmail],
input[name=authName] {
	border: none; border-bottom: 1px solid black;
	width: 100%; margin-bottom: 10px;
}

#adjoinbtn, #adjoinreset {
	text-align: center;
	width: 40%;
}
#classSel, #deptSel {
	width: 80%;
}
</style>

<script>
$(function () {
	let checkid = false;
	let checkemail = false;
	
	$("input[name=adminId]").on('keyup', function() {
		const pattern = /^[a-zA-Z0-9]{5,12}$/;
		const id = $("input:eq(0)").val();
		if(!pattern.test(id)){
			$("#message").css('color', 'red').html("영문자 숫자 _로 5~12자 가능합니다.");
			checkid=false;
			return;
		}
		
		$.ajax({
			url : "../adMember/idcheck",
			data : {"adminId" : $("#adminId").val()},
			success : function(data){
				if(data == -1){ 			//id가 없는 경우
					$("#message").css('color', 'green').html("사용 가능한 아이디 입니다.");
					checkid = true;
				} else{ 					//id가 있는 경우
					$("#message").css('color', 'red').html("사용 중인 아이디 입니다.");
					checkid = false;
				}
			} //success end
		}) // ajax end
	}); // id keyup end
	
	$("input[name=adminEmail]").on('keyup', function () {
		const pattern = /^\w+@\w+[.]\w{3}$/;
		const email_value = $(this).val();
		
		if(!pattern.test(email_value)){
			$("#email_message").css('color', 'red').html("이메일 형식에 맞지 않습니다.");
			checkemail = false;
		} else{
			$("#email_message").css('color', 'green').html("이메일 형식에 맞습니다.");
			checkemail = true;
		}
	});// email keyup end
	
	// $('form').submit(function () {
	// 	if(!checkid){
	// 		alert("사용 가능한 id로 입력하세요");
	// 		$("input[name=adminId]").val('').focus();
	// 		return false;
	// 	}
		
	// 	if(!checkemail){
	// 		alert("email 형식을 확인하세요");
	// 		$("input[name=adminId]").focus();
	// 		return false;
	// 	}
	// }) // submit end
}); // ready end
</script>
</head>
<body class="g-sidenav-show   bg-gray-100">
  <jsp:include page="../admin/adminList.jsp" />
  <main class="main-content position-relative border-radius-lg ">
  <jsp:include page="../admin/adminNavbar.jsp" />
  <!-- End Navbar -->
	<div class="card shadow-lg mx-4 card-profile-bottom">
      <div class="card-body p-3">
        <div class="row gx-4">
          <div class="col-auto my-auto">
            <div class="h-100">
              <h5 class="mb-1">
                관리자 회원가입
              </h5>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="alert" role="alert" style="margin: 50px 70px 0px 70px; background: white;
     position: relative; height: 700px;">
    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);
     padding: 20px;">
	<form name="joinform" action="joinProcess" method="post">
		<div class="col-md-10">
			<div class="form-group">
				<b>아이디</b> 
				<input type="text" name="adminId" placeholder="Enter Id" maxlength="12" required> 
				<span id="message"></span> 
			</div>
		</div>
		<div class="col-md-10">
			<div class="form-group">
				<b>비밀번호</b>
				<input type="password" name="adminPw" placeholder="Enter Password" required> 
			</div>
		</div>
		<div class="col-md-10">
			<div class="form-group">
				<b>이름</b> 
				<input type="text" name="adminName" placeholder="Enter name" maxlength="15" required> 
			</div>
		</div>
		<div class="col-md-10">
			<div class="form-group">
				<b>부서를 선택하세요</b> 
				<div class="custom-select">
				  <select id="deptSel">
				    <option id="adminDept" name="adminDept" value="영업">영업</option>
				    <option id="adminDept" name="adminDept" value="서비스">서비스</option>
				    <option id="adminDept" name="adminDept" value="기술">기술</option>
				    <option id="adminDept" name="adminDept" value="인사">인사</option>
				  </select>
				</div>
			</div>
		</div>
		<div class="col-md-10">
			<div class="form-group">
				<b>직급을 선택하세요</b>
				<div class="custom-select">
				  <select id="classSel">
				    <option id="adminClass" name="adminClass" value="부장">부장</option>
				    <option id="adminClass" name="adminClass" value="차장">차장</option>
				    <option id="adminClass" name="adminClass" value="팀장">팀장</option>
				    <option id="adminClass" name="adminClass" value="대리">대리</option>
				    <option id="adminClass" name="adminClass" value="사원">사원</option>
				  </select>
				</div>
			</div>
		</div>
		<div class="col-md-10">
			<div class="form-group">
				<b>이메일</b> 
				<input type="text" name="adminEmail" placeholder="Enter email" maxlength="30"
				 required><span id="email_message"></span>
			</div>
		</div>
		<div class="col-md-10">
			<div class="form-group">
				<b>권한</b>
				<input type="text" name="authName" id="authName" placeholder="ADMIN"
				 value="ADMIN" ReadOnly>
			</div>
		</div>
		<div class="clearfix">
			<button type="submit" class="submitbtn" id="adjoinbtn">회원가입</button>
			<button type="reset" class="cancelbtn" id="adjoinreset">다시작성</button>
		</div>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
	</form>
	</div>
	</div>
</body>
</html>