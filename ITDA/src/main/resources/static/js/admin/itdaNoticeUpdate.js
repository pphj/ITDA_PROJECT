	$(function(){
		let check = 0;
		
		$("form[name=itdaNoticeUpdate]").submit(function(){					//submit버튼 클릭시 이벤트
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
			
			if($.trim($("#adPassword").val()) == ""){
				alert("비밀번호를 입력하세요.");
				$("#adPassword").focus();
				return false;
			}
			
		})//submit end
		
	});//ready end