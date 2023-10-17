<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>회원탈퇴 사유 선택 : 잇다ID</title>

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
<script type="text/javascript">
//<![CDATA[
//nClicks 전역변수
var nsc = "my.info"+ "";
var ccsrv = "cc.naver.com";
//]]>

function checkRadioButton(leaveReason_id){
    var radioObj = document.getElementsByName(leaveReason_id);
    var isChecked = false;
    if(radioObj.length == null){
        isChecked = radioObj.checked;
    }else{
        for(i=0; i<radioObj.length; i++){
            if(radioObj[i].checked){
                isChecked = true;
                break;
            }
        }
    }
    return isChecked;
}

function getCheckedRadioValue(leaveReason_id){
    var radioObj = document.getElementsByName(leaveReason_id);
    var radioCheckedValue = '';
    if(radioObj.length == null){
        radioCheckedValue = radioObj.value;
    }else{
        for(i=0; i<radioObj.length; i++){
            if(radioObj[i].checked){
                radioCheckedValue = radioObj[i].value;
                break;
            }
        }
    }
    console.log(radioCheckedValue);
    return radioCheckedValue;
}

function setTextbox(state){
	proposal = document.getElementById('proposal');
	if(state == 'unset'){
		proposal.value = "";
		document.getElementById('div_proposal').style.display="none";
		document.getElementById('lmtbyte').innerHTML="";
	}
	else if(state == 'set'){
		document.getElementById('div_proposal').style.display="block";
		proposal.focus();
		proposal.value = "";
		document.getElementById('lmtbyte').innerHTML="<span>0</span>/200byte";
	}
}

function setTextArea(){
	if(document.fm.leaveReason_id[document.fm.leaveReason_id.length-1].checked == false){
		document.fm.leaveReason_id[document.fm.leaveReason_id.length-1].checked = true;
		document.fm.proposal.value="";
	}
}

function mainSubmit(){
	var radioCheckedValue = getCheckedRadioValue("leaveReason_id");
    var isChecked = checkRadioButton("leaveReason_id");

    if(!isChecked){
        alert('탈퇴사유를 선택해 주세요.');
        return;
    }else if(isChecked && radioCheckedValue == '9' && document.fm.proposal.value == ""){
        alert('잇다에 바라는 점을 입력해 주세요.');
        document.fm.proposal.focus();
        return;
    } else if(isChecked && radioCheckedValue == '9' && document.fm.proposal.value.length > 100 ){
        alert('잇다에 바라는 점을 100자 이내로 입력해 주세요.');
        document.fm.proposal.value="";
        document.fm.proposal.focus();
        return;
    }
    
    //clickcr(this,'otn.quitappconfirm','','',window.event);
     
    document.fm.submit();
    return;
}
function Len_Check(str,max){
	var m_cnt=0;
	var len=0;
	m_str=str.value;

	for(var i=0; i<m_str.length; i++){
		m_cnt+=1;

		if(m_cnt <= max){
			len = len + 1;
		}
	}

	if(m_cnt>max){
		alert("최대 100자까지 입력하실 수 있습니다.");
		max_str=m_str.substr(0,len);
		str.value=max_str;
	}
	str.focus();
}


