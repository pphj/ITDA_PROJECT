var input1 = document.getElementById("sample6_detailAddress");
input1.addEventListener("keydown", function(event) {
  if (event.key === "Enter") {
    event.preventDefault();
  }
});

var input2 = document.getElementById("sample6_extraAddress");
input2.addEventListener("keydown", function(event) {
  if (event.key === "Enter") {
    event.preventDefault();
  }
});    

// 주소 필드가 비어 있는지 확인



// 주소 변경 버튼 클릭 시 form 데이터 전송
	var addressSend = document.getElementById("sendAddress");
	
	addressSend.addEventListener("click", function () {
	var addressInput = document.getElementById("sample6_address");
	var addform = document.getElementById("fm");
	
	// 주소 필드가 비어 있는지 확인
    if (addressInput.value.trim() === "") {
            document.getElementById("e_addressNo").className = "popup_error";
            document.getElementById("e_addressNo").innerHTML = "주소를 입력하세요.";
        	event.preventDefault();
	}else{
	addform.action = "/itda/user/addressUpdatePro";
	addform.method = "Post";
	addform.submit();
	}
	});
	
	

    function show2StepVerificationPopUp() {
        displayObj('dimmed2');
        displayObj('twoStepVerificationPopUpLayer');
        document.getElementById("wrap").classList.add("is_fixed");
    }

    function hide2StepVerificationPopUp() {
        hiddenObj('dimmed2');
        hiddenObj('twoStepVerificationPopUpLayer');
        document.getElementById("wrap").classList.remove("is_fixed");
    }

    function go2StepVerification() {
        var twoStepVerifBaseUrl = "/user2/help/2StepVerif?";


        twoStepVerifBaseUrl += "m=viewGuide&token_help=&lang=ko_KR";

        document.location.href = twoStepVerifBaseUrl;
    }