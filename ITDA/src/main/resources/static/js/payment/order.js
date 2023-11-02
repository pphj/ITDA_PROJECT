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
   
        
        console.log($("._AGREEMENT:checked").length);

        // 나머지 제출 로직을 여기에 추가할 수 있습니다.
});

    $(".button_back._BACK").on("click", function(e) {
        e.preventDefault(); // 기본 동작(링크 이동)을 중지합니다.
        window.history.back();
    });

$('input[name="cpNum"]').change(function() {
    const code = $('input[name="cpNum"]:checked').attr('data-couponCode');
     console.log(code);
     $('input[name="couponCode"]').val(code);

    var selectedCouponValue = 0;
    // 선택한 쿠폰의 값 가져오기
    var selectedCoupon = $('input[name="cpNum"]:checked');
    if (selectedCoupon.length > 0) {
        selectedCouponValue = parseInt(selectedCoupon.val());
    }

    // 상품 가격 가져오기
    var productPrice = $('input[name="productPrice"]').val();

    // 쿠폰 적용 금액 표시 업데이트
    var couponDiscount = productPrice - selectedCouponValue;
    
    console.log(productPrice);
    
    if (couponDiscount < 0 || couponDiscount > productPrice) {
        selectedCouponValue = couponDiscount + selectedCouponValue;
        couponDiscount = 0;
    }
    console.log(selectedCouponValue);
    // 정수로 변환하여 업데이트
    $('._SUBSCRIPTION_COUPON_PRICE').text(selectedCouponValue);
    $('._SUBSCRIPTION_DISCOUNT_PRICE').text(couponDiscount);

    // 총 결제 금액 업데이트
    var totalPayPrice = couponDiscount;
    $('input[name="totalPayPrice"]').val(totalPayPrice);

    // 정수로 변환하여 업데이트
    $('input[name="discountPrice"]').val(selectedCouponValue);
});

// 초기화: 쿠폰 선택이 없는 경우
if ($('input[name="cpNum"]:checked').length === 0) {
    $('input[name="cpNum"]').first().prop('checked', true);
}

// 첫 번째 쿠폰에 대한 이벤트 트리거 (페이지 로딩시 초기값을 반영하기 위해)
$('input[name="cpNum"]:checked').change();


