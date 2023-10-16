<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
<meta http-equiv="Cache-Control" content="post-check=0, pre-check=0">
<meta http-equiv="Pragma" content="No-Cache">


<title>잇다ID</title>

<link href='https://fonts.googleapis.com/css?family=Gloria+Hallelujah' rel='stylesheet' type='text/css'>
<link href="https://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage/account.min.css">
<link href="https://nid.naver.com/favicon_1024.png" rel="apple-touch-icon-precomposed" sizes="1024x1024" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage/common/lcslog.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage/common/nclk_v0.8.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage/common/ko/commonUtil.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage/common/lua.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage/esign/agent_check.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/mypage/userinfo/popup1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/mypage/userinfo/popup2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/mypage/userinfo/post.js"></script>
    
<script type="text/javascript">
    var gnbBrightness = 1;


	var gnb_option = {
		gnb_service : "nid",
		gnb_template : "gnb_utf8",
		gnb_logout : encodeURIComponent("https://nid.naver.com/user2/help/myInfoV2?lang=ko_KR"),
		gnb_brightness : gnbBrightness,
		gnb_one_naver : 0,
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
<meta name="decorator" content="NEW_USER_MYINFO_V2">
    <script type="text/javascript">
        var g_ssc = "my.home" + "";
        var ccsrv = "cc.naver.com";
    </script>
</head>


<body onclick="clearDocs();gnbClose();" id="mainBody" class="bgother">
<div id="wrap" class="wrap naverid">
    <!-- skip navigation -->
    <div class="u_skip"><a href="#container">본문 바로가기</a></div>
    <!-- //skip navigation -->

<header class="header" role="banner">
    <div class="header_home">

    <!--N로고/잇다ID-->
    <div class="gnb_area">
        <a href="${pageContext.request.contextPath}/" onclick="nclk(this,'gnb.naver','','',event)">
        <img class="header_logo_img" alt=""
							src="${pageContext.request.contextPath}/resources/image/common/itda_logo4.png">
            <span class="blind">잇다</span>
        </a>
        <a href="${pageContext.request.contextPath}/user/myInfo" class="gnb_title" onclick="nclk(this,'gnb.naverID','','',event)">
            <h1><span class="blind">잇다ID</span></h1>
        </a>
    </div>


    <!--프로필-사진,아이디,메일주소,2단계인증알림-->
    <div class="profile_area">
        <div class="profile_inner">
            <a href="#" onclick="changeImage()" class="photo">
                <img src="https://static.nid.naver.com/images/web/user/default.png" width="84"
                     height="84" alt="프로필 이미지">
                <span class="photo_edit"></span>
            </a>
            <div class="profile">
                <p class="useid">${user.userName }</p>
                <p class="usemail">${user.userId }</p>
            </div>
        </div>
    </div>

    <div id="headerLeft" class="header_left">

        <ul class="left_menu" role="menu">
            <li>
                <div class="left_item" role="menuitem" aria-current=>
                    <div class="menu_text ">내프로필</div>
                </div>
            </li>

        </ul>

        <!-- footerLeft -->
        <footer class="left_footer" role="contentinfo">
            <ul class="left_guide">
                <li>
                        <div>
                <a href="javascript:;" onclick="logout()" class="left_item">
                <form action="${pageContext.request.contextPath}/member/logout"
							            method="post" name="logout">
                        <button class="footer_text" type="submit">로그아웃</button>
                    <input type="hidden" name="${_csrf.parameterName}"
							                value="${_csrf.token}">
                </form>
                    </a>
                        </div>
                    </li>
                <li><a href="javascript:;" onclick="goHelpPage()" class="left_item">
                        <div class="footer_text">고객센터</div>
                    </a></li>

            </ul>
            <div class="footer_logo"><img class="bottom_logo_img" alt=""
							src="${pageContext.request.contextPath}/resources/image/common/itda_logo5.png"><span><span class="blind">잇다</span></span></div>
        </footer>
        <!-- //footerLeft -->

    </div>
    <!--//-->

    </div>
</header>
<script>
    var rurl = encodeURIComponent(document.location.href);
    var rawRurl = document.location.href;
    var myInfoV2HomeUrl = encodeURIComponent("https://nid.naver.com/user2/help/myInfoV2?lang=" + "ko_KR");

    // 작은 화면 - 영문일 때 메뉴 텍스트 길이 짤리지 않도록
    if (window.innerWidth <= 385) {
        var lnbAreaScrollLeft = $('#lnbArea').scrollLeft();
    }

    function changeImage() {
        nclk(this,'nid.prfedit','','',event);
        document.location.href = "${pageContext.request.contextPath}/user/myProfile";
    }

    function landscapeHandler() {
        if (window.innerWidth <= window.innerHeight) {
            $('body').removeClass('landscape');
            $('div .container').addClass('floating');
        } else {
            $('body').addClass('landscape');
            $('div .container').removeClass('floating');
        }
    }

     function logout() {
        nclk(this,'fot.logout','','',event);
        if (confirm("로그아웃 하시겠습니까?") == true) {
			event.preventDefault();
            var returnUrl = "${pageContext.request.contextPath}/member/logout";
			$("form[name=logout]").submit();
            $(location).attr('href', returnUrl);
        }
    } 


    function logout() {
        nclk(this, 'fot.logout', '', '', event);
        event.preventDefault();
        if (confirm("로그아웃 하시겠습니까?")) {
			alert("로그아웃 되었습니다.")
            $("form[name=logout]").submit();
        }
    }


    
    function goHelpPage() {
        nclk(this,'fot.help','','',event);
        document.location.href = "${pageContext.request.contextPath}/info/faq";
    }



    function toggleLeftLangSelectList() {
        nclk(this, 'fot.lang', '', '', event);

        var leftLangSelectListBtn = $("#leftLangSelectListBtn");
        if (leftLangSelectListBtn.attr("aria-expanded") === "true") {
            leftLangSelectListBtn.attr("aria-expanded", "false");
            leftLangSelectListBtn.removeClass("fold");
        } else {
            leftLangSelectListBtn.attr("aria-expanded", "true");
            leftLangSelectListBtn.addClass("fold");
        }

        $("#leftLangSelectList").toggle();
    }

    function goSimpleSignIn() {
        nclk(this,'fot.simplesignin','','',event);
        document.location.href = "https://nid.naver.com/nidlogin.login?svctype=262144&url=" + myInfoV2HomeUrl;
    }
</script>
    <div id="container" class="container">
        <!-- container -->
        <div id="content" class="content">
            <div class="naverid_wrap" role="main">

                <div id="headerTop" class="path_area">
                    <div id="gnb" class="" style="float:right;">
                        <script type='text/javascript' charset='utf-8'
                                src='https://static.nid.naver.com/template/gnb_utf8.nhn?2023. 10. 4'>
                        </script>
                    </div>
                </div>
<!--                <div class="banner_area top">
    <a href="javascript:;" class="banner" style="background-color: #22afff;" onclick="nclk(this,'nid.banner2Step','','',event);go2StepVerification();">
        <img src="https://ssl.pstatic.net/static/nid/account/banner/naverid_banner_01.png" width="100%" height="100%" alt="새벽 4시에 로그인? 2단계 인증, 늦기 전에 미리 설정!" class="img_banner">
    </a>
</div>-->

<!--내프로필-->
<%-- <div class="account_box">
    <div class="title">
        <h2 class="title_text">내프로필</h2>
    </div>

    <ul class="account_row">
        <li>
            <div class="row_item name ">
                <span class="item_text">${user.userName }</span>
                <button type="button" class="btn_edit"
                        onclick="changeName()">
                    <span class="text">실명수정</span>
                </button>
            </div>
        </li>

        <li>
            <div id="phoneNoRegDiv" class="row_item phone ">
                <span id="phoneNoRegSpan"
                      class="item_text">${user.userPhone}</span>
                <button type="button" id="phoneNoRegBtn"
                        class="btn_edit"
                        onclick="showPhoneNumberChangePopUp()">
                    <span id="phoneNoRegBtnTxt"
                          class="text">수정</span>
                </button>
            </div>
        </li>

        <li>
            <div class="row_item mail ">
                <span id="myLetterEmailRegSpan"
                      class="item_text">${user.userEmail }</span>
                <button type="button" class="btn_edit"
                        onclick="showMyLetterEmailChangePopUp()">
                    <span class="text">수정</span>
                </button>
            </div>
            <div id="pswdEmailRegDiv" class="row_item mail not">
                <span id="pswdEmailRegSpan"
                      class="item_text">본인확인 이메일 없음</span>
                <button type="button" id="pswdEmailRegBtn"
                        class="btn_accent"
                        onclick="showPswdEmailChangePopUp()">
                    <span id="pswdEmailRegBtnTxt"
                          class="text">등록</span>
                </button>
            </div>
        </li>
        <li>
            <div id="phoneNoRegDiv" class="row_item post ">
                <span id="phoneNoRegSpan"
                      class="item_text">${user.userPost}&nbsp;&nbsp;
                     ${user.userAddress1}&nbsp;${user.userAddress2}</span>
   	 <button type="button" id="addressRegBtn"
            class="btn_edit"
            onclick="showAddressChangePopUp()"><span class="text">주소변경</span></button>
            </div>
        </li>
                <li>
            <div id="phoneNoRegDiv" class="row_item post ">
                <span id="phoneNoRegSpan"
                      class="item_text">${user.cate_Name}</span>
    			<button type="button" id="addressRegBtn"
            class="btn_edit"
            onclick="showAddressChangePopUp()"><span class="text">관심키워드 변경</span></button>
            </div>
        </li>
    </ul>
</div> --%>
<div class="account_box">
    <div class="title">
        <h2 class="title_text">내프로필</h2>
    </div>

    <ul class="account_row">
        <li>
            <div class="row_item name">
                <span class="item_text">${user.userName}</span>
                <button type="button" class="btn_edit" onclick="changeName()">
                    <span class="text">실명수정</span>
                </button>
            </div>
        </li>

        <li>
            <div id="phoneNoRegDiv" class="row_item phone">
                <span id="phoneNoRegSpan" class="item_text">${user.userPhone}</span>
                <button type="button" id="phoneNoRegBtn" class="btn_edit" onclick="showPhoneNumberChangePopUp()">
                    <span id="phoneNoRegBtnTxt" class="text">수정</span>
                </button>
            </div>
        </li>

        <li>
            <div class="row_item mail">
                <span id="myLetterEmailRegSpan" class="item_text">${user.userEmail}</span>
                <button type="button" class="btn_edit" onclick="showMyLetterEmailChangePopUp()">
                    <span class="text">수정</span>
                </button>
            </div>
            <div id="pswdEmailRegDiv" class="row_item mail not">
                <span id="pswdEmailRegSpan" class="item_text">본인확인 이메일 없음</span>
                <button type="button" id="pswdEmailRegBtn" class="btn_accent" onclick="showPswdEmailChangePopUp()">
                    <span id="pswdEmailRegBtnTxt" class="text">등록</span>
                </button>
            </div>
        </li>
        <li>
            <div id="phoneNoRegDiv" class="row_item post">
                <span id="phoneNoRegSpan" class="item_text">${user.userPost}&nbsp;&nbsp;${user.userAddress1}&nbsp;${user.userAddress2}</span>
                <button type="button" id="addressRegBtn" class="btn_edit" onclick="showAddressChangePopUp()">
                    <span class="text">주소변경</span>
                </button>
            </div>
        </li>
        <li>
            <div id="phoneNoRegDiv" class="row_item heart">
                <span id="phoneNoRegSpan" class="item_text">${user.cate_Name}</span>
                <button type="button" id="addressRegBtn" class="btn_edit" onclick="showKeyWordChangePopUp()">
                    <span class="text">관심키워드 변경</span>
                </button>
            </div>
        </li>
    </ul>
</div>

<!-- seller 프로필 시작  -->
<div class="account_box">
    <div class="title">
        <h2 class="title_text">SELLER 프로필</h2>
    </div>

    <ul class="account_row">
        <li>
            <div id="phoneNoRegDiv" class="row_item phone ">
                <span id="phoneNoRegSpan"
                      class="item_text">${user.sellerPhone}</span>
                <button type="button" id="phoneNoRegBtn"
                        class="btn_edit"
                        onclick="showPhoneNumberChangePopUp()">
                    <span id="phoneNoRegBtnTxt"
                          class="text">수정</span>
                </button>
            </div>
        </li>
        <li>
            <div class="row_item mail ">
                <span id="myLetterEmailRegSpan"
                      class="item_text">${user.sellerEmail }</span>
                <button type="button" class="btn_edit"
                        onclick="showMyLetterEmailChangePopUp()">
                    <span class="text">수정</span>
                </button>
            </div>
            <div id="pswdEmailRegDiv" class="row_item mail not">
                <span id="pswdEmailRegSpan"
                      class="item_text">본인확인 이메일 없음</span>
                <button type="button" id="pswdEmailRegBtn"
                        class="btn_accent"
                        onclick="showPswdEmailChangePopUp()">
                    <span id="pswdEmailRegBtnTxt"
                          class="text">등록</span>
                </button>
            </div>
        </li>
      </ul>
   </div>

<!--보안설정-->
<div class="account_box">
    <div class="title">
        <h2 class="title_text">보안설정</h2>
    </div>

    <ul class="account_row">
        <li>
            <div class="row_item lock">
                <span class="item_text">비밀번호</span>
                <button type="button" class="btn_edit"
                        onclick="goChangePassword()">
                    <span class="text">수정</span>
                </button>
            </div>
        </li>
 
    </ul>
</div>

<div class="account_box">
    <div class="title2">
        <h5 class="title_text2"><a href="${pageContext.request.contextPath}/user/leave" class="href-title">회원탈퇴 ></a></h5>
    </div>

<!--이력관리-->

<script>

    function goChangePassword() {
        nclk(this,'nid.pswchg','','',event);
        document.location.href = "${pageContext.request.contextPath}/user/myInfo/viewChangePasswd";
    }

</script>
<script>
    function changeName() {
        nclk(this, 'nid.rename', '', '', event)
        document.location = "/user2/help/realNameCheck?type=20&rurl=" + rurl + "&surl=" + rurl + "&lang=ko_KR";
    }

    function cert_realnm() {
        nclk(this, 'nid.idconfirm', '', '', event)
        document.location = "/user2/help/realNameCheck?type=common&rurl=" + rurl + "&surl=" + rurl + "&lang=ko_KR";
    }
</script>
<script>
    function goLoginStatus() {
        nclk(this,'nid.signinstatus','','',event);
        document.location.href = "/user2/help/userLoginLog?m=viewLoginStatus&lang=ko_KR";
    }

    function goMyActivityLog() {
        nclk(this,'nid.myactivity','','',event);
        document.location.href = "/user2/help/userLoginLog?m=viewLoginLog&lang=ko_KR"
    }

    function goConnectedWithNaver() {
        nclk(this,'nid.connectednaver','','',event);
        document.location.href = "/internalToken/view/tokenList/pc?lang=ko_KR"
    }

    function excuteNclicksAs2StepVerification() {
        nclk(this,'nid.otpsetting','','',event)
    }

    function excuteNclicksAsRegionIp() {
        var $regionIp = $("#regionIp");
        if ($regionIp.is(":checked")) {
            nclk(this, 'nid.blockregionon', '', '', event)
        } else {
            nclk(this, 'nid.blockregionoff', '', '', event)
        }
    }

    function excuteNclicksAsAbroadIp() {
        var $abroadIp = $("#abroadIp");
        if ($abroadIp.is(":checked")) {
            nclk(this, 'nid.blockabroadon', '', '', event)
        } else {
            nclk(this, 'nid.blockabroadoff', '', '', event)
        }
    }
</script>


<!--관련링크-->


<script>

    function goSmartBotChat() {
        nclk(this,'fot.smartbot','','',event);
        document.location.href = "https://nca.naver.com/chat/account/view";
    }

    function goMemberTalkTalk() {
        nclk(this,'fot.membertalktalk','','',event);
        document.location.href = "https://talk.naver.com/ct/wc4bsu#nafullscreen";
    }
</script>            </div>
<footer class="footer" role="contentinfo">
    <div class="footer_home">
        <ul class="guide_link">
            <li>
               
            
                <a href="javascript:;" onclick="logout()" class="guide_item" >
                    <span>
                    <form action="${pageContext.request.contextPath}/member/logout"
							            method="post" name="logout">
                    <button class="footer_text" type="submit">로그아웃</button>
                                    <input type="hidden" name="${_csrf.parameterName}"
							                value="${_csrf.token}">
                                    </form>
                    
                    </span>
                </a>

            </li>
            <li>
                <a href="javascript:;" onclick="goHelpPage()" class="guide_item">
                    <span class="footer_text">고객센터</span>
                </a>
            </li>
        </ul>
        <div class="footer_logo"><img class="bottom_logo_img" alt=""
							src="${pageContext.request.contextPath}/resources/image/common/itda_logo5.png"><span><span class="blind">잇다</span></span></div>
    </div>
</footer>
<script>

    function toggleLangSelectList() {
        nclk(this, 'fot.lang', '', '', event);

        var langSelectListBtn = $("#langSelectListBtn");
        if (langSelectListBtn.attr("aria-expanded") === "true") {
            langSelectListBtn.attr("aria-expanded", "false");
            langSelectListBtn.removeClass("fold");
        } else {
            langSelectListBtn.attr("aria-expanded", "true");
            langSelectListBtn.addClass("fold");
        }

        $("#langSelectList").toggle();
    }

    $("#leftLangSelectList .lang_item").click(function() {
        var $this = $(this);
        if ($this.attr("aria-selected") === "true") {
            var leftLangSelectListBtn = $("#leftLangSelectListBtn");
            leftLangSelectListBtn.attr("aria-expanded", "false");
            leftLangSelectListBtn.removeClass("fold");
            $("#leftLangSelectList").hide();

                nclk(this,'fot.korean','','',event);

            return;
        }
        changeLanguage();
    });

    $("#langSelectList .lang_item").click(function() {
        var $this = $(this);
        if ($this.attr("aria-selected") === "true") {
            var langSelectListBtn = $("#langSelectListBtn");
            langSelectListBtn.attr("aria-expanded", "false");
            langSelectListBtn.removeClass("fold");
            $("#langSelectList").hide();

                nclk(this,'fot.korean','','',event);

            return;
        }
        changeLanguage();
    });
</script>        </div>
        <!-- //container -->
    </div>
</div>
<form id="fm" name="fm">
    <input type="hidden" name="token_help" id="token_help" value=" "/>
    <input type="hidden" name="isEmailYn" id="isEmailYn" value="N" />
    <input type="hidden" name="isPhoneYn" id="isPhoneYn" value="Y"  />
    <input type="hidden" name="phoneAuthYn" id="phoneAuthYn" value="N"/>
    <input type="hidden" name="mobileYn" id="mobileYn" value="N" />
    <input type="hidden" name="addressYn" id="isAddressYn" value="Y"/>
    <input type="hidden" name="userId" id="userId" value="${user.userId }"/>
    
 
    
    <!--팝업딥드-->
    <div id="dimmed" class="dimmed post" aria-hidden="true" style="display:none;"></div>
    <!--팝업내용-->
    
    <!-- 주소변경창 -->
           <div id="addressChangePopUpLayer" class="layer" style="display:none;">
        <div class="popup_layer">
            <div class="popup_layer_inner">
                <div class="popup_content">
                
                <!--주소 팝업콘텐츠영역-->


                 <div class="contact_edit_popup" style="width:329px;">
                        <h4 class="contact_edit_title">
                                <strong class="bold">${user.userName}님</strong>의 회원정보 중
                                <em class="accent">주소</em>를 <span
                                    id="p_txt_phoneNo_changeYn">수정</span>합니다.
                        </h4>
                        <fieldset style="margin-bottom: 20px;">
                    <div class="address_text"><span>우편번호  </span>
                    <button style="float: right; position: static" class="btn_contact"  onclick="sample6_execDaumPostcode()" value="우편번호 찾기" type="button">주소검색</button>
                    </div>
                    <div class="popup_row">
                    <input readonly type="text" id="sample6_postcode" placeholder="우편번호" class="popup_input" name="userPost">                    
                    
                      </div>                    
                       <div class="address_text"><span>주소  </span></div>
                       <div class="popup_row">
                       <input readonly type="text" placeholder="주소" class="popup_input" id="sample6_address" name="userAddress1">
                        
                    </div>
                    <div  class="address_text">
                    <span>상세주소  </span> 
                    </div>
                    <div class="popup_row">
                       <input type="text" id="sample6_detailAddress"  placeholder="상세주소" class="popup_input" name="userAddress1">
                        
                    </div>
                    <div class="popup_row"> 
                       <input type="text" id="sample6_extraAddress" placeholder="참고항목" class="popup_input" name="userAddress2">
                        
                    </div>
                    <p id="e_addressNo" class="popup_error"></p>
                            
                        </fieldset>
                    
                    <div class="btn_duo_popup">
                            <a href="javascript:;" class="btn_item" role="button"
                               onclick="hideAddressChangePopUp()">
                                <span class="btn_text">취소</span>
                            </a>
                            <button type="submit" class="btn_item on" id="sendAddress">
                                <span id="b_txt_address_reg"
                                      class="btn_text">변경</span>
                            </button>
                        </div>
                        <button type="button" class="close_popup"
                                onclick="hideAddressChangePopUp()"><span
                                    class="blind">닫기</span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 키워드 변경 팝업 -->
        <!-- 주소변경창 -->
           <div id="keyWordChangePopUpLayer" class="layer" style="display:block;">
        <div class="popup_layer">
            <div class="popup_layer_inner">
                <div class="popup_content">
                
                <!--주소 팝업콘텐츠영역-->


                 <div class="contact_edit_popup" style="width:329px;">
                        <h4 class="contact_edit_title">
                                <strong class="bold">${user.userName}님</strong>의 회원정보 중
                                <br>
                                <em class="accent">관심 키워드</em>를 <span
                                    id="p_txt_phoneNo_changeYn">수정</span>합니다.
                        </h4>
                        <fieldset style="margin-bottom: 20px;">
                        <ul>
                      <c:forEach var="categoryList" items="${categoryList}">
                        <li>
                       <div class="checkbox">
			        <input type="checkbox" id="check${categoryList.cate_Id}" value="${categoryList.cate_Id}"/>
			        <label for="check${categoryList.cate_Id}" >
			          <div>
			          <i class="fa fa-check"></i>
			          </div> ${categoryList.cate_Name}
			        </label>
   				 	</div>
                        </li>
                      </c:forEach>
                        <li>
                      <div class="checkbox">
			        <input type="checkbox" id="check2"/>
			        <label for="check2" >
			          <div>
			          <i class="fa fa-check"></i>
			          </div> I like Codepen!
			        </label>
   				 	</div>
                        </li>
                        </ul>
                        </fieldset>
                    <div class="btn_duo_popup">
                            <a href="javascript:;" class="btn_item" role="button"
                               onclick="hideKeyWordChangePopUp()">
                                <span class="btn_text">취소</span>
                            </a>
                            <button type="submit" class="btn_item on" id="sendKeyWord">
                                <span id="b_txt_address_reg"
                                      class="btn_text">변경</span>
                            </button>
                        </div>
                        <button type="button" class="close_popup"
                                onclick="hideKeyWordChangePopUp()"><span
                                    class="blind">닫기</span></button>
                 	  </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

        
     
    
    <div id="phoneNumberChangePopUpLayer" class="layer" style="display:none;">
        <div class="popup_layer">
            <div class="popup_layer_inner">
                <div class="popup_content">

                    <!--팝업콘텐츠영역-->
                    <div class="contact_edit_popup" style="width:329px;">
                        <h4 class="contact_edit_title">
                                <strong class="bold">${user.userName}</strong>의 회원정보 중
                                <em class="accent">전화번호</em>를 <span
                                    id="p_txt_phoneNo_changeYn">수정</span>하기 위해
                                인증절차가 필요합니다.
                        </h4>
                        <div id="phoneNoForm" class="row_item phone" style="display: none;">
                            <span id="p_txt_phoneNo" class="item_text">${user.userPhone }</span>
                        </div>
                        <div class="contact_form">
                            <div class="popup_row select">
                                <select id="internationalCode" name="internationalCode" title="전화번호"
                                        class="popup_input">
                                                <option value="233"> 가나 +233</option>
                                                <option value="241"> 가봉 +241</option>
                                                <option value="592"> 가이아나 +592</option>
                                                <option value="220"> 감비아 +220</option>
                                                <option value="502"> 과테말라 +502</option>
                                                <option value="1671"> 괌 +1671</option>
                                                <option value="1473"> 그레나다 +1473</option>
                                                <option value="30"> 그리스 +30</option>
                                                <option value="224"> 기니 +224</option>
                                                <option value="245"> 기니비사우 +245</option>
                                                <option value="264"> 나미비아 +264</option>
                                                <option value="674"> 나우루 +674</option>
                                                <option value="234"> 나이지리아 +234</option>
                                                <option value="672"> 남극,오스트레일리아의외 +672</option>
                                                <option value="27"> 남아프리카공화국 +27</option>
                                                <option value="31"> 네덜란드 +31</option>
                                                <option value="599"> 네덜란드령보네르 +599</option>
                                                <option value="297"> 네덜란드령아루바 +297</option>
                                                <option value="977"> 네팔 +977</option>
                                                <option value="47"> 노르웨이 +47</option>
                                                <option value="64"> 뉴질랜드 +64</option>
                                                <option value="683"> 뉴질랜드령니우에 +683</option>
                                                <option value="690"> 뉴질랜드령토켈라우제도 +690</option>
                                                <option value="227"> 니제르 +227</option>
                                                <option value="505"> 니카라과 +505</option>
                                                <option value="82"> 대한민국 +82</option>
                                                <option value="45"> 덴마크 +45</option>
                                                <option value="299"> 덴마크령그린란드 +299</option>
                                                <option value="298"> 덴마크령페로제도 +298</option>
                                                <option value="1809"> 도미니카공화국 +1809</option>
                                                <option value="1829"> 도미니카공화국 2 +1829</option>
                                                <option value="1849"> 도미니카공화국 3 +1849</option>
                                                <option value="49"> 독일 +49</option>
                                                <option value="670"> 동티모르 +670</option>
                                                <option value="856"> 라오스 +856</option>
                                                <option value="231"> 라이베리아 +231</option>
                                                <option value="371"> 라트비아 +371</option>
                                                <option value="7"> 러시아/카자흐스탄 +7</option>
                                                <option value="961"> 레바논 +961</option>
                                                <option value="266"> 레소토 +266</option>
                                                <option value="40"> 루마니아 +40</option>
                                                <option value="352"> 룩셈부르크 +352</option>
                                                <option value="250"> 르완다 +250</option>
                                                <option value="218"> 리비아 +218</option>
                                                <option value="370"> 리투아니아 +370</option>
                                                <option value="423"> 리히텐슈타인 +423</option>
                                                <option value="261"> 마다가스카르 +261</option>
                                                <option value="692"> 마셜제도공화국 +692</option>
                                                <option value="691"> 마이크로네시아연방 +691</option>
                                                <option value="853"> 마카오 +853</option>
                                                <option value="389"> 마케도니아공화국 +389</option>
                                                <option value="265"> 말라위 +265</option>
                                                <option value="60"> 말레이시아 +60</option>
                                                <option value="223"> 말리 +223</option>
                                                <option value="52"> 멕시코 +52</option>
                                                <option value="377"> 모나코 +377</option>
                                                <option value="212"> 모로코 +212</option>
                                                <option value="230"> 모리셔스 +230</option>
                                                <option value="222"> 모리타니아 +222</option>
                                                <option value="258"> 모잠비크 +258</option>
                                                <option value="382"> 몬테네그로 +382</option>
                                                <option value="373"> 몰도바 +373</option>
                                                <option value="960"> 몰디브 +960</option>
                                                <option value="356"> 몰타 +356</option>
                                                <option value="976"> 몽골 +976</option>
                                                <option value="1"> 미국/캐나다 +1</option>
                                                <option value="1670"> 미국령북마리아나제도 +1670</option>
                                                <option value="95"> 미얀마 +95</option>
                                                <option value="678"> 바누아투 +678</option>
                                                <option value="973"> 바레인 +973</option>
                                                <option value="1246"> 바베이도스 +1246</option>
                                                <option value="1242"> 바하마 +1242</option>
                                                <option value="880"> 방글라데시 +880</option>
                                                <option value="229"> 베냉 +229</option>
                                                <option value="58"> 베네수엘라 +58</option>
                                                <option value="84"> 베트남 +84</option>
                                                <option value="32"> 벨기에 +32</option>
                                                <option value="375"> 벨라루스 +375</option>
                                                <option value="501"> 벨리즈 +501</option>
                                                <option value="387"> 보스니아헤르체고비나 +387</option>
                                                <option value="267"> 보츠와나 +267</option>
                                                <option value="591"> 볼리비아 +591</option>
                                                <option value="257"> 부룬디 +257</option>
                                                <option value="226"> 부르키나파소 +226</option>
                                                <option value="975"> 부탄 +975</option>
                                                <option value="359"> 불가리아 +359</option>
                                                <option value="55"> 브라질 +55</option>
                                                <option value="673"> 브루나이 +673</option>
                                                <option value="685"> 사모아 +685</option>
                                                <option value="966"> 사우디아라비아 +966</option>
                                                <option value="378"> 산마리노 +378</option>
                                                <option value="239"> 상투메프린시페 +239</option>
                                                <option value="221"> 세네갈 +221</option>
                                                <option value="381"> 세르비아 +381</option>
                                                <option value="248"> 세이셀 +248</option>
                                                <option value="1784"> 세인트빈센트그레나딘 +1784</option>
                                                <option value="252"> 소말리아 +252</option>
                                                <option value="677"> 솔로몬제도 +677</option>
                                                <option value="249"> 수단 +249</option>
                                                <option value="597"> 수리남 +597</option>
                                                <option value="94"> 스리랑카 +94</option>
                                                <option value="268"> 스와질랜드 +268</option>
                                                <option value="46"> 스웨덴 +46</option>
                                                <option value="41"> 스위스 +41</option>
                                                <option value="34"> 스페인 +34</option>
                                                <option value="421"> 슬로바키아 +421</option>
                                                <option value="386"> 슬로베니아 +386</option>
                                                <option value="963"> 시리아 +963</option>
                                                <option value="232"> 시에라리온 +232</option>
                                                <option value="65"> 싱가포르 +65</option>
                                                <option value="971"> 아랍에미리트 +971</option>
                                                <option value="374"> 아르메니아 +374</option>
                                                <option value="54"> 아르헨티나 +54</option>
                                                <option value="1684"> 아메리칸사모아 +1684</option>
                                                <option value="354"> 아이슬란드 +354</option>
                                                <option value="509"> 아이티 +509</option>
                                                <option value="353"> 아일랜드 +353</option>
                                                <option value="994"> 아제르바이잔 +994</option>
                                                <option value="93"> 아프가니스탄 +93</option>
                                                <option value="376"> 안도라 +376</option>
                                                <option value="355"> 알바니아 +355</option>
                                                <option value="213"> 알제리 +213</option>
                                                <option value="244"> 앙골라 +244</option>
                                                <option value="251"> 에디오피아 +251</option>
                                                <option value="291"> 에리트레아 +291</option>
                                                <option value="372"> 에스토니아 +372</option>
                                                <option value="593"> 에콰도르 +593</option>
                                                <option value="503"> 엘살바도르 +503</option>
                                                <option value="44"> 영국 +44</option>
                                                <option value="290"> 영국령세인트헬레나 +290</option>
                                                <option value="246"> 영국령인도양지역 +246</option>
                                                <option value="350"> 영국령지브롤터 +350</option>
                                                <option value="500"> 영국령포클랜드제도 +500</option>
                                                <option value="967"> 예멘 +967</option>
                                                <option value="968"> 오만 +968</option>
                                                <option value="43"> 오스트리아 +43</option>
                                                <option value="504"> 온두라스 +504</option>
                                                <option value="962"> 요르단 +962</option>
                                                <option value="256"> 우간다 +256</option>
                                                <option value="598"> 우루과이 +598</option>
                                                <option value="998"> 우즈베키스탄 +998</option>
                                                <option value="380"> 우크라이나 +380</option>
                                                <option value="964"> 이라크 +964</option>
                                                <option value="98"> 이란 +98</option>
                                                <option value="972"> 이스라엘 +972</option>
                                                <option value="20"> 이집트 +20</option>
                                                <option value="39"> 이탈리아 +39</option>
                                                <option value="91"> 인도 +91</option>
                                                <option value="62"> 인도네시아 +62</option>
                                                <option value="81"> 일본 +81</option>
                                                <option value="1876"> 자메이카 +1876</option>
                                                <option value="260"> 잠비아 +260</option>
                                                <option value="240"> 적도기니 +240</option>
                                                <option value="995"> 조지아 +995</option>
                                                <option value="86"> 중국 +86</option>
                                                <option value="236"> 중앙아프리카공화국 +236</option>
                                                <option value="253"> 지부티 +253</option>
                                                <option value="263"> 짐바브웨 +263</option>
                                                <option value="235"> 차드 +235</option>
                                                <option value="420"> 체코 +420</option>
                                                <option value="56"> 칠레 +56</option>
                                                <option value="237"> 카메룬 +237</option>
                                                <option value="238"> 카보베르데 +238</option>
                                                <option value="974"> 카타르 +974</option>
                                                <option value="855"> 캄보디아왕국 +855</option>
                                                <option value="254"> 케냐 +254</option>
                                                <option value="269"> 코모로,마요트 +269</option>
                                                <option value="506"> 코스타리카 +506</option>
                                                <option value="225"> 코트디부아르 +225</option>
                                                <option value="57"> 콜롬비아 +57</option>
                                                <option value="242"> 콩고 +242</option>
                                                <option value="243"> 콩고민주공화국 +243</option>
                                                <option value="53"> 쿠바 +53</option>
                                                <option value="965"> 쿠웨이트 +965</option>
                                                <option value="682"> 쿡제도 +682</option>
                                                <option value="385"> 크로아티아 +385</option>
                                                <option value="996"> 키르기스스탄 +996</option>
                                                <option value="686"> 키리바시 +686</option>
                                                <option value="357"> 키프로스 +357</option>
                                                <option value="886"> 타이완 +886</option>
                                                <option value="992"> 타지키스탄 +992</option>
                                                <option value="255"> 탄자니아 +255</option>
                                                <option value="66"> 태국 +66</option>
                                                <option value="90"> 터키 +90</option>
                                                <option value="228"> 토고 +228</option>
                                                <option value="676"> 통가 +676</option>
                                                <option value="993"> 투르크메니스탄 +993</option>
                                                <option value="216"> 튀니지 +216</option>
                                                <option value="1868"> 트리니다드토바고 +1868</option>
                                                <option value="507"> 파나마 +507</option>
                                                <option value="595"> 파라과이 +595</option>
                                                <option value="92"> 파키스탄 +92</option>
                                                <option value="675"> 파푸아뉴기니 +675</option>
                                                <option value="680"> 팔라우 +680</option>
                                                <option value="970"> 팔레스타인 +970</option>
                                                <option value="51"> 페루 +51</option>
                                                <option value="351"> 포르투갈 +351</option>
                                                <option value="48"> 폴란드 +48</option>
                                                <option value="1787"> 푸에르토리코 +1787</option>
                                                <option value="33"> 프랑스 +33</option>
                                                <option value="590"> 프랑스령과들루프 +590</option>
                                                <option value="594"> 프랑스령기아나 +594</option>
                                                <option value="687"> 프랑스령뉴칼레도니아 +687</option>
                                                <option value="262"> 프랑스령레위니옹 +262</option>
                                                <option value="596"> 프랑스령마르티니크 +596</option>
                                                <option value="508"> 프랑스령생피에르미클롱 +508</option>
                                                <option value="681"> 프랑스령월리스푸투나제 +681</option>
                                                <option value="689"> 프랑스령폴리네시아 +689</option>
                                                <option value="679"> 피지 +679</option>
                                                <option value="358"> 핀란드 +358</option>
                                                <option value="63"> 필리핀 +63</option>
                                                <option value="36"> 헝가리 +36</option>
                                                <option value="61"> 호주 +61</option>
                                                <option value="852"> 홍콩 +852</option>
                                </select>
                            </div>
                            <div class="popup_row rightgap">
                                <input type="tel" id="phoneNo" placeholder="전화번호" name="phoneNo"
                                       maxlength="14"
                                       class="popup_input"
                                       onkeydown="check_num_ajax3('phoneNo', '2', 'e_phoneNo')">
                                <button type="button" class="btn_contact"
                                        onclick="sendSmsForChangePhoneNo()">인증</button>
                            </div>
                            <div class="popup_row">
                                <input type="tel" id="authNo" placeholder="인증번호 입력"
                                       class="popup_input"
                                       onkeydown="check_num_ajax3('authNo', '2', 'e_phoneNo')"
                                       oninput="changeVerifyToPopupInput('authNo')"
                                       disabled>
                            </div>
                            <p id="e_phoneNo" class="popup_error"></p>


                        </div>
                        <div class="btn_duo_popup">
                            <a href="javascript:;" class="btn_item" role="button"
                               onclick="excuteNclicksCancelAsPhoneYn();hidePhoneNumberChangePopUp()">
                                <span class="btn_text">취소</span>
                            </a>
                            <a href="javascript:;" class="btn_item on" role="button"
                               onclick="checkAuthNoForChangePhoneNo()">
                                <span id="b_txt_phoneNo_reg"
                                      class="btn_text">변경</span>
                            </a>
                        </div>
                        <button type="button" class="close_popup"
                                onclick="excuteNclicksCloseAsPhoneYn();hidePhoneNumberChangePopUp()"><span
                                    class="blind">닫기</span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="myLetterEmailChangePopUpLayer" class="layer" style="display:none;">
        <div class="popup_layer">
            <div class="popup_layer_inner">
                <div class="popup_content">
                    <!--팝업콘텐츠영역-->
                    <div class="contact_edit_popup" style="width:329px;">
                        <h4 class="contact_edit_title">
                                <strong class="bold">${user.userName}님</strong>의 회원정보 중
                                <em class="accent">연락처
                                    이메일</em>을 수정하기 위해
                                인증절차가 필요합니다.
                        </h4>
                            <div id="p_txt_myLetterEmailForm" class="row_item mail">
                                <span id="p_txt_myLetterEmail" class="item_text">${user.userEmail }</span>
                            </div>
                            <div id="myLetterEmailForm" class="contact_form one">
                                <div class="popup_row rightgap">
                                    <input type="email" placeholder="현재 연락처 이메일 입력"
                                           id="confirmMyLetterEmail"
                                           class="popup_input">
                                    <button type="button" class="btn_contact"
                                            onclick="doConfirmMyLetterEmail()">확인
                                    </button>
                                </div>
                            </div>
                        <div class="contact_edit_desc">
                            잇다 서비스의 변경/종료, 본인 작성 게시물 조치 등 대부분의 잇다 안내에 사용합니다.
                        </div>
                        <div id="myLetterEmailPhoneVerify" class="contact_edit_desc">
                            등록된 이메일 주소가 기억나지 않는다면 휴대전화 인증 후 이메일을 수정할 수 있습니다.
                            <a href="javascript:;" class="link_come"
                               onclick="userMobile('myLetterEmail')">
                                <span class="text">전화번호 인증</span>
                            </a>
                        </div>
                        <div class="contact_form">
                            <div class="popup_row rightgap">
                                <input type="email" placeholder="변경할 이메일 입력" id="myLetterEmail"
                                       class="popup_input" disabled>
                                <button type="button" class="btn_contact"
                                        onclick="sendAuthNoForEmailAuth('myLetterEmail')">
                                    인증
                                </button>
                            </div>
                            <div class="popup_row">
                                <input type="text" placeholder="인증번호 입력" id="myLetterEmailAuthNo"
                                       class="popup_input" oninput="changeVerifyToPopupInput('myLetterEmailAuthNo')"
                                       disabled>
                            </div>
                            <a href="javascript:;" id="myLetterEmailAuthGuide" class="link_come"
                               onclick="nclk(this,'inf.primaryhelp','','',event)">
                                <span class="text">인증번호가 오지 않나요?</span>
                            </a>
                            <div id="myLetterEmailAuthGuideTxt" class="link_come_desc" style="display: none;">
                                잇다가 발송한 메일이 스팸 메일로 분류된 것은 아닌지 확인해 주세요. 스팸 메일함에도 메일이 없다면, 다시 한 번 '인증'을 눌러주세요.
                            </div>
                            <p id="e_myLetterEmail" class="popup_error"></p>
                        </div>
                        <div class="btn_duo_popup">
                            <a href="javascript:;" class="btn_item" role="button"
                               onclick="nclk(this,'inf.primarycancel','','',event);hideMyLetterEmailChangePopUp()">
                                <span class="btn_text">취소</span>
                            </a>
                            <a href="javascript:;" class="btn_item on" role="button" onclick="setEmail()">
                                <span id="b_txt_myLetterEmail_reg"
                                      class="btn_text">변경</span>
                            </a>
                        </div>
                        <button type="button" class="close_popup"
                                onclick="nclk(this,'inf.primaryx','','',event);hideMyLetterEmailChangePopUp()"><span
                                    class="blind">닫기</span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="pswdEmailChangePopUpLayer" class="layer" style="display:none;">
        <div class="popup_layer">
            <div class="popup_layer_inner">
                <div class="popup_content">

                    <!--팝업콘텐츠영역-->
                    <div class="contact_edit_popup" style="width:329px;">
                        <h4 class="contact_edit_title">
                                <strong class="bold">${user.userName}님</strong>의 회원정보 중
                                <em class="accent">본인확인
                                    이메일</em>을 <span
                                    id="p_txt_pswdEmail_changeYn">등록</span>하기 위해
                                인증절차가 필요합니다.
                        </h4>
                        <div id="p_txt_pswdEmailForm" class="row_item mail" style="display: none;">
                        <span id="p_txt_pswdEmail"
                              class="item_text"></span>
                        </div>
                        <div id="pswdEmailForm" class="contact_form one" style="display: none;">
                            <div class="popup_row rightgap">
                                <input type="email" placeholder="현재 본인확인 이메일 입력" id="confirmPswdEmail"
                                       class="popup_input">
                                <button type="button" class="btn_contact"
                                        onclick="doConfirmPswdEmail()">
                                    확인
                                </button>
                            </div>
                        </div>
                        <div class="contact_edit_desc" aria-expanded="false">
                            아이디, 비밀번호 찾기, 로그인이 안되는 경우 등 본인확인이 필요한 경우 사용합니다.
                        </div>
                        <div class="contact_edit_desc">
                            지금 로그인한 잇다 아이디나, 다른 사람의 잇다 아이디는 연락처로 사용하실 수 없습니다. 비상 시 사용할 이메일 정보이니 정확하게 입력해 주세요.
                        </div>
                        <div id="pswdEmailPhoneVerify" class="contact_edit_desc" style="display: none;">
                            등록된 이메일 주소가 기억나지 않는다면 휴대전화 인증 후 이메일을 수정할 수 있습니다.
                            <a href="javascript:;" class="link_come" onclick="userMobile('pswdEmail')">
                                <span class="text">전화번호 인증</span>
                            </a>
                        </div>
                        <div class="contact_form">
                            <div class="popup_row rightgap">
                                <input type="email"
                                       placeholder="등록할 이메일 입력"
                                       id="pswdEmail" class="popup_input" disabled>
                                <button type="button" class="btn_contact"
                                        onclick="sendAuthNoForEmailAuth('pswdEmail')">인증
                                </button>
                            </div>
                            <div class="popup_row">
                                <input type="text" placeholder="인증번호 입력" id="pswdEmailAuthNo"
                                       class="popup_input" oninput="changeVerifyToPopupInput('pswdEmailAuthNo')"
                                       disabled>
                            </div>
                            <a href="javascript:;" id="pswdEmailAuthGuide" class="link_come"
                               onclick="nclk(this,'inf.recoveryhelp','','',event)">
                                <span class="text">인증번호가 오지 않나요?</span>
                            </a>
                            <div id="pswdEmailAuthGuideTxt" class="link_come_desc" style="display: none;">
                                잇다가 발송한 메일이 스팸 메일로 분류된 것은 아닌지 확인해 주세요. 스팸 메일함에도 메일이 없다면, 다시 한 번 '인증'을 눌러주세요.
                            </div>
                            <p id="e_pswdEmail" class="popup_error"></p>
                        </div>
                        <div class="btn_duo_popup">
                            <a href="javascript:;" class="btn_item" role="button"
                               onclick="excuteNclicksCancelAsPswdEmailYn();hidePswdEmailChangePopUp()">
                                <span class="btn_text">취소</span>
                            </a>
                            <a href="javascript:;" class="btn_item on" role="button" onclick="setPswdEmail()">
                                <span id="b_txt_pswdEmail_reg"
                                      class="btn_text">등록</span>
                            </a>
                        </div>
                        <button type="button" class="close_popup"
                                onclick="excuteNclicksCloseAsPswdEmailYn();hidePswdEmailChangePopUp()"><span
                                    class="blind">닫기</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="ugcPhoneNoticePopUpLayer" class="layer" style="display:none;">
        <div class="layer_inner">
            <div class="modal_post_wrap">
                <div class="modal_post">
                    <div class="modal_post_inner">
                        <div id="ugcPhoneNoticePopUpMsg" class="title" tabindex="0" style="outline:none;"></div>
                        <p id="ugcPhoneNoticePopUpMsgDesc" class="desc"></p>
                    </div>
                    <div class="btn_box">
                        <button onclick="hideUgcPhoneNoticePopUp()" type="button" class="btn_modal"><span class="text">확인</span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="setAdMobilePopUpLayer" class="layer" style="display:none;">
        <div class="layer_inner">
            <div class="modal_post_wrap">
                <div class="modal_post">
                    <div class="modal_post_inner">
                        <div class="title" tabindex="0">
                            
								&lsquo;개인정보 이용&rsquo; 및 &lsquo;이벤트&middot;혜택 정보 수신&rsquo;에 모두 동의합니다.<br>
							
                        </div>
                        <p class="desc">
                            <a href="https://nid.naver.com/user2/common/terms/terms2?t=viewNidEventPPkr&v=1" onclick="hideSetAdMobilePromotionPopUp()" class="lnk_more"><span class="text">전체보기</span></a>
                        </p>
                    </div>
                    <div class="btn_box">
                        <ul class="btn_list">
                            <li>
                                <button onclick="hideSetAdMobilePromotionPopUp()" type="button" class="btn_modal off"><span class="text">나중에</span></button>
                            </li>
                            <li>
                                <button onclick="doSetAdMobilePromotionPopup()" type="button" class="btn_modal"><span class="text">동의</span></button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="unsetAdMobilePopUpLayer" class="layer" style="display:none;">
        <div class="layer_inner">
            <div class="modal_post_wrap">
                <div class="modal_post">
                    <div class="modal_post_inner">
                        <div class="title" tabindex="0">
                            
								앞으로 잇다에서 제공하는<br>프로모션 정보를 받으실 수 없습니다.<br>수신 상태를 변경하시겠습니까?
							
                        </div>
                    </div>
                    <div class="btn_box">
                        <ul class="btn_list">
                            <li>
                                <button onclick="hideUnsetAdMobilePromotionPopUp()" type="button" class="btn_modal off"><span class="text">취소</span></button>
                            </li>
                            <li>
                                <button onclick="doSetAdMobilePromotionPopup()" type="button" class="btn_modal"><span class="text">확인</span></button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="setAdEmailPopUpLayer" class="layer" style="display:none;">
        <div class="layer_inner">
            <div class="modal_post_wrap">
                <div class="modal_post">
                    <div class="modal_post_inner">
                        <div class="title" tabindex="0">
                            
								&lsquo;개인정보 이용&rsquo; 및 &lsquo;이벤트&middot;혜택 정보 수신&rsquo;에 모두 동의합니다.<br>
							
                        </div>
                        <p class="desc">
                            <a href="https://nid.naver.com/user2/common/terms/terms2?t=viewNidEventPPkr&v=1" onclick="hideSetAdEmailPromotionPopUp()" class="lnk_more"><span class="text">전체보기</span></a>
                        </p>
                    </div>
                    <div class="btn_box">
                        <ul class="btn_list">
                            <li>
                                <button onclick="hideSetAdEmailPromotionPopUp()" type="button" class="btn_modal off"><span class="text">나중에</span></button>
                            </li>
                            <li>
                                <button onclick="doSetAdEmailPromotionPopup()" type="button" class="btn_modal"><span class="text">동의</span></button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="unsetAdEmailPopUpLayer" class="layer" style="display:none;">
        <div class="layer_inner">
            <div class="modal_post_wrap">
                <div class="modal_post">
                    <div class="modal_post_inner">
                        <div class="title" tabindex="0">
                            
								앞으로 잇다에서 제공하는<br>프로모션 정보를 받으실 수 없습니다.<br>수신 상태를 변경하시겠습니까?
							
                        </div>
                    </div>
                    <div class="btn_box">
                        <ul class="btn_list">
                            <li>
                                <button onclick="hideUnsetAdEmailPromotionPopUp()" type="button" class="btn_modal off"><span class="text">취소</span></button>
                            </li>
                            <li>
                                <button onclick="doSetAdEmailPromotionPopup()" type="button" class="btn_modal"><span class="text">확인</span></button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
<form name="formAuth" method="post" action="/user2/help/changeUserInfo?m=actionUserMobile">
    <input type=hidden name="authRes" value=""/>
    <input type=hidden name="token_help" value=" "/>
</form>

    
<div id="dimmed2" class="dimmed" aria-hidden="true" style="display:none;"></div>
<!--팝업내용-->
<div id="twoStepVerificationPopUpLayer" class="layer" style="display:none;">
    <div class="popup_layer">
        <div class="popup_layer_inner">
            <div class="popup_content">
                <!--팝업콘텐츠영역-->
                <div class="contact_2step_popup" style="width:329px;">
                    <h4 class="contact_edit_title">
                        새로운 <strong class="bold">2단계 인증</strong>으로 바꿔 보세요.<br>
                        "번거로운 숫자 대신, 한번의 클릭"
                    </h4>
                    <div class="contact_edit_desc">
                        보안성은 그대로, 편리함을 더한 새로운 '2단계 인증'으로 바꿔 보세요.
                        스마트 기기 알림 화면에서 '예' 버튼만 클릭하면 안전하게 로그인할 수 있습니다.
                        새로운 기능 제공으로 현재 OTP 관리 기능은 지원하지 않습니다.
                    </div>
                    <div class="contact_edit_desc">
                        <strong>OTP 로그인을 해제한 후, 2단계 인증을 설정하세요.</strong>
                    </div>
                    <div class="btn_duo_popup ratio">
                        <a href="/user2/help/2StepVerif?m=viewReleaseSettings&token_help= &lang=ko_KR"
                           class="btn_item on" role="button" onclick="nclk(this,'2fc.otprelease','','',event)">
                            <span class="btn_text">OTP 해제하기</span>
                        </a>
                        <a href="javascript:;" class="btn_item" role="button" onclick="nclk(this,'2fc.otplater','','',event);hide2StepVerificationPopUp()">
                            <span class="btn_text">나중에 하기</span>
                        </a>
                    </div>
                    <button type="button" class="close_popup" onclick="nclk(this,'2fc.otprx','','',event);hide2StepVerificationPopUp()"><span
                                class="blind">닫기</span></button>
                </div>
                <!-- // -->
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage/userinfo/myinfobottom1.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage/userinfo/myinfobottom2.js"></script>
</body>
</html>