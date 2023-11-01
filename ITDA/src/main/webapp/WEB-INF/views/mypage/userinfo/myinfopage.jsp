<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">


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
                 <t:choose>
                     <t:when test="${empty user.userProfile}">
			                <img src="https://static.nid.naver.com/images/web/user/default.png" width="84" height="84" alt="프로필 이미지">
                        </t:when>
                    <t:when test="${!empty user.userProfile}">
                                <img id="imgThumb" src="${pageContext.request.contextPath}/image/Member/${user.userId}${user.userProfile}" width="84" height="84">
                        </t:when>
                 </t:choose>
                     
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

<div class="account_box">
    <div class="title">
        <h2 class="title_text">내프로필</h2>
    </div>

    <ul class="account_row">
        <li>
            <div class="row_item name">
                <span class="item_text">${user.userName}</span>
<%--                 <button type="button" class="btn_edit" onclick="changeName()">
                    <span class="text">실명수정</span>
                </button> --%>
            </div>
        </li>

        <li>
            <div id="phoneNoRegDiv" class="row_item phone">
                <span id="phoneNoRegSpan" class="item_text">${user.userPhone}</span>
<%--                <button type="button" id="phoneNoRegBtn" class="btn_edit" onclick="showPhoneNumberChangePopUp()">
                    <span id="phoneNoRegBtnTxt" class="text">수정</span>
                </button>--%>
            </div>
        </li>

        <li>
            <div class="row_item mail">
                <span id="myLetterEmailRegSpan" class="item_text">${user.userEmail}</span>
                <button type="button" class="btn_edit" onclick="showMyLetterEmailChangePopUp()">
                    <span class="text">수정</span>
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

<t:if test="${message ne 'NOT_SELLER' }">

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
<%--                <button type="button" id="phoneNoRegBtn"
                        class="btn_edit"
                        onclick="showPhoneNumberChangePopUp()">
                    <span id="phoneNoRegBtnTxt"
                          class="text">수정</span>
                </button>--%>
            </div>
        </li>
        <li>
            <div class="row_item mail ">
                <span id="myLetterEmailRegSpan"
                      class="item_text">${user.sellerEmail }</span>
                <button type="button" class="btn_edit"
                        onclick="showSellerLetterEmailChangePopUp()">
                    <span class="text">수정</span>
                </button>
            </div>
        </li>
      </ul>
   </div>
