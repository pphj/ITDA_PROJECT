	$(function(){

		$("#adWriter").val($("#loginId").text());		//sec를 안쓰고 아이디를 나타내는 법

		$("form[name=itdaNoticeform]").submit(function(){
			if($.trim($("#adPassword").val()) == ""){
				alert("비밀번호를 입력하세요.");
				$("#adPassword").focus();
				return false;
			}
			
			if($.trim($("#adTitle").val()) == ""){
				alert("제목을 입력하세요.");
				$("#adTitle").focus();
				return false;
			}
			
			if($.trim($("#adContent").val()) == ""){
				alert("내용을 입력하세요.");
				$("#adContent").focus();
				return false;
			}
			
			
		})//submit end
		
	});//ready end