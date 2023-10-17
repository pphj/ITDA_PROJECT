<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<title>회원탈퇴 안내 : 잇다ID</title>

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
var nsc = "my.info"+ "";
var ccsrv = "cc.naver.com";

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

//비밀번호 확인 ajax
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

</script>	</div>

	<div id="container">
		<!-- CONTENTS -->
		<!-- CONTENTS -->
	<div id="content">
		<div class="c_header">
			<h2>탈퇴 안내</h2>
			<p class="contxt">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
		</div>
		<sec:authentication property="principal" var="pinfo" />
		<!-- [D] input type="text"에 focus 되었을때 class에 on 추가 (ie6,ie7 대응) -->
		<div class="section_delete">
			<h3 class="h_dropout">
						     	  사용하고 계신 아이디(<em> ${pinfo.username} </em>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
						     </h3>
			<p class="dropout_dsc">
						     	  <em>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</em>하오니 신중하게 선택하시기 바랍니다.
						     </p>
			<h3 class="h_dropout">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h3>
			<p class="dropout_dsc">
						     	  회원정보 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.
						     </p>
			<table cellspacing="0" border="1" summary="탈퇴 후 회원정보 및 개인형 서비스 이용기록 삭제 안내" class="tbl_type">
			<caption>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</caption>
			<colgroup>
			<col width="145"><col width="*">
			</colgroup>
			<tbody id="tblBullet1"> 
			
			<tr>
			<th scope="row">잇다 콘텐츠</th>
			<td>구독, 구매 내역 및 이용 이력 전체 삭제</td>
			</tr>
			<tr>
			<th scope="row">잇다 콘텐츠 스튜디오</th>
			<td>(관리자) 운영 중인 프리미엄 채널, 채널 내 게시물 및 판매 이력 등을 포함한 모든 정보 삭제</td>
			</tr>
			<tr>
			<th scope="row">기타</th>
			<td>아이디에 연계된 개인적 영역의 정보 및 게시물 삭제</td>
			</tr>
			
			</tbody>
			</table>
			<div class="more_wrap"> 
               <!-- <a id="more_list1" class="btn_more">더보기</a>  -->
           </div> 
			<h3 class="h_dropout">탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</h3>
			<p class="dropout_dsc">뉴스, 카페, 지식iN 등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.
			<br>
						     	  삭제를 원하는 게시글이 있다면 <em>반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</em>
						     
			<br>
								탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다. 
							 
			</p>
			<table cellspacing="0" border="1" summary="탈퇴 후 게시판형 서비스에 등록한 게시물 유지 안내" class="tbl_type">
			<caption>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</caption>
			<colgroup>
			<col width="145"><col width="*">
			</colgroup>
			<tbody id="tblBullet2"> 

			<tr>
			<th scope="row">잇다 콘탠츠</th>
			<td>게시물 및 댓글 및 좋아요</td>
			</tr>
			<tr> 
			<th scope="row">기타</th>
			<td>공적인 영역의 게시물, 댓글 및 의견</td>
			</tr>


			</tbody>
			</table>
           <div class="more_wrap"> 
               <!-- <a id="more_list2" class="btn_more">더보기</a>  -->
           </div> 
           
			<form name="fm" id ="fm" method="post" action="${pageContext.request.contextPath}/user/leave/passwdInput">
				<div class="dropout_agree_area">
					<p class="contxt">
						<strong>
						     	  탈퇴 후에는 아이디 <em> ${pinfo.username} </em> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.
						     <br>
								 게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.<br>
							</strong>
					</p>
					<input type="checkbox" id="dropoutAgree" name="dropoutAgree" onclick="clickcr(this,'otn.guideagree','','',event);" >
					<label for="dropoutAgree"><strong>안내 사항을 모두 확인하였으며, 이에 동의합니다.</strong></label>
				</div>
				<div class="btn_area_w">
					<p class="btn_area">
						<a href="#99" id="btnNext" class="btn_model"><b class="btn3">확인</b></a>
					</p>
				</div>	
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
							
			</form>
		</div>
	</div>
	<hr />
<script type="text/javascript">
$(document).ready(function() {

    var rowCount1 = $('#tblBullet1').children('tr').length;
    var rowCount2 = $('#tblBullet2').children('tr').length;
    
//	$("#tblBullet1 tr").hide();
//	$("#tblBullet2 tr").hide();
	    
	if(rowCount1 > 5){
		$('#more_list1').show();
		$("#more_list1").parent().show();
	    $("#tblBullet1 tr:hidden").slice(0, 5).show();          
	}
	
	if(rowCount2 > 5){
		$('#more_list2').show();
		$("#more_list2").parent().show();
	    $("#tblBullet2 tr:hidden").slice(0, 5).show();
	}
	
	setContainerHeight(document.getElementById('content').clientHeight);
	
	$('#more_list1').css('cursor','pointer');
	$(document).on("click", "#more_list1", function(event){
		var currentLength = $("#tblBullet1 tr:visible").length;
		var rowCount1 = $('#tblBullet1').children('tr').length;
		if(rowCount1 > (currentLength + 5)){
			$("#tblBullet1 tr").slice(0, currentLength + 5).show();
		}else{
			$("#tblBullet1 tr").slice(0, rowCount1).show();
			$('#more_list1').hide();
			$("#more_list1").parent().hide();
		}
		
		setContainerHeight(document.getElementById('content').clientHeight);
	});	
	
 	$('#more_list2').css('cursor','pointer');
	$(document).on("click", "#more_list2", function(event){
		var currentLength = $("#tblBullet2 tr:visible").length;
		var rowCount2 = $('#tblBullet2').children('tr').length;
		if(rowCount2 > (currentLength + 5)){
			$("#tblBullet2 tr").slice(0, currentLength + 5).show();
		}else{
			$("#tblBullet2 tr").slice(0, rowCount2).show();
			$('#more_list2').hide();
			$("#more_list2").parent().hide();
		}
		
		setContainerHeight(document.getElementById('content').clientHeight);
	});		
	 
	$('#btnNext').css('cursor','pointer');
	$(document).on("click", "#btnNext", function(event){
		clickcr(this,'otn.guideconfirm','','',window.event);
		if( $("#dropoutAgree").is(":checked")){
			$("#fm").submit();
		}else{
			alert("탈퇴 안내를 확인하고 동의해 주세요.");
			$("#dropoutAgree").focus();
		}
	});	
	
	$('#lnk_external').css('cursor','pointer');
	$(document).on("click", "#lnk_external", function(event){
		rurl ="/internalToken/view/tokenList/pc?lang=ko_KR";
		$("#lnk_external").attr("target","_blank");
		window.open(rurl);
	});	
	
});		
</script>
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
