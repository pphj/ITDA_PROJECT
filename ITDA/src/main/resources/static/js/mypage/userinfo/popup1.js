    var isValid = '';
    var emailType = '';


	$(document).ready(function () {

        
        $('#myLetterEmailAuthGuide, #pswdEmailAuthGuide').click(function () {
            var authGuideTxt = '#' + $(this).attr('id')
                + 'Txt';
            var $authGuideTxt = $(authGuideTxt);
            if ($authGuideTxt.css('display') === 'none') {
                $authGuideTxt.css('display', 'block');
            } else {
                $authGuideTxt.css('display', 'none');
            }
        });

        if (isValid !== "Y") return;

        if (emailType === "myLetterEmail") {
            showMyLetterEmailChangePopUp();
            return;
        }

        showPswdEmailChangePopUp();
    });

    function showPhoneNumberChangePopUp() {
        var clickCode = "imn";
            clickCode = "nid";

        displayObj('dimmed');
        displayObj('phoneNumberChangePopUpLayer');
        document.getElementById("wrap").classList.add("is_fixed");
        //resetInternationalCode();
        if (document.getElementById("isPhoneYn").value === "Y") {
            nclk(this, clickCode + '.mphoneedit', '', '', event)
            document.getElementById("phoneNoForm").style.display = "block";
        } else {
            nclk(this, clickCode + '.mphoneregister', '', '', event)
            document.getElementById("phoneNoForm").style.display = "none";
        }
    }

    function hidePhoneNumberChangePopUp() {
        hiddenObj('dimmed');
        hiddenObj('phoneNumberChangePopUpLayer');
        document.getElementById("wrap").classList.remove("is_fixed");
        //resetInternationalCode();
        document.getElementById("phoneNo").value = '';
        document.getElementById("authNo").value = '';
        document.getElementById("authNo").className = "popup_input";
        document.getElementById("e_phoneNo").innerHTML = "";
        document.getElementById("authNo").disabled = true;
    }

