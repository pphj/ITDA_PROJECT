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

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage/common/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage/help_member.css">
<link href="https://nid.naver.com/favicon_1024.png" rel="apple-touch-icon-precomposed" sizes="1024x1024" />
<script type="text/javascript" src="https://nid.naver.com/js/clickcr.js"></script>
<script type="text/javascript" src="/inc/common/js/lcs_nclicks.js?r=20220411"></script>
<script type="application/json" src="${pageContext.request.contextPath}/resources/js/mypage/userinfo/commonUtil.js"></script>
<script type="text/javascript" src="/inc/common/js/lua.js?r=20220411"></script>
<script type="text/javascript">
	var gnb_option = {
		gnb_service : "nid",
		gnb_template : "gnb_utf8",
		gnb_logout : encodeURIComponent("https://nid.naver.com/user2/help/myInfo?menu=home"),
		gnb_brightness : 1,
		gnb_one_naver : 1,
		gnb_item_hide_option : 0
	}

	lcs_do();

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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage/userinfo/passwdAjax.js"></script>
<!-- <script type="text/javascript" src="/inc/common/js/rsaAll.js"></script> -->
<!-- <script type="text/javascript" src="https://nid.naver.com/inc/user/js/soundCaptcha.js?20220411"></script> -->

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
            url: contextpath + "/user/myInfo/passwdCheck", 
            beforeSend : function(xhr){
        		xhr.setRequestHeader(header, token);
        	},
            data: { "userPw": userPw },
            dataType: "json",
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
var nsc = "my.private"+ "";
var ccsrv = "cc.naver.com";

function mainSubmit() {
	if ( document.fm.now_pw.value == "" ) {
		alert("비밀번호를 입력하세요.");
		document.fm.now_pw.focus();
	} else if ( document.fm.new_pw.value == "" ) {
		alert("새 비밀번호를 입력하세요.");
		document.fm.new_pw.focus();
	} else if ( !isValid_passwd(document.fm.new_pw.value) ) {
		document.fm.new_pw.value = "";
		document.fm.conf_pw.value = "";
		document.getElementById("lb_new_pw").style.display = "block";
		document.getElementById("lb_conf_pw").style.display = "block";
		document.fm.new_pw.focus();
		document.fm.new_pw.select();
	} else if( !pwdstat ) {
		alert("안전도가 너무 낮습니다. 다른 비밀번호를 입력해 주세요.");
		document.fm.new_pw.value = "";
		document.fm.conf_pw.value = "";
		document.getElementById("lb_new_pw").style.display = "block";
		document.getElementById("lb_conf_pw").style.display = "block";
		document.fm.new_pw.focus();
	} else if ( document.fm.now_pw.value == document.fm.new_pw.value ) {
		alert("현재 비밀번호와 동일합니다.");
		document.fm.new_pw.value = "";
		document.fm.conf_pw.value = "";
		document.getElementById("lb_new_pw").style.display = "block";
		document.getElementById("lb_conf_pw").style.display = "block";
		document.fm.new_pw.focus();
		document.fm.new_pw.select();
	} else if ( document.fm.conf_pw.value == "" ) {
		alert("새 비밀번호 확인을 입력하세요.");
		document.getElementById("lb_conf_pw").style.display = "block";
		document.fm.conf_pw.focus();
	} else if ( document.fm.new_pw.value != document.fm.conf_pw.value ) {
		alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		document.fm.conf_pw.value = "";
		document.getElementById("lb_conf_pw").style.display = "block";
		document.fm.conf_pw.focus();
	}else {
		document.fm.tempAutoValue.value = document.fm.autoValue.value;
		document.fm.tempChkBlockIp.value = document.fm.chkBlockIp.checked;
		
		createRsaKey();
/* 		lua_do('changePW_PC' , arguments.callee.name,INFO_CHECK_POINT_SUBMIT, document.fm.token_help.value, true,'');
 */		return true;
	}
	return false;
}

