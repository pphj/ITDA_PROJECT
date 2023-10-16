	$(function(){

		$("#productWriter").val($("#loginId").text());		//sec를 안쓰고 아이디를 나타내는 법

		$("form[name=productform]").submit(function(){
			if($.trim($("#productName").val()) == ""){
				alert("이용권 이름을 입력하세요.");
				$("#couponName").focus();
				return false;
			}
			
			if($.trim($("#productDetail").val()) == ""){
				alert("이용권 내용을 입력하세요.");
				$("#couponDetail").focus();
				return false;
			}
			
			if($.trim($("#productPrice").val()) == ""){
				alert("이용권 가격을 입력하세요.");
				$("#couponPrice").focus();
				return false;
			}
			
			if($.trim($("#productTerm").val()) == ""){
				alert("이용권 기간을 입력하세요.");
				$("#couponTerm").focus();
				return false;
			}
			
			alert("이용권이 생성되었습니다.");
			
		})//submit end
		
	});//ready end