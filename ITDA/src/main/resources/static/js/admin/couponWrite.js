	$(function(){

		$("#adminId").val($("#loginId").text());		//sec를 안쓰고 아이디를 나타내는 법

		$("form[name=couponform]").submit(function(){
			//if($.trim($("#couponCode").val()) == ""){
			//	alert("쿠폰 코드를 입력하세요.");
			//	$("#couponCode").focus();
			//	return false;
			//}
			
			if($.trim($("#couponName").val()) == ""){
				alert("쿠폰 이름을 입력하세요.");
				$("#couponName").focus();
				return false;
			}
			
			if($.trim($("#couponDetail").val()) == ""){
				alert("쿠폰 내용을 입력하세요.");
				$("#couponDetail").focus();
				return false;
			}
			
			if($.trim($("#couponPrice").val()) == ""){
				alert("쿠폰 가격을 입력하세요.");
				$("#couponPrice").focus();
				return false;
			}
			
		})//submit end
		
	});//ready end