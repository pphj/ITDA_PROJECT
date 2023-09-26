<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- header 연결 -->
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/ChanelMain_category.css" />
<title>ChannelMain_category.jsp</title>
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

			<li>
				<a href="#articles" class="articleTab link_tab">
					<span class="txt_tab">게시글 216</span>
				</a>
			</li>

			<li class="on">
				<a href="#works" class="magazineTab link_tab"> 
					<span class="txt_tab">카테고리</span>
				</a>
			</li>
		</ul>
	</div>
	
	<!-- 카테고리 내용 -->
	<div class="wrap_contents">
			<ul class="channel_category_list">
					<li class="channel_category_item">
						<a href="/usa/nasdaq/contents" class="channel_category_link" data-clk="chlh_category.listall">
							<strong class="channel_category_name">전체</strong>
							<div class="channel_category_num">493</div>
						</a>
					</li>
					<li class="channel_category_item">
						<a href="/usa/nasdaq/contents?categoryId=17be87ffaa1000h5l" class="channel_category_link" data-clk="chlh_category.list">
							<strong class="channel_category_name">지난주 실적과 이슈</strong>
							<div class="channel_category_num">103</div>
						</a>
					</li>
					<li class="channel_category_item">
						<a href="/usa/nasdaq/contents?categoryId=17be8803899000vts" class="channel_category_link" data-clk="chlh_category.list">
							<strong class="channel_category_name">시장경제의 이해</strong>
							<div class="channel_category_num">113</div>
						</a>
					</li>
					<li class="channel_category_item">
						<a href="/usa/nasdaq/contents?categoryId=17be880c024000lq0" class="channel_category_link" data-clk="chlh_category.list">
							<strong class="channel_category_name">신기술과 테마</strong>
							<div class="channel_category_num">97</div>
						</a>
					</li>
					<li class="channel_category_item">
						<a href="/usa/nasdaq/contents?categoryId=17be8815662000j2x" class="channel_category_link" data-clk="chlh_category.list">
							<strong class="channel_category_name">개별회사 소개</strong>
							<div class="channel_category_num">66</div>
						</a>
					</li>
					<li class="channel_category_item">
						<a href="/usa/nasdaq/contents?categoryId=17be8812f2d000wzk" class="channel_category_link" data-clk="chlh_category.list">
							<strong class="channel_category_name">SEC공시분석 강좌</strong>
							<div class="channel_category_num">27</div>
						</a>
					</li>
					<li class="channel_category_item">
						<a href="/usa/nasdaq/contents?categoryId=17d75a3ca2d000mlo" class="channel_category_link" data-clk="chlh_category.list">
							<strong class="channel_category_name">투자 방법론</strong>
							<div class="channel_category_num">59</div>
						</a>
					</li>
					<li class="channel_category_item">
						<a href="/usa/nasdaq/contents?categoryId=17c68e9a677000nan" class="channel_category_link" data-clk="chlh_category.list">
							<strong class="channel_category_name">미주사 정보국</strong>
							<div class="channel_category_num">3</div>
						</a>
					</li>
					<li class="channel_category_item">
						<a href="/usa/nasdaq/contents?categoryId=17be86622ec000mfd" class="channel_category_link" data-clk="chlh_category.list">
							<strong class="channel_category_name">공지사항</strong>
							<div class="channel_category_num">23</div>
						</a>
					</li>
			</ul>
	</div>

	
</body>
</html>