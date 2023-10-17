function isNaverApp() {
    var isNaverAppInHint = (navigator.userAgentData && navigator.userAgentData.brands)
        ? navigator.userAgentData.brands.some(function(v) { return /naver/i.test(v.brand) })
        : false;
    var isNaverAppInUA = navigator.userAgent.indexOf('NAVER(inapp; search;') !== -1;

    return isNaverAppInHint || isNaverAppInUA;
}

function isXwhaleView() {
    var searchKey = "com.nhn.android.search";
    var ua = navigator.userAgent.toLowerCase();
    return ua.indexOf(searchKey.toLowerCase()) !== -1;
}

function isNaverAppOrXwhaleView() {
    return isNaverApp() || isXwhaleView();
}

function isInNaverSignView() {
    var ua = navigator.userAgent.toLowerCase();
    var isNaverAppInHint = (navigator.userAgentData && navigator.userAgentData.brands)
        ? navigator.userAgentData.brands.some(function(v) { return /naver/i.test(v.brand) })
        : false;
    if(ua.indexOf("naver(inapp; search;") !== -1 || isNaverAppInHint) {
        return true;
    }

    if(isIOS()) {
        return isNaverApp() && ua.indexOf("loginmod") === -1;
    } else {
        return isNaverApp() || ua.indexOf("loginmod") !== -1;
    }
}

function isSignableWhaleBrowser() {
    var isWhaleUserAgentData = (navigator.userAgentData && navigator.userAgentData.brands)
        ? navigator.userAgentData.brands.some(function (v) {return /Whale/i.test(v.brand)})
        : false;
    return !isInNaverSignView() && (navigator.userAgent.toLowerCase().indexOf("whale") || isWhaleUserAgentData) && window.whaleNaverSign !== undefined
}

function isIpad() {
    var userAgent = navigator.userAgent.toLowerCase();
    return (userAgent.search("ipad") > -1) && !isIpod();
}

function isIpod() {
    var userAgent = navigator.userAgent.toLowerCase();

    return (userAgent.search("ipod") > -1);
}

function isIOS()
{
    var userAgent = navigator.userAgent.toLowerCase();
    if ((userAgent.search("iphone") > -1) || (userAgent.search("ipad") > -1) || (navigator.userAgentData && navigator.userAgentData.platform.indexOf('iOS') !== -1))
    {
        return true;
    }
    return false;
}

function inAppPageClose() {
    if(isIOS()) {
        location.href = "naverapp://closewindow";
    } else {
        window.close();

        location.replace("https://nid.naver.com/com.nhn.login_global/inweb/finish");
    }
}

function inAppPageCloseForRealname() {
    if(isNaverApp()) {
        location.href = "naverapp://closewindow";
    } else {
        window.close();

        location.replace("https://nid.naver.com/com.nhn.login_global/inweb/finish");
    }
}


function inAppGoToNaverMain() {
    if(isIOS()) {
        location.href = "https://m.naver.com";
    } else {
        location.href = "naversearchapp://default?version=5";
    }
}

function isSignableThisNaverApp() {
    if(!isInNaverSignView()) {
        return false;
    }

    var ua = window.navigator.userAgent;
    var appVersion = "";
    var startStr = "";
    var subStr = "";
    if(isNaverApp()) {
        startStr = "NAVER(";
        subStr = ua.substring(ua.indexOf(startStr), ua.length);
        subStr = subStr.substring(subStr.indexOf("("), subStr.indexOf(")"));
        appVersion = subStr.split(";")[3].trim();
    } else {
        startStr = "com.nhn.android.search/";
        subStr = ua.substring(ua.indexOf(startStr), ua.length);
        appVersion = subStr.split("/")[1].split("(")[0];
    }
    var appVerArray = appVersion.split(".");
    var majorVersion = parseInt(appVerArray[0]);
    var midVersion = parseInt(appVerArray[1]);
    var minorVersion = parseInt(appVerArray[2]);

    if(isIOS()) {
        if (majorVersion < 10) {
            return false;
        }
        if (majorVersion === 10 && midVersion < 5) {
            return false;
        }
    } else {
        if (majorVersion < 10) {
            return false;
        }
        if (majorVersion === 10 && midVersion < 5) {
            return false;
        } else if(majorVersion === 10 && midVersion === 5 && minorVersion < 4) {
            return false;
        }
    }
    return true;
}

function hideNaverAppToolbarSlowly() {
    if (isNaverApp()) {
        if(isIOS()) {
            location.href = "naverapp://fullscreen?top=show";
        } else {
            location.href = "naverapp://fullscreen?top=show";
            setTimeout(function() {
                location.href = "naverapp://fullscreen?top=show";
            }, 500);
        }

    }
}

function isMsIeNotSupportedVersion() {
    var ua = navigator.userAgent.toLowerCase();
    return ua.indexOf("msie 8.0".toLowerCase()) !== -1 || ua.indexOf("msie 9.0".toLowerCase()) !== -1;
}