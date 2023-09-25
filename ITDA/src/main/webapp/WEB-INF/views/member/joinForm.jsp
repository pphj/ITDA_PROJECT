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

</script>
<div id="sellerback">
    <form name="sellerform" id="sellerform" method="post" action="joinProcess" enctype="multipart/form-data">
        <h1 style="margin: 30px 50px;">Sign in it-da</h1>
   
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
			<label><input type='radio' name='userCategory' id='category1' value="경제/시사"> 경제/시사</label>
			<label><input type='radio' name='userCategory' id='category2' value="문화예술"> 문화예술</label>
			<label><input type='radio' name='userCategory' id='category3' value="IT트렌드"> IT트렌드</label>
			<label><input type='radio' name='userCategory' id='category4' value="역사"> 역사</label>
			<label><input type='radio' name='userCategory' id='category5' value="과학"> 과학</label>
			<label><input type='radio' name='userCategory' id='category6' value="건강"> 건강</label>
			<label><input type='radio' name='userCategory' id='category7' value="요리"> 요리</label>
			<label><input type='radio' name='userCategory' id='category8' value="스포츠"> 스포츠</label>
			<label><input type='radio' name='userCategory' id='category9' value="재태크"> 재태크</label>
			<label><input type='radio' name='userCategory' id='category10' value="취미"> 취미</label>
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
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </form>
    </div>
</body>


