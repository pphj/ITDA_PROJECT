$(document).ready(function() {
    // "삭제" 버튼 클릭 이벤트 핸들러
    $(".my_attention_remove").click(function() {
    	
    	var boardNum = $(this).data("boardnum");
        // 모달 레이어 생성
        var modalHtml = `
            <div class="popup_layer _MODAL">
                <strong class="popup_tit"></strong>
                <p class="popup_sub_desc">해당 콘텐츠를 최근 본 콘텐츠 목록에서 삭제하시겠습니까?</p>
                <div class="popup_button_wrap">
                    <button type="button" class="button_layer _MODAL_CANCEL">
                        취소
                    </button>
                    <button type="submit" class="button_layer type_confirm" id="delSub">
                        확인
                    </button>
                </div>
            </div>
        `;

        // 모달 레이어를 _LAYER_DIMMED 아래에 추가
        $("#_LAYER_DIMMED").html(modalHtml);

        // _LAYER_DIMMED를 보이게 함
        $("#_LAYER_DIMMED").show();

        // "취소" 버튼 클릭 이벤트 핸들러
        $(".button_layer._MODAL_CANCEL").click(function() {
            // 모달 레이어를 숨김
            $("#_LAYER_DIMMED").hide();
        });
        
        $("#delSub").click(function(event) {
            event.preventDefault();
            
            $("#fm input[name='boardNum']").val(boardNum);
            console.log(boardNum);
            // 여기에서 필요한 작업을 수행

            // 마지막으로 양식을 제출
            $("#fm").attr('action', '/itda/my/contents/likeDeletePro');
            $("#fm").attr('method', 'post');
            $("#fm").submit();
        });
        
    });
});