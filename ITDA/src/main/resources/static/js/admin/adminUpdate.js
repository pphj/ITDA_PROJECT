	$(function(){

		$(".adminId").val($("#loginId").text());		//sec를 안쓰고 아이디를 나타내는 법
		
		$(".adminId").on("input", function() {
	        let input_id = $(this).val();
	        let pattern = /^[A-Za-z0-9]{5,12}$/;
	
	        if (!pattern.test(input_id)) {
	            $(".message1").css('color', 'red').html("영문자 숫자로 5 ~ 12자 가능합니다.");
	        } else {
	            $(".message1").css('color', 'green').html("사용 가능한 아이디입니다.");
	        }
	    })
		
		$(".adminName").on("input", function() {
	        let input_name = $(this).val();
	        let pattern = /^[A-Za-z가-힣\s]{1,15}$/;
	
	        if (!pattern.test(input_name)) {
	            $(".message2").css('color', 'red').html("한글 또는 영어로 1~15자 이내로 입력하세요.");
	        } else {
	            $(".message2").css('color', 'green').html("확인되었습니다.");
	        }
	    })
	    
	    $(".adminDept").on("input", function() {
	        let input_dept = $(this).val();
	        let pattern = /^(기술|인사|서비스|유지개발|고객서비스)$/;
	
	        if (!pattern.test(input_dept)) {
	            $(".message3").css('color', 'red').html("부서를 확인하세요. ex)기술, 인사, 서비스, 유지개발, 고객서비스");
	        } else {
	            $(".message3").css('color', 'green').html("확인되었습니다.");
	        }
	    })
	    
	    $(".adminClass").on("input", function() {
	        let input_class = $(this).val();
	        let pattern = /^(부장|차장|팀장|대리|팀원)$/;
	
	        if (!pattern.test(input_class)) {
	            $(".message4").css('color', 'red').html("직급을 확인하세요. ex)부장, 차장, 팀장, 대리, 팀원");
	        } else {
	            $(".message4").css('color', 'green').html("확인되었습니다.");
	        }
	    })
	    
	    $(".adminEmail").on("input", function() {
	        let input_email = $(this).val();
	        let pattern = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/; // 원하는 정규 표현식 패턴
	
	        if (!pattern.test(input_email)) {
	            $(".message5").css('color', 'red').html("이메일 양식을 확인해주세요. ex)email@email.com");
	        } else {
	            $(".message5").css('color', 'green').html("사용 가능한 이메일입니다.");
	        }
	    })
		
	});//ready end