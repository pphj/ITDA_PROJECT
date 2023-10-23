<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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

	<title>프로필 수정</title>
<jsp:include page="../../include/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage/help_member.css">	<link href="https://nid.naver.com/favicon_1024.png" rel="apple-touch-icon-precomposed" sizes="1024x1024" />
	<script type="text/javascript">
	
		//120919 win8 이슈 대응 : capslock 자동설정해제
		document.msCapsLockWarningOff = true;
		function setContainerHeight(height) {}
		function clearDocs(){}
	</script>
	<script type="text/javascript">
		var msg = "<c:out value='${msg}'/>";
		var url = "<c:out value='${url}'/>";
		alert(meg);
		location.href = url;
	</script>
	<meta name="decorator" content="USER_PROFILE">


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
    <form id="profileForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/user/myInfo/changeProfilePro">
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
                           <c:choose>
                        <c:when test="${empty vo.userProfile}">
                                <img id="imgThumb" src="https://static.nid.naver.com/images/web/user/default.png" width="100" height="100">
                        </c:when>
                        <c:when test="${!empty vo.userProfile}">
                                <img id="imgThumb" src="${pageContext.request.contextPath}/image/Member/${vo.userId}${vo.userProfile}" width="100" height="100">
                        </c:when>
                        </c:choose>
                                <span class="mask"></span>
                            </div>
                            <div class="btn_area_btm">
                                <span class="btn_file">
                                    <label for="inputImage" class="btn_model"><b id="btnChangeProfile" class="btn2" onclick="changeImage(this)">사진변경</b></label>

                                    <input type="file" id="inputImage" name="profile"  accept="image/*" />
                                </span>
                                <a href="javascript:;" class="btn_model"><b id="btnDelete" class="btn2" >삭제</b></a>
                                </div>
                            </div>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="btn_wrap">
                <a href="javascript:;" class="btn_model"><b id="btnConfirm" class="btn8" onclick="btnChangeProfile">적용</b></a>
                <a href="javascript:;" class="btn_model"><b id="btnCancel" class="btn2" onclick="cancel();">취소</b></a>
            </div>
        </fieldset>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    </form>
</div>


	</div>

 	<div id="footer">

</div>
</div>
</div>
 	<jsp:include page="../../include/footer.jsp"></jsp:include>


<script src="${pageContext.request.contextPath}/resources/js/mypage/userinfo/profile.js"></script>
<script type="text/javascript">
	getGNB();

	window.onresize = function() {
		setContainerHeight(document.getElementById('content').clientHeight);
	}
</script>


</body>
</html>
