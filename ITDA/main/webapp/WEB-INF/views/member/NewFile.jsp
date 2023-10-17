<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        let checkemail = false;
        let idcheck = ''; // 중복된 아이디 검사 결과를 저장하기 위한 변수 추가

        function checkId(id) {
            return id == idcheck;
        }

        // 중복확인 버튼 클릭 핸들러를 추가합니다.
        $("#id_butt").click(function() {
            // 기존 아이디 중복 확인 로직
            // ...

            // JWT 인증 로직
            const username = $("#showid").val();
            const password = $("#password").val();

            // 서버에 인증 요청을 보냅니다.
            $.ajax({
                type: "POST",
                url: "/authenticate", // 사용자 인증 엔드포인트 (본인의 엔드포인트로 수정 필요)
                data: { username, password },
                success: function(data) {
                    // 서버로부터 JWT 토큰을 받아옵니다.
                    const jwtToken = data.token;

                    // 토큰을 안전하게 저장합니다 (예: 쿠키 또는 로컬 스토리지)
                    $("#jwtToken").val(jwtToken);

                    // 아이디 중복 확인 로직 계속 진행
                    if (resp == -1) {
                        $("#message").css('color', 'green').html("사용 가능한 아이디 입니다.");
                        checkid = true;
                        idcheck = username;
                    } else {
                        $("#message").css('color', 'red').html("사용중인 아이디 입니다.");
                        checkid = false;
                        idcheck = '';
                    }
                },
                error: function(error) {
                    // 인증 오류 처리
                    alert("인증에 실패했습니다. 자격 증명을 확인하세요.");
                },
            });
        });

        // 기존의 나머지 폼에 대한 JavaScript 코드
        // ...
    });
</script>

<div id="sellerback">
    <form name="sellerform" id="sellerform" method="post" action="registerUser" enctype="multipart/form-data">
        <h1 style="margin: 30px 50px;">Sign in it-da</h1>

        <!-- 기존 폼 필드 -->

        <!-- 인증을 위한 필드 추가 -->
        <div class='num0 clearfix'>
            <label for='id' style="float: left;"><span style="color: red">*</span>아이디</label>
            <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
                <input type="text" id="showid" name="userId" placeholder="아이디를 입력하세요" required>
                <input type='button' id="id_butt" value='중복확인' style="width: 20%;">
            </div>
        </div>
        <div id="message" style="color: red; margin-top: 5px;"></div>
        
        <!-- JWT 인증을 위한 필드 -->
        <input type="text" name="username" id="username" placeholder="사용자 이름" required>
        <input type="password" name="password" id="password" placeholder="비밀번호" required>
        <input type="hidden" name="jwtToken" id="jwtToken">

        <!-- 기존 폼 필드 -->

        <!-- 폼 제출 핸들러 수정하여 JWT 토큰을 포함합니다 -->
        $("#sellerform").submit(function(e) {
            e.preventDefault();

            // 사용자 입력을 수집합니다 (사용자 이름과 비밀번호)
            const formData = $("#sellerform").serialize();

            // 서버에 인증 요청을 보냅니다.
            $.ajax({
                type: "POST",
                url: "/authenticate", // 사용자 인증 엔드포인트 (본인의 엔드포인트로 수정 필요)
                data: formData,
                success: function(data) {
                    // 서버로부터 JWT 토큰을 받아옵니다.
                    const jwtToken = data.token;

                    // 토큰을 안전하게 저장합니다 (예: 쿠키 또는 로컬 스토리지)
                    $("#jwtToken").val(jwtToken);

                    // 폼 제출을 계속합니다
                    $("#sellerform")[0].submit(); // 폼 제출
                },
                error: function(error) {
                    // 인증 오류 처리
                    alert("인증에 실패했습니다. 자격 증명을 확인하세요.");
                },
            });
        });

        <!-- 기존 폼 필드와 버튼 -->

    </form>
</div>
</body>
</html>
