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
    
    // 체크박스 '전체' 선택 시 전체 선택 되는 js 
    const selectAllCheckbox = document.getElementById("check0");

// 전체 선택 체크박스 클릭 이벤트 리스너 추가
selectAllCheckbox.addEventListener("click", function () {
  // 하위 체크박스 요소들 가져오기 (여기에서는 cate_Id라는 name을 가진 체크박스를 선택)
  const checkboxes = document.querySelectorAll('input[name="cate_Id"]');

  // 전체 선택 체크박스의 상태에 따라 하위 체크박스 선택 또는 선택 해제
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAllCheckbox.checked;
  });
});

	// 변경 버튼 클릭 이벤트 리스너 추가
	
	
	
var sendKeyWord = document.getElementById("sendKeyWord");

sendKeyWord.addEventListener("click", function(event) {
    event.preventDefault();

    var addform = document.getElementById("fm");

    // 체크박스 요소들 가져오기
    const checkboxes = document.querySelectorAll('input[name="cate_Id"]');

    let atLeastOneChecked = false;

    // 모든 체크박스 확인
    checkboxes.forEach(checkbox => {
        if (checkbox.checked) {
            atLeastOneChecked = true;
            return; // 하나라도 선택되어 있으면 반복 종료
        }
    });

    // 하나라도 선택된 항목이 없으면 알림을 띄우고 제출을 중단
    if (!atLeastOneChecked) {
        alert('키워드를 선택해주세요.');
        return;
    } else {
        addform.action = "/itda/user/myInfo/keyWdChangePro";
        addform.method = "post"; // "Post" 대신 "post"로 수정
        addform.submit();
    }

    // 여기에서 변경을 계속 진행하도록 할 수 있습니다.
    // 변경 코드 추가
});
