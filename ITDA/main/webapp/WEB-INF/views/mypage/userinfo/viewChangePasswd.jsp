<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
<meta http-equiv="Cache-Control" content="post-check=0, pre-check=0">
<meta http-equiv="Pragma" content="No-Cache">

<title>로그인 비밀번호 변경</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage/common/jquery.min.js"></script>--%>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage/help_member.css">
<link href="https://nid.naver.com/favicon_1024.png" rel="apple-touch-icon-precomposed" sizes="1024x1024" />
<script type="text/javascript">

	function gnbClose(){
		$('#wrap').click(function(e){
			if( !$('#gnb').has(e.target).length ){
				gnbAllLayerClose();
			}
		});
	}
	//120919 win8 이슈 대응 : capslock 자동설정해제
	document.msCapsLockWarningOff = true;
	function setContainerHeight(height) {}
	function clearDocs(){}
</script>
<meta name="decorator" content="NEW_USER_MYINFO">

 <script type="text/javascript">

// 비밀번호 확인 ajax
$(function() {
    let contextpath = "${pageContext.request.contextPath}";
    let checkPw = false;
    var header = '${_csrf.headerName}';
    var token = '${_csrf.token}';

    $("input[id=now_pw]").on('keyup', function() {
        // 현재 비밀번호 입력값을 가져옴
        let userPw = $(this).val();

        $.ajax({
            type: "POST",
            url: contextpath + "/user/passwdCheck",
            data: { "userPw": userPw},
            dataType: "json",
            beforeSend: function(xhr){
                xhr.setRequestHeader(header, token);
            }, 
            success: function(result) {
                console.log(result);

                if (result === 1) {
                    $('#now_pw').html("비밀번호 일치");
                    checkPw = true;
                } else {
                    $("#now_pw").html("비밀번호 불일치");
                    checkPw = false;
                }
                
            },
            error: function(error) {
                console.log("error: " + error);
            }
        });
    });
});


</script>
<script type="text/javascript">

function mainSubmit() {
    if (document.fm.now_pw.value == "") {
        alert("비밀번호를 입력하세요.");
        document.fm.now_pw.focus();
        return false; // 비밀번호가 비어있는 경우 false를 반환
    } else if (document.fm.new_pw.value == "") {
        alert("새 비밀번호를 입력하세요.");
        document.fm.new_pw.focus();
        return false; // 새 비밀번호가 비어있는 경우 false를 반환
    } else if (document.fm.conf_pw.value == "") {
        alert("새 비밀번호 확인을 입력하세요.");
        document.getElementById("lb_conf_pw").style.display = "block";
        document.fm.conf_pw.focus();
        return false; // 비밀번호 확인이 비어있는 경우 false를 반환
    } else if (document.fm.new_pw.value != document.fm.conf_pw.value) {
        alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        document.fm.conf_pw.value = "";
        document.getElementById("lb_conf_pw").style.display = "block";
        document.fm.conf_pw.focus();
        return false; // 새 비밀번호와 비밀번호 확인이 일치하지 않는 경우 false를 반환
    }
    return true; // 모든 조건을 통과한 경우에만 true를 반환
}



/* function showCapslockForNowPw(option) {
	if ( option == -1) {
		document.getElementById("help0_1").style.display = "none";
	} else {
		if ( isCapslock ) {
			document.getElementById("help0_1").style.display = "block";
		} else {
			document.getElementById("help0_1").style.display = "none";
		}
	}
}

function toggle(obj){
}



function getLenChar(texts) {
	texts = texts + "";
	return String.fromCharCode(texts.length);
}

function initializeForm(){
	document.fm.now_pw.value = "";
	document.fm.new_pw.value = "";
	document.fm.conf_pw.value = "";
	document.fm.autoValue.value = "";
    document.getElementById("lbCapcha").className = "lbl_in";
	document.getElementById("lb_now_pw").style.display = "block";
	document.getElementById("lb_new_pw").style.display = "block";
	document.getElementById("lb_conf_pw").style.display = "block";
	document.getElementById("chkBlockIp").checked = false;
}
*/
function goSecurityAfterCancel(){
	document.location.href = "${pageContext.request.contextPath}/user/myInfo";
}

/*
function hiddenText(objName){
	document.getElementById(objName).className = "blind";
}

function showText(objName, compName){
	if(document.getElementById(compName).value == ""){
		document.getElementById(objName).className = "lbl_in";
	}
}
*/
// placeholder
function convertDiv(obj, stat){
	if(stat == "none") {
		document.getElementById("lb_" + obj).style.display = stat;
	}else{
		if(document.getElementById(obj).value == ""){
			document.getElementById("lb_" + obj).style.display = stat;
		}else{
			document.getElementById("lb_" + obj).style.display = "none";
		}
	}
}
 

