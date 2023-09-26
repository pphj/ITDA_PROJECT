<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- header 연결 -->
<link href="${pageContext.request.contextPath}/resources/css/channel/header.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/channel/ChanelMain.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../js/channel/channelMain.js">
<style>

</style>
</head>
<body>
	<!--  header  -->
	<div class="header">
		<img class="logo" src="../image/common/logo.png">
		<div class="icon">
			<p class="login">로그인</p>
			<img class="search" src="../image/common/search.png">
		</div>
	</div>
	<hr class="hr">

	<!--  채널바  -->
	<div class="wrap_profile">
		<div class="bloger_thumb">
			<img class="profileUserImage img_thumb"
				src="../image/channel/channel.jpeg"
				width="100" height="100" alt="이미지정보"
				data-image="//img1.daumcdn.net/thumb/C500x500.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/xTI/image/CGONwj7UEwl7YWVC2V6i2IeoLxY.JPG">
			<input class="profileUserImageUrl" type="hidden"
				value="http://t1.daumcdn.net/brunch/service/user/xTI/image/CGONwj7UEwl7YWVC2V6i2IeoLxY.JPG">
		</div>
		<div class="wrap_profile_desc">
			<strong class="profileUserName tit_bloger">[${channel.chname}]</strong>

			<dl class="blog_count ">
				<dd>
					<a href="/@garangbimaker/follower" class="link_count #follower">
						<em class="txt_g">구독자</em><span class="num_count">4,460</span>
					</a>
				</dd>
			</dl>
		</div>
		<div class="wrap_profile_btn">
			<input type="hidden" name="myWriter" value="false"> 
			<span class="#my_follow follow_button_wrapper">
				<button type="button"
					class="btn_type btn_new_type btn_default btn_profile btnFollow #p_follow">
					<span class="txt_default"><img class="ico_plus" src="../image/channel/ico-plus.png" alt="알림 버튼 아이콘">알림</span>
				</button>
				<button type="button"
					class="btn_type btn_new_type btn_default btn_profile btnFollow #p_follow">
					<span class="txt_default"><img class="ico_plus"
						src="../image/channel/ico-plus.png"
						alt="구독 버튼 아이콘">구독</span>
				</button>
			</span>
			
		</div>
		
		
	</div>

	<div class="tab_contents">
		<ul id="contentsTab" class="list_tab">
			<li>
				<a href="#info" class="infoTab link_tab #info_open"> 
				<span class="txt_tab">채널소개</span>
				</a>
			</li>

			<li class="on">
				<a href="#articles" class="articleTab link_tab">
				<span class="txt_tab">게시글</span>
				</a>
			</li>

			<li>
				<a href="#works" class="magazineTab link_tab"> 
				<span class="txt_tab">카테고리</span>
				</a>
			</li>
		</ul>
	</div>

	<!-- 게시글(글) -->
	<div class="wrap_contents">
	
		<div id="wrapInfo" class="wrap_authorinfo #my_profile_info"
			style="display: none;">
			<h3 class="screen_out">작가소개</h3>
			<div id="infoLoadSpinner" class="layer-more-loading"
				style="display: none">
				<div class="loader">
					<div class="dot dot1"></div>
					<div class="dot dot2"></div>
					<div class="dot dot3"></div>
				</div>
			</div>
		</div>
		
		<div id="wrapArticle" class="wrap_article #my_post">
			<div class="wrap_article_list">
				<ul class="list_article list_post1 #post_list">
					<li data-articleuid="xTI_303" class="animation_up"
						data-tiara-action-name="작가 프로필 > 글탭 > 리스트 클릭"
						data-tiara-action-kind="ClickContent" data-tiara-layer="articles"
						data-tiara-id="@@xTI">
						<a href="/magazine/whatwetalkabout" class="link_category">
							<em class="tit_category"> A에서 Z 사이에서 나눈 말 </em>
						</a> 
						<a href="/@garangbimaker/303" class="link_post has_image #post_listview"> 
							<strong class="tit_subject"> E의 말 “아무것도 할 수 없어서 읽고 또 읽었어요.” </strong>
							
							<div class="post_thumb">
								<img class="img_thumb" 
								src="../image/channel/channel1.jpeg"
								style="width: 120px; height: 120px;"
								 alt="이미지정보">
							</div>
							
							<div class="post_desc">
								<div class="wrap_sub_content">
									<em class="tit_sub">부산에서 독자 E의 말</em><span class="ico_bar"></span>
									<span class="article_content"> 신간 3종의 데이터를 검수하고 강의 자료를
										준비하며 19일간 자정께 집에 집에 닿았다. 회계 정리와 업무 메일 발송, 번거로운 잡무를 정리하며 허둥대다
										보면 반나절이 허무하게 끝나버리는 하루하루를 보냈다. 구멍가게도 나름의 원리와 나름의 고충이 있다는 것은
										출판사를 시작하며 알게 됐다. 새벽 일찍 밖을 나서서 늦은 저녁까지 깨어 있다고 해서 당장에 읽어주는 
									</span>
								</div>
							</div> 
							
								<span class="post_append" style="white-space: nowrap"> 
									<span class="ico_dot"></span> 
									<span class="publish_time">8시간전</span>
								</span>
						</a>
					</li>
					
					
					<li data-articleuid="xTI_303" class="animation_up"
						data-tiara-action-name="작가 프로필 > 글탭 > 리스트 클릭"
						data-tiara-action-kind="ClickContent" data-tiara-layer="articles"
						data-tiara-id="@@xTI">
						<a href="/magazine/whatwetalkabout" class="link_category">
							<em class="tit_category"> 아이라는 놀라운 세계 </em>
						</a> 
						<a href="/@garangbimaker/303" class="link_post has_image #post_listview"> 
							<strong class="tit_subject"> 엄마의 소풍 도시락 </strong>
							
							<div class="post_thumb">
								<img class="img_thumb" 
								src="../image/channel/channel2.jpeg"
								style="width: 120px; height: 120px;"
								 alt="이미지정보">
							</div>
							
							<div class="post_desc">
								<div class="wrap_sub_content">
									<em class="tit_sub">부산에서 독자 E의 말</em><span class="ico_bar"></span>
									<span class="article_content"> 
									올해 봄 둘째 아이가 유치원에서 동물원으로 소풍을 갔다. 알림장에는 '가정에서 직접 만든' 점심을 보내달라는 문구가 적혀 있었다. 구운 고기, 
									밀키트 그리고 외식으로 아이들의 끼니를 이어나가고 있던 나는 난감해졌다. '가정에서 직접 만든' 음식이면 무얼 만들어야 하지. 
									고민 끝에 김밥을 도전해 볼 생각으로 마트에서 몇 가지 재료를 사 왔다. 막상 식탁 위
									</span>
								</div>
							</div> 
							
								<span class="post_append" style="white-space: nowrap"> 
									<span class="ico_dot"></span> 
									<span class="publish_time">8시간전</span>
								</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>