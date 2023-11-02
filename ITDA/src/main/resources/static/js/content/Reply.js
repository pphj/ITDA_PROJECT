// 현재 선택된 옵션을 저장하는 변수
let option = 1;

// 신고하기 함수 추가
function reportComment(chnum, boardNum, replyNum) {
    if (!$("#LoginId").val()) {
        alert('로그인이 필요한 서비스입니다.');
        return;
    }

    window.open('/itda/contents/warn/' + chnum + '?boardNum=' + boardNum + '&replyNum=' + replyNum, '_blank', 'width=636, height=845');
}

// 댓글 목록을 가져오는 함수
function getList(state) {
    // CSRF 토큰을 가져옴
    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");

    // chnum과 boardNum을 가져옴
    var chnum = $('#chnum').val();
    var boardNum = $('#boardnum').val();
    

    // 콘솔에 현재 상태 출력
    console.log(state);

    // 현재 옵션을 업데이트
    option = state;

    // Ajax 요청을 사용하여 서버로 댓글 목록을 요청
    $.ajax({
        type: "post",
        url: '/itda/contents/' + chnum + "/" + boardNum + "/replyView",
        data: { "boardNum": $("#Reply_board_num").val(), state: state },
        beforeSend: function (xhr) {
            // 데이터를 전송하기 전에 헤더에 CSRF 토큰을 설정
            xhr.setRequestHeader(header, token);
        },
        datetype: "json",
        success: function (rdata) {
            // 댓글 갯수를 업데이트하고 레드/그레이 색상으로 표시
            $(".reply_count").text(rdata.listcount).css('font-family', 'Lucida Console');
            let red1 = 'red';
            let red2 = 'red';

            if (state == 1) {
                red2 = 'gray';
            } else if (state == 2) {
                red1 = 'gray';
            }

            let output = "";

            // 등록순, 최신순 버튼 생성
            output += '<li class="reply_order_item" >'
                + '		<a href="javascript:getList(1)" class="reply_order_button ' + red1 + '">등록순 </a>'
                + '</li>'
                + '<li class="reply_order_item" >'
                + '		<a href="javascript:getList(2)" class="reply_order_button ' + red2 + '">최신순 </a>'
                + '</li>';
            $('.reply_order_list').html(output);

            output = '';

            // 댓글 목록 생성
            $(rdata.replylist).each(function () {
                const lev = this.replyLev;
                let reply_reply = '';

                if (lev >= 1 && lev <= 10) {
                    reply_reply = ' reply_list_item__reply lev' + lev;
                }

                // 날짜 형식 변경
                var date = new Date(this.replyDate);
                var formattedDate = date.getFullYear() + '-' +
                    ('0' + (date.getMonth() + 1)).slice(-2) + '-' +
                    ('0' + date.getDate()).slice(-2) + ' ' +
                    ('0' + date.getHours()).slice(-2) + ':' +
                    ('0' + date.getMinutes()).slice(-2) + ':' +
                    ('0' + date.getSeconds()).slice(-2);

                output += '<li id="' + this.replyNum + '" class="reply_list_item '  + reply_reply + '">'
                    + '	<div class="reply_nick_area">'
                    + '  <div class="reply_box">'
                    + '		<div class="reply_nick_box">'
                    + '			<div class="reply_nick_info">'
                    + '				<div class="reply_nickname">' + this.replyWriter + '</div>'
                    + '			</div>'
                    + '		</div>'
                    + '  </div>'
                    + '	 <div class="reply_text_box">'
                    + '		<p class="reply_text_view">'
                    + '			<span class="text_reply">' + this.replyContent + '</span>'
                    + '		</p>'
                    + '	 </div>'
                    + '  <div class="reply_info_box">'
                    + '		<span class="reply_info_date">' + formattedDate + '</span>';

                // 답글 쓰기 버튼
                output += ' <a href="javascript:replyform(' + this.replyNum + ','
                    + lev + ',' + this.replySeq + ','
                    + this.replyRef + ')" class="reply_info_button">답글쓰기</a>'

                output += '  </div>'

				 var contextPath = "${pageContext.request.contextPath}";
				 
                // 더보기 및 수정, 삭제, 신고 버튼
				if ($("#LoginId").val() == this.replyWriter) {
				    output += '<div class="reply_tool">'
				        + '		<div title="더보기" class="reply_tool_button">'
				        + '     	<div>&#46;&#46;&#46;</div>'
				        + ' 	</div>'
				        + ' 	<div id="reply_list_item_layer' + this.replyNum + '"  class="LayerMore"  style="display: none; width: 90px;">'
				        + '     	<ul class="layer_list"  style="display: flex;">'
				        + '     	<li class="layer_item"  style="display: flex;">'
				        + '      		<a href="javascript:updateForm(' + this.replyNum + ')"'
				        + '         	class="layer_button">수정</a>&nbsp;&nbsp;'
				        + '      		<a href="javascript:del(' + this.replyNum + ')"'
				        + '         	class="layer_button">삭제</a>&nbsp;&nbsp;'
				        + '     	</li></ul>'
				        + '   </div>'
				        + '</div>'
				} else {
				    output += '<div class="reply_tool">'
				        + '		<div title="더보기" class="reply_tool_button">'
				        + '     	<div>&#46;&#46;&#46;</div>'
				        + ' 	</div>'
				        + ' 	<div id="reply_list_item_layer' + this.replyNum + '"  class="LayerMore"  style="display: none; width: 70px;">'
				        + '     	<ul class="layer_list"  style="display: flex;">'
				        + '     	<li class="layer_item"  style="display: flex;">'
					    + '<a href="javascript:reportComment(' + chnum + ', ' + boardNum + ', ' + this.replyNum + ')" class="layer_button">신고하기</a>'
					    + '     	</li></ul>'
					    + '   </div>'
					    + '</div>'
				}


                output += '</div>'
                    + '</li>'
            });

            $('.reply_list').html(output);

            if (rdata.replylist.length === 0) {
                $('.reply_list').empty();
                $('.reply_order_list').empty();
            }
        }
    });
}

