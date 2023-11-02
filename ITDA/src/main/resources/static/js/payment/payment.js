   $("#fm").submit(function(event) {
	   event.preventDefault(); // 제출을 막습니다.
	   		 if ($("._AGREEMENT:checked").length < 4) {
            // 필수 항목이 선택되지 않았을 때 경고창을 표시하고 제출을 막습니다.
            alert("필수 항목을 체크해 주세요.");
            return false;
        }
	   
	  	var productName = $("input[name='productName']").val();
	  	var productId = $("input[name='productId']").val();
	  	//sessionStorage.setItem('item_name', productName);
	    //var discountPrice = $("#discountPrice").val(); 
	    var productPrice = $("input[name='productPrice']").val();
	    var totalProductPrice = productPrice;
	    var totalPayPrice = $("input[name='totalPayPrice']").val()
	    var discountPrice = $("input[name='discountPrice']").val()
	    var couponCode = $("input[name='couponCode']").val()

	    // totalPayPrice와 totalProductPrice를 각각의 input 필드에 설정
	    $("input[name='totalProductPrice']").val(totalProductPrice);
	    $("input[name='totalPayPrice']").val(totalPayPrice);
	    $("input[name='discountPrice']").val(discountPrice);
		$("input[name='couponCode']").val(couponCode);
//	    let token = $("meta[name='_csrf']").attr("content");  
//	    let header = $("meta[name='_csrf_header']").attr("content");
	    $.ajax({
	      url: '/itda/product/subscriptions/info/order/kakaoPay.do',
//	      type: 'POST', // HTTP 요청 메서드를 POST로 지정
	      dataType: 'json',
	      cache: false,
//	      beforeSend: function(xhr) {
//	        xhr.setRequestHeader(header, token);
//	      },
	      data: {
			  productId: productId,
			  item_name: productName,
			  total_amount: totalPayPrice,
			  discount: discountPrice,
			  couponCode: couponCode
	      },
	      success: function(data) {
	        var paybox = data.next_redirect_pc_url;
	        window.open(paybox);
	      },
	      error: function(jqXHR, textStatus, errorThrown) {
	      console.log(discountPrice);
	      console.log(couponCode);
	        alert("에러발생");
	      }
	      });
	    }); // ajax
	  
