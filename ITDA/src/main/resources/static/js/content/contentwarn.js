$(document).ready(function(){
    // CSRF 토큰을 가져옴
    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");
    let chnum = $('#chnum').val(); // 추가한 코드

    $('input[name="select"]').on('change', function() {
        if ($(this).val() == '7') {
            $('.other-reason').show();
        } else {
            $('.other-reason').hide();
        }
    });
    
    

    $('.btn_submit').on('click', function(e){
        e.preventDefault();

        let replyWriter = $('.report_nick').text();
        let loginUser = $('#loginid').text();
        let selectedCategory = $('input[name="select"]:checked').val();
        let boardNum = $.urlParam('boardNum') || '';  // 수정
        let warnReason = '';
        let userid = $("#writer").val(); 

        if (selectedCategory == '7') {
            warnReason = $('#otherReason').val();
        }

        // 이미 신고한 카테고리인지 확인
        $.ajax({
            type: "GET",
            url: "/itda/contents/checkContentCategory",  // 이 URL은 실제 서버의 라우트에 맞게 변경해주세요.
            data: {
                userId: loginUser,
                category: selectedCategory
            },
            beforeSend: function (xhr) {
                            // 데이터를 전송하기 전에 헤더에 CSRF 토큰을 설정
                            xhr.setRequestHeader(header, token);
                        },
            success: function(response) {
                if(response.reported) {
                    alert("이미 해당 카테고리로 신고 처리가 접수되었습니다.");
                } else {
                    // 신고 접수 요청
                    $.ajax({
                        type: "POST",
                        url: "/itda/contents/contentreport",
                        data: {
                            punchId: loginUser,
                            sickId: replyWriter,
                            warnCateId: selectedCategory,
                            boardNum: boardNum,
                            warnReason: warnReason ? warnReason : null,  
                            chNum: chnum
                        },
                        beforeSend: function (xhr) {
                            // 데이터를 전송하기 전에 헤더에 CSRF 토큰을 설정
                            xhr.setRequestHeader(header, token);
                        },
                        success: function(response) {
                            if(response.status === "success") {
                                alert("신고 접수 성공");
								//window.location.href = "/itda/contents/" + chnum + "/" + boardNum + "?userid=" + userid; 
								window.close();  // 팝업 창을 닫습니다.
								
                            } else {
                                alert(response.message);
                            }
                        },
                        error: function(request, status, error) {
                            alert("신고 접수에 실패하였습니다.");
                        }
                    });
                }
            }
        });
    });

    // 창 닫기 버튼을 눌렀을 때 창을 닫는 이벤트 리스너
    $(".btn_close").click(function() {
        window.close();  // 현재 창을 닫습니다.
    });

    // 더보기 버튼을 눌렀을 때 내용을 표시하는 이벤트 리스너
    $(".more").click(function() {
        var answerArea = $(this).siblings(".answer_area");  // 해당 버튼의 형제 요소 중 .answer_area를 찾습니다.
        var isHidden = answerArea.is(":hidden");  // .answer_area가 숨겨져 있는지 확인합니다.

        // .answer_area가 숨겨져 있으면 표시하고, 그렇지 않으면 숨깁니다.
        if (isHidden) {
            answerArea.show();
        } else {
            answerArea.hide();
        }
    });
});

// URL의 쿼리스트링 파라미터를 추출하는 함수
$.urlParam = function(name){
    var results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(window.location.href);
    return results ? results[1] : null;
}