// 댓글 수정 폼을 열고 기존 내용을 가져와서 보여줌
function updateForm(num) {
    $('.reply_tool').hide();
    $('.LayerMore').hide();
    let $num = $('#' + num);
    const replycontent = $num.find('.text_reply').text();
    const selector = '#' + num + ' > .reply_nick_area'
    $(selector).hide();
    $num.append($('.reply_list+.reply_write').clone());
    $num.find('textarea').val(replycontent);
    $num.find('.btn-register').attr('data-id', num).addClass('update').text('수정완료');
    $num.find('.btn-cancel').css('display', 'block');
    const count = replycontent.length;
    $num.find('.reply_write_area_count').text(count + "/200");
}

// 댓글 삭제 버튼이 클릭되었을 때 이벤트 핸들러
$('.reply_area').on('click', '.delete', function () {
    const num = $(this).attr('data-id'); // 댓글 ID
    
    alert(num);
});

// 댓글 삭제
function del(num, ref, lev, seq) {
	let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");
    // 먼저 해당 댓글이 신고된 상태인지 확인합니다.
    $.ajax({
        url: '/itda/contents' + '/checkReportStatus',
        data: { num: num },
        type: 'POST',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (rdata) {
            // 만약 신고된 댓글이라면,
            if (rdata.status == "reported") {  // 이 부분을 수정했습니다.
                // 경고 메시지를 띄우고,
                alert('신고된 댓글로 삭제가 불가합니다.');
                // 함수를 종료합니다.
                return;
            }

            // 신고되지 않은 댓글이라면, 삭제를 진행합니다.
            if (!confirm('정말 삭제하시겠습니까?')) {
                $('#reply_list_item_layer' + num).hide();
                return;
            }
            
            $.ajax({
                url: '/itda/contents' + '/replydelete',
                data: { num: num },
                type: 'POST',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: function (rdata) {
                    if (rdata >= 1) {
                        getList(option);
                    } else {
                        alert("댓글 삭제중 오류");
                    }
                }
            });
        }
    });
}