<!-- JAVASCRIPT KeyUp Event for FF/Opera -->   
	var Observe = function(oEl) {
		  
		  this._o = oEl;
		  this._value = oEl.value;
		  
		  this._bindEvents();
		  
		};
		 
		Observe.prototype._bindEvents = function() {
		  
		  var self = this;
		  var bind = function(oEl, sEvent, pHandler) {
		    if (oEl.attachEvent) oEl.attachEvent('on' + sEvent, pHandler);
		    else oEl.addEventListener(sEvent, pHandler, false);
		  };
		  
		  bind(this._o, 'focus', function() {
		    
		    if (self._timer) clearInterval(self._timer);
		    self._timer = setInterval(function() {
		      
		      // window.console.debug('compare : ' + self._value + ' == ' + self._o.value);
		      if (self._value != self._o.value) {
		        self._value = self._o.value;
		        self._fireEvent();
		      }
		      
		    }, 50);
		    
		  });
		  
		  bind(this._o, 'blur', function() {
		    
		    if (self._timer) clearInterval(self._timer);
		    self._timer = null;
		    
		  });
		            
		};
		 
		Observe.prototype._fireEvent = function() {
		          
		  if (document.createEvent) {
		    
		    var e;
		    
		    if (window.KeyEvent) {
		      
		      e = document.createEvent('KeyEvents');
		      e.initKeyEvent('keyup', true, true, window, false, false, false, false, 65, 0);
		      
		    } else {
		      
		      e = document.createEvent('UIEvents');
		      e.initUIEvent('keyup', true, true, window, 1);
		      e.keyCode = 65;
		      
		    }
		    
		    this._o.dispatchEvent(e);
		    
		  } else {
		    
		    var e = document.createEventObject();
		    e.keyCode = 65;
		    
		    this._o.fireEvent('onkeyup', e);
		    
		  }
	};

   window.onload = function() {
     new Observe(document.getElementById('proposal'));
   };
   
   function chr_type(sValue, Ev) {
    	document.fm.leaveReason_id[document.fm.leaveReason_id.length-1].checked = true;

		var evCode = (window.netscape) ? Ev.which : event.keyCode ;

		if(evCode < 37 || evCode > 40){
		
		var strCount = 0;
		var strCount2 = 0;
		var tempStr, tempStr2="";

		for(i=0; i< sValue.length;i++){
			tempStr=sValue.charAt(i);
			if(escape(tempStr).length > 4){
			    strCount += 2;
			}else{
				strCount += 1;
			}

			if(strCount <= 200){
		        tempStr2 += tempStr;
		        strCount2 = strCount;
		    }
		}
		document.getElementById('lmtbyte').innerHTML = "<span>"+strCount+"/200byte</span>";
		
		if(strCount > 200){
			alert("최대 100자까지 입력하실 수 있습니다.");
			document.fm.proposal.value=tempStr2;
			document.getElementById('lmtbyte').innerHTML = "<span>"+strCount2+"/200byte</span>";
				document.fm.proposal.focus();
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
	</div>
	<!-- //스킵네비게이션 -->
	<div id="header">
	<div id="lnb_area">
		<div class="lnb">
			<ul role="menu">
				<li id="nid" role="presentation"><a href="${pageContext.request.contextPath}/user/myInfo" role="menuitem" onclick="clickcr(this,'lnb.info','','',event);">내프로필<em></em></a></li>
			</ul>
		</div>
	</div>
<script type="text/javascript">
document.getElementById("nid").className = "selected";

var tagList = "nid security ";

	tagList += "manageHistory ";

var menu = "";
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
	<div class="c_header">
		<h2>회원탈퇴 신청</h2>
		<p class="contxt">그동안 잇다를 이용해 주셔서 감사합니다.</p>
	</div>
	<div class="section_delete2">
		<div class="sd2_header">
			<h3>탈퇴아이디 확인</h3>
		</div>
		<sec:authentication property="principal" var="pinfo" />

		<table class="table2">
			<col style="width:125px"><col>
			<tr class="first">
				<th scope="row">아이디</th>
				<td>${pinfo.username}</td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td>${userName.userName}</td>
			</tr>
		</table>
		
		<div class="sd2_header">
			<h3>잇다를 탈퇴하시는 이유는 무엇인가요?</h3>
			<p class="contxt">회원님께서 잇다를 탈퇴하는 이유를 알려주시면 보다 좋은 서비스 제공을 위해 노력하겠습니다.</p>
		</div>

		<form action="${pageContext.request.contextPath}/user/leaveAction"  name="fm" id="fm" method="post">
			<!-- <input hidden="userId" id="userId" name="userId"> -->
			<div class="box3">
				<ul>
				<c:forEach var="reason" items="${reason}" begin="0" end="7">
				    <li>
				        <input name="leaveReason_id" type="radio" value="${reason.leaveReason_id}" class="input_radio" id="rs_${reason.leaveReason_id}" onclick="javascript:void(setTextbox('unset'));" />
				        <label for="rs_${reason.leaveReason_id}">${reason.leaveReason_name}</label>
				    </li>
				</c:forEach>
					<li class="last">
						<c:forEach var="reason" items="${reason}" varStatus="status">
						    <c:if test="${status.index eq 8}">
						        <input name="leaveReason_id" type="radio" value="9" class="input_radio" id="rs9" onclick="javascript:void(setTextbox('set'));" />${reason.leaveReason_name}<label for="rs9"></label>
						    </c:if>
						</c:forEach>
						<!-- [D] 감추기 보이기 display:block/none -->
						<div class="txtbox_w" id="div_proposal" style="display:block">
							<textarea type="text" name="userLeaveReason" id="proposal" title="탈퇴 사유 입력" 
						          cols="40" rows="2"  
						          onkeyup="chr_type(this.value, event);" 
						          onclick="javascript:void(setTextArea());" 
						          onfocus="this.className='txtbox txtbox_v1 on'" 
						          onblur="this.className='txtbox txtbox_v1'" 
						          class="txtbox txtbox_v1">사유를 입력해주세요
						    </textarea>
							<div id="lmtbyte" class="limit"><span>0</span>/200byte</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="btn_area_w">
				<p class="btn_area">
					<a href="#" onclick="mainSubmit();return false;" class="btn_model"><b class="btn3">탈퇴확인</b></a>
					<a href="${pageContext.request.contextPath}" onclick="clickcr(this,'otn.quitappcancel','','',event);" class="btn_model"><b class="btn2">탈퇴취소</b></a>
				</p>
			</div>
			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>

</div>
	</div>
	</div>
 	<div id="footer">

</div>
</div>
</div>
 	<jsp:include page="../../include/footer.jsp"></jsp:include>



<script type="text/javascript">
getGNB();

window.onresize = function() {
	setContainerHeight(document.getElementById('content').clientHeight);
}
</script>
</body>
</html>