</script>
<jsp:include page="../../include/header.jsp"></jsp:include>
</head>

<body onclick="clearDocs();gnbClose();" id="mainBody">
<div class="contentbodywrap">
<div id="wrap">
	<!-- 스킵네비게이션 : 웹접근성대응-->
	<div id="u_skip">
<!-- [D] 주메뉴가 존재하는 페이지에 적용 -->
<!-- <a href="#lnb" onclick="document.getElementById('lnb_area').tabIndex=-1;document.getElementById('lnb_area').focus();return false;"><span>주메뉴로 바로가기</span></a>
<a href="#content" onclick="document.getElementById('content').tabIndex=-1;document.getElementById('content').focus();return false;"><span>본문으로 바로가기</span></a>
 -->	</div>
	<!-- //스킵네비게이션 -->
	<div id="header">
<%-- 		<div class="top">
			<h1>
			   <a href="${pageContext.request.contextPath}/" onclick="clickcr(this,'STA.my','','',event);">
       			 <img class="header_logo_img" src="${pageContext.request.contextPath}/resources/image/common/itda_logo6.png">
            <span class="blind">잇다</span>
				<a href="http://www.naver.com" target="_top" onclick="clickcr(this,'STA.naver','','',event);"><span class="sptxt">NAVER</span><em></em></a>
				<a href="/user2/help/myInfo?lang=ko_KR" onclick="clickcr(this,'STA.my','','',event);" ><span class="sptxt">네이버ID</span><em></em></a>
			</h1>
			<div class="gnb_area">
				<div id="gnb" class="gnb_one">
					<script type='text/javascript' charset='utf-8' src='https://static.nid.naver.com/template/gnb_utf8.nhn?2023. 10. 5'></script>
				</div>
			</div>
		</div> --%>
		<div id="lnb_area">
			<div class="lnb">
	            <ul role="menu">
					<li id="nid" role="presentation"><a href="${pageContext.request.contextPath}/user/myInfo" role="menuitem" onclick="clickcr(this,'lnb.info','','',event);">내프로필<em></em></a></li>
<!-- 					<li id="security" role="presentation"><a href="/user2/help/myInfoV2?m=viewSecurity&lang=ko_KR" role="menuitem" onclick="clickcr(this,'lnb.protect','','',event);">보안설정<em></em></a></li>
					<li id="manageHistory" role="presentation"><a href="/user2/help/myInfoV2?m=viewManageHistory&lang=ko_KR" role="menuitem" onclick="clickcr(this,'lnb.history','','',event);">이력관리<em></em></a></li> -->
				</ul>
			</div>
		</div>
	</div>

	<div id="container">
		<!-- CONTENTS -->
		<div id="content">
	<!-- section_pwconfirm -->
	<div class="section_pwconfirm">
		<div class="spc_header">
			<h2>비밀번호 변경</h2>
			<p class="contxt"><a href="https://help.naver.com/support/alias/membership/p.membership/p.membership_5.naver" target="_blank" class="link">안전한 비밀번호로 내정보를 보호</a>하세요</p>
			<p class="contxt contxt_list"><em>다른 아이디/사이트에서 사용한 적 없는 비밀번호</em></p>
			<p class="contxt contxt_list"><em>이전에 사용한 적 없는 비밀번호</em>가 안전합니다.</p>			
		</div>
		<div class="spc_content">
			<form id="fm" name="fm">
			<input type="hidden" id="encPasswd" name="encPasswd">
			<input type="hidden" id="encNewPasswd" name="encNewPasswd">
			<input type="hidden" id="encNm" name="encNm">		
			<input type="hidden" id="captcha_type" name="captcha_type" value="image">
			<input type="hidden" id="chptchakey" name="chptchakey" value="">
			
				<fieldset>
					<legend>비밀번호 변경</legend>
					<p class="spc_row">
						<label id="lb_now_pw" for="now_pw">현재 비밀번호</label>
						<input type="password" id="now_pw" maxlength="20" style="width:336px" title="현재 비밀번호 입력"
								onFocus="convertDiv('now_pw', 'none')"
								onBlur="convertDiv('now_pw', 'block')"><!-- showCapslockForNowPw(-1);"
								onkeyup="showCapslockForNowPw(1);"
								onkeypress="capslock(event);"> -->
					</p>
					<div id="help0_1" class="help left" style="top:9px; right:-122px">
						<div class="txt">
							<p>키보드에 Caps Lock이 켜져 있습니다.</p>
						</div>
						<span class="shadow1"></span>
						<span class="shadow2"></span>
						<span class="arrow"></span>
					</div>
					<p class="spc_row2">
						<label id="lb_new_pw" for="new_pw">새 비밀번호</label>
						<input type="password" id="new_pw" name="userPw" maxlength="20" style="width:260px" title="새 비밀번호 입력"
								onFocus="convertDiv('new_pw','none');"
								onBlur="convertDiv('new_pw','block')" >