/*
    function resetInternationalCode() {
        var internationalCode = document.getElementById('internationalCode');
        for (var i = 0; i < internationalCode.length; i++) {
            if (internationalCode.options[i].value === '82') {
                internationalCode.options[i].selected = true;
            } else {
                internationalCode.options[i].selected = false;
            }
        }
    }
*/
    var sendSmsForChangePhoneNoFlag = false;

    function sendSmsForChangePhoneNo() {
        if (sendSmsForChangePhoneNoFlag === true) {
            return;
        }

        if (document.getElementById("phoneNo").value == "") {
            document.getElementById("e_phoneNo").className = "popup_error";
            document.getElementById("e_phoneNo").innerHTML = "전화번호를 입력하세요.";
            return;
        }

        nclk(this, 'inf.mphoneverify', '', '', window.event);

        sendAuthNo(sendSmsForChangePhoneNoFlag);
    }

    var CHANGE_USER_INFO_URL = "/user2/help/changeUserInfo";

    function sendAuthNo(submitFlag) {
        if (submitFlag === true) {
            return;
        } else {
            submitFlag = true;
        }

        var token = "";
        var phoneNo = document.getElementById("phoneNo").value;
        var mobileYn = document.getElementById("mobileYn").value;

        var index = document.getElementById("internationalCode").selectedIndex;
        var internationalCode = document.getElementById("internationalCode").options[index].value;
        var urls = CHANGE_USER_INFO_URL + "?m=sendAuthNo&token_help=" + token + "&phoneNo=" + encodeURIComponent(phoneNo) + "&internationalCode=" + encodeURIComponent(internationalCode);

        $.ajax({
            type: "GET",
            url: urls,
            success: function (data) {
                msgKey = data.substr(4, 999);

                var list = msgKey.split("|", 3);
                if (msgKey.length > 300) {
                    alert("유효 시간이 초과 되었습니다. 다시 시도해 주세요.");
                    document.location.href = rawRurl;
                } else {
                    var resultCode = list[0];
                    var resultMessage = list[1];
                    if (resultCode == "0") {
                        document.getElementById("e_phoneNo").className = "popup_error green";
                        document.getElementById("e_phoneNo").innerHTML = resultMessage;
                        document.getElementById("authNo").disabled = false;
                        document.getElementById("authNo").value = "";
                        document.getElementById("authNo").focus();
                    } else if (resultCode == "-2") {
                        var message = "인증하신 휴대전화 번호는 이미 다른 아이디에 등록되어 추가로 등록이 불가합니다. 등록을 원하시면 다른 아이디에 등록된 휴대전화 번호를 삭제해야 합니다. 삭제 하시겠습니까?";
                        if (confirm(message)) {
                            if (mobileYn == "Y") {
                                document.location.href = "/user2/help/deleteContacts?m=informDeletePhoneNo&lang=ko_KR&returnUrl=" + rurl;
                            } else {
                                window.open("/user2/help/deleteContacts?m=informDeletePhoneNo&lang=ko_KR&returnUrl=" + rurl, 'deleteContacts');
                            }
                        }
                    } else {
                        document.getElementById("e_phoneNo").className = "popup_error";
                        document.getElementById("e_phoneNo").innerHTML = resultMessage;
                    }
                }
            },
            error: function (xhr, status, error) {
                alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
                $(location).attr("href", rawRurl);
            },
            complete: function () {
                submitFlag = false;
            }
        });
    }

    var checkAuthNoForChangePhoneNoFlag = false;

    function checkAuthNoForChangePhoneNo() {
        if (checkAuthNoForChangePhoneNoFlag === true) {
            return;
        }

        if (document.getElementById("isPhoneYn").value == "Y") {
            nclk(this, 'inf.mphoneok', '', '', window.event);
        } else {
            nclk(this, 'inf.mphoneregok', '', '', window.event);
        }

        if ((document.getElementById("phoneNo").value != "" && document.getElementById("phoneNo").value.length >= 7) && document.getElementById("authNo").disabled == true) {
            document.getElementById("e_phoneNo").className = "popup_error";
            document.getElementById("e_phoneNo").innerHTML = "[인증] 버튼을 클릭하여, 인증번호를 받아주세요.";
            return;
        }

        if (document.getElementById("phoneNo").value == "" && document.getElementById("authNo").disabled == true) {
            document.getElementById("e_phoneNo").className = "popup_error";
            document.getElementById("e_phoneNo").innerHTML = "전화번호를 입력하세요.";
            document.getElementById("phoneNo").focus();
            return;
        }

        if (document.getElementById("phoneAuthYn").value == "N" && document.getElementById("phoneNo").value.length < 7 && document.getElementById("phoneNo").value.length != 0) {
            document.getElementById("e_phoneNo").className = "popup_error";
            document.getElementById("e_phoneNo").innerHTML = "전화번호 형식에 맞게 입력해 주세요.";
            document.getElementById("phoneNo").focus();
            return;
        }

        if (document.getElementById("authNo").disabled == false && document.getElementById("authNo").value.length < 6) {
            if (document.getElementById("authNo").value.length == 0) {
                document.getElementById("e_phoneNo").className = "popup_error";
                document.getElementById("e_phoneNo").innerHTML = "인증번호를 입력해 주세요.";
            } else {
                document.getElementById("e_phoneNo").className = "popup_error";
                document.getElementById("e_phoneNo").innerHTML = "인증번호를 정확하게 입력해 주세요.";
            }
            document.getElementById("authNo").focus();
            return;
        }

        checkAuthNo(checkAuthNoForChangePhoneNoFlag);
    }

    function checkAuthNo(submitFlag) {
        if (submitFlag === true) {
            return;
        } else {
            submitFlag = true;
        }

        var token = '';
        var authNo = document.getElementById("authNo").value;
        var mobileYn = document.getElementById("mobileYn").value;

        var urls = CHANGE_USER_INFO_URL + "?m=checkAuthNo&token_help=" + token + "&authNo=" + encodeURIComponent(authNo);

        $.ajax({
            type: "GET",
            url: urls,
            success: function (data) {
                msgKey = data.substr(4, 999);

                var list = msgKey.split("|", 2);
                if (msgKey.length > 300) {
                    alert("유효 시간이 초과 되었습니다. 다시 시도해 주세요.");
                    document.location.href = rawRurl;
                } else {
                    if (list[0] == "-1") {
                        document.getElementById("e_phoneNo").className = "popup_error";
                        document.getElementById("e_phoneNo").innerHTML = list[1];
                    } else {
                        document.getElementById("p_txt_phoneNo").innerHTML = list[1];
                        document.getElementById("p_txt_phoneNo_changeYn").innerHTML = (list[1] == "" ? "등록" : "수정");
                        document.getElementById("b_txt_phoneNo_reg").innerHTML = (list[1] == "" ? "등록" : "변경");
                        if (list[1] == "") {
                            document.getElementById("phoneNoRegDiv").classList.remove("phone");
                            document.getElementById("phoneNoRegDiv").classList.add("not");
                            document.getElementById("phoneNoRegBtn").className = "btn_accent"
                        } else {
                            document.getElementById("phoneNoRegDiv").classList.remove("not");
                            document.getElementById("phoneNoRegDiv").classList.add("phone");
                            document.getElementById("phoneNoRegBtn").className = "btn_edit"
                        }
                        document.getElementById("phoneNoRegSpan").innerHTML = (list[1] == "" ? "전화번호 없음" : list[1]);
                        document.getElementById("phoneNoRegBtnTxt").innerHTML = (list[1] == "" ? "등록" : "수정");
                        hidePhoneNumberChangePopUp();

                        if (list[1] == "") {
                            document.getElementById("isPhoneYn").value = "N";
                            document.getElementById("phoneAuthYn").value = "Y";
                        } else {
                            document.getElementById("isPhoneYn").value = "Y";
                        }
                    }
                }
            },
            error: function (xhr, status, error) {
                alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
                $(location).attr("href", rawRurl);
            },
            complete: function () {
                submitFlag = false;
            }
        });
    }
 



    function showMyLetterEmailChangePopUp() {
        var clickCode = "imn";
            clickCode = "nid";

        displayObj('dimmed');
        displayObj('myLetterEmailChangePopUpLayer');
        document.getElementById("wrap").classList.add("is_fixed");
        if (isValid === "Y" && emailType === "myLetterEmail") {
            document.getElementById("myLetterEmailForm").style.display = "none";
            document.getElementById("p_txt_myLetterEmailForm").style.display = "none";
            document.getElementById("myLetterEmailPhoneVerify").style.display = "none";
            document.getElementById("myLetterEmail").disabled = false;
        } else {
            nclk(this, clickCode + '.primaryedit', '', '', event)
            document.getElementById("myLetterEmailForm").style.display = "block";
            document.getElementById("p_txt_myLetterEmailForm").style.display = "block";
            document.getElementById("myLetterEmailPhoneVerify").style.display = "block";
            document.getElementById("myLetterEmail").disabled = true;
        }
    }

    function hideMyLetterEmailChangePopUp() {
        hiddenObj('dimmed');
        hiddenObj('myLetterEmailChangePopUpLayer');
        document.getElementById("wrap").classList.remove("is_fixed");
        document.getElementById("confirmMyLetterEmail").value = "";
        document.getElementById("myLetterEmail").value = "";
        document.getElementById("myLetterEmailAuthNo").value = "";
        document.getElementById("myLetterEmailAuthNo").className = "popup_input";
        document.getElementById("e_myLetterEmail").innerHTML = "";
        document.getElementById("myLetterEmail").disabled = true;
        document.getElementById("myLetterEmailAuthNo").disabled = true;
        document.getElementById("myLetterEmailAuthGuideTxt").style.display = "none"
    }

    var element_e_myLetterEmail = $("#e_myLetterEmail");;
    var element_confirmMyLetterEmail = $("#confirmMyLetterEmail");
   	var element_myLetterEmail = $("#myLetterEmail");
    var element_myLetterEmailAuthNo = $("#myLetterEmailAuthNo");

    var element_confirmPswdEmail = $("#confirmPswdEmail");
    var element_pswdEmail = $("#pswdEmail");
    var element_pswdEmailAuthNo = $("#pswdEmailAuthNo");
    var element_e_pswdEmail = $("#e_pswdEmail");
    var element_isEmailYn = $("#isEmailYn");


    
  // 변수와 함수 정의
  var doConfirmMyLetterEmailFlag = false;
  
  function doConfirmMyLetterEmail() {
    var element_confirmMyLetterEmail = $("#confirmMyLetterEmail");
    var element_e_myLetterEmail = $("#e_myLetterEmail");
    
    if (doConfirmMyLetterEmailFlag === true) {
      return;
    }
    
    nclk(this, 'inf.primaryconfirm', '', '', window.event);
    
    if (element_confirmMyLetterEmail.val() == "" || element_confirmMyLetterEmail.val().replace(/^\s+/, "") == "") {
   	  $("#e_myLetterEmail").removeClass("popup_error green");
      $("#e_myLetterEmail").addClass("popup_error");
      element_e_myLetterEmail.html("이메일 주소를 입력해 주세요.");
      element_confirmMyLetterEmail.focus();
      element_confirmMyLetterEmail.val("");
      return;
    }
    
    if (!isValid_email_myinfo(element_confirmMyLetterEmail.val().replace(/^\s+/, ""), "e_myLetterEmail")) {
      $("#e_myLetterEmail").removeClass("popup_error green");
      $("#e_myLetterEmail").addClass("popup_error");
      element_e_myLetterEmail.html("이메일 형식이 올바르지 않습니다.");
      element_confirmMyLetterEmail.focus();
      element_confirmMyLetterEmail.val("");
      return;
    }
    
    // confirmMyLetterEmail 함수 호출
    confirmMyLetterEmail(doConfirmMyLetterEmailFlag);
}



