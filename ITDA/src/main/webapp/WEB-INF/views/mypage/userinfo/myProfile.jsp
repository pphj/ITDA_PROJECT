<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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

	<title>프로필 수정</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage/help_member.css">	<link href="https://nid.naver.com/favicon_1024.png" rel="apple-touch-icon-precomposed" sizes="1024x1024" />
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
	<meta name="decorator" content="USER_PROFILE">
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
			var otherMenu = tagList.replace(subMenu + "", "").split("");
			for (var i = 0; i < otherMenu.length - 1; i++) {
				document.getElementById(otherMenu[i]).className = "";
			}
		}
		
		function cancle(){
			window.history.back();
		}
	</script>
	</div>

	<div id="container">
		<!-- CONTENTS -->
		<div id="content" style="background-color: #fff;">
    <div class="c_header">
        <h2>프로필 수정</h2>
        <p class="contxt">대표 프로필 사진을 수정 하실 수 있습니다.</p>
    </div>
    <form id="profileForm" method="post" enctype="multipart/form-data">
        <input type="hidden" id="helpToken" name="token_help" value="" />
        <input type="hidden" id="deleteYn" name="deleteYn" value="N" />
        <input type="hidden" id="ieLessThan9Yn" name="ieLessThan9Yn" value="N" />
        <fieldset>
            <legend>프로필 수정</legend>
            <table border="0" class="tbl_model">
                <caption><span class="blind">프로필 수정</span></caption>
                <colgroup>
                    <col style="width:22%"><col>
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">
                        <div class="thcell">프로필 사진</div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <div class="profile_photo">
                                <img id="imgThumb" src="https://static.nid.naver.com/images/web/user/default.png" width="100" height="100">
                                <span class="mask"></span>
                            </div>
                            <div class="btn_area_btm">
                                <span class="btn_file">
                                    <label for="inputImage" class="btn_model"><b id="btnChangeProfile" class="btn2" onclick="clickcr(this,'prf.upimg','','',event);">사진변경</b></label>
                                    <input type="file" id="inputImage" name="profileImage"  accept="image/*" />
                                </span>
                                <a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2" onclick="clickcr(this,'prf.delimg','','',event);">삭제</b></a>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
<!--                 <tr>
                    <th scope="row">
                        <div class="thcell"><label for="inpNickname">별명</label></div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <p class="contxt_webctrl nickname">
                                <input type="text" name="nickname" id="inpNickname" value="" style="width:254px" onclick="clickcr(this,'prf.nick','','',event);">
                                Enter 입력으로 submit이 되는걸 방지하기 위한 Input
                                <input type="text" style="display: none;" >
                            </p>
                        </div>
                    </td>
                </tr>
 -->                </tbody>
            </table>
            <div class="btn_wrap">
                <a href="javascript:;" class="btn_model"><b id="btnConfirm" class="btn8" onclick="clickcr(this,'prf.apply','','',event);">적용</b></a>
                <a href="javascript:;" class="btn_model"><b id="btnCancel" class="btn2" onclick="cancle();">취소</b></a>
            </div>
        </fieldset>
    </form>
</div>

<!--[D] 캐릭터만들기 딤드처리 -->
<div class="dim_layer"></div>

<script type="text/javascript">
    //nClicks 전역변수
/*     var nsc = "my.profile"+ "";
    var ccsrv = "cc.naver.com";

    $(document).ready(function() {
        var profileInfo = {
            isNicknameChanged: false,
            nickname: "",
            defaultImageUrl: "https://static.nid.naver.com/images/web/user/default.png",
            imageUrl: "",
            token: "",
            id: "",
            deleteYn: "N",
            originImageUrl: "",
            originNickname: ""
        };

        var message = {
            maxUploadSizeErrMessage: "최대 파일 업로드 사이즈는 10MB입니다.",
            overTimeReturnErrMessage: "유효 시간이 초과 되었습니다. 다시 시도해 주세요.",
            temporaryAccessErrMessage: "일시적인 오류입니다. 잠시 후 다시 시도해 주세요.",
            confirm: "프로필 변경 사항을 적용하시겠습니까?"
        };

        var url = {
            removeTempImageUrl: "/user2/api/naverProfile?m=removeTempImageUrl",
            checkImageAndSaveTmep: "/user2/api/naverProfile?m=checkImageAndSaveTempForUser",
            changeProfile: "/user2/api/naverProfile?m=changeProfileForUser",
            returnUrl: ""
        };

        profile.init(profileInfo, message, url);
        profile.run();
        
        if (!isSupportedBrowser()) {
            $("#coach_tooltip").hide();
            $("#btnAvatar").hide();
        }
        
        if (isOverDueDate()) {
            $("#coach_tooltip").hide();
            $("#btnAvatar").removeClass("coach_mark");
        }

        $(".txt_tooltip").on("click", function() {
            $("#coach_tooltip").hide();
        });

        if (getCookie("coach_tooltip") === "ok") {
            $("#coach_tooltip").hide();
            $("#btnAvatar").removeClass("coach_mark");
        } else {
            setCookie("coach_tooltip", "ok", 30, "");
        }
        
        // IE 호환성 지원 관련
        $("a").click(function(event) {
            // 상단 버튼과 구별
            var isProfileBtnClicked = $(event.currentTarget).hasClass("btn_model") ||
                                      $(event.currentTarget).hasClass("txt_tooltip");
            if (isProfileBtnClicked) {
                event.preventDefault();
            }
        }); */

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