<!-- 								onkeyup="checkShiftUp(event);"
								onkeypress="capslock(event);"
								onkeydown="checkShiftDownNoMsg(event);"> -->
					</p>
					<p class="spc_row3">
						<label id="lb_conf_pw" for="conf_pw">새 비밀번호 확인</label>
						<input type="password" id="conf_pw" maxlength="20" style="width:260px" title="새 비밀번호 확인 입력"
								onFocus="convertDiv('conf_pw','none');"
								onBlur="convertDiv('conf_pw','block');">
					</p>
					
					<!--비밀번호 안전도 말풍선-->
					<div id="help1_1" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							<strong>사용불가</strong> : 비밀번호 재작성 필요
						<br />
							<span class="ex">8~16 자의 영문 대소문자, 숫자 및 특수문자 사용</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
					
					<div id="help1_2" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							비밀번호 안전도 <em>|</em> <strong>낮음</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar1_140811.gif" width="47" height="3" alt="" /><br />
							<span class="ex">안전도가 높은 비밀번호를 권장합니다.</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>

					<div id="help1_3" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							비밀번호 안전도 <em>|</em> <strong>적정</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar2_140811.gif" width="47" height="3" alt="" /><br />
							<span>안전하게 사용하실 수 있는 비밀번호 입니다.</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
					
					<div id="help1_4" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							비밀번호 안전도 <em>|</em> <strong>높음</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar3_140811.gif" width="47" height="3" alt="" /><br />
							<span>예측하기 힘든 비밀번호로 더욱 안전합니다.</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
					
					<div id="help1_5" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							비밀번호 안전도 <em>|</em> <strong>낮음</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar1_140811.gif" width="47" height="3" alt="" /><br />
								<span>도용 예방을 위해 이전에 사용한 적 없는 새로운 비밀번호를 사용하세요.</span></p>
							<p class="topline">비밀번호는 암호화하여 보관하며 비밀번호의 일치 여부만 확인합니다.</p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
					
					<div id="help1_6" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>비밀번호는 8자 이상 입력하셔야 합니다.</p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
					
					<div id="help1_7" class="help left" style="top:62px;right:-122px">
						<!-- 사용불가 메시지 -->
						<div class="txt">
							<p>
							<strong>사용불가</strong> : 비밀번호 재작성 필요
						<br />
							<span>도용된 비밀번호는 다시 도용될 가능성이 높아 사용하실 수 없습니다. 새로운 비밀번호로 설정해 주세요.</span>
							<p class="topline">비밀번호는 암호화하여 보관하며 비밀번호의 일치 여부만 확인합니다.</p>
						</div>
						<!-- //사용불가 메시지 -->
						<span class="arrow"></span> 
					</div>

					<div id="help2_1" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							<strong>사용불가</strong> : 비밀번호 재작성 필요
						<br />
							<span class="ex" id="p02">8~16 자의 영문 대소문자, 숫자 및 특수문자 사용</span>
							<span class="ex2">키보드에 Caps Lock이 켜져 있습니다.</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
					
					<div id="help2_2" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							비밀번호 안전도 <em>|</em> <strong>낮음</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar1_140811.gif" width="47" height="3" alt="" /><br />
							<span class="ex">안전도가 높은 비밀번호를 권장합니다.</span>
							<span class="ex2">키보드에 Caps Lock이 켜져 있습니다.</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
					
					<div id="help2_3" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							비밀번호 안전도 <em>|</em> <strong>적정</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar2_140811.gif" width="47" height="3" alt="" /><br />
							<span class="ex">안전하게 사용하실 수 있는 비밀번호 입니다.</span>
							<span class="ex2">키보드에 Caps Lock이 켜져 있습니다.</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
					
					<div id="help2_4" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
								
							비밀번호 안전도 <em>|</em> <strong>높음</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar3_140811.gif" width="47" height="3" alt="" /><br />
								<span class="ex">예측하기 힘든 비밀번호로 더욱 안전합니다.</span>
								<span class="ex2">키보드에 Caps Lock이 켜져 있습니다.</span>
							</p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
					
					<div id="help2_5" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
							비밀번호 안전도 <em>|</em> <strong>낮음</strong>
						 <img src="https://static.nid.naver.com/images/web/user/safetybar1_140811.gif" width="47" height="3" alt="" /><br />
							<span>도용 예방을 위해 이전에 사용한 적 없는 새로운 비밀번호를 사용하세요.</span>
							<p class="topline">비밀번호는 암호화하여 보관하며 비밀번호의 일치 여부만 확인합니다.
							<span class="ex2">키보드에 Caps Lock이 켜져 있습니다.</span></p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
					
					<div id="help2_6" class="help left" style="top:62px;right:-122px">
						<!-- 비밀번호 안전도 -->
						<div class="txt">
							<p>
								<span class="ex">비밀번호는 8자 이상 입력하셔야 합니다.</span>
								<span class="ex2">키보드에 Caps Lock이 켜져 있습니다.</span>
							</p>
						</div>
						<!-- //비밀번호 안전도 -->
						<span class="arrow"></span>
					</div>
					<div id="help2_7" class="help left" style="top:62px;right:-122px">
						<!-- 사용불가 메시지 -->
						<div class="txt">
							<p>
							<strong>사용불가</strong> : 비밀번호 재작성 필요
						<br />
							<span>도용된 비밀번호는 다시 도용될 가능성이 높아 사용하실 수 없습니다. 새로운 비밀번호로 설정해 주세요.</span>
							<p class="topline">비밀번호는 암호화하여 보관하며 비밀번호의 일치 여부만 확인합니다.
							<span class="ex2">키보드에 Caps Lock이 켜져 있습니다.</span></p>
						</div>
						<!-- //사용불가 메시지 -->
						<span class="arrow"></span> 
					</div>
					<!--비밀번호 안전도 말풍선-->

					<!--캡챠-->