function confirmMyLetterEmail(submitFlag) {
    if (submitFlag === true) {
        return;
    } else {
        submitFlag = true;
    }

	var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
    
    var myLetterEmail = $("#confirmMyLetterEmail").val(); // jQuery로 요소 참조

	
    $.ajax({
        type: "POST",
        url: "myInfo/emailCheck",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        data: {"userEmail": myLetterEmail},
        dataType: "json",
        success: function (result) {
        	console.log(result);

        
            var element_e_myLetterEmail = $("#e_myLetterEmail");
            var element_myLetterEmail = $("#myLetterEmail"); 

            if (result == 1) {
                element_e_myLetterEmail.addClass("popup_error green");
                element_e_myLetterEmail.html("현재 정보가 확인되었습니다. <br>변경할 이메일을 입력해주세요.");
                element_myLetterEmail.prop("disabled", false);
                element_myLetterEmail.focus();
            } else {
                element_e_myLetterEmail.removeClass("popup_error green");
                element_e_myLetterEmail.addClass("popup_error");
                element_e_myLetterEmail.html(result.resultMsg);
            }
        },
        error: function (xhr, status, error) {
       		console.log("error: " + error);
            alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
            window.location.href = rawRurl; // 페이지 이동
        },
        complete: function () {
        	
            submitFlag = false;
        }
    });
}

    function handleSessionExpiredErr(data) {
        if (data && data.indexOf("-9|") === 0) {
            alertReturnMessage(data.split("|")[1]);
            document.location.reload();
        }
    }

    function alertReturnMessage(resultMessage) {
        if (resultMessage) {
            alert(resultMessage.replace("\\n", "\n"));
        }
    }

 var sendAuthNoForEmailAuthFlag = false;
 
function sendAuthNoForEmailAuth(obj) {
    if (sendAuthNoForEmailAuthFlag === true) {
        return;
    }
    
    var element_e_myLetterEmail = $("#e_myLetterEmail");
    var element_myLetterEmail = $("#myLetterEmail"); 

    // 인증 번호 전송 전에 이메일 주소 형식 검사
    var email = $("#" + obj).val();
    var errorElement = $("#e_" + obj);
    
    if (email === "" || email.replace(/^\s+/, "") === "") {
    	$("#e_myLetterEmail").removeClass("popup_error green");
        $("#e_myLetterEmail").addClass("popup_error");
        $("#e_myLetterEmail").html("이메일 주소를 입력해 주세요.");
        $("#" + obj).focus();
        return;
    }

    if (!isValidEmailFormat(email)) {
        $("#e_myLetterEmail").removeClass("popup_error green");
        $("#e_myLetterEmail").addClass("popup_error");
     	$("#e_myLetterEmail").html("이메일 형식이 올바르지 않습니다.");
        $("#" + obj).val("");
        $("#" + obj).focus();
        return;
    }
      

    // 이메일 주소 형식이 올바른 경우에만 인증번호를 요청
    getAjaxSendAuthNoForEmailAuth1(obj, sendAuthNoForEmailAuthFlag);
}

// 이메일 주소 형식 검사 함수
function isValidEmailFormat(email) {
    // 이메일 정규표현식
    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return emailPattern.test(email);
}

	
 
 /*   
    function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.text(minutes + ":" + seconds);

        if (--timer < 0) {
            timer = duration;
        }
    }, 1000);
}
*/

 var setEmailFlag = false;
 

