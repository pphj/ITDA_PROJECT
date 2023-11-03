<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<title>일반회원가입 페이지</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/joinForm.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</head>
<body>
<script>
$(function() {
    let checkid = false;
    let checkpassword = false;
    let checkemail = false;
    let idcheck = '';
    let categoryCheck = false;

    function checkId(id) {
        return id == idcheck;
    }

    // 중복확인 버튼 클릭 핸들러를 추가합니다.
    $("#id_butt").click(function() {
        const pattern = /^\w{5,12}$/;
        const input_id = $("#showid").val();

        if (!pattern.test(input_id)) {
            $("#message").css('color', 'red').html("영문자 숫자로 5 ~ 12자 가능합니다.");
            checkid = false;
            return;
        }

        // 서버에 아이디 중복 확인 요청을 보내는 ajax 코드
        $.ajax({
            url: "/itda/member/idcheck",
            data: { userId: input_id },
            success: function (resp) {
                if (resp == -1) {
                    $("#message").css('color', 'green').html("사용 가능한 아이디 입니다.");
                    checkid = true;
                    idcheck = input_id;
                } else {
                    $("#message").css('color', 'red').html("사용중인 아이디 입니다.");
                    checkid = false;
                    idcheck = '';
                }
            }
        });
    });

    // 프로필 이미지 유효성 검사
    $('input[type=file]').change(function(e){
        const inputfile = $(this).val().split('\\');
        const profileName = inputfile[inputfile.length - 1];
        const pattern = /(gif|jpg|jpeg|png)$/i;

        if (pattern.test(profileName)) {
            $('#profileLabel > .center-div').text(profileName);

            const reader = new FileReader();
            reader.readAsDataURL(event.target.files[0]);

            reader.onload = function(){
                $('#previewImage > img').attr('src', this.result);
            };
        } else {
            alert('이미지 파일(gif, jpg, jpeg, png)이 아닌 경우 업로드되지 않습니다.');
            $(this).val('');
            $('#profileLabel > .center-div').text('파일 선택');
            $('#previewImage > img').attr('src', '');
        }
    });

    // 회원가입 폼 제출 이벤트 리스너 등록
    $("#sellerform").submit(function (e) {
        // 필요한 변수들을 가져옴
        var id = $("#showid").val().trim();
        var password = $('#password').val().trim();
        var date_birth = $('#date_birth').val().trim();
        var phone = $('#phone').val().trim();
        var email = $("#email").val().trim();

        // 중복 확인
        if (!checkid) {
            alert("사용 가능한 아이디인지 확인하세요.");
            $("#showid").focus();
            e.preventDefault(); // 폼 제출을 중지
            return;
        }

        // 생년월일 중복 검사
        if (!date_birth) {
            alert("생년월일을 입력하세요");
            $("input[name='date_birth']").val('').focus();
            e.preventDefault();
            return;
        }

        // 생년월일 유효성 검사
        const dateOfBirthPattern = /^(19|20)\d\d-(0\d|1[0-2])-(0\d|1\d|2\d|3[01])$/; // YYYY-MM-DD 형식
        if (!dateOfBirthPattern.test(date_birth)) {
            alert("올바른 생년월일 형식인 YYYY-MM-DD로 입력하세요");
            $('#date_birth').val('').focus();
            e.preventDefault();
            return;
        }

        // 비밀번호 입력 확인
        if (password == '') {
            alert("비밀번호를 입력하세요");
            $('#password').focus();
            e.preventDefault();
            return;
        } else if ($("#password_confirm").val().trim() != password) {
            alert("비밀번호가 일치하지 않습니다");
            $("#password_confirm").focus();
            e.preventDefault();
            return;
        }

        // 비밀번호 유효성 검사
        const passwordPattern = /^(?=.*[a-zA-Z0-9!@#$%^&*]).{1,12}$/;
        if (!passwordPattern.test(password)) {
            alert("비밀번호는 영문, 숫자, 특수문자 중 하나 이상을 포함한 1 ~ 12자리로 작성해주세요.");
            e.preventDefault();
            return;
        }

        // 이메일 입력 확인 및 유효성 검사
        if (email == '') {
            alert("이메일을 입력하세요");
            $('#email').focus();
            e.preventDefault();
            return;
        }
        var emailPattern = /^[A-Za-z0-9_]{1,100}@[A-Za-z0-9_]{1,100}\.[A-Za-z0-9]{2,3}$/;
        if (!emailPattern.test(email)) {
            alert("이메일의 형식을 확인해주세요");
            $('#email').val('').focus();
            e.preventDefault();
            return;
        }

        // 카테고리 선택 확인
        var categorys = $('input[name="userCategory"]:checked').length;
        if (categorys === 0) {
            alert("채널의 주제로 삼을 카테고리를 선택하세요");
            e.preventDefault();
            return;
        }

        // 전화번호 유효성 검사
        var phone = $('#phone').val();
        if (phone.trim().length == 13 || phone.trim().length == 14) {
            const phonePattern = /^[0-9]{3,4}-[0-9]{4}-[0-9]{4}$/;
            if (!phonePattern.test(phone)) {
                alert("전화번호를 형식에 맞게 입력하세요");
                $('#phone').val('').focus();
                e.preventDefault();
                return;
            }
        }
    });

    // Ajax를 사용한 회원가입 처리
    $("#signup_butt").on("click", function () {
        let formData = new FormData(document.getElementById("sellerform"));

        $.ajax({
            url: "/itda/member/joinProcess",
            type: "POST",
            data: formData,
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeader, csrfToken); // CSRF 토큰 추가
            },
            success: function(response) {
                if (response.result == "joinSuccess") {
                    alert("회원 가입이 성공적으로 완료되었습니다.");
                    window.location.href = "/"; // 회원 가입 성공 시 홈 페이지로 이동
                } else {
                    alert("회원 가입 실패. 다시 시도해 주세요.");
                }
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    });
});



$(document).ready(function() {
    $('.num0 input, .num1 input, .num2 input, .num3 input, .num4 input, .num5 input, .num6 input, .num7 input, .num8 input, .num9 input, .num10 input, .num11 input').on('click focus', function() {
        $(this).css('transition', 'border 0.5s ease-in-out'); // 애니메이션 효과 추가
        $(this).css('border', '1px solid #00bfff'); // 2px 두껍게, 주황색으로 변경
        $(this).css('border-radius', '5px'); // 모서리를 8px로 둥글게 변경
    });

    // 입력이 완료되면 원래 색상 및 두껍기를 복구하는 이벤트 핸들러 추가
    $('.num0 input, .num1 input, .num2 input, .num3 input, .num4 input, .num5 input, .num6 input, .num7 input, .num8 input, .num9 input, .num10 input, .num11 input').on('blur', function() {
        $(this).css('transition', 'border 0.3s ease-in-out'); // 애니메이션 효과 추가
        $(this).css('border', ''); // 입력 완료 시 원래 색상 및 두껍기로 복구
        $(this).css('border-radius', ''); // 입력 완료 시 모서리 원래대로 복구
    });
});






</script>


<div id="sellerback">
    <form name="sellerform" id="sellerform" method="post" action="joinProcess" enctype="multipart/form-data">
        <h1 style="margin: 30px 50px;">회원가입</h1>
   		<h5 style="margin: 30px 50px;">회원이 되어 다양한 콘텐츠를 경험해 보세요!</h5>
        <div class='num0 clearfix'>
                <label for='id' style="float: left;"><span style="color: red">*</span>아이디</label>
                <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
                    <input type="text" id="showid" name="userId" placeholder="아이디를 입력하세요" required> 
                    <input type='button' id="id_butt" value='중복확인' style="width: 20%;">
                </div>
            </div>
            <div id="message" style="color: red; margin-top: 5px;"></div>
	 <div class='num1 clearfix'>
                <label for='password' style="float: left;"><span style="color: red">*</span>비밀번호</label><br>
                <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
                    <input type='password' placeholder='영문/숫자만 사용 가능, 10자 이하' name='userPw' id='password' style="width: 100%;" required>
                </div>
            </div>
	<div class='num2 clearfix'>
		<label for='channel' style="float: left;"><span style="color: red">*</span>비밀번호 확인</label><br>
	    <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
	       <input type='password' name='password_confirm' id='password_confirm' style="width: 100%;" required>
	    </div>    
	</div>
	<div class='num3 clearfix'>
		<label for='channel' style="float: left;"><span style="color: red">*</span>이름</label><br>
	    <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
	        <input type='text' name='userName' id='name' style="width: 100%;" maxLength="10" required>
	    </div>    
	</div>
	<div class='num4 clearfix'>
		<label for='channel' style="float: left;"><span style="color: red">*</span>생년월일</label><br>
	    <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
	        <input type='text' name='userBirth' id='date_birth' placeholder='YYYY-MM-DD 형식' style="width: 100%;" required>
	    </div>    
	</div>
	<div class='num5 clearfix'>
	<label for='channel' style="float: left;"><span style="color: red">*</span>성별</label>
	</div>
		<div>
			<label><input type="radio" name="userGender" value="남" checked>남자</label>
			<label><input type="radio" name="userGender" value="여">여자</label>
		</div>
	<div class='num6'>
		<label for='phone' style="float: left;"><span style="color: red">*</span>휴대폰번호</label>
			<input type='text' maxLength='14' name='userPhone' id='phone' placeholder='예:010-1234-5678' required>
	</div>
	<div class='num7 clearfix'>
		<label for='channel' style="float: left;"><span style="color: red">*</span>주소</label><br>
	    <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
	        <input type='text' name=userAddress1 id='address1' style="width: 100%;" required>
	    </div>    
	</div>
	<div class='num8 clearfix'>
		<label for='channel' style="float: left;"><span style="color: red">*</span>상세주소</label><br>
	    <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
	        <input type='text' name='userAddress2' id='address2' style="width: 100%;" required>
	    </div>    
	</div>
	<div class='num9 clearfix'>
		<label for='channel' style="float: left;"><span style="color: red">*</span>우편번호</label><br>
	    <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
	        <input type='text' name='userPost' id='zip_code' style="width: 100%;" required>
	    </div>    
	</div>
	<div class='num10'>
		<label for='email' style="float: left;"><span style="color: red">*</span>이메일</label>
			<input type='text' name='userEmail' id='email' placeholder='예:itda@itda.com' required>
	</div>
	<div id="categories clearfix">
    <label for='category' style="float: left; margin-left: 15px;"><span style="color: red">*</span>관심 카테고리</label><br>
    <div id="section">
			<label><input type='radio' name='userCategory' id='category1' value="1"> 경제/시사</label>
			<label><input type='radio' name='userCategory' id='category2' value="2"> 문화예술</label>
			<label><input type='radio' name='userCategory' id='category3' value="3"> IT트렌드</label>
			<label><input type='radio' name='userCategory' id='category4' value="4"> 역사</label>
			<label><input type='radio' name='userCategory' id='category5' value="5"> 과학</label>
			<label><input type='radio' name='userCategory' id='category6' value="6"> 건강</label>
			<label><input type='radio' name='userCategory' id='category7' value="7"> 요리</label>
			<label><input type='radio' name='userCategory' id='category8' value="8"> 스포츠</label>
			<label><input type='radio' name='userCategory' id='category9' value="9"> 재태크</label>
			<label><input type='radio' name='userCategory' id='category10' value="10"> 취미</label>
			</div>
	</div><br>

	<div class='num12 clearfix'>
		  <div id="profile_select" style="float:left; margin-right: 10px;">
		    <label for='profile' style="float: left;">프로필사진<span style="font-size: 12px;"> (설정하지 않으면 기본프로필로 나타납니다.)</span></label>
		    <label for="inputFile">
		      <div class="center-div btn-Upload"></div>
		    </label>
		    <input type='file' name='profile' id='profile' accept="image/*">
		  </div>
	</div>

	 <div class='num11 clearfix'>
                <button type='submit' value="일반회원가입" class='signup_butt'>일반회원가입</button>
               <button type='button' value="취소" class='cancel_butt' id='cancel_btn'>취소</button>
            </div>
        <input type="hidden" name="${_csrf
        .parameterName}" value="${_csrf.token}">
        </form>
    </div>
    
</body>