<!-- 					캡챠
					<div id="divShowBlock" class="login_check">
						<input type="checkbox" name="chkBlockIp" id="chkBlockIp"  class="" /><label for="chkBlockIp" class="lbl">보안강화를 위해 해외 IP에서의 로그인 차단</label>
						<a href="javascript:toggle('blockIp')" class="link_help"><i id="i_blockIp" class="spico ico_arr4_dn">도움말</i></a>
						<p id="p_blockIp" class="check_txt" style="display:none">
					     	  해외에서 접속할 경우 <strong>회원정보에 등록된 이름/생일을 입력하여 본인 여부를 확인</strong>합니다. 기억나지 않을 경우 등록된 사용자 연락처 정보로 로그인 하실 수 있습니다. 해외 사용자이거나, 여행, 출장 등으로 해외에서 체류할 경우 해제해 주세요.
					     </p>
					</div> -->
		
					<p class="btn_area_btm">
						<button type="submit" id="changeSubmit">확인</button>
						<button type="button" onclick="goSecurityAfterCancel();">취소</button>
					</p>
				</fieldset>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
				
			</form>
		</div>
	</div>
	<!-- //section_pwconfirm -->
</div>
</div>

<hr />



<script type="text/javascript">

     
// var normalCount = 0;
/* var _submitFlag = false;

 $("#changeSubmit").on("click", function(event) {
    if ($("#now_pw").val().length >= 6 || $("#encNewPasswd").val()) {
        normalCount = normalCount + 1;
    }
    if ($("#new_pw").val().length >= 6 || $("#encNewPasswd").val()) {
        normalCount = normalCount + 1;
    }
    if ($("#conf_pw").val().length >= 6 || $("#encNewPasswd").val()) {
        normalCount = normalCount + 1;
    }
});  

$("#fm").submit(function(e) {
    e.preventDefault(); // avoid to execute the actual submit of the form.
    if (_submitFlag) {
        return false;
    }

    _submitFlag = true;
    if (!mainSubmit()) {
        _submitFlag = false;
        return false;
    }

    let contextpath = "${pageContext.request.contextPath}";

    // 양식의 속성을 올바르게 설정합니다.
    $("#fm").attr("action", contextpath + "/user/myInfo/passWdChangePro"); // 경로와 메서드 속성을 설정합니다.
    $("#fm").attr("method", "POST");

    // 양식을 제출합니다.
    $("#fm").submit();
    return true;
    
}); */

    var _submitFlag = false;
    var addform = $("#fm");

    $("#changeSubmit").on("click", function(event) {
		event.preventDefault();
        if(_submitFlag == false || checkPw == false){
        	alert("비밀번호가 일치하지 않습니다");
        	return false;
        }else if(!mainSubmit()){
        	 return false;
        }else{
        	let contextpath = "${pageContext.request.contextPath}";
        	
			 $("#fm").attr("action", contextpath + "/user/myInfo/passWdChangePro"); // 경로와 메서드 속성을 설정합니다.
			 $("#fm").attr("method", "POST");
			 $("#fm").submit();
			 
			 alert("비밀번호가 변경 되었습니다.");
			 
        }

    });






</script>
	</div>

 	<div id="footer">

</div>
</div>
 	<jsp:include page="../../include/footer.jsp"></jsp:include>



</body>
</html>
