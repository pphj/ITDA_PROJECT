$(document).ready(function() {
  $("#btnChangeProfile").click(function() {
    $("#inputImage").click();
  });

  $("#inputImage").change(function() {
    var fileInput = this;
    var imgThumb = $("#imgThumb")[0];

    if (fileInput.files && fileInput.files[0]) {
      var file = fileInput.files[0];
      var imageType = /^image\//;

      if (!imageType.test(file.type)) {
        // 파일이 이미지 파일이 아닌 경우
        alert("이미지 파일을 선택해 주세요.");
        $(fileInput).val(""); // 파일 입력 필드 초기화
      } else {
        var reader = new FileReader();
        reader.onload = function(e) {
          imgThumb.src = e.target.result;
        };
        reader.readAsDataURL(file);
      }
    }
  });
    $("#btnDelete").click(function() {
    // 프로필 사진 삭제 기능을 여기에 구현
    $("#imgThumb").attr("src", "https://static.nid.naver.com/images/web/user/default.png");
    $("#inputImage").val(""); // 파일 입력 필드 초기화
  });

  $("#btnConfirm").click(function() {
  		$("#profileForm").submit();
  });

  $("#btnCancel").click(function() {
  	window.location.href = "/itda";
  });
});
