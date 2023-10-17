<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<title>비밀번호 재확인 : 잇다ID</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage/help_member.css">
<link href="https://nid.naver.com/favicon_1024.png" rel="apple-touch-icon-precomposed" sizes="1024x1024" />
<script type="text/javascript" src="https://nid.naver.com/js/clickcr.js"></script>
<script type="text/javascript" src="https://nid.naver.com/inc/common/js/ko/commonUtil.js?20170214"></script>
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
<script type="text/javascript" src="https://nid.naver.com/inc/common/js/passwdAjax.js?20180530"></script>
<script type="text/JavaScript">

var nsc =  "my.info" + "";
var ccsrv = "cc.naver.com";

function confirm() {
	if (mainSubmit()) {
		document.getElementById("fm").submit();
		
	}
}
function mainSubmit() {
    clickcr(this, 'pwc.ok', '', '', window.event);

    if (document.fm.upw.value == '') {
        alert('비밀번호를 입력하세요.');
        document.fm.upw.focus();
        return false;
    }

    let contextpath = "${pageContext.request.contextPath}";
    let checkPw = false;
    var header = '${_csrf.headerName}';
    var token = '${_csrf.token}';
    let userPw = document.fm.upw.value; // 현재 비밀번호 가져옴

    $.ajax({
        type: "POST",
        url: contextpath + "/user/passwdCheck",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        data: { "userPw": userPw },
        dataType: "json",
        success: function (result) {
            console.log(result);

            if (result == 1) {
                $('#upw').html("비밀번호 일치");
                // 원하는 작업 수행
                document.fm.action = contextpath + "/user/leave/leaveReason"; // 폼의 action 설정
                document.fm.submit();
            } else {
                $("#upw").html("비밀번호 불일치");
                alert("비밀번호가 일치하지 않습니다.");
                document.fm.upw.value = "";
                document.fm.upw.focus();
                checkPw = false;
            }
        },
        error: function (error) {
            console.log("error: " + error);
        }
    });
	    return checkPw; 

}

/* function createRsaKey() {
	var rsa = new RSAKey();
	var sessionKey = "";
	var keyName = "";
	var eValue = "";
	var nValue = "";
	var id = "";
	rsa.setPublic(eValue, nValue);
    
	if (sessionKey == "" || eValue == "" || nValue == "" || keyName == "") {
		alert("일시적인 오류입니다. 처음부터 다시 진행해 주세요.");
		reset();
	} else {
		var form = document.getElementById("fm");
		var comVal = getLenChar(sessionKey) + sessionKey + getLenChar(id) + id;
		form.encPasswd.value = rsa.encrypt(comVal + getLenChar(form.upw.value) + form.upw.value);
		form.encNm.value = keyName;
		document.fm.upw.value = "";
	}
} */
function getLenChar(texts) {
	texts = texts + "";
	return String.fromCharCode(texts.length);
}

function reset(){
	document.fm.upw.value = "";
}

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

function hideCapsLock(target) {
        var target= document.getElementById(target);
        target.style.display ='none';
        return;
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
	</div>
	<!-- //스킵네비게이션 -->
	<div id="header">
	<div id="lnb_area">
		<div class="lnb">
			<ul role="menu">
				<li id="nid" role="presentation"><a href="${pageContext.request.contextPath}/user/leave/" role="menuitem" onclick="clickcr(this,'lnb.info','','',event);">내프로필<em></em></a></li>
			</ul>
		</div>
	</div>
<script type="text/javascript">
document.getElementById("nid").className = "selected";

var tagList = "nid security ";

	tagList += "manageHistory ";

var menu = "nid";
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
		<!-- CONTENTS -->
	<div id="content">
		<div class="section_pwconfirm">
			<div class="spc_header">
				<h2>비밀번호 재확인</h2>
				<p class="contxt">안전한 잇다 사용을 위해 비밀번호를 다시 한 번 입력해주세요.</p>
			</div>
			<form id="fm" name="fm"  method="post" onSubmit="return mainSubmit();">
			<div class="spc_content">
				<fieldset>
					<legend>비밀번호 재확인 입력</legend>
					<sec:authentication property="principal" var="pinfo" />
				    <p class="spc_row"><span class="txt_userid">${pinfo.username}</span></p>
					<p class="spc_row2">
						<label id="lb_upw" for="upw">비밀번호</label>
						<input type="password" id="upw" name="userPw" maxlength="20"
						       onkeyup="checkShiftUp(event);" 
						       onFocus="convertDiv('upw', 'none')"
						       onBlur="convertDiv('upw', 'block');hideCapsLock('help2_1');"					 
						       onkeypress="capslock(event);showCapslock();" 
						       onkeydown="checkShiftDown(event);" style="width:336px">

						<!-- [D] 감추기 보이기 display:none/block -->
						<span id="help2_1" class="ly_msg_arrow" style="display:none">
							<span class="txt">
						     	  키보드에 <strong>Caps Lock</strong>이 켜져 있습니다.
						     </span>
							<span class="arrow"></span>
						</span>
					</p>
					<p class="btn_area_btm">
						<button type="submit">확인</button>
					</p>
				</fieldset>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
			</form>
		</div>
	</div>
<script type="text/javascript"> 
document.fm.upw.focus();
</script>
	</div>
</div>
		</div>
	<div id="footer">
		<jsp:include page="../../include/footer.jsp"></jsp:include>
<!-- <ul class="policy_lst">
<li><a href="http://policy.naver.com/policy/privacy.html" onclick="clickcr(this,'fot.privacy','','',event);"><strong>개인정보처리방침</strong></a><span class="bar"></span></li>
<li><a href="http://policy.naver.com/rules/disclaimer.html" onclick="clickcr(this,'fot.disclaimer','','',event);">책임의 한계와 법적 고지</a><span class="bar"></span></li>
<li><a href="https://help.naver.com/support/alias/membership/p.membership/p.membership_26.naver" onclick="clickcr(this,'fot.memberhelp','','',event);">회원정보 고객센터</a></li>

</ul>
<address>
	<a href="http://www.navercorp.com/" target="_blank"  onclick="clickcr(this,'fot.nhncorp','','',event);" class="logo">NAVER</a>
	<span class="copyright">Copyright &copy; <a href="http://www.navercorp.com/ko/index.nhn " onclick="clickcr(this,'fot.navercorp','','',event);" target="_blank">NAVER Corp.</a> All Rights Reserved.</span>
</address> -->

<!-- <script type="text/javascript" src="/inc/common/js/jquery.resize.js"></script>
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
</script>	 -->
</div>


<!-- <script type="text/javascript">
getGNB();

window.onresize = function() {
	setContainerHeight(document.getElementById('content').clientHeight);
}
</script> -->
</body>
</html>