</t:if>

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
    <input type="hidden" name="isEmailYn" id="isEmailYn" value="N" />
    <input type="hidden" name="isPhoneYn" id="isPhoneYn" value="Y"  />
    <input type="hidden" name="phoneAuthYn" id="phoneAuthYn" value="N"/>
    <input type="hidden" name="mobileYn" id="mobileYn" value="N" />
    <input type="hidden" name="addressYn" id="isAddressYn" value="Y"/>
    <input type="hidden" name="userId" id="userId" value="${user.userId }"/>
    <input type="hidden" name="cateNameYn" id="cateNameYn" value="${user.cate_Name}"/>
    <input type="hidden" name="userEmail" id="setUserEmail" value=""/>
    <input type="hidden" name="sellerEmail" id="sellerUserEmail" value=""/>
    
    
 
    
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
        
           <div id="keyWordChangePopUpLayer" class="layer" style="display:none;">
        <div class="popup_layer">
            <div class="popup_layer_inner">
                <div class="popup_content">
                
                <!--키워드 팝업콘텐츠영역-->


                 <div class="contact_edit_popup" style="width:329px;">
                        <h4 class="contact_edit_title">
                                <strong class="bold">${user.userName}님</strong>의 회원정보 중
                                <br>
                                <em class="accent">관심 키워드</em>를 <span
                                    id="p_txt_phoneNo_changeYn">수정</span>합니다.
                        </h4>
                        <fieldset style="margin-bottom: 20px;">
                        <ul>
                                      <li> 
                      <div class="box-line" style="margin-bottom:4px;">
			        <input type="checkbox" id="check0" class="ch-input"/>
			        <label for="check0" >
			          <div>
			          <i class="fa fa-check"></i>
			          </div><span>전체</span>
			        </label>
   				 	</div>
                        </li>
                     	 <t:forEach var="chCategoryList" items="${chCategoryList}" begin="0" varStatus="status" end="${fn:length(chCategoryList)}">
                        <li>
                       <div class="box-line" style="margin-bottom:4px;">
				        <input type="checkbox" id="check${chCategoryList.cate_Id}" value="${chCategoryList.cate_Id}" name="cate_Id" class="ch-input"/>
				        <label for="check${chCategoryList.cate_Id}" >
				          <div>
				          <i class="fa fa-check"></i>
				          </div><span>${chCategoryList.cate_Name}</span> 
				        </label>
   				 	  </div>
                        </li>
                      </t:forEach>
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
    
	<!-- 개인 이메일 수정 팝업 -->
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
                            <a href="javascript:;" class="link_come">
                               <!-- onclick="userMobile('myLetterEmail')" -->
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
    
	<!-- 샐러 이메일 변경 팝업 -->
    <div id="showSellerLetterEmailChangePopUpLayer" class="layer" style="display:none;">
        <div class="popup_layer">
            <div class="popup_layer_inner">
                <div class="popup_content">

                    <!--팝업콘텐츠영역-->
                    <div class="contact_edit_popup" style="width:329px;">
                        <h4 class="contact_edit_title">
                                <strong class="bold">${user.userName}님</strong>의 회원정보 중
                                <em class="accent">판매자
                                    이메일</em>을 수정하기 위해
                                인증절차가 필요합니다.
                        </h4>
                            <div id="p_txt_myLetterEmailForm" class="row_item mail">
                                <span id="p_txt_myLetterEmail" class="item_text">${user.sellerEmail }</span>
                            </div>
                            <div id="myLetterEmailForm" class="contact_form one">
                                <div class="popup_row rightgap">
                                    <input type="email" placeholder="현재 연락처 이메일 입력"
                                           id="confirmSellerLetterEmail"
                                           class="popup_input">
                                    <button type="button" class="btn_contact"
                                            onclick="doConfirmSellerLetterEmail()">확인
                                    </button>
                                </div>
                            </div>
                        <div class="contact_edit_desc">
                            잇다 서비스의 변경/종료, 본인 작성 게시물 조치 등 대부분의 잇다 안내에 사용합니다.
                        </div>
                        <div id="myLetterEmailPhoneVerify" class="contact_edit_desc">
                            등록된 이메일 주소가 기억나지 않는다면 휴대전화 인증 후 이메일을 수정할 수 있습니다.
                            <a href="javascript:;" class="link_come">
                              <!--  onclick="userMobile('myLetterEmail')"> -->
                                <span class="text">전화번호 인증</span>
                            </a>
                        </div>
                        <div class="contact_form">
                            <div class="popup_row rightgap">
                                <input type="email" placeholder="변경할 이메일 입력" id="sellerLetterEmail"
                                       class="popup_input" disabled>
                                <button type="button" class="btn_contact"
                                        onclick="sendAuthNoForEmailAuth('sellerLetterEmail')">
                                    인증
                                </button>
                            </div>
                            <div class="popup_row">
                                <input type="text" placeholder="인증번호 입력" id="sellerLetterEmailAuthNo"
                                       class="popup_input" oninput="changeVerifyToPopupInput('sellerLetterEmailAuthNo')"
                                       disabled>
                            </div>
                            <a href="javascript:;" id="myLetterEmailAuthGuide" class="link_come"
                               onclick="nclk(this,'inf.primaryhelp','','',event)">
                                <span class="text">인증번호가 오지 않나요?</span>
                            </a>
                            <div id="myLetterEmailAuthGuideTxt" class="link_come_desc" style="display: none;">
                                잇다가 발송한 메일이 스팸 메일로 분류된 것은 아닌지 확인해 주세요. 스팸 메일함에도 메일이 없다면, 다시 한 번 '인증'을 눌러주세요.
                            </div>
                            <p id="e_sellerLetterEmail" class="popup_error"></p>
                        </div>
                        <div class="btn_duo_popup">
                            <a href="javascript:;" class="btn_item" role="button"
                               onclick="nclk(this,'inf.primarycancel','','',event);hideSellerMyLetterEmailChangePopUp()">
                                <span class="btn_text">취소</span>
                            </a>
                            <a href="javascript:;" class="btn_item on" role="button" onclick="setSellerEmail()">
                                <span id="b_txt_myLetterEmail_reg"
                                      class="btn_text">변경</span>
                            </a>
                        </div>
                        <button type="button" class="close_popup"
                                onclick="nclk(this,'inf.primaryx','','',event);hideSellerMyLetterEmailChangePopUp()"><span
                                    class="blind">닫기</span></button>
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

    


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage/userinfo/myinfobottom1.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage/userinfo/myinfobottom2.js"></script>
</body>
</html>