// 답글 쓰기 폼 열기
function replyform(replyNum, lev, seq, ref) {
    $(".LayerMore").hide();
    let output = '<li class="reply_list_item reply_list_item__reply lev' + lev + '"></li>'
    const $replyNum = $('#' + replyNum);
    $replyNum.after(output);
    output = $('.reply_list+.reply_write').clone();
    const $replyNum_next = $replyNum.next();
    $replyNum_next.html(output);
    $replyNum_next.find('textarea').attr('placeholder', '답글을 남겨보세요');
    $replyNum_next.find('.btn-cancel').css('display', 'block').addClass('reply-cancel');
    $replyNum_next.find('.btn-register').addClass('reply')
        .attr('data-ref', ref).attr('data-lev', lev).attr('data-seq', seq).text('답글완료');
}

$(function () {
    getList(option);

    $('.reply_area').on('keyup', '.reply_write_area_text', function () {
        const length = $(this).val().length;
        $(this).prev().text(length + '/200');
    });

    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");

    $('ul+.reply_write .btn-register').click(function () {
        const loginId = $('#LoginId').val();
        if (!loginId) {
            alert('로그인 후 이용 가능합니다.');
            return;
        }

        const replycontent = $('.reply_write_area_text').val();
        if (!replycontent) {
            alert("댓글을 입력하세요");
            return;
        }

        var LoginId = $('#LoginId').val();
        var chnum = $('#chnum').val();
        var boardNum = $('#boardnum').val();
        $.ajax({
            url: contextPath + '/contents/' + chnum + '/' + boardNum + '/replies/add',
            type: 'post',
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify({
                replyWriter: $('#LoginId').val(),
                replyContent: replycontent,
                boardNum: $('#Reply_board_num').val()
            }),
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function (response) {
                if (response.status == "success") {
                    getList(option);
                    $('.u_cnt_count').text(response.commentCount);
                } else {
                    console.log("댓글 등록 실패");
                }
            }
        });
        $('.reply_write_area_text').val('');
        $('.reply_write_area_count').text('0/200');
    });

    $(".reply_list").on('click', '.reply_tool_button', function () {
        $(this).next().toggle();
        $(".reply_tool_button").not(this).next().hide();
    });

    $('.reply_area').on('click', '.update', function () {
        let token = $("meta[name='_csrf']").attr("content");
        let header = $("meta[name='_csrf_header']").attr("content");
        const replycontent = $(this).parent().parent().find('textarea').val();
        if (!replycontent) {
            alert("수정할 글을 입력하세요");
            return;
        }
        const replyNum = $(this).attr('data-id');
        $.ajax({
            url: '/itda/contents' + '/replyupdate',
            type: 'POST',
            data: { replyNum: replyNum, replyContent: replycontent },
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function (rdata) {
                if (rdata == 1) {
                    getList(option);
                }
            }
        });
    });

    $('.reply_area').on('click', '.btn-cancel', function () {
        const num = $(this).next().attr('data-id');
        const selector = '#' + num;
        $(selector + ' .reply_write').remove();
        $(selector + '>.reply_nick_area').css('display', 'block');
        $(".reply_tool").show();
    });

    $('.reply_area').on('click', '.reply', function () {
        const replycontent = $(this).parent().parent().find('.reply_write_area_text').val();
        if (!replycontent) {
            alert("답글을 입력하세요");
            return;
        }
        let token = $("meta[name='_csrf']").attr("content");
        let header = $("meta[name='_csrf_header']").attr("content");
        const replyref = $(this).attr('data-ref');
        const replylev = $(this).attr('data-lev');
        const replyseq = $(this).attr('data-seq');
        var LoginId = $('#LoginId').val();
        var chnum = $('#chnum').val();
        var boardNum = $('#boardnum').val();
        $.ajax({
            url: '/itda/contents' + '/ReplyReply',
            data: {
                replyContent: replycontent,
                boardNum: $('#Reply_board_num').val(),
                replyLev: replylev,
                replyRef: replyref,
                replySeq: replyseq
            },
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            type: 'post',
            success: function (rdata) {
                if (rdata == 1) {
                    getList(option);
                }
            }
        });
    });

    $('.reply_area').on('click', '.reply-cancel', function () {
        $(this).parent().parent().parent().remove();
        $(".reply_tool").show();
    });

    $('.reply_area').on('click', '.reply_info_button', function (event) {
        $(".reply_tool").hide();
        const length = $('.reply_area .btn-register.reply').length;
        if (length === 1) {
            event.preventDefault();
        }
    });
});
