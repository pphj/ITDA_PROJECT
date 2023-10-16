let index = {
  init: function () {
    $("#btn-kakaopay").on("click", () => {
      this.kakaopay();
    });
  },

  kakaopay: function () {
    var path = "${pageContext.request.contextPath}";

    $.ajax({
      url: '/itda/pay/kakaoPay.do',
      dataType: "json",
    }).done(function (resp) {
      if (resp.status === 500) {
        alert("카카오페이를 처리할 수 없습니다.");
      } else {
        // alert(resp.tid); //결제 정보 확인
        var box = resp.next_redirect_pc_url;
        // window.open(box); // 새 창 열기
        location.href = box;
      }
    }).fail(function (error) {
      alert(JSON.stringify(error));
    });
  },
}

index.init();