function setEmail() {

    var element_e_myLetterEmail = $("#e_myLetterEmail");
    var element_myLetterEmail = $("#myLetterEmail"); 
    var element_myLetterEmailAuthNo = $("#myLetterEmailAuthNo");
    var element_confirmMyLetterEmail = $("#confirmMyLetterEmail");


    if (setEmailFlag === true) {
        return;
    }

    nclk(this, 'inf.primaryok', '', '', window.event);
    
	$("#b_txt_myLetterEmail_reg").prop("disabled", true);
    $("#e_myLetterEmail").removeClass("popup_error green");
    $("#e_myLetterEmail").addClass("popup_error");
    $("#e_myLetterEmail").html("");

    if ($("#myLetterEmail").prop("disabled") === true) {
    	
        $("#e_myLetterEmail").html("현재 이메일 주소가 정확한지 확인해 주세요.");
        $("#confirmMyLetterEmail").focus();
        return;
    }

    if ($("#myLetterEmail").val() === "" || $("#myLetterEmail").val().replace(/^\s+/, "") === "") {
        $("#e_myLetterEmail").html("이메일 주소를 입력해 주세요.");
        $("#myLetterEmail").focus();
        $("#myLetterEmail").val("");
        return;
    }

    if (!isValid_email_myinfo($("#myLetterEmail").val().replace(/^\s+/, ""), "e_myLetterEmail")) {
        $("#e_myLetterEmail").html("이메일 형식이 올바르지 않습니다.");
        $("#myLetterEmail").focus();
        $("#myLetterEmail").val("");
        return;
    }

    if ($("#myLetterEmail").val() !== "" && $("#myLetterEmail").prop("disabled") === true) {
        $("#e_myLetterEmail").html("[인증] 버튼을 클릭하여, 인증번호를 받아주세요.");
        return;
    }
	
	console.log($("#myLetterEmailAuthNo").prop("disabled"));
	console.log( $("#myLetterEmailAuthNo").val().length);

    if ($("#myLetterEmailAuthNo").val().length !== 6) {
        if ($("#myLetterEmailAuthNo").val().length === 0) {
           $("#e_myLetterEmail").html("인증번호를 입력해 주세요.");
        } else {
            $("#e_myLetterEmail").html("인증번호를 정확하게 입력해 주세요.");
        }
        $("#myLetterEmailAuthNo").focus();
        return;
    }

    setMyLetterEmail(setEmailFlag);
    return;
}
 
function setMyLetterEmail(submitFlag){
        if (submitFlag === true) {
            return;
        } else {
            submitFlag = true;
        }
		var myLetterEmail = $("#myLetterEmail").val();
        var authNo = $("#myLetterEmailAuthNo").val();
        
       	var token = $("meta[name='_csrf']").attr("content");
    	var header = $("meta[name='_csrf_header']").attr("content");
 		
 		var addform = $("#fm");
 		
 		//var authCode = $('#authcodecheck').val();

	$.ajax({
            type: "POST",
            url: "myInfo/emailCheck/authCodeCheck",
            beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
       		},
       		async:false,
            data: {"authNo": authNo},
            success: function (result) {
				console.log(result);
				
                if (result == 200) {
                   //$("#b_txt_myLetterEmail_reg").prop("disabled", false);
                   $("#setUserEmail").val(myLetterEmail);
                    isValid = "N";
                    hideMyLetterEmailChangePopUp();
                    addform.attr("action", "/itda/user/emailChangePro");
            	addform.attr("method", "Post");
            	addform.submit();
            	alert("이메일 변경이 완료되었습니다.");
                } else {
	                alert("인증 오류입니다. 다시 시도해 주세요");
                }
            },
            error: function (xhr, status, error) {
                alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
                $(location).attr("href", rawRurl);
            },
            complete: function () {
                submitFlag = false;
            }
        });
    }
 
 
    //샐러 이메일 팝업 레이어
	function showSellerLetterEmailChangePopUp(){
		        var clickCode = "imn";
            clickCode = "nid";

        displayObj('dimmed');
        displayObj('showSellerLetterEmailChangePopUpLayer');
        document.getElementById("wrap").classList.add("is_fixed");
        if (isValid === "Y" && emailType === "sellerLetterEmail") {
            document.getElementById("myLetterEmailForm").style.display = "none";
            document.getElementById("p_txt_myLetterEmailForm").style.display = "none";
            document.getElementById("myLetterEmailPhoneVerify").style.display = "none";
            document.getElementById("sellerLetterEmail").disabled = false;
        } else {
            nclk(this, clickCode + '.primaryedit', '', '', event)
            document.getElementById("myLetterEmailForm").style.display = "block";
            document.getElementById("p_txt_myLetterEmailForm").style.display = "block";
            document.getElementById("myLetterEmailPhoneVerify").style.display = "block";
            document.getElementById("sellerLetterEmail").disabled = true;
        }
    }
    
    // 샐러 이미지 닫기
    function hideSellerMyLetterEmailChangePopUp() {
        hiddenObj('dimmed');
        hiddenObj('showSellerLetterEmailChangePopUpLayer');
        document.getElementById("wrap").classList.remove("is_fixed");
        document.getElementById("confirmSellerLetterEmail").value = "";
        document.getElementById("sellerLetterEmail").value = "";
        document.getElementById("myLetterEmailAuthNo").value = "";
        document.getElementById("myLetterEmailAuthNo").className = "popup_input";
        document.getElementById("e_myLetterEmail").innerHTML = "";
        document.getElementById("sellerLetterEmail").disabled = true;
        document.getElementById("myLetterEmailAuthNo").disabled = true;
        document.getElementById("myLetterEmailAuthGuideTxt").style.display = "none"
    }

 
