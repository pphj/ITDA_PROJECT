	$(function(){
		let check = 0;
		
		$("form[name=FAQmodify]").submit(function(){					//submit버튼 클릭시 이벤트
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
			
			if (check == 0) {
				const value = $('#QcateId').text();
				const html = "<input type='hidden' value='" + value + "'name='check'>";
				$(this).append(html);
				
			}
			
		})//submit end
		
	});//ready end