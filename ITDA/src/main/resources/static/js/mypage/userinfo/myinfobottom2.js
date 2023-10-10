

getGNB();

window.onresize = function() {
	setContainerHeight(document.getElementById('content').clientHeight);
}

function landscapeHandler() {
        var headerLeft = document.querySelector("#headerLeft")
        var headerTop = document.querySelector("#headerTop");
        if (window.innerWidth >= 1024) {
            headerLeft.ariaHidden = "false";
            headerTop.ariaHidden = "false";
        } else {
            headerLeft.ariaHidden = "true";
            headerTop.ariaHidden = "true";
        }
    }

    $(document).ready(function(){
        landscapeHandler();

        $("a[id^='info']").click(function () {
            var $this = $(this);
            if($this.attr("aria-expanded") === "true"){
                $this.attr("aria-expanded", "false");
                var info = "#" + $this.attr("id");
                var infoToolTip = $(info + "ToolTip");
                infoToolTip.attr("aria-hidden", "true");
                infoToolTip.css("display", "none");
            } else {
                $this.attr("aria-expanded", "true");
                var infoToolTip = $("#" + $this.attr("id") + "ToolTip");
                infoToolTip.attr("aria-hidden", "false");
                infoToolTip.css("display", "block");
            }
        })

        $("button[id^='infoExit']").click(function () {
            var info = "#info" + $(this).attr("id").substr(8, 1);
            $(info).attr("aria-expanded", "false");
            var infoToolTip = $(info + "ToolTip");
            infoToolTip.attr("aria-hidden", "true");
            infoToolTip.css("display", "none");
        })

        // https://stackoverflow.com/questions/47226824/iphonex-and-notch-detection
        // Really basic check for the ios platform
        // https://stackoverflow.com/questions/9038625/detect-if-device-is-ios
        var iOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;

        // Get the device pixel ratio
        var ratio = window.devicePixelRatio || 1;

        // Define the users device screen dimensions
        var screen = {
            width : window.screen.width * ratio,
            height : window.screen.height * ratio
        };

        // iPhone X Detection
        if (iOS && screen.width == 1125 && screen.height === 2436) {
            document.getElementById("mainBody").style.padding =
                "env(safe-area-inset-top) env(safe-area-inset-right) env(safe-area-inset-bottom) env(safe-area-inset-left)";
        }
    });

    var timer; // 디바운싱
    window.addEventListener('resize', function () {
        clearTimeout(timer);
        timer = setTimeout(landscapeHandler, 300);
    });