function doConfirmSellerLetterEmail() {
    // 이메일 입력 필드에서 값을 가져옵니다.
    var sellerLetterEmail = $.trim($("#confirmSellerLetterEmail").val()); // .trim()을 사용하여 공백을 제거합니다.

    // 유효성 검사를 진행합니다.
    var emailRegex = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;
    var errorElement = $("#e_sellerLetterEmail");

    if (sellerLetterEmail === "") {
        // 이메일 주소를 입력하지 않은 경우
        errorElement.text("이메일 주소를 입력해 주세요.");
        return; // 여기서 함수 실행 종료
    } else if (!emailRegex.test(sellerLetterEmail)) {
        // 올바르지 않은 이메일 형식인 경우
        errorElement.text("이메일 형식에 맞지 않습니다.");
        return; // 여기서 함수 실행 종료
    }

    // 이메일 유효성 검사 통과 후 서버에 확인 요청을 보냅니다.
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    
        var errorElement = $("#e_sellerLetterEmail");

    $.ajax({
        type: "POST",
        url: "myInfo/sellerEmailCheck",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        data: { "sellerEmail": sellerLetterEmail },
        dataType: "json",
        success: function (result) {
            console.log(result);
            console.log(sellerLetterEmail);

            var sellerLetterEmailField = $("#sellerLetterEmail");

            if (result == 1) {
                errorElement.addClass("popup_error green");
                errorElement.html("현재 정보가 확인되었습니다. <br>변경할 이메일을 입력해주세요.");
                sellerLetterEmailField.prop("disabled", false);
                sellerLetterEmailField.focus();
            } else {
                errorElement.removeClass("popup_error green");
                errorElement.addClass("popup_error");
                errorElement.text("이메일이 일치하지 않습니다.");
            }
        },
        error: function (xhr, status, error) {
            console.log("error: " + error);
            alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
            window.location.href = rawRurl; // 페이지 이동
        },
        complete: function () {
            submitFlag = false;
        }
    });
}

// sendAuthNoForEmailAuth 함수 업데이트
function sendAuthNoForEmailAuth(obj) {
    if (sendAuthNoForEmailAuthFlag === true) {
        return;
    }

    var element_e_sellerLetterEmail = $("#e_sellerLetterEmail");
    var element_sellerLetterEmail = $("#sellerLetterEmail");

    // 인증 번호 전송 전에 이메일 주소 형식 검사
    var email = $("#" + obj).val();
    var errorElement = $("#e_" + obj);

    if (email === "" || email.replace(/^\s+/, "") === "") {
        element_e_sellerLetterEmail.removeClass("popup_error green");
        element_e_sellerLetterEmail.addClass("popup_error");
        errorElement.html("이메일 주소를 입력해 주세요.");
        $("#" + obj).focus();
        return;
    }

    if (!isValidEmailFormat(email)) {
        element_e_sellerLetterEmail.removeClass("popup_error green");
        element_e_sellerLetterEmail.addClass("popup_error");
        errorElement.html("이메일 형식이 올바르지 않습니다.");
        $("#" + obj).val("");
        $("#" + obj).focus();
        return;
    }

    // 이메일 주소 형식이 올바른 경우에만 인증번호를 요청
    getAjaxSendAuthNoForEmailAuth(obj);
}

// getAjaxSendAuthNoForEmailAuth 함수 업데이트
function getAjaxSendAuthNoForEmailAuth(obj) {
    if (sendAuthNoForEmailAuthFlag === true) {
        return;
    } else {
        sendAuthNoForEmailAuthFlag = true;
    }

    var email = $("#" + obj).val();

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    var authCode = $('#authcodecheck').val();

    $.ajax({
        type: "POST",
        url: "myInfo/emailCheck/authentication",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        data: { "email": email },
        dataType: "json",
        async:false,
        success: function (result) {
            console.log(result);
            console.log(email);
            if (result === 1) {
                // 인증번호가 성공적으로 발생한 경우
                // console.log((800+"#" + obj + 'AuthNo'))
                  $("#e_myLetterEmail").removeClass("popup_error");
                $("#e_myLetterEmail").addClass("popup_error green");
                $("#e_myLetterEmail").html("인증번호가 성공적으로 발송되었습니다. <br>인증번호를 입력해주세요");
                $("#" + obj + 'AuthNo').prop("disabled", false);
                $("#" + obj + 'AuthNo').focus();
                 $("#e_sellerLetterEmail").removeClass("popup_error");
                $("#e_sellerLetterEmail").addClass("popup_error green");
                $("#e_sellerLetterEmail").html("인증번호가 성공적으로 발송되었습니다. <br>인증번호를 입력해주세요");
            } else {
                // 인증번호 발생 실패
                $("#e_" + obj).addClass("popup_error");
                $("#e_sellerLetterEmail").html("인증번호 발송에 실패하였습니다.");
            }
        },
        error: function (xhr, status, error) {
            console.log("error: " + error);
            console.log(result);
        },
        complete: function () {
            sendAuthNoForEmailAuthFlag = false;
        }
    });
}
var setSellerEmailFlag = false;

function setSellerEmail() {
    var e_sellerLetterEmail = $("#e_sellerLetterEmail");
    var sellerLetterEmail = $("#sellerLetterEmail");
    var sellerLetterEmailAuthNo = $("#sellerLetterEmailAuthNo");
    //var confirmMyLetterEmail = $("#myLetterEmailAuthNo");

    if (setSellerEmail === true) {
        return;
    }

    nclk(this, 'inf.primaryok', '', '', window.event);

    e_sellerLetterEmail.removeClass("popup_error green");
    e_sellerLetterEmail.addClass("popup_error");
    e_sellerLetterEmail.html("");

    if (sellerLetterEmail.prop("disabled") === true) {
        e_sellerLetterEmail.html("현재 이메일 주소가 정확한지 확인해 주세요.");
        sellerLetterEmail.focus();
        return;
    }

    if (sellerLetterEmail.val() === "" || sellerLetterEmail.val().replace(/^\s+/, "") === "") {
        e_sellerLetterEmail.html("이메일 주소를 입력해 주세요.");
        sellerLetterEmail.focus();
        sellerLetterEmail.val("");
        return;
    }

    if (!isValid_email_myinfo(sellerLetterEmail.val().replace(/^\s+/, ""), "e_sellerLetterEmail")) {
        e_sellerLetterEmail.html("이메일 형식이 올바르지 않습니다.");
        sellerLetterEmail.focus();
        sellerLetterEmail.val("");
        return;
    }

    if (sellerLetterEmail.val() !== "" && sellerLetterEmail.prop("disabled") === true) {
        e_sellerLetterEmail.html("[인증] 버튼을 클릭하여, 인증번호를 받아주세요.");
        return;
    }

    if (sellerLetterEmailAuthNo.val().length !== 6) {
        if (sellerLetterEmailAuthNo.val().length === 0) {
            e_sellerLetterEmail.html("인증번호를 입력해 주세요.");
        } else {
            e_sellerLetterEmail.html("인증번호를 정확하게 입력해 주세요.");
        }
        sellerLetterEmailAuthNo.focus();
        return;
    }

    setSellerLetterEmail(setSellerEmail);
    return;
}