function setNoticeLayer(target){
	var obj = document.getElementById(target);

	var top = -223, left = 0;

	while(obj && obj.offsetParent) {
		top += obj.offsetTop;
		left += obj.offsetLeft;
		obj = obj.offsetParent;
	}

	var target= document.getElementById('help3_1');
	target.style.left = left+"px";
	target.style.top = top+"px";

	showCapslock();
}

function showCapslockForNowPw(option) {
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

function createRsaKey() {
	var rsa = new RSAKey();
	var sessionKey = "";
	var keyName = "";
	var eValue = "";
	var nValue = "";
	var id = "";
	rsa.setPublic(eValue, nValue);
    
	if (sessionKey == "" || eValue == "" || nValue == "" || keyName == "") {
		alert("일시적인 오류입니다. 처음부터 다시 진행해 주세요.");
		initializeForm();
	} else {
		var form = document.getElementById("fm");
		var comVal = getLenChar(sessionKey) + sessionKey + getLenChar(id) + id;
		form.encPasswd.value = rsa.encrypt(comVal + getLenChar(form.now_pw.value) + form.now_pw.value);
		form.encNewPasswd.value = rsa.encrypt(comVal + getLenChar(form.new_pw.value) + form.new_pw.value);
		form.encNm.value = keyName;
		initializeForm();
	}
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

function goSecurityAfterCancel(){
	document.location.href = "${pageContext.request.contextPath}/user/myInfo";
}

function reCaptcha() {
	reCaptchaCount++;
	lua_do('changePW_PC' , arguments.callee.name,INFO_CHECK_POINT_RETRY, document.fm.token_help.value, true,'');
	document.getElementById("chptchaimg").src = document.getElementById("chptchaimg").src + "1";
}

function hiddenText(objName){
	document.getElementById(objName).className = "blind";
}

function showText(objName, compName){
	if(document.getElementById(compName).value == ""){
		document.getElementById(objName).className = "lbl_in";
	}
}

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

function checkNumber(){
	var captcha = document.getElementById('captcha_image_legend').style.display;
	
	if(captcha == "none"){
		check_num('autoValue', '1');
	}
}
</script>
</head>

<body onclick="clearDocs();gnbClose();" id="mainBody">
<div id="wrap">
	<!-- 스킵네비게이션 : 웹접근성대응-->
	<div id="u_skip">
<!-- [D] 주메뉴가 존재하는 페이지에 적용 -->
<a href="#lnb" onclick="document.getElementById('lnb_area').tabIndex=-1;document.getElementById('lnb_area').focus();return false;"><span>주메뉴로 바로가기</span></a>
<a href="#content" onclick="document.getElementById('content').tabIndex=-1;document.getElementById('content').focus();return false;"><span>본문으로 바로가기</span></a>
	</div>
	<!-- //스킵네비게이션 -->
	<div id="header">
		<div class="top">
			<h1>
				<a href="http://www.naver.com" target="_top" onclick="clickcr(this,'STA.naver','','',event);" class="link_logo"><span class="sptxt">NAVER</span><em></em></a>
				<a href="/user2/help/myInfo?lang=ko_KR" onclick="clickcr(this,'STA.my','','',event);" class="link_subtit "><span class="sptxt">네이버ID</span><em></em></a>
			</h1>
			<div class="gnb_area">
				<div id="gnb" class="gnb_one">
					<script type='text/javascript' charset='utf-8' src='https://static.nid.naver.com/template/gnb_utf8.nhn?2023. 10. 5'></script>
				</div>
			</div>
		</div>
		<div id="lnb_area">
			<div class="lnb">
	            <ul role="menu">
					<li id="nid" role="presentation"><a href="/user2/help/myInfoV2?m=viewProfile&lang=ko_KR" role="menuitem" onclick="clickcr(this,'lnb.info','','',event);">내프로필<em></em></a></li>
					<li id="security" role="presentation"><a href="/user2/help/myInfoV2?m=viewSecurity&lang=ko_KR" role="menuitem" onclick="clickcr(this,'lnb.protect','','',event);">보안설정<em></em></a></li>
					<li id="manageHistory" role="presentation"><a href="/user2/help/myInfoV2?m=viewManageHistory&lang=ko_KR" role="menuitem" onclick="clickcr(this,'lnb.history','','',event);">이력관리<em></em></a></li>
				</ul>
			</div>
		</div>
<script type="text/javascript">
document.getElementById("nid").className = "selected";

var tagList = "nid security ";

	tagList += "manageHistory ";

var menu = "security";
if(menu == "nid1_sub_m3" || menu.substring(0,4) == "nid2") { 
	menu = "security";
} else if( menu.substring(0,4) == "nid1" ) { 
	menu = "nid"; 
} else if( menu.substring(0,4) == "nid1" ) { 
	menu = "security"; 
} else if(menu == "" || menu == "null" || menu == null || tagList.indexOf(menu) == -1){
	menu = "nid";
} 

showMenu(menu);
function showMenu(subMenu) {
	document.getElementById(subMenu).className = "on";
	$("#" + subMenu).attr("aria-current", "true");
	
	var otherMenu = tagList.replace(subMenu + " ", "").split(" ");
	for (var i = 0; i < otherMenu.length - 1; i++) {
		document.getElementById(otherMenu[i]).className = "";
	}
}
</script>	</div>

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
			<input type="hidden" name="token_help" value="" />
			<input type="hidden" name="menu" value="security" />
			<input type="hidden" id="encPasswd" name="encPasswd">
			<input type="hidden" id="encNewPasswd" name="encNewPasswd">
			<input type="hidden" id="encNm" name="encNm">		
			<input type="hidden" id="captcha_type" name="captcha_type" value="image">
			<input type="hidden" id="chptchakey" name="chptchakey" value="">
			<input type="hidden" id="tempAutoValue" name="tempAutoValue">
			<input type="hidden" id="tempChkBlockIp" name="tempChkBlockIp">
			
				<fieldset>
					<legend>비밀번호 변경</legend>
					<p class="spc_row">
						<label id="lb_now_pw" for="now_pw">현재 비밀번호</label>
						<input type="password" name="userPw" id="now_pw" maxlength="20" style="width:336px" title="현재 비밀번호 입력"
								onFocus="convertDiv('now_pw', 'none')"
								onBlur="convertDiv('now_pw', 'block');showCapslockForNowPw(-1);"
								onkeyup="showCapslockForNowPw(1);"
								onkeypress="capslock(event);">
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
								onFocus="convertDiv('new_pw','none');checkpwd_login('new_pw','now_pw');"
								onBlur="convertDiv('new_pw','block');showhelpmsg(-1);" 
								onkeyup="checkShiftUp(event);checkpwd_login('new_pw','now_pw');"
								onkeypress="capslock(event);"
								onkeydown="checkShiftDownNoMsg(event);">
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

					<!--캡챠-->
					<div id="divShowBlock" class="login_check">
						<input type="checkbox" name="chkBlockIp" id="chkBlockIp"  class="" /><label for="chkBlockIp" class="lbl">보안강화를 위해 해외 IP에서의 로그인 차단</label>
						<a href="javascript:toggle('blockIp')" class="link_help"><i id="i_blockIp" class="spico ico_arr4_dn">도움말</i></a>
						<p id="p_blockIp" class="check_txt" style="display:none">
					     	  해외에서 접속할 경우 <strong>회원정보에 등록된 이름/생일을 입력하여 본인 여부를 확인</strong>합니다. 기억나지 않을 경우 등록된 사용자 연락처 정보로 로그인 하실 수 있습니다. 해외 사용자이거나, 여행, 출장 등으로 해외에서 체류할 경우 해제해 주세요.
					     </p>
					</div>
		
					<p class="btn_area_btm">
						<button type="submit" id="changeSubmit" onclick="clickcr(this,'npw.confirm','','',event);">확인</button>
						<button type="button" onclick="goSecurityAfterCancel();clickcr(this,'npw.reload','','',event);">취소</button>
					</p>
				</fieldset>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
				
			</form>
		</div>
	</div>
	<!-- //section_pwconfirm -->
</div>
<hr />

<!-- 비밀번호 변경 후 로그아웃 여부 확인창  -->
<!-- [D : 딤드레이어 접근성]  aria-hidden="true" 는 초점이 안가도록 함 -->
<div class="pop_dim" id="pop_dim" style="display:none;" aria-hidden="true"></div>

<!-- [D : 접근성 초점이동] 팝업 노출시 aria-hidden="false" / 팝업 미노출시 aria-hidden="true"-->
<div class="otp_pop_area" id="otp_pop_area" style="display:none;">
    <div class="abnormal_pop_area" style="width:542px; height:406px;" role="dialog" aria-hidden="true">
        <div class="abnormal_pop" id="logout_confirm">
            <!-- [D : 접근성 초점이동] 팝업 노출시 초점이 첫번째로 이동 할 곳에 tabindex="0"을 적용 -->
            <h1 class="title" tabindex="0">비밀번호가 변경되었습니다.</h1>
            <div class="abnormal_radio">
                <div class="radio_area">
                    <input id="logoutAll" name="logoutOption" type="radio">
                    <!--[D] 선택시 글자컬러 활성화 위해 ie8일때는 class에 ie8_on을 적용해주세요. class="sel_radio ie8_on" -->
                    <label for="logoutAll" class="sel_radio">모든 기기 및 브라우저에서 로그아웃</label>
                    <div class="desc">다른 사람이 회원님의 비밀번호를 알고 있다고 생각된다면 모든 기기에서 로그아웃하시는 것이 안전합니다.</div>
                </div>
                <div class="radio_area">
                    <input id="logoutNone" name="logoutOption" type="radio">
                    <!--[D] 선택시 글자컬러 활성화 위해 ie8일때는 class에 ie8_on을 적용해주세요. class="sel_radio ie8_on" -->
                    <label for="logoutNone" class="sel_radio">로그인 상태 유지</label>
                    <div class="desc">회원님의 아이디로 로그인한 목록은 보안 설정의 로그인 관리 > 로그인 목록에서 확인이 가능합니다.</div>
                </div>
            </div>
            <button type="button" class="abnormal_btn" id="btnConfirmLogout">확인</button>
        </div>

        <div class="abnormal_pop_logout" id="logout_complete" style="display:none;">
            <!-- [D : 접근성 초점이동] 팝업 노출시 초점이 첫번째로 이동 할 곳에 tabindex="0"을 적용 -->
            <h1 class="title" tabindex="0">
							다른 모든 기기와 브라우저에서<br> 로그아웃 되었습니다.
						</h1>
            <button type="button" class="abnormal_btn" id="btnComplete">확인</button>
        </div>
    </div>
</div>
<!-- // 비밀번호 변경 후 로그아웃 여부 확인창  -->

<script type="text/javascript">
document.getElementById("mainBody").className = "skin_main";
	document.getElementById('divShowBlock').style.display="none";	
</script>
<script type="text/javascript">
var pwStime = 0;
var pwEtime = 0;
var time = 0;
var totalTime = 0;
var normalCount = 0;
var reCaptchaCount = 0;

var cStime = 0;
var cEtime = 0;
var ctime = 0;

var reCaptchaTime = 0;
var rtime = 0;

var _submitFlag = false;
var _showExitPopup = true;

$(document).ready(function() {
	if(totalTime == 0) {
		totalTime  = new Date();
	}

    $("#now_pw").on("keydown", function(event){
        if(pwStime == 0) {
            pwStime = new Date();
        }
    });

    $("#new_pw").on("keydown", function(event){
        if(pwStime == 0) {
            pwStime = new Date();
        }
    });

    $("#conf_pw").on("keydown", function(event){
        if(pwStime == 0) {
            pwStime = new Date();
        }
    });
    
    $("#aReCaptcha").on( "click", function(event){
            reCaptchaTime = new Date();
            reCaptcha('');
    });

    $("#now_pw").on( "blur", function(event){
        if($("#now_pw").val().length >= 6 && $("#new_pw").val().length >= 6 && $("#conf_pw").val().length >= 6) {
            pwEtime = new Date();
        }        
    });

    $("#new_pw").on( "blur", function(event){
        if($("#now_pw").val().length >= 6 && $("#new_pw").val().length >= 6 && $("#conf_pw").val().length >= 6) {
            pwEtime = new Date();
        }        
    });

    $("#conf_pw").on( "blur", function(event){
        if($("#now_pw").val().length >= 6 && $("#new_pw").val().length >= 6 && $("#conf_pw").val().length >= 6) {
            pwEtime = new Date();
        }
    });


	$("#autoValue").on( "keydown", function(event){
        if(cStime == 0) {
            cStime = new Date();
        }
        
        if (event.keyCode == 13) {
            if(cEtime == 0) {
          		cEtime = new Date();
      	 	}
        }        
    });
    
	$("#autoValue").on( "focus", function(event){
        $.ajax({
	        url:"/user2/lua?m=checkApi&token=" + document.fm.token_help.value,
	        success: function(data, dataType){
	        }
	    }); 
    });        
        
	$("#autoValue").on( "blur", function(event){
        cEtime = new Date();
    });        
    
    $("#changeSubmit").on( "click", function(event){
    	if($("#now_pw").val().length >= 6 || $("#encNewPasswd").val()){
    		normalCount = normalCount + 1;
    	}
    	if($("#new_pw").val().length >= 6 || $("#encNewPasswd").val()){
    		normalCount = normalCount + 1;
    	}
    	if($("#conf_pw").val().length >= 6 || $("#encNewPasswd").val()){
    		normalCount = normalCount + 1;
    	}
    	
        time = pwEtime - pwStime;
        if(reCaptchaTime == 0){
        	reCaptchaTime = cStime;
        }
        ctime = cEtime - cStime;
        rtime = cEtime - reCaptchaTime;

        var nowTime = new Date();
        var ttime = nowTime - totalTime;
        
/*         lua_do2('ChangePW_PC', arguments.callee.name, normalCount + "^" + time + "^" + ctime + "^" + rtime  + "^" + ttime + "^" + reCaptchaCount, document.fm.token_help.value, true,'');        
 */        
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

        $.ajax({
            type: "POST",
            url: contextpath + "/user/myInfo/passWdChangePro", 
            data: $(this).serialize(), // serializes the form's elements.
            success : function(data) {
                _showExitPopup = false;
                handleSessionExpiredErr(data);

                var obj = JSON.parse(data);
                if (obj.resultCode === 0) {
                    showPasswordChangeConfirm();
					return;
                }

				// 에러 처리
                if (obj.resultCode === -3) {
                    if (confirmReturnMessage(obj.resultMsg)) {
                        document.location.href = "/user2/help/pwInquiry?lang=ko_KR";
                    } else {
                        document.location.href = "/user2/help/myInfo?m=viewChangePasswd&token_help=";
					}
					return;
                }
				alertReturnMessage(obj.resultMsg);
				if (obj.resultCode === -2) {
					document.location.href = "/user2/help/myInfo?m=viewChangePasswd&token_help=&lang=ko_KR";
				} else {
					document.location.href = "/user2/help/myInfoV2?lang=ko_KR";
				}
			},
            error : function(xhr, status, error) {
                alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
                _submitFlag = false;
            }
        });
    });

    var isLogoutSuccess = false;
    $("#btnConfirmLogout").on( "click", function(event){
        event.preventDefault();

        var selected = $("input[name=logoutOption]:checked").attr('id');
        if (!selected) {
            alert("옵션을 선택해주세요.");
            return;
        }

        if (selected == 'logoutAll') {
            $.ajax({
                type: "POST",
                url: "/user2/help/myInfo?m=actionChangePasswdComplete&token_help=",
                success : function(data) {
                    handleSessionExpiredErr(data);

                    var obj = JSON.parse(data);
                    if (obj.resultCode === 0) {
                        isLogoutSuccess = true;
                        return;
                    } else {
                        alertReturnMessage(obj.resultMsg);
                    }
                },
                error: function (xhr, status, error) {
                    alert("일시적인 오류입니다. 잠시 후 다시 시도해 주세요.");
                },
                complete: function(data) {
					if (isLogoutSuccess) {
                        showPasswordChangeComplete();
					} else {
                        document.location.href = "/user2/help/myInfoV2?lang=ko_KR";
                    }
                }
            });
        } else {
            document.location.href = "/user2/help/myInfoV2?lang=ko_KR";
        }
    });

    $("#btnComplete").on( "click", function(event){
        document.location.href= "/user2/help/myInfoV2?lang=ko_KR";
    });
});


function alertReturnMessage(resultMessage) {
    if (resultMessage) {
        alert(resultMessage.replace("\\n", "\n"));
    }
}

function confirmReturnMessage(resultMessage) {
    if (resultMessage) {
        return confirm(resultMessage.replace("\\n", "\n"));
    }
    return false;
}

function showPasswordChangeConfirm() {
    $("#pop_dim").show();
    $("#otp_pop_area").attr('aria-hidden', 'false').show();
}

function showPasswordChangeComplete() {
    $("#logout_confirm").hide();
    $("#logout_complete").show();
}

function handleSessionExpiredErr(data) {
    if (data && data.indexOf("-9|") === 0) {
        alertReturnMessage(data.split("|")[1]);
        document.location.href = "/user/myInfo";
    }
}
</script>
	</div>

	<div id="footer">
<ul class="policy_lst">
<li><a href="http://policy.naver.com/policy/privacy.html" onclick="clickcr(this,'fot.privacy','','',event);"><strong>개인정보처리방침</strong></a><span class="bar"></span></li>
<li><a href="http://policy.naver.com/rules/disclaimer.html" onclick="clickcr(this,'fot.disclaimer','','',event);">책임의 한계와 법적 고지</a><span class="bar"></span></li>
<li><a href="https://help.naver.com/support/alias/membership/p.membership/p.membership_26.naver" onclick="clickcr(this,'fot.memberhelp','','',event);">회원정보 고객센터</a></li>

</ul>
<address>
	<a href="http://www.navercorp.com/" target="_blank"  onclick="clickcr(this,'fot.nhncorp','','',event);" class="logo">NAVER</a>
	<span class="copyright">Copyright &copy; <a href="http://www.navercorp.com/ko/index.nhn " onclick="clickcr(this,'fot.navercorp','','',event);" target="_blank">NAVER Corp.</a> All Rights Reserved.</span>
</address>

<!-- <script type="text/javascript" src="/inc/common/js/jquery.resize.js"></script> -->
 <script type="text/javascript">
var ua = window.navigator.userAgent.toLowerCase();
var cur_container_height = Number(document.getElementById("content").clientHeight);
var min_container_height = 647;
var header_height = 140;
var footer_height = 85;

window.onload = changeContentSize; // Window 창 로드시
window.onresize = changeContentSize; // Window 창 크기를 조정할때마다
$("#content").resize(changeContentSize);

function changeContentSize() {
	cur_container_height = Number(document.getElementById("content").clientHeight);

	var container_height = min_container_height;
	var window_height = Number(document.documentElement.clientHeight) - header_height - footer_height;
	if (window_height > cur_container_height) {
		if (window_height > min_container_height) {
			container_height = window_height;
		}
	} else {
		if (cur_container_height > min_container_height) {
			container_height = cur_container_height;
		}
	}
	
    if (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) { // ie11 추가
        document.getElementById("container").style.height = container_height + "px";
    }else if (window.navigator.userAgent.indexOf("MSIE") == -1 || (document.all && window.XMLHttpRequest)) { // ie6 제외
        document.getElementById("container").style.height = container_height + "px";
    } else {
        document.getElementById("container").style.height ="100%";
    }
}

function setContainerHeight(height) {
	if (height >= 0) {
		cur_container_height = height;
	} else {
		cur_container_height = Number(document.getElementById("container").clientHeight);
	}
	
	if(height == -9 || height == 0 || height == "undefined"){ //공지사항 예외처리 //ie7대응
		document.getElementById("container").style.height ="100%";
	}else{
		changeContentSize();
	}
}
</script>	</div>
 --></div>

<script type="text/javascript">
getGNB();

window.onresize = function() {
	setContainerHeight(document.getElementById('content').clientHeight);
}
</script>
</body>
</html>
