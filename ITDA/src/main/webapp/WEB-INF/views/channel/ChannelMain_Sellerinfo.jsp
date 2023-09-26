<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- header 연결 -->
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/ChanelMain_Sellerinfo.css" />
<title>ChanelMain_Sellerinfo.jsp</title>
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
			<strong class="profileUserName tit_bloger">채널이름</strong>

			<dl class="blog_count ">
				<dd>
					<a href="/@garangbimaker/follower" class="link_count #follower">
						<em class="txt_g">구독자</em><span class="num_count">4,460</span>
					</a>
				</dd>
			</dl>
		</div>
		<div class="wrap_profile_btn">
			<input type="hidden" name="myWriter" value="false"> <span
				class="#my_follow follow_button_wrapper">
				<button type="button"
					class="btn_type btn_new_type btn_default btn_profile btnFollow #p_follow">
					<span class="txt_default"><img class="ico_plus"
						src="../image/channel/ico-plus.png"
						alt="글작성 버튼 아이콘">글작성</span>
				</button>
			</span>
		</div>
		
		<div class="moe_control"> <!-- 메뉴더보기 클릭시 ctrl_on 클래스 추가 -->
                <button type="button" class="setting_button" style="background-color: white; border: none;">
					<span class="txt_default2"><img class="setting_img" src="../image/channel/setting.png"  
										style="width: 30px; height: 30px; padding-left: 660px; opacity: 0.6;"
										alt="메뉴 더보기">
				    </span>
				</button>
			    <!-- <div class="layer_action_ctrl">
			                <div class="inner_action_ctrl">
			                       <button type="button" class="btnBlockProfile btn_ctrl requireLogin">차단하기</button>
			                       <button type="button" class="btnReportProfile btn_ctrl requireLogin">신고하기</button>
			                </div>
			         </div>
			     -->
            </div>
	</div>

	<div class="tab_contents">
        <ul id="contentsTab" class="list_tab">
            <li class="on">
	            <a href="#info" class="infoTab link_tab #info_open">
	            <span class="txt_tab">작가소개</span>
	            </a>
	        </li>

			<li>
				<a href="#articles" class="articleTab link_tab">
				<span class="txt_tab">게시글 216</span>
				</a>
			</li>

			<li>
				<a href="#works" class="magazineTab link_tab"> 
				<span class="txt_tab">카테고리</span>
				</a>
			</li>
		</ul>
	</div>

	<!-- 작가소개 -->
	<div class="author_intro animation_up">
	    <strong class="tit_intro">채널소개</strong>
	    <p class="desc_intro">마음속에 담아둔 말이 많은 내과 의사. 마흔을 앞둔 지금, 의학 '드라마'가 아닌 진짜 이야기를 쓰고 싶습니다.</p>
		    <ul class="list_tag">
			        <li>
			            <a href="/keyword/profile/에세이" class="link_tag #profilekeyword">에세이</a>
			        </li>
			        <li>
			            <a href="/keyword/profile/가족" class="link_tag #profilekeyword">가족</a>
			        </li>
			        <li>
			            <a href="/keyword/profile/육아" class="link_tag #profilekeyword">육아</a>
			        </li>
			        <li>
			            <a href="/keyword/profile/의사" class="link_tag #profilekeyword">의사</a>
			        </li>
			        <li>
			            <a href="/keyword/profile/출간작가" class="link_tag #profilekeyword">출간작가</a>
			        </li>
			        <li>
			            <a href="/keyword/profile/교수" class="link_tag #profilekeyword">교수</a>
			        </li>
		    </ul>
	</div>
	
	<!-- 통계 -->
	<div class="author_intro animation_up">
	    <strong class="tit_intro">구독자 통계</strong>
	    <div class="slide_book slide_basic">
	        <div class="inner_slide">
	            <ul class="list_book" data-page="1" style="width: 221px; transition-duration: 0.3s;">
		            <li>
		               <div class="channel_stats">
						<div class="channel_stats_both">
							<div class="channel_stats_left">
								<ul class="channel_stats_graph">
								
									<li class="channel_stats_item">
										<div class="channel_stats_bar">
											<div class="channel_stats_bar_value" style="height:2%;">
												<span class="channel_stats_bar_percent">1%</span>
											</div>
										</div>
										<!-- <div class="channel_stats_legend">10<span class="channel_stats_legend_unit">대</span></div> -->
									</li>
									
									<li class="channel_stats_item">
										<div class="channel_stats_bar">
											<div class="channel_stats_bar_value is_2" style="height:64%;">
												<span class="channel_stats_bar_percent">24%</span>
												<span class="channel_stats_bar_text">2<span class="blind">위</span></span>
											</div>
										</div>
									</li>
									
									<li class="channel_stats_item">
										<div class="channel_stats_bar">
											<div class="channel_stats_bar_value is_1" style="height:100%;">
												<span class="channel_stats_bar_percent">38%</span>
												<span class="channel_stats_bar_text">1<span class="blind">위</span></span>
											</div>
										</div>
									</li>
									
									<li class="channel_stats_item">
										<div class="channel_stats_bar">
											<div class="channel_stats_bar_value" style="height:63%;">
												<span class="channel_stats_bar_percent">24%</span>
											</div>
										</div>
									</li>
									
									<li class="channel_stats_item">
										<div class="channel_stats_bar">
											<div class="channel_stats_bar_value" style="height:29%;">
												<span class="channel_stats_bar_percent">11%</span>
											</div>
										</div>
									</li>
									
									<li class="channel_stats_item">
										<div class="channel_stats_bar">
											<div class="channel_stats_bar_value" style="height:7%;">
												<span class="channel_stats_bar_percent">3%</span>
											</div>
										</div>
									</li>
								</ul>
							</div>
				
								<!-- 원 통계 -->
								<div class="channel_stats_right">
										<div class="channel_stats_donut">
											<div id="_CHANNEL_HOME_PROFILE_SUBSCRIBER_GENDER" class="pie_chart _gender_chart bb" 
													style="position: relative;">
													<svg width="130" height="130" style="overflow: hidden; display: block;">
														<g class="bb-main" transform="translate(0.5, 0.5)">
														
														<g class="bb-chart" clip-path="">
														<g class="bb-chart-arcs" transform="translate(65, 60)">
														<g class="bb-chart-arc bb-target bb-target-female">
														
														<g class="bb-shapes bb-shapes-female bb-arcs bb-arcs-female">
														<path class="bb-shape bb-shape bb-arc bb-arc-female" transform="scale(1,1)" style="fill: rgb(232, 147, 147);" d="M-53.286345393897996,-20.237722069496993A57,57,0,0,1,-1.726449813346965,-56.97384813264762L-1.726449813346935,-38.961768068736234A39,39,0,0,0,-36.26181095760991,-14.355523887150968Z"></path>
														</g>
														
														<text dy=".35em" transform="translate(-11.141215697917236,-15.636921460840131)" style="text-anchor: middle; pointer-events: none;">19%</text>
														</g>
														
														<g class="bb-chart-arc bb-target bb-target-male">
														<g class="bb-shapes bb-shapes-male bb-arcs bb-arcs-male">
														<path class="bb-shape bb-shape bb-arc bb-arc-male" transform="scale(1,1)" style="fill: rgb(102, 135, 187);" d="M1.7264498133468948,-56.97384813264762A57,57,0,1,1,-54.41395752064261,-16.974134055724363L-37.38942308435453,-11.09193587337831A39,39,0,1,0,1.726449813346887,-38.961768068736234Z"></path>
														</g>
														
														<text dy=".35em" transform="translate(11.141215697917218,15.63692146084014)" style="text-anchor: middle; pointer-events: none;">81%</text>
														</g>
														</g></g></g>
														</svg>
													<div class="bb-tooltip-container" style="position: absolute; pointer-events: none; display: none;"></div>
												</div>
													<div class="channel_stats_donutlegend">
														<span class="channel_stats_donutlegend_item _GENDER is_female" data-id="female" data-percent="0.1921540991308433">여자</span>
														<span class="channel_stats_donutlegend_item _GENDER is_male" data-id="male" data-percent="0.8078459008691566">남자</span>
													</div>
										</div>
								</div>
							</div>
						</div>
		            </li>
	            </ul>
	        </div>
	    </div>
	</div>

</body>
</html>