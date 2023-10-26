$(document).ready(function() {
    // 초기에는 'articles' 탭을 보이도록 설정
    onTabClick('articles');
    // 드롯다운 버튼에 이벤트 핸들러 연결
    $("#settingButton").click(onDropdownButtonClick);
    // 글 작성 버튼 클릭 이벤트 처리
    $(".btn_write").click(goToWritePage);

    // 구독 버튼 클릭 이벤트 처리
    $(document).on('click', '.btn_subscribe', toggleSubscription);

    // 페이지 로딩 시 사용자의 구독 상태를 확인합니다.
    checkSubscription();
});

// 탭 클릭 이벤트 처리 함수
function onTabClick(tabId) {
    $(".tab_content").hide();
    $("#" + tabId).css('opacity', 0).show().animate({ opacity: 1 }, 400);
    $(".list_tab li").removeClass("on");
    $("#" + tabId + "_tab").parent().addClass("on");
}

// 드롭다운 버튼 클린 이벤트 처리 함수
function onDropdownButtonClick() {
	$(".layer_action_ctrl").toggle();
}

// 글 작성 버튼 클릭 이벤트 처리 함수
function goToWritePage() {
    var chnum = $("input[name='btnwrite']").val();
    window.location.href = 'contentwrite.co/' + chnum;
}

let isSubscribed = false;

// 구독 버튼 클릭 이벤트 처리 함수
function toggleSubscription() {
    if (!isLoggedIn()) {
        alert("로그인이 필요한 서비스입니다. 로그인 후 이용해주세요.");
        return;
    }

    if (isSubscribed) {
        unsubscribe();
        $(this).removeClass("subscribed");
        $(this).css({
            "border-color": "#00c6be",
            "background-color": "initial",
            "color": "#00c6be"
        });
        $(".txt_default_subscribe").html('<img class="ico_plus" src="../image/channel/ico-plus.png" alt="구독 버튼 아이콘">구독');
        isSubscribed = false;
    } else {
        subscribe();
        $(this).addClass("subscribed");
        $(this).css({
            "border-color": "#00c6be",
            "background-color": "#00c6be",
            "color": "#fff"
        });
        $(".txt_default_subscribe").html('<img class="ico_plus" src="../image/channel/subing.png" style="height: 10px; margin-right: 4px; vertical-align: sub; width: 13px; margin-bottom: 4px;" alt="구독 취소 버튼 아이콘">구독중');
        isSubscribed = true;
    }
    updateSubscriberCount();
}


// 로그인 여부를 확인하는 함수
function isLoggedIn() {
    let userId = $('#loginid').text();
    console.log(userId);
    console.log(userId !== undefined && userId !== '')
    return userId !== undefined && userId !== '';
}

// 구독 처리를 하는 함수
function subscribe() {
    sendSubscriptionRequest("/itda/channels/subscribe");
}

// 구독 취소 처리를 하는 함수
function unsubscribe() {
    sendSubscriptionRequest("/itda/channels/unsubscribe");
}

// 구독 요청을 보내는 함수
function sendSubscriptionRequest(url) {
    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");
    let userId = $('#loginid').text();
    let chnum = $('#chnum').val();

     $.ajax({
        url: url,
        type: 'POST',
        data: { userId: userId, chnum: chnum },
        beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function(data) {
            console.log(url.split('/').pop() + " 처리 완료");
            
            // 구독자 수 업데이트
            updateSubscriberCount();
        }
    });
}

// 구독자 수를 실시간 업데이트하는 함수
function updateSubscriberCount() {
    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");
    let userId = $('#loginid').text();
    let chnum = $('#chnum').val();

    $.ajax({
        url: "/itda/channels/getSubscriberCount",
        type: 'POST',
        data: { userId: userId, chnum: chnum },
        beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function(data) {
            // 구독자 수 업데이트
            $(".num_count").text(data.subscriberCount);
        }
    });
}


// 로그인한 사용자의 구독 상태를 확인하는 함수
function checkSubscription() {
	let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");
    let userId = $('#loginid').text();
    let chnum = $('#chnum').val();
    
   
    if (!userId) {
        return;
    }

    $.ajax({
        url: "/itda/channels/checkSubscription",
        type: 'POST',
        data: { userId: userId, chnum: chnum },
        beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function(response) {
            isSubscribed = response.isSubscribed;
            if (isSubscribed) {
                $('.btn_subscribe').addClass("subscribed");
                $('.btn_subscribe').css({
                    "border-color": "#00c6be",
                    "background-color": "#00c6be",
                    "color": "#fff"
                });
                $(".txt_default_subscribe").html('<img class="ico_plus" src="../image/channel/subing.png" style="height: 10px; margin-right: 4px; vertical-align: sub; width: 13px; margin-bottom: 4px;" alt="구독중 버튼 아이콘">구독중');
            } else {
                $('.btn_subscribe').removeClass("subscribed");
                $('.btn_subscribe').css({
                    "border-color": "#00c6be",
                    "background-color": "initial",
                    "color": "#00c6be"
                });
                $(".txt_default_subscribe").html('<img class="ico_plus" src="../image/channel/ico-plus.png" alt="구독 버튼 아이콘">구독');
            }
        }
    });
}