function setSellerLetterEmail(setSellerEmail) {
    if (setSellerEmail === true) {
        return;
    } else {
        setSellerEmail = true;
    }

    var sellerLetterEmail = $("#sellerLetterEmail").val();
    var authNo = $("#sellerLetterEmailAuthNo").val();
    
    var addform = $("#fm");

    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $.ajax({
        type: "POST",
        url: "myInfo/emailCheck/authCodeCheck",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        data: { "authNo": authNo },
        success: function (result) {
            console.log(result);
            if (result == 200) {
                isValid = "N";
                hideSellerMyLetterEmailChangePopUp();
                addform.attr("action", "/itda/user/sellerEmailChangePro");
           		  addform.attr("method", "Post");
           		  addform.submit();
             alert("이메일 변경이 완료되었습니다.");
            } else {
                alert("인증 오류입니다. 다시 시도해 주세요");
            }
        },
        error: function (xhr, status, error) {
            alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
            $(location).attr("href", rawRurl);
        },
        complete: function () {
            $("#sellerUserEmail").val(sellerLetterEmail);
            console.log(sellerLetterEmail);
            setSellerEmail = false;

        }
    });
}

 

    function showPswdEmailChangePopUp() {
        var clickCode = "imn";
            clickCode = "nid";

        displayObj('dimmed');
        displayObj('pswdEmailChangePopUpLayer');
        document.getElementById("wrap").classList.add("is_fixed");
        if (!(isValid === "Y" && emailType === "pswdEmail") && element_isEmailYn.value === "Y") {
            document.getElementById("pswdEmailForm").style.display = "block";
            document.getElementById("p_txt_pswdEmailForm").style.display = "block";
            document.getElementById("pswdEmailPhoneVerify").style.display = "block";
            document.getElementById("pswdEmail").disabled = true;
        } else {
            document.getElementById("pswdEmailForm").style.display = "none";
            document.getElementById("p_txt_pswdEmailForm").style.display = "none";
            document.getElementById("pswdEmailPhoneVerify").style.display = "none";
            document.getElementById("pswdEmail").disabled = false;
        }

        if (isValid !== "Y" && element_isEmailYn.value === "Y") {
            nclk(this, clickCode + '.recoveryedit', '', '', event)
        } else {
            nclk(this, clickCode + '.recoveryregister', '', '', event)
        }
    }

    function hidePswdEmailChangePopUp() {
        hiddenObj('dimmed');
        hiddenObj('pswdEmailChangePopUpLayer');
        document.getElementById("wrap").classList.remove("is_fixed");
        document.getElementById("confirmPswdEmail").value = "";
        document.getElementById("pswdEmail").value = "";
        document.getElementById("pswdEmailAuthNo").value = "";
        document.getElementById("pswdEmailAuthNo").className = "popup_input";
        document.getElementById("e_pswdEmail").innerHTML = "";
        document.getElementById("pswdEmail").disabled = true;
        document.getElementById("pswdEmailAuthNo").disabled = true;
        document.getElementById("pswdEmailAuthGuideTxt").style.display = "none"
    }

    var doConfirmPswdEmailFlag = false;

    function doConfirmPswdEmail() {
        if (doConfirmPswdEmailFlag === true) {
            return;
        }

        nclk(this, 'inf.recoveryconfirm', '', '', window.event);

        element_e_pswdEmail.className = "popup_error";
        element_e_pswdEmail.innerHTML = "";

        if (element_isEmailYn.value == "Y") {
            if (element_confirmPswdEmail.value == "" || element_confirmPswdEmail.value.replace(/^\s+/, "") == "") {
                element_e_pswdEmail.innerHTML = "이메일 주소를 입력해 주세요.";
                element_confirmPswdEmail.focus();
                element_confirmPswdEmail.value = "";
                return;
            }

            if (!isValid_email_myinfo(element_confirmPswdEmail.value.replace(/^\s+/, ""), "e_pswdEmail")) {
                element_e_pswdEmail.innerHTML = "이메일 형식이 올바르지 않습니다.";
                element_confirmPswdEmail.focus();
                element_confirmPswdEmail.value = "";
                return;
            }

            confirmPasswdEmail(doConfirmPswdEmailFlag);
        }
    }

    function confirmPasswdEmail(submitFlag) {
        if (submitFlag === true) {
            return;
        } else {
            submitFlag = true;
        }

        var token = '';
        var pswdEmail = element_confirmPswdEmail.value;

        var urls = CHANGE_USER_INFO_URL + "?m=checkPasswdEmail&token_help=" + token;
        $.ajax({
            type: "POST",
            url: urls,
            data: {"pswdEmail": pswdEmail},
            success: function (data) {
                msgKey = data.substr(4, 999);

                var list = msgKey.split("|", 2);
                if (msgKey.length > 300) {
                    alert("유효 시간이 초과 되었습니다. 다시 시도해 주세요.");
                    document.location.href = rawRurl;
                } else {
                    if (list[0] == "0") {
                        element_e_pswdEmail.className = "popup_error green";
                        element_e_pswdEmail.innerHTML = "현재 정보가 확인되었습니다. 변경할 이메일을 입력해주세요.";
                        element_pswdEmail.disabled = false;
                        element_pswdEmail.focus();
                    } else {
                        element_e_pswdEmail.className = "popup_error";
                        element_e_pswdEmail.innerHTML = list[1];
                    }
                }
            },
            error: function (xhr, status, error) {
                alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
                $(location).attr("href", rawRurl);
            },
            complete: function () {
                submitFlag = false;
            }
        });
    }

    var setPswdEmailFlag = false;

    function setPswdEmail() {
        if (setPswdEmailFlag === true) {
            return;
        }

        if (element_isEmailYn.value == "Y") {
            nclk(this, 'inf.recoveryok', '', '', window.event);
        } else {
            nclk(this, 'inf.recoveryregok', '', '', window.event);
        }

        element_e_pswdEmail.className = "popup_error";
        element_e_pswdEmail.innerHTML = "";

        if (element_isEmailYn.value == "N" && element_pswdEmail.value == "") {
            element_e_pswdEmail.innerHTML = "삭제하실 이메일 주소가 없습니다.";
            return;
        }

        if (element_isEmailYn.value == "Y" && element_pswdEmail.disabled == true) {
            element_e_pswdEmail.innerHTML = "현재 이메일 주소가 정확한지 확인해 주세요.";
            element_confirmPswdEmail.focus();
            return;
        }

        if (element_pswdEmail.value == "" || element_pswdEmail.value.replace(/^\s+/, "") == "") {
            if (!confirm("본인확인 이메일을 삭제하시겠습니까?")) {
                element_pswdEmail.focus();
                return;
            }
        } else {
            if (element_pswdEmail.value != "" && !isValid_pswdEmail(element_pswdEmail.value.replace(/^\s+/, ""), "e_pswdEmail")) {
                element_e_pswdEmail.innerHTML = "이메일 형식이 올바르지 않습니다.";
                element_pswdEmail.focus();
                element_pswdEmail.value = "";
                return;
            }

            if (element_pswdEmailAuthNo.disabled == true) {
                element_e_pswdEmail.innerHTML = "[인증] 버튼을 클릭하여, 인증번호를 받아주세요.";
                return;
            }

            if (element_pswdEmailAuthNo.disabled == false && element_pswdEmailAuthNo.value.length != 6) {
                if (element_pswdEmailAuthNo.value.length == 0) {
                    element_e_pswdEmail.innerHTML = "인증번호를 입력해 주세요.";
                } else {
                    element_e_pswdEmail.innerHTML = "인증번호를 정확하게 입력해 주세요.";
                }
                element_pswdEmailAuthNo.focus();
                return;
            }
        }

        setPasswdEmail(setPswdEmailFlag);
        return;
    }

    function setPasswdEmail(submitFlag) {
        if (submitFlag === true) {
            return;
        } else {
            submitFlag = true;
        }

        var token = '';
        var pswdEmail = element_pswdEmail.value;
        var authNo = element_pswdEmailAuthNo.value;

        var urls = CHANGE_USER_INFO_URL + "?m=setPasswdEmailWithVerification&token_help=" + token;

        $.ajax({
            type: "POST",
            url: urls,
            data: {"pswdEmail": pswdEmail, "authNo": authNo},
            success: function (data) {
                handleSessionExpiredErr(data);

                var result = JSON.parse(data);
                if (result.resultCode == 0) {
                    var newPasswdEmail = result.resultMsg;
                    document.getElementById("p_txt_pswdEmail").innerHTML = newPasswdEmail;
                    document.getElementById("p_txt_pswdEmail_changeYn").innerHTML = (newPasswdEmail == "" ? "등록" : "수정");
                    document.getElementById("pswdEmail").placeholder = (newPasswdEmail == "" ? "등록할 이메일 입력" : "변경할 이메일 입력");
                    document.getElementById("b_txt_pswdEmail_reg").innerHTML = (newPasswdEmail == "" ? "등록" : "변경");
                    if (newPasswdEmail == "") {
                        document.getElementById("pswdEmailRegDiv").classList.add("not");
                        document.getElementById("pswdEmailRegBtn").className = "btn_accent"
                    } else {
                        document.getElementById("pswdEmailRegDiv").classList.remove("not");
                        document.getElementById("pswdEmailRegBtn").className = "btn_edit"
                    }
                    document.getElementById("pswdEmailRegSpan").innerHTML = (newPasswdEmail == "" ? "본인확인 이메일 없음" : newPasswdEmail);
                    document.getElementById("pswdEmailRegBtnTxt").innerHTML = (newPasswdEmail == "" ? "등록" : "수정");
                    element_isEmailYn.value = (newPasswdEmail == "" ? "N" : "Y");
                    isValid = "N";
                    hidePswdEmailChangePopUp();
                } else {
                    element_e_pswdEmail.innerHTML = result.resultMsg;
                }
            },
            error: function (xhr, status, error) {
                alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
                $(location).attr("href", rawRurl);
            },
            complete: function () {
                submitFlag = false;
            }
        });
    }

    function userMobile(emailType) {
        var ua = window.navigator.userAgent.toLowerCase();
        if ((/crios/.test(ua) || (navigator.userAgentData && navigator.userAgentData.platform.indexOf('iOS') !== -1 && (navigator.userAgentData.brands.some(function(v) { return /Chrome/i.test(v.brand) })))) && /ipad/.test(ua)) {
            alert("접속하신 브라우저에서는 본인 휴대전화 인증이 지원되지 않습니다. 다른 브라우저를 이용해 주세요.");
            return;
        }

        if (emailType === "myLetterEmail") {
            nclk(this, 'inf.primaryverify', '', '', event);
        } else {
            nclk(this, 'inf.recoveryverify', '', '', event);
        }

        winOpenAtCenter("/user2/help/changeUserInfo?m=viewUserMobile&token_help= &emailType=" + emailType, "auth", 400, 490, 'auto');

        return;
    }

    function changeVerifyToPopupInput(obj) {
        var element = document.getElementById(obj);
        if (element.value.length === 0) {
            element.classList.remove("verify");
        } else {
            element.classList.add("verify");
        }
    }

    function excuteNclicksCancelAsPhoneYn() {
        if (document.getElementById("isPhoneYn").value == "Y") {
            nclk(this, 'inf.mphonecancel', '', '', event)
        } else {
            nclk(this, 'inf.mphoneregcancel', '', '', event)
        }
    }

    function excuteNclicksCloseAsPhoneYn() {
        if (document.getElementById("isPhoneYn").value == "Y") {
            nclk(this, 'inf.mphonex', '', '', event)
        } else {
            nclk(this, 'inf.mphoneregx', '', '', event)
        }
    }

    function excuteNclicksCancelAsPswdEmailYn() {
        if (document.getElementById("isEmailYn").value == "Y") {
            nclk(this, 'inf.recoverycancel', '', '', event)
        } else {
            nclk(this, 'inf.recoveryregcancel', '', '', event)
        }
    }

    function excuteNclicksCloseAsPswdEmailYn() {
        if (document.getElementById("isEmailYn").value == "Y") {
            nclk(this, 'inf.recoveryx', '', '', event)
        } else {
            nclk(this, 'inf.recoveryregx', '', '', event)
        }
    }

    function hideUgcPhoneNoticePopUp() {
        if (document.getElementById("ugcPhoneNotice_toggle_switch_on").getAttribute("aria-checked") == "true") {
            nclk(this, 'imn.postactionsonok', '', '', event)
        } else {
            nclk(this, 'imn.postactionsoffok', '', '', event)
        }
        hiddenObj('dimmed');
        hiddenObj('ugcPhoneNoticePopUpLayer');
        $("#wrap").removeClass('is_fixed');
    }

    function viewSetMobilePromotionPopup() {
        $("#wrap").addClass('is_fixed');
        displayObj('dimmed');
        displayObj('setAdMobilePopUpLayer');
    }

    function hideSetAdMobilePromotionPopUp() {
        hiddenObj('dimmed');
        hiddenObj('setAdMobilePopUpLayer');
        $("#wrap").removeClass('is_fixed');

        $("#adMobileCheck").prop("checked", false);
        $('#adMobileCheck_toggle_switch_on').attr('aria-checked', 'false');
        $('#adMobileCheck_toggle_switch_off').attr('aria-checked', 'true');

        return false;
    }

    function doSetAdMobilePromotionPopup() {
        hiddenObj('dimmed');
        hiddenObj('setAdMobilePopUpLayer');
        hiddenObj('unsetAdMobilePopUpLayer');
        $("#wrap").removeClass('is_fixed');

        var isChecked = $("#adMobileCheck").is(':checked');
        if (isChecked == false) {
            nclk(this, 'imn.adagreemobileoff', '', '', event)
            $.setMobilePromotionInfo(isChecked);
        } else {
            nclk(this, 'imn.adagreemobileon', '', '', event)
            $.setMobilePromotionInfo(isChecked);
        }
        return;
    }

    function viewUnsetMobilePromotionPopup() {
        $("#wrap").addClass('is_fixed');
        displayObj('dimmed');
        displayObj('unsetAdMobilePopUpLayer');
    }

    function hideUnsetAdMobilePromotionPopUp() {
        hiddenObj('dimmed');
        hiddenObj('unsetAdMobilePopUpLayer');
        $("#wrap").removeClass('is_fixed');

        $("#adMobileCheck").prop("checked", true);
        $('#adMobileCheck_toggle_switch_on').attr('aria-checked', 'true');
        $('#adMobileCheck_toggle_switch_off').attr('aria-checked', 'false');
    }

    function viewSetEmailPromotionPopup() {
        $("#wrap").addClass('is_fixed');
        displayObj('dimmed');
        displayObj('setAdEmailPopUpLayer');
    }

    function hideSetAdEmailPromotionPopUp() {
        hiddenObj('dimmed');
        hiddenObj('setAdEmailPopUpLayer');
        $("#wrap").removeClass('is_fixed');

        $("#adEmailCheck").prop("checked", false);
        $('#adEmailCheck_toggle_switch_on').attr('aria-checked', 'false');
        $('#adEmailCheck_toggle_switch_off').attr('aria-checked', 'true');

        return false;
    }

    function doSetAdEmailPromotionPopup() {
        hiddenObj('dimmed');
        hiddenObj('setAdEmailPopUpLayer');
        hiddenObj('unsetAdEmailPopUpLayer');
        $("#wrap").removeClass('is_fixed');

        var isChecked = $("#adEmailCheck").is(':checked');
        if (isChecked == false) {
            nclk(this, 'imn.adagreeemailoff', '', '', event)
            $.setEmsCheck(isChecked);
        } else {
            nclk(this, 'imn.adagreeemailon', '', '', event)
            $.setEmsCheck(isChecked);
        }
        return;
    }

    function viewUnsetEmailPromotionPopup() {
        $("#wrap").addClass('is_fixed');
        displayObj('dimmed');
        displayObj('unsetAdEmailPopUpLayer');
    }

    function hideUnsetAdEmailPromotionPopUp() {
        hiddenObj('dimmed');
        hiddenObj('unsetAdEmailPopUpLayer');
        $("#wrap").removeClass('is_fixed');

        $("#adEmailCheck").prop("checked", true);
        $('#adEmailCheck_toggle_switch_on').attr('aria-checked', 'true');
        $('#adEmailCheck_toggle_switch_off').attr('aria-checked', 'false');
    }
<!--팝업딥드-->