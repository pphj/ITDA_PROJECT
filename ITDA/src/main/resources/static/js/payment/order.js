        $(document).ready(function() {
            // 전체 동의 체크박스를 클릭할 때
            $("#agreement_all").click(function() {
                // 전체 동의 체크박스의 상태를 가져옵니다.
                var isChecked = $(this).prop("checked");

                // 모든 체크박스에 동일한 상태를 적용합니다.
                $("._AGREEMENT").prop("checked", isChecked);
            });

            // 다른 체크박스를 클릭할 때
            $("._AGREEMENT").click(function() {
                // 다른 체크박스 중 하나라도 선택 해제되면 전체 동의 체크박스도 선택 해제합니다.
                if ($("._AGREEMENT:checked").length < $("._AGREEMENT").length) {
                    $("#agreement_all").prop("checked", false);
                }
            });
        });
        
        $(".button_back._BACK").on("click", function(e) {
            e.preventDefault(); // 기본 동작(링크 이동)을 중지합니다.
            window.history.back();
        });
        
        