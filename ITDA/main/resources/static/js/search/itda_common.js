!function(e) {
    var t = {};
    function n(r) {
        if (t[r])
            return t[r].exports;
        var i = t[r] = {
            i: r,
            l: !1,
            exports: {}
        };
        return e[r].call(i.exports, i, i.exports, n),
        i.l = !0,
        i.exports
    }
    n.m = e,
    n.c = t,
    n.d = function(e, t, r) {
        n.o(e, t) || Object.defineProperty(e, t, {
            enumerable: !0,
            get: r
        })
    }
    ,
    n.r = function(e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
            value: "Module"
        }),
        Object.defineProperty(e, "__esModule", {
            value: !0
        })
    }
    ,
    n.t = function(e, t) {
        if (1 & t && (e = n(e)),
        8 & t)
            return e;
        if (4 & t && "object" == typeof e && e && e.__esModule)
            return e;
        var r = Object.create(null);
        if (n.r(r),
        Object.defineProperty(r, "default", {
            enumerable: !0,
            value: e
        }),
        2 & t && "string" != typeof e)
            for (var i in e)
                n.d(r, i, function(t) {
                    return e[t]
                }
                .bind(null, i));
        return r
    }
    ,
    n.n = function(e) {
        var t = e && e.__esModule ? function() {
            return e.default
        }
        : function() {
            return e
        }
        ;
        return n.d(t, "a", t),
        t
    }
    ,
    n.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }
    ,
    n.p = "",
    n(n.s = 100)
}({
    0: function(e, t) {
        var n = "https://nelo2-col.navercorp.com/_store"
          , r = 3e3
          , i = {
            projectName: "one-front",
            projectVersion: "1.0.0",
            ua: navigator.userAgent || "-",
            url: location.href || "-",
            host: svr || "-"
        }
          , o = !1
          , a = 1;
        function s(e) {
            try {
                if (!o)
                    return;
                if (!e || !e.error || !XMLHttpRequest)
                    return;
                if ("string" == typeof e.error) {
                    var t = e.error || "-";
                    e.textStatus && e.textStatus.length > 0 && (t = t + " / textStatus = " + e.textStatus),
                    "object" == typeof e.jqXHR && (t = t + " / status = " + e.jqXHR.status + " / statusText = " + e.jqXHR.statusText),
                    e.errorThrown && e.errorThrown.length > 0 && (t = t + " / errorThrown : " + e.errorThrown),
                    i.body = t
                } else {
                    var s = e.error || e.error.error;
                    i.body = s.message || "-",
                    i.lineno = s.lineno > -1 ? s.lineno : -1,
                    i.colno = s.colno > -1 ? s.colno : -1,
                    i.filename = s.filename || "-"
                }
                i.logLevel = e.logLevel;
                try {
                    i.pid = lcs_get_lpid()
                } catch (e) {
                    i.pid = ""
                }
                if (a > nelo.maxCount)
                    return;
                a == nelo.maxCount && (i.body = i.body + " / " + nelo.maxSendMessage);
                var u = new XMLHttpRequest;
                u.open("POST", n, !0),
                u.timeout = r,
                u.send(JSON.stringify(i)),
                setTimeout(function() {
                    4 !== u.readyState && u.abort()
                }, r),
                a++
            } catch (e) {}
        }
        e.exports = {
            init: function(e) {
                99 * Math.random() + 1 <= nelo.sampleNumber && function(e) {
                    o = e
                }(!0),
                1 == e && window.addEventListener && window.addEventListener("error", this.sendErrorToNelo)
            },
            sendErrorToNelo: function(e, t, n, r) {
                s({
                    logLevel: "ERROR",
                    error: e,
                    jqXHR: t,
                    textStatus: n,
                    errorThrown: r
                })
            },
            sendWarnToNelo: function(e, t, n, r) {
                s({
                    logLevel: "WARN",
                    error: e,
                    jqXHR: t,
                    textStatus: n,
                    errorThrown: r
                })
            },
            sendInfoToNelo: function(e, t, n, r) {
                s({
                    logLevel: "INFO",
                    error: e,
                    jqXHR: t,
                    textStatus: n,
                    errorThrown: r
                })
            }
        }
    },
    100: function(e, t, n) {
        e.exports = n(101)
    },
    101: function(e, t, n) {
        n(102),
        n(6),
        n(103),
        n(0).init(!0)
    },
    102: function(e, t) {
        !function(e) {
            var t = {
                nnb: !0
            }
              , n = {}
              , r = {}
              , i = {}
              , o = 0;
            function a(e) {
                window.lcs_SerName || (window.lcs_SerName = "lcs.naver.com");
                var a, s, u, f = "", l = document, d = window.location;
                try {
                    u = (d.protocol ? d.protocol : "http:") + "//" + window.lcs_SerName + "/m?"
                } catch (e) {
                    return
                }
                try {
                    f = u + "u=" + encodeURIComponent(d.href) + "&e=" + (l.referrer ? encodeURIComponent(l.referrer) : "")
                } catch (e) {}
                try {
                    for (a in void 0 === n.i && (n.i = ""),
                    o < 1 && (function() {
                        r.os = function() {
                            var e = "";
                            try {
                                navigator.platform && (e = navigator.platform)
                            } catch (e) {}
                            return e
                        }(),
                        r.ln = function() {
                            var e = "";
                            try {
                                navigator.userLanguage ? e = navigator.userLanguage : navigator.language && (e = navigator.language)
                            } catch (e) {}
                            return e
                        }(),
                        r.sr = function() {
                            var e = "";
                            try {
                                if (window.screen && screen.width && screen.height)
                                    e = screen.width + "x" + screen.height;
                                else if (window.java || self.java) {
                                    var t = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
                                    e = t.width + "x" + t.height
                                }
                            } catch (t) {
                                e = ""
                            }
                            return e
                        }(),
                        r.pr = window.devicePixelRatio || 1;
                        var e = function() {
                            var e = document
                              , t = {
                                bw: "",
                                bh: ""
                            };
                            try {
                                t.bw = e.documentElement.clientWidth ? e.documentElement.clientWidth : e.body.clientWidth,
                                t.bh = e.documentElement.clientHeight ? e.documentElement.clientHeight : e.body.clientHeight
                            } catch (e) {}
                            return t
                        }();
                        r.bw = e.bw,
                        r.bh = e.bh,
                        r.c = function() {
                            var e = "";
                            try {
                                if (window.screen)
                                    e = screen.colorDepth ? screen.colorDepth : screen.pixelDepth;
                                else if (window.java || self.java) {
                                    var t = java.awt.Toolkit.getDefaultToolkit().getColorModel().getPixelSize();
                                    e = t
                                }
                            } catch (t) {
                                e = ""
                            }
                            return e
                        }(),
                        r.j = function() {
                            var e = "";
                            try {
                                e = navigator.javaEnabled() ? "Y" : "N"
                            } catch (e) {}
                            return e
                        }(),
                        r.k = function() {
                            var e = "";
                            try {
                                e = navigator.cookieEnabled ? "Y" : "N"
                            } catch (e) {}
                            return e
                        }()
                    }(),
                    t.nnb && function() {
                        try {
                            var e = localStorage;
                            if (e) {
                                if (e.ls) {
                                    var t = e.ls;
                                    if (13 == t.length)
                                        return void (n.ls = t)
                                }
                                var r = function() {
                                    try {
                                        var e, t, n, r = document.cookie, i = r.split(";");
                                        for (n = 0; n < i.length; n++)
                                            if (e = i[n].substr(0, i[n].indexOf("=")),
                                            t = i[n].substr(i[n].indexOf("=") + 1),
                                            "NNB" == (e = e.replace(/^\s+|\s+$/g, "")))
                                                return unescape(t)
                                    } catch (e) {}
                                }();
                                null != r && "" != r && (e.ls = r,
                                n.ls = r)
                            }
                        } catch (e) {}
                    }(),
                    n.ct = function() {
                        var e = "";
                        try {
                            var t = navigator.connection || navigator.mozConnection || navigator.webkitConnection;
                            if (t && void 0 !== t.type)
                                switch (t.type) {
                                case t.CELL_2G:
                                    e = "2g";
                                    break;
                                case t.CELL_3G:
                                    e = "3g";
                                    break;
                                case t.CELL_4G:
                                    e = "4g";
                                    break;
                                case t.WIFI:
                                    e = "wifi";
                                    break;
                                case t.ETHERNET:
                                    e = "eth";
                                    break;
                                case t.UNKNOWN:
                                    e = "unknown";
                                    break;
                                case t.NONE:
                                    e = "none";
                                    break;
                                default:
                                    e = ""
                                }
                            else if ("undefined" != typeof blackberry && void 0 !== blackberry.network) {
                                var n = blackberry.network;
                                e = "Wi-Fi" == n ? "wifi" : "3G" == n ? "3g" : n
                            } else {
                                var r = "Microsoft Internet Explorer" == navigator.appName
                                  , i = navigator.userAgent.indexOf("MAC") >= 0;
                                if (r && !i && o && o.addBehavior) {
                                    var o = document.body
                                      , a = o.addBehavior("#default#clientCaps");
                                    e = o.connectionType,
                                    o.removeBehavior(a)
                                }
                            }
                        } catch (e) {
                            console.warn(e)
                        }
                        return e
                    }(),
                    function() {
                        var e = window.performance || {};
                        if (e.timing) {
                            var t = e.timing;
                            for (var n in t) {
                                var r = t[n];
                                "number" == typeof r && (i[n] = r)
                            }
                        }
                    }(),
                    function() {
                        var e = window.performance || {};
                        try {
                            if (e.getEntriesByType) {
                                var t = e.getEntriesByType("paint");
                                t.forEach(function(e, t, n) {
                                    var r = e.name;
                                    switch (r) {
                                    case "first-paint":
                                    case "first-contentful-paint":
                                        i[r] = e.startTime
                                    }
                                })
                            }
                        } catch (e) {
                            console.warn(e)
                        }
                    }(),
                    function() {
                        var e = function() {
                            var e = window.performance || {};
                            if (e.navigation)
                                return e.navigation.type;
                            return
                        }();
                        void 0 !== e && (i.ngt = e)
                    }()),
                    r)
                        "function" != typeof r[a] && (f += "&" + a + "=" + encodeURIComponent(r[a]));
                    for (a in n)
                        void 0 !== (s = n[a]) && "function" != typeof s && (f += "&" + a + "=" + encodeURIComponent(s));
                    if (o < 1)
                        for (a in i)
                            (s = i[a]) && (f += "&" + a + "=" + encodeURIComponent(s));
                    for (a in e)
                        (a.length >= 3 && "function" != typeof e[a] || "qy" === a) && (f += "&" + a + "=" + encodeURIComponent(e[a]));
                    var h;
                    if (!1 == !!e || !1 == !!e.pid)
                        h = window.g_pid ? g_pid : c(),
                        f += "&pid=" + encodeURIComponent(h);
                    f += "&ts=" + (new Date).getTime(),
                    f += "&EOU";
                    var g = document.createElement("img");
                    return g.src = f,
                    g.onload = function() {
                        g.onload = null
                    }
                    ,
                    o++,
                    f.replace(u, "")
                } catch (e) {
                    return
                }
            }
            var s = null;
            function u() {
                var e, t = localStorage.ls;
                t ? e = t : e = navigator.userAgent + Math.random();
                var n, r = window.performance || {}, i = location.href;
                return n = r.now ? r.now() : (new Date).getTime(),
                s = f.md5(e + i + n)
            }
            function c() {
                return null === s && (s = u()),
                s
            }
            var f = {};
            !function(e) {
                function t(e, t) {
                    var n = (65535 & e) + (65535 & t);
                    return (e >> 16) + (t >> 16) + (n >> 16) << 16 | 65535 & n
                }
                function n(e, n, r, i, o, a) {
                    return t(function(e, t) {
                        return e << t | e >>> 32 - t
                    }(t(t(n, e), t(i, a)), o), r)
                }
                function r(e, t, r, i, o, a, s) {
                    return n(t & r | ~t & i, e, t, o, a, s)
                }
                function i(e, t, r, i, o, a, s) {
                    return n(t & i | r & ~i, e, t, o, a, s)
                }
                function o(e, t, r, i, o, a, s) {
                    return n(t ^ r ^ i, e, t, o, a, s)
                }
                function a(e, t, r, i, o, a, s) {
                    return n(r ^ (t | ~i), e, t, o, a, s)
                }
                function s(e, n) {
                    var s, u, c, f, l;
                    e[n >> 5] |= 128 << n % 32,
                    e[14 + (n + 64 >>> 9 << 4)] = n;
                    var d = 1732584193
                      , h = -271733879
                      , g = -1732584194
                      , m = 271733878;
                    for (s = 0; s < e.length; s += 16)
                        u = d,
                        c = h,
                        f = g,
                        l = m,
                        h = a(h = a(h = a(h = a(h = o(h = o(h = o(h = o(h = i(h = i(h = i(h = i(h = r(h = r(h = r(h = r(h, g = r(g, m = r(m, d = r(d, h, g, m, e[s], 7, -680876936), h, g, e[s + 1], 12, -389564586), d, h, e[s + 2], 17, 606105819), m, d, e[s + 3], 22, -1044525330), g = r(g, m = r(m, d = r(d, h, g, m, e[s + 4], 7, -176418897), h, g, e[s + 5], 12, 1200080426), d, h, e[s + 6], 17, -1473231341), m, d, e[s + 7], 22, -45705983), g = r(g, m = r(m, d = r(d, h, g, m, e[s + 8], 7, 1770035416), h, g, e[s + 9], 12, -1958414417), d, h, e[s + 10], 17, -42063), m, d, e[s + 11], 22, -1990404162), g = r(g, m = r(m, d = r(d, h, g, m, e[s + 12], 7, 1804603682), h, g, e[s + 13], 12, -40341101), d, h, e[s + 14], 17, -1502002290), m, d, e[s + 15], 22, 1236535329), g = i(g, m = i(m, d = i(d, h, g, m, e[s + 1], 5, -165796510), h, g, e[s + 6], 9, -1069501632), d, h, e[s + 11], 14, 643717713), m, d, e[s], 20, -373897302), g = i(g, m = i(m, d = i(d, h, g, m, e[s + 5], 5, -701558691), h, g, e[s + 10], 9, 38016083), d, h, e[s + 15], 14, -660478335), m, d, e[s + 4], 20, -405537848), g = i(g, m = i(m, d = i(d, h, g, m, e[s + 9], 5, 568446438), h, g, e[s + 14], 9, -1019803690), d, h, e[s + 3], 14, -187363961), m, d, e[s + 8], 20, 1163531501), g = i(g, m = i(m, d = i(d, h, g, m, e[s + 13], 5, -1444681467), h, g, e[s + 2], 9, -51403784), d, h, e[s + 7], 14, 1735328473), m, d, e[s + 12], 20, -1926607734), g = o(g, m = o(m, d = o(d, h, g, m, e[s + 5], 4, -378558), h, g, e[s + 8], 11, -2022574463), d, h, e[s + 11], 16, 1839030562), m, d, e[s + 14], 23, -35309556), g = o(g, m = o(m, d = o(d, h, g, m, e[s + 1], 4, -1530992060), h, g, e[s + 4], 11, 1272893353), d, h, e[s + 7], 16, -155497632), m, d, e[s + 10], 23, -1094730640), g = o(g, m = o(m, d = o(d, h, g, m, e[s + 13], 4, 681279174), h, g, e[s], 11, -358537222), d, h, e[s + 3], 16, -722521979), m, d, e[s + 6], 23, 76029189), g = o(g, m = o(m, d = o(d, h, g, m, e[s + 9], 4, -640364487), h, g, e[s + 12], 11, -421815835), d, h, e[s + 15], 16, 530742520), m, d, e[s + 2], 23, -995338651), g = a(g, m = a(m, d = a(d, h, g, m, e[s], 6, -198630844), h, g, e[s + 7], 10, 1126891415), d, h, e[s + 14], 15, -1416354905), m, d, e[s + 5], 21, -57434055), g = a(g, m = a(m, d = a(d, h, g, m, e[s + 12], 6, 1700485571), h, g, e[s + 3], 10, -1894986606), d, h, e[s + 10], 15, -1051523), m, d, e[s + 1], 21, -2054922799), g = a(g, m = a(m, d = a(d, h, g, m, e[s + 8], 6, 1873313359), h, g, e[s + 15], 10, -30611744), d, h, e[s + 6], 15, -1560198380), m, d, e[s + 13], 21, 1309151649), g = a(g, m = a(m, d = a(d, h, g, m, e[s + 4], 6, -145523070), h, g, e[s + 11], 10, -1120210379), d, h, e[s + 2], 15, 718787259), m, d, e[s + 9], 21, -343485551),
                        d = t(d, u),
                        h = t(h, c),
                        g = t(g, f),
                        m = t(m, l);
                    return [d, h, g, m]
                }
                function u(e) {
                    var t, n = "", r = 32 * e.length;
                    for (t = 0; t < r; t += 8)
                        n += String.fromCharCode(e[t >> 5] >>> t % 32 & 255);
                    return n
                }
                function c(e) {
                    var t, n = [];
                    for (n[(e.length >> 2) - 1] = void 0,
                    t = 0; t < n.length; t += 1)
                        n[t] = 0;
                    var r = 8 * e.length;
                    for (t = 0; t < r; t += 8)
                        n[t >> 5] |= (255 & e.charCodeAt(t / 8)) << t % 32;
                    return n
                }
                function l(e) {
                    var t, n, r = "";
                    for (n = 0; n < e.length; n += 1)
                        t = e.charCodeAt(n),
                        r += "0123456789abcdef".charAt(t >>> 4 & 15) + "0123456789abcdef".charAt(15 & t);
                    return r
                }
                function d(e) {
                    return unescape(encodeURIComponent(e))
                }
                function h(e) {
                    return function(e) {
                        return u(s(c(e), 8 * e.length))
                    }(d(e))
                }
                function g(e, t) {
                    return function(e, t) {
                        var n, r, i = c(e), o = [], a = [];
                        for (o[15] = a[15] = void 0,
                        i.length > 16 && (i = s(i, 8 * e.length)),
                        n = 0; n < 16; n += 1)
                            o[n] = 909522486 ^ i[n],
                            a[n] = 1549556828 ^ i[n];
                        return r = s(o.concat(c(t)), 512 + 8 * t.length),
                        u(s(a.concat(r), 640))
                    }(d(e), d(t))
                }
                f.md5 = function(e, t, n) {
                    return t ? n ? g(t, e) : function(e, t) {
                        return l(g(e, t))
                    }(t, e) : n ? h(e) : function(e) {
                        return l(h(e))
                    }(e)
                }
            }(),
            e.lcs_do = a,
            e.lcs_do_gdid = function(e, t) {
                try {
                    if (e)
                        return n.i = e,
                        t ? a(t) : a()
                } catch (e) {}
            }
            ,
            e.lcs_get_lpid = c,
            e.lcs_update_lpid = function() {
                return s = u()
            }
            ,
            e.lcs_version = "v0.6.0"
        }(window)
    },
    103: function(e, t, n) {
        var r;
        "object" != typeof _paq && (_paq = []),
        "object" != typeof window.Matomo && (window.Matomo = window.Piwik = function() {
            var n, i, o, a = {}, s = {}, u = document, c = navigator, f = screen, l = window, d = l.performance || l.mozPerformance || l.msPerformance || l.webkitPerformance, h = l.encodeURIComponent, g = l.decodeURIComponent, m = (unescape,
            []), p = [], v = 0, T = 0, C = 0, b = !1;
            function w(e) {
                try {
                    return g(e)
                } catch (t) {
                    return unescape(e)
                }
            }
            function y(e) {
                return "undefined" !== typeof e
            }
            function N(e) {
                return "object" == typeof e
            }
            function k(e) {
                return "string" == typeof e || e instanceof String
            }
            function E(e) {
                return y(e) && (function(e) {
                    return "number" == typeof e || e instanceof Number
                }(e) || k(e) && e.length)
            }
            function _(e) {
                "undefined" !== typeof console && console && console.error && console.error(e)
            }
            function S() {
                var e, t, n, r, i;
                for (e = 0; e < arguments.length; e += 1) {
                    var a, s;
                    if (i = null,
                    arguments[e] && arguments[e].slice && (i = arguments[e].slice()),
                    k(n = (r = arguments[e]).shift()) && n.indexOf("::") > 0)
                        s = (a = n.split("::"))[0],
                        n = a[1],
                        "object" == typeof o[s] && "function" == typeof o[s][n] ? o[s][n].apply(o[s], r) : i && p.push(i);
                    else
                        for (t = 0; t < m.length; t++)
                            if (k(n)) {
                                s = m[t];
                                var u = n.indexOf(".") > 0;
                                if (u)
                                    if (a = n.split("."),
                                    s && "object" == typeof s[a[0]])
                                        s = s[a[0]],
                                        n = a[1];
                                    else if (i) {
                                        p.push(i);
                                        break
                                    }
                                if (s[n])
                                    s[n].apply(s, r);
                                else {
                                    var c = "The method '" + n + '\' was not found in "_paq" variable.  Please have a look at the Matomo tracker documentation: https://developer.matomo.org/api-reference/tracking-javascript';
                                    if (_(c),
                                    !u)
                                        throw new TypeError(c)
                                }
                                if ("addTracker" === n)
                                    break;
                                if ("setTrackerUrl" === n || "setSiteId" === n)
                                    break
                            } else
                                n.apply(m[t], r)
                }
            }
            function A(e, t, n, r) {
                return e.addEventListener ? (e.addEventListener(t, n, r),
                !0) : e.attachEvent ? e.attachEvent("on" + t, n) : void (e["on" + t] = n)
            }
            function O(e) {
                "complete" === u.readyState ? e() : l.addEventListener ? l.addEventListener("load", e, !1) : l.attachEvent && l.attachEvent("onload", e)
            }
            function L(e) {
                var t = !1;
                (t = u.attachEvent ? "complete" === u.readyState : "loading" !== u.readyState) ? e() : (u.addEventListener ? A(u, "DOMContentLoaded", function n() {
                    u.removeEventListener("DOMContentLoaded", n, !1),
                    t || (t = !0,
                    e())
                }) : u.attachEvent && (u.attachEvent("onreadystatechange", function n() {
                    "complete" === u.readyState && (u.detachEvent("onreadystatechange", n),
                    t || (t = !0,
                    e()))
                }),
                u.documentElement.doScroll && l === l.top && function n() {
                    if (!t) {
                        try {
                            u.documentElement.doScroll("left")
                        } catch (e) {
                            return void setTimeout(n, 0)
                        }
                        t = !0,
                        e()
                    }
                }()),
                A(l, "load", function() {
                    t || (t = !0,
                    e())
                }, !1))
            }
            function x(e, t, n) {
                if (!e)
                    return "";
                var r, i, o = "";
                for (r in a)
                    Object.prototype.hasOwnProperty.call(a, r) && (a[r] && "function" == typeof a[r][e]) && (i = (0,
                    a[r][e])(t || {}, n)) && (o += i);
                return o
            }
            function I(e) {
                var t = new RegExp("^([a-z]+):").exec(e);
                return t ? t[1] : null
            }
            function R(e) {
                var t = new RegExp("^(?:(?:https?|ftp):)/*(?:[^@]+@)?([^:/#]+)").exec(e);
                return t ? t[1] : e
            }
            function P(e) {
                return /^[0-9][0-9]*(\.[0-9]+)?$/.test(e)
            }
            function q(e, t) {
                return 0 === (e = String(e)).lastIndexOf(t, 0)
            }
            function M(e, t) {
                return -1 !== (e = String(e)).indexOf(t, e.length - t.length)
            }
            function U(e, t) {
                return (e = String(e)).substr(0, e.length - t)
            }
            function j(e, t) {
                if (-1 === (e = String(e)).indexOf("?" + t + "=") && -1 === e.indexOf("&" + t + "="))
                    return e;
                var n = e.indexOf("?");
                if (-1 === n)
                    return e;
                var r = e.substr(n + 1)
                  , i = e.substr(0, n);
                if (r) {
                    var o = ""
                      , a = r.indexOf("#");
                    -1 !== a && (o = r.substr(a + 1),
                    r = r.substr(0, a));
                    for (var s = r.split("&"), u = s.length - 1; u >= 0; u--)
                        s[u].split("=")[0] === t && s.splice(u, 1);
                    var c = s.join("&");
                    c && (i = i + "?" + c),
                    o && (i += "#" + o)
                }
                return i
            }
            function D(e, t) {
                var n = new RegExp("[\\?&#]" + t + "=([^&#]*)").exec(e);
                return n ? w(n[1]) : ""
            }
            function V(e) {
                return e && String(e) === e ? e.replace(/^\s+|\s+$/g, "") : e
            }
            function W(e) {
                var t, n, r, i, o, a, s, u, c, f, l = function(e, t) {
                    return e << t | e >>> 32 - t
                }, d = function(e) {
                    var t, n = "";
                    for (t = 7; t >= 0; t--)
                        n += (e >>> 4 * t & 15).toString(16);
                    return n
                }, g = [], m = 1732584193, p = 4023233417, v = 2562383102, T = 271733878, C = 3285377520, b = [];
                for (f = (e = function(e) {
                    return unescape(h(e))
                }(e)).length,
                n = 0; n < f - 3; n += 4)
                    r = e.charCodeAt(n) << 24 | e.charCodeAt(n + 1) << 16 | e.charCodeAt(n + 2) << 8 | e.charCodeAt(n + 3),
                    b.push(r);
                switch (3 & f) {
                case 0:
                    n = 2147483648;
                    break;
                case 1:
                    n = e.charCodeAt(f - 1) << 24 | 8388608;
                    break;
                case 2:
                    n = e.charCodeAt(f - 2) << 24 | e.charCodeAt(f - 1) << 16 | 32768;
                    break;
                case 3:
                    n = e.charCodeAt(f - 3) << 24 | e.charCodeAt(f - 2) << 16 | e.charCodeAt(f - 1) << 8 | 128
                }
                for (b.push(n); 14 != (15 & b.length); )
                    b.push(0);
                for (b.push(f >>> 29),
                b.push(f << 3 & 4294967295),
                t = 0; t < b.length; t += 16) {
                    for (n = 0; n < 16; n++)
                        g[n] = b[t + n];
                    for (n = 16; n <= 79; n++)
                        g[n] = l(g[n - 3] ^ g[n - 8] ^ g[n - 14] ^ g[n - 16], 1);
                    for (i = m,
                    o = p,
                    a = v,
                    s = T,
                    u = C,
                    n = 0; n <= 19; n++)
                        c = l(i, 5) + (o & a | ~o & s) + u + g[n] + 1518500249 & 4294967295,
                        u = s,
                        s = a,
                        a = l(o, 30),
                        o = i,
                        i = c;
                    for (n = 20; n <= 39; n++)
                        c = l(i, 5) + (o ^ a ^ s) + u + g[n] + 1859775393 & 4294967295,
                        u = s,
                        s = a,
                        a = l(o, 30),
                        o = i,
                        i = c;
                    for (n = 40; n <= 59; n++)
                        c = l(i, 5) + (o & a | o & s | a & s) + u + g[n] + 2400959708 & 4294967295,
                        u = s,
                        s = a,
                        a = l(o, 30),
                        o = i,
                        i = c;
                    for (n = 60; n <= 79; n++)
                        c = l(i, 5) + (o ^ a ^ s) + u + g[n] + 3395469782 & 4294967295,
                        u = s,
                        s = a,
                        a = l(o, 30),
                        o = i,
                        i = c;
                    m = m + i & 4294967295,
                    p = p + o & 4294967295,
                    v = v + a & 4294967295,
                    T = T + s & 4294967295,
                    C = C + u & 4294967295
                }
                return (c = d(m) + d(p) + d(v) + d(T) + d(C)).toLowerCase()
            }
            function G(e) {
                var t = e.length;
                return "." === e.charAt(--t) && (e = e.slice(0, t)),
                "*." === e.slice(0, 2) && (e = e.slice(1)),
                -1 !== e.indexOf("/") && (e = e.substr(0, e.indexOf("/"))),
                e
            }
            function H(e) {
                return e ? !y(e.children) && y(e.childNodes) ? e.children : y(e.children) ? e.children : [] : []
            }
            function B(e, t) {
                if (e && e.indexOf)
                    return e.indexOf(t);
                if (!y(e) || null === e)
                    return -1;
                if (!e.length)
                    return -1;
                var n = e.length;
                if (0 === n)
                    return -1;
                for (var r = 0; r < n; ) {
                    if (e[r] === t)
                        return r;
                    r++
                }
                return -1
            }
            function F(e) {
                if (!e)
                    return !1;
                function t(e, t) {
                    return l.getComputedStyle ? u.defaultView.getComputedStyle(e, null)[t] : e.currentStyle ? e.currentStyle[t] : void 0
                }
                return function n(r, i, o, a, s, c, f) {
                    var l = r.parentNode;
                    return !!function(e) {
                        for (e = e.parentNode; e; ) {
                            if (e === u)
                                return !0;
                            e = e.parentNode
                        }
                        return !1
                    }(r) && (9 === l.nodeType || "0" !== t(r, "opacity") && "none" !== t(r, "display") && "hidden" !== t(r, "visibility") && (y(i) && y(o) && y(a) && y(s) && y(c) && y(f) || (i = r.offsetTop,
                    s = r.offsetLeft,
                    a = i + r.offsetHeight,
                    o = s + r.offsetWidth,
                    c = r.offsetWidth,
                    f = r.offsetHeight),
                    (e !== r || 0 !== f && 0 !== c || "hidden" !== t(r, "overflow")) && (!l || ("hidden" !== t(l, "overflow") && "scroll" !== t(l, "overflow") || !(s + 1 > l.offsetWidth + l.scrollLeft || s + c - 1 < l.scrollLeft || i + 1 > l.offsetHeight + l.scrollTop || i + f - 1 < l.scrollTop)) && (r.offsetParent === l && (s += l.offsetLeft,
                    i += l.offsetTop),
                    n(l, i, o, a, s, c, f)))))
                }(e)
            }
            var z = {
                htmlCollectionToArray: function(e) {
                    var t, n = [];
                    if (!e || !e.length)
                        return n;
                    for (t = 0; t < e.length; t++)
                        n.push(e[t]);
                    return n
                },
                find: function(e) {
                    if (!document.querySelectorAll || !e)
                        return [];
                    var t = document.querySelectorAll(e);
                    return this.htmlCollectionToArray(t)
                },
                findMultiple: function(e) {
                    if (!e || !e.length)
                        return [];
                    var t, n, r = [];
                    for (t = 0; t < e.length; t++)
                        n = this.find(e[t]),
                        r = r.concat(n);
                    return r = this.makeNodesUnique(r)
                },
                findNodesByTagName: function(e, t) {
                    if (!e || !t || !e.getElementsByTagName)
                        return [];
                    var n = e.getElementsByTagName(t);
                    return this.htmlCollectionToArray(n)
                },
                makeNodesUnique: function(e) {
                    var t = [].concat(e);
                    if (e.sort(function(e, n) {
                        if (e === n)
                            return 0;
                        var r = B(t, e)
                          , i = B(t, n);
                        return r === i ? 0 : r > i ? -1 : 1
                    }),
                    e.length <= 1)
                        return e;
                    var n, r = 0, i = 0, o = [];
                    for (n = e[r++]; n; )
                        n === e[r] && (i = o.push(r)),
                        n = e[r++] || null;
                    for (; i--; )
                        e.splice(o[i], 1);
                    return e
                },
                getAttributeValueFromNode: function(e, t) {
                    if (this.hasNodeAttribute(e, t)) {
                        if (e && e.getAttribute)
                            return e.getAttribute(t);
                        if (e && e.attributes)
                            if ("undefined" !== typeof e.attributes[t]) {
                                if (e.attributes[t].value)
                                    return e.attributes[t].value;
                                if (e.attributes[t].nodeValue)
                                    return e.attributes[t].nodeValue;
                                var n, r = e.attributes;
                                if (r) {
                                    for (n = 0; n < r.length; n++)
                                        if (r[n].nodeName === t)
                                            return r[n].nodeValue;
                                    return null
                                }
                            }
                    }
                },
                hasNodeAttributeWithValue: function(e, t) {
                    return !!this.getAttributeValueFromNode(e, t)
                },
                hasNodeAttribute: function(e, t) {
                    return e && e.hasAttribute ? e.hasAttribute(t) : !(!e || !e.attributes) && "undefined" !== typeof e.attributes[t]
                },
                hasNodeCssClass: function(e, t) {
                    if (e && t && e.className && -1 !== B("string" == typeof e.className ? e.className.split(" ") : [], t))
                        return !0;
                    return !1
                },
                findNodesHavingAttribute: function(e, t, n) {
                    if (n || (n = []),
                    !e || !t)
                        return n;
                    var r, i, o = H(e);
                    if (!o || !o.length)
                        return n;
                    for (r = 0; r < o.length; r++)
                        i = o[r],
                        this.hasNodeAttribute(i, t) && n.push(i),
                        n = this.findNodesHavingAttribute(i, t, n);
                    return n
                },
                findFirstNodeHavingAttribute: function(e, t) {
                    if (e && t) {
                        if (this.hasNodeAttribute(e, t))
                            return e;
                        var n = this.findNodesHavingAttribute(e, t);
                        return n && n.length ? n[0] : void 0
                    }
                },
                findFirstNodeHavingAttributeWithValue: function(e, t) {
                    if (e && t) {
                        if (this.hasNodeAttributeWithValue(e, t))
                            return e;
                        var n, r = this.findNodesHavingAttribute(e, t);
                        if (r && r.length)
                            for (n = 0; n < r.length; n++)
                                if (this.getAttributeValueFromNode(r[n], t))
                                    return r[n]
                    }
                },
                findNodesHavingCssClass: function(e, t, n) {
                    if (n || (n = []),
                    !e || !t)
                        return n;
                    if (e.getElementsByClassName) {
                        var r = e.getElementsByClassName(t);
                        return this.htmlCollectionToArray(r)
                    }
                    var i, o, a = H(e);
                    if (!a || !a.length)
                        return [];
                    for (i = 0; i < a.length; i++)
                        o = a[i],
                        this.hasNodeCssClass(o, t) && n.push(o),
                        n = this.findNodesHavingCssClass(o, t, n);
                    return n
                },
                findFirstNodeHavingClass: function(e, t) {
                    if (e && t) {
                        if (this.hasNodeCssClass(e, t))
                            return e;
                        var n = this.findNodesHavingCssClass(e, t);
                        return n && n.length ? n[0] : void 0
                    }
                },
                isLinkElement: function(e) {
                    if (!e)
                        return !1;
                    return -1 !== B(["a", "area"], String(e.nodeName).toLowerCase())
                },
                setAnyAttribute: function(e, t, n) {
                    e && t && (e.setAttribute ? e.setAttribute(t, n) : e[t] = n)
                }
            }
              , X = {
                CONTENT_ATTR: "data-track-content",
                CONTENT_CLASS: "matomoTrackContent",
                LEGACY_CONTENT_CLASS: "piwikTrackContent",
                CONTENT_NAME_ATTR: "data-content-name",
                CONTENT_PIECE_ATTR: "data-content-piece",
                CONTENT_PIECE_CLASS: "matomoContentPiece",
                LEGACY_CONTENT_PIECE_CLASS: "piwikContentPiece",
                CONTENT_TARGET_ATTR: "data-content-target",
                CONTENT_TARGET_CLASS: "matomoContentTarget",
                LEGACY_CONTENT_TARGET_CLASS: "piwikContentTarget",
                CONTENT_IGNOREINTERACTION_ATTR: "data-content-ignoreinteraction",
                CONTENT_IGNOREINTERACTION_CLASS: "matomoContentIgnoreInteraction",
                LEGACY_CONTENT_IGNOREINTERACTION_CLASS: "piwikContentIgnoreInteraction",
                location: void 0,
                findContentNodes: function() {
                    var e = "." + this.CONTENT_CLASS
                      , t = "." + this.LEGACY_CONTENT_CLASS
                      , n = "[" + this.CONTENT_ATTR + "]";
                    return z.findMultiple([e, t, n])
                },
                findContentNodesWithinNode: function(e) {
                    if (!e)
                        return [];
                    var t = z.findNodesHavingCssClass(e, this.CONTENT_CLASS);
                    t = z.findNodesHavingCssClass(e, this.LEGACY_CONTENT_CLASS, t);
                    var n, r = z.findNodesHavingAttribute(e, this.CONTENT_ATTR);
                    if (r && r.length)
                        for (n = 0; n < r.length; n++)
                            t.push(r[n]);
                    return z.hasNodeAttribute(e, this.CONTENT_ATTR) ? t.push(e) : z.hasNodeCssClass(e, this.CONTENT_CLASS) ? t.push(e) : z.hasNodeCssClass(e, this.LEGACY_CONTENT_CLASS) && t.push(e),
                    t = z.makeNodesUnique(t)
                },
                findParentContentNode: function(e) {
                    if (e)
                        for (var t = e, n = 0; t && t !== u && t.parentNode; ) {
                            if (z.hasNodeAttribute(t, this.CONTENT_ATTR))
                                return t;
                            if (z.hasNodeCssClass(t, this.CONTENT_CLASS))
                                return t;
                            if (z.hasNodeCssClass(t, this.LEGACY_CONTENT_CLASS))
                                return t;
                            if (t = t.parentNode,
                            n > 1e3)
                                break;
                            n++
                        }
                },
                findPieceNode: function(e) {
                    var t;
                    return (t = z.findFirstNodeHavingAttribute(e, this.CONTENT_PIECE_ATTR)) || (t = z.findFirstNodeHavingClass(e, this.CONTENT_PIECE_CLASS)),
                    t || (t = z.findFirstNodeHavingClass(e, this.LEGACY_CONTENT_PIECE_CLASS)),
                    t || e
                },
                findTargetNodeNoDefault: function(e) {
                    if (e) {
                        var t = z.findFirstNodeHavingAttributeWithValue(e, this.CONTENT_TARGET_ATTR);
                        return t || ((t = z.findFirstNodeHavingAttribute(e, this.CONTENT_TARGET_ATTR)) ? t : (t = z.findFirstNodeHavingClass(e, this.CONTENT_TARGET_CLASS)) ? t : (t = z.findFirstNodeHavingClass(e, this.LEGACY_CONTENT_TARGET_CLASS)) || void 0)
                    }
                },
                findTargetNode: function(e) {
                    var t = this.findTargetNodeNoDefault(e);
                    return t || e
                },
                findContentName: function(e) {
                    if (e) {
                        var t = z.findFirstNodeHavingAttributeWithValue(e, this.CONTENT_NAME_ATTR);
                        if (t)
                            return z.getAttributeValueFromNode(t, this.CONTENT_NAME_ATTR);
                        var n = this.findContentPiece(e);
                        if (n)
                            return this.removeDomainIfIsInLink(n);
                        if (z.hasNodeAttributeWithValue(e, "title"))
                            return z.getAttributeValueFromNode(e, "title");
                        var r = this.findPieceNode(e);
                        if (z.hasNodeAttributeWithValue(r, "title"))
                            return z.getAttributeValueFromNode(r, "title");
                        var i = this.findTargetNode(e);
                        return z.hasNodeAttributeWithValue(i, "title") ? z.getAttributeValueFromNode(i, "title") : void 0
                    }
                },
                findContentPiece: function(e) {
                    if (e) {
                        var t = z.findFirstNodeHavingAttributeWithValue(e, this.CONTENT_PIECE_ATTR);
                        if (t)
                            return z.getAttributeValueFromNode(t, this.CONTENT_PIECE_ATTR);
                        var n = this.findPieceNode(e)
                          , r = this.findMediaUrlInNode(n);
                        return r ? this.toAbsoluteUrl(r) : void 0
                    }
                },
                findContentTarget: function(e) {
                    if (e) {
                        var t, n = this.findTargetNode(e);
                        if (z.hasNodeAttributeWithValue(n, this.CONTENT_TARGET_ATTR))
                            return z.getAttributeValueFromNode(n, this.CONTENT_TARGET_ATTR);
                        if (z.hasNodeAttributeWithValue(n, "href"))
                            return t = z.getAttributeValueFromNode(n, "href"),
                            this.toAbsoluteUrl(t);
                        var r = this.findPieceNode(e);
                        return z.hasNodeAttributeWithValue(r, "href") ? (t = z.getAttributeValueFromNode(r, "href"),
                        this.toAbsoluteUrl(t)) : void 0
                    }
                },
                isSameDomain: function(e) {
                    if (!e || !e.indexOf)
                        return !1;
                    if (0 === e.indexOf(this.getLocation().origin))
                        return !0;
                    var t = e.indexOf(this.getLocation().host);
                    return 8 >= t && 0 <= t
                },
                removeDomainIfIsInLink: function(e) {
                    return e && e.search && -1 !== e.search(new RegExp("^https?://[^/]+")) && this.isSameDomain(e) && ((e = e.replace(new RegExp("^.*//[^/]+"), "")) || (e = "/")),
                    e
                },
                findMediaUrlInNode: function(e) {
                    if (e) {
                        var t = e.nodeName.toLowerCase();
                        if (-1 !== B(["img", "embed", "video", "audio"], t) && z.findFirstNodeHavingAttributeWithValue(e, "src")) {
                            var n = z.findFirstNodeHavingAttributeWithValue(e, "src");
                            return z.getAttributeValueFromNode(n, "src")
                        }
                        if ("object" === t && z.hasNodeAttributeWithValue(e, "data"))
                            return z.getAttributeValueFromNode(e, "data");
                        if ("object" === t) {
                            var r, i = z.findNodesByTagName(e, "param");
                            if (i && i.length)
                                for (r = 0; r < i.length; r++)
                                    if ("movie" === z.getAttributeValueFromNode(i[r], "name") && z.hasNodeAttributeWithValue(i[r], "value"))
                                        return z.getAttributeValueFromNode(i[r], "value");
                            var o = z.findNodesByTagName(e, "embed");
                            if (o && o.length)
                                return this.findMediaUrlInNode(o[0])
                        }
                    }
                },
                trim: function(e) {
                    return V(e)
                },
                isOrWasNodeInViewport: function(e) {
                    if (!e || !e.getBoundingClientRect || 1 !== e.nodeType)
                        return !0;
                    var t = e.getBoundingClientRect()
                      , n = u.documentElement || {}
                      , r = t.top < 0;
                    r && e.offsetTop && (r = e.offsetTop + t.height > 0);
                    var i = n.clientWidth;
                    l.innerWidth && i > l.innerWidth && (i = l.innerWidth);
                    var o = n.clientHeight;
                    return l.innerHeight && o > l.innerHeight && (o = l.innerHeight),
                    (t.bottom > 0 || r) && t.right > 0 && t.left < i && (t.top < o || r)
                },
                isNodeVisible: function(e) {
                    var t = F(e)
                      , n = this.isOrWasNodeInViewport(e);
                    return t && n
                },
                buildInteractionRequestParams: function(e, t, n, r) {
                    var i = "";
                    return e && (i += "c_i=" + h(e)),
                    t && (i && (i += "&"),
                    i += "c_n=" + h(t)),
                    n && (i && (i += "&"),
                    i += "c_p=" + h(n)),
                    r && (i && (i += "&"),
                    i += "c_t=" + h(r)),
                    i && (i += "&ca=1"),
                    i
                },
                buildImpressionRequestParams: function(e, t, n) {
                    var r = "c_n=" + h(e) + "&c_p=" + h(t);
                    return n && (r += "&c_t=" + h(n)),
                    r && (r += "&ca=1"),
                    r
                },
                buildContentBlock: function(e) {
                    if (e) {
                        var t = this.findContentName(e)
                          , n = this.findContentPiece(e)
                          , r = this.findContentTarget(e);
                        return t = this.trim(t),
                        n = this.trim(n),
                        r = this.trim(r),
                        {
                            name: t || "Unknown",
                            piece: n || "Unknown",
                            target: r || ""
                        }
                    }
                },
                collectContent: function(e) {
                    if (!e || !e.length)
                        return [];
                    var t, n, r = [];
                    for (t = 0; t < e.length; t++)
                        y(n = this.buildContentBlock(e[t])) && r.push(n);
                    return r
                },
                setLocation: function(e) {
                    this.location = e
                },
                getLocation: function() {
                    var e = this.location || l.location;
                    return e.origin || (e.origin = e.protocol + "//" + e.hostname + (e.port ? ":" + e.port : "")),
                    e
                },
                toAbsoluteUrl: function(e) {
                    if ((!e || String(e) !== e) && "" !== e)
                        return e;
                    if ("" === e)
                        return this.getLocation().href;
                    if (-1 !== e.search(/^\/\//))
                        return this.getLocation().protocol + e;
                    if (-1 !== e.search(/:\/\//))
                        return e;
                    if (0 === e.indexOf("#"))
                        return this.getLocation().origin + this.getLocation().pathname + e;
                    if (0 === e.indexOf("?"))
                        return this.getLocation().origin + this.getLocation().pathname + e;
                    if (0 === e.search("^[a-zA-Z]{2,11}:"))
                        return e;
                    if (-1 !== e.search(/^\//))
                        return this.getLocation().origin + e;
                    return this.getLocation().origin + this.getLocation().pathname.match(new RegExp("(.*/)"))[0] + e
                },
                isUrlToCurrentDomain: function(e) {
                    var t = this.toAbsoluteUrl(e);
                    if (!t)
                        return !1;
                    var n = this.getLocation().origin;
                    return n === t || 0 === String(t).indexOf(n) && ":" !== String(t).substr(n.length, 1)
                },
                setHrefAttribute: function(e, t) {
                    e && t && z.setAnyAttribute(e, "href", t)
                },
                shouldIgnoreInteraction: function(e) {
                    return !!z.hasNodeAttribute(e, this.CONTENT_IGNOREINTERACTION_ATTR) || (!!z.hasNodeCssClass(e, this.CONTENT_IGNOREINTERACTION_CLASS) || !!z.hasNodeCssClass(e, this.LEGACY_CONTENT_IGNOREINTERACTION_CLASS))
                }
            };
            function J(e, t) {
                if (t)
                    return t;
                if (function(e, t) {
                    return -1 !== (e = String(e)).indexOf(t)
                }(e = X.toAbsoluteUrl(e), "?")) {
                    var n = e.indexOf("?");
                    e = e.slice(0, n)
                }
                if (M(e, "matomo.php"))
                    e = U(e, "matomo.php".length);
                else if (M(e, "piwik.php"))
                    e = U(e, "piwik.php".length);
                else if (M(e, ".php")) {
                    var r = e.lastIndexOf("/");
                    e = e.slice(0, r + 1)
                }
                return M(e, "/js/") && (e = U(e, "js/".length)),
                e
            }
            function Y(e) {
                var t = "Matomo_Overlay"
                  , n = new RegExp("index\\.php\\?module=Overlay&action=startOverlaySession&idSite=([0-9]+)&period=([^&]+)&date=([^&]+)(&segment=[^&]*)?").exec(u.referrer);
                if (n) {
                    if (n[1] !== String(e))
                        return !1;
                    var r = n[2]
                      , i = n[3]
                      , o = n[4];
                    o ? 0 === o.indexOf("&segment=") && (o = o.substr("&segment=".length)) : o = "",
                    l.name = t + "###" + r + "###" + i + "###" + o
                }
                var a = l.name.split("###");
                return 4 === a.length && a[0] === t
            }
            function Q(e, t, n) {
                var r = l.name.split("###")
                  , i = r[1]
                  , o = r[2]
                  , a = r[3]
                  , s = J(e, t);
                !function(e, t) {
                    var n = u.createElement("script");
                    n.type = "text/javascript",
                    n.src = e,
                    n.readyState ? n.onreadystatechange = function() {
                        var e = this.readyState;
                        "loaded" !== e && "complete" !== e || (n.onreadystatechange = null,
                        t())
                    }
                    : n.onload = t,
                    u.getElementsByTagName("head")[0].appendChild(n)
                }(s + "plugins/Overlay/client/client.js?v=1", function() {
                    Matomo_Overlay_Client.initialize(s, n, i, o, a)
                })
            }
            function $(e, t) {
                var r, s, p, S, U, H, F, K, Z, ee, te, ne, re, ie, oe, ae = this, se = "mtm_consent", ue = "mtm_cookie_consent", ce = "mtm_consent_removed", fe = function(e, t, n) {
                    return e || (e = ""),
                    t || (t = ""),
                    "translate.googleusercontent.com" === e ? ("" === n && (n = t),
                    e = R(t = D(t, "u"))) : "cc.bingj.com" !== e && "webcache.googleusercontent.com" !== e && "74.6." !== e.slice(0, 5) || (e = R(t = u.links[0].href)),
                    [e, t, n]
                }(u.domain, l.location.href, function() {
                    var e = "";
                    try {
                        e = l.top.document.referrer
                    } catch (t) {
                        if (l.parent)
                            try {
                                e = l.parent.document.referrer
                            } catch (t) {
                                e = ""
                            }
                    }
                    return "" === e && (e = u.referrer),
                    e
                }()), le = G(fe[0]), de = w(fe[1]), he = w(fe[2]), ge = !1, me = "GET", pe = "application/x-www-form-urlencoded; charset=UTF-8", ve = pe, Te = e || "", Ce = "", be = "", we = "", ye = t || "", Ne = "", ke = "", Ee = "", _e = ["7z", "aac", "apk", "arc", "arj", "asf", "asx", "avi", "azw3", "bin", "csv", "deb", "dmg", "doc", "docx", "epub", "exe", "flv", "gif", "gz", "gzip", "hqx", "ibooks", "jar", "jpg", "jpeg", "js", "mobi", "mp2", "mp3", "mp4", "mpg", "mpeg", "mov", "movie", "msi", "msp", "odb", "odf", "odg", "ods", "odt", "ogg", "ogv", "pdf", "phps", "png", "ppt", "pptx", "qt", "qtm", "ra", "ram", "rar", "rpm", "rtf", "sea", "sit", "tar", "tbz", "tbz2", "bz", "bz2", "tgz", "torrent", "txt", "wav", "wma", "wmv", "wpd", "xls", "xlsx", "xml", "z", "zip"], Se = [le], Ae = [], Oe = [], Le = [], xe = [], Ie = 500, Re = !0, Pe = ["pk_campaign", "mtm_campaign", "piwik_campaign", "matomo_campaign", "utm_campaign", "utm_source", "utm_medium"], qe = ["pk_kwd", "mtm_kwd", "piwik_kwd", "matomo_kwd", "utm_term"], Me = "_pk_", Ue = "pk_vid", je = 180, De = !1, Ve = "Lax", We = !1, Ge = 339552e5, He = 18e5, Be = 15768e6, Fe = !0, ze = !1, Xe = !1, Je = !1, Ye = !1, Qe = {}, $e = {}, Ke = {}, Ze = {}, et = {}, tt = {}, nt = [], rt = !1, it = !1, ot = !1, at = !1, st = !1, ut = (function() {
                    var e;
                    try {
                        e = l.frameElement
                    } catch (e) {
                        return !0
                    }
                    if (y(e))
                        return !(!e || "iframe" !== String(e.nodeName).toLowerCase());
                    try {
                        l.self,
                        l.top
                    } catch (e) {
                        return !0
                    }
                }(),
                null), ct = null, ft = W, lt = !1, dt = 0, ht = ["id", "ses", "cvar", "ref"], gt = !1, mt = null, pt = [], vt = [], Tt = C++, Ct = !1, bt = !0;
                try {
                    Ee = u.title
                } catch (e) {
                    Ee = ""
                }
                function wt(e) {
                    if (We)
                        return 0;
                    var t = new RegExp("(^|;)[ ]*" + e + "=([^;]*)").exec(u.cookie);
                    return t ? g(t[2]) : 0
                }
                function yt(e, t, n, r, i, o, a) {
                    var s;
                    We && e !== ce || (n && (s = new Date).setTime(s.getTime() + n),
                    a || (a = "Lax"),
                    u.cookie = e + "=" + h(t) + (n ? ";expires=" + s.toGMTString() : "") + ";path=" + (r || "/") + (i ? ";domain=" + i : "") + (o ? ";secure" : "") + ";SameSite=" + a,
                    (!n || n >= 0) && wt(e) !== String(t) && _("There was an error setting cookie `" + e + "`. Please check domain and path."))
                }
                function Nt(e) {
                    var t, n;
                    for (e = j(e, Ue),
                    n = 0; n < Oe.length; n++)
                        e = j(e, Oe[n]);
                    return S ? (t = new RegExp("#.*"),
                    e.replace(t, "")) : e
                }
                function kt(e, t) {
                    var n;
                    if ((e = String(e).toLowerCase()) === (t = String(t).toLowerCase()))
                        return !0;
                    if ("." === t.slice(0, 1)) {
                        if (e === t.slice(1))
                            return !0;
                        if ((n = e.length - t.length) > 0 && e.slice(n) === t)
                            return !0
                    }
                    return !1
                }
                function Et(e) {
                    var t = document.createElement("a");
                    return 0 !== e.indexOf("//") && 0 !== e.indexOf("http") && (0 === e.indexOf("*") && (e = e.substr(1)),
                    0 === e.indexOf(".") && (e = e.substr(1)),
                    e = "http://" + e),
                    t.href = X.toAbsoluteUrl(e),
                    t.pathname ? t.pathname : ""
                }
                function _t(e, t) {
                    q(t, "/") || (t = "/" + t),
                    q(e, "/") || (e = "/" + e);
                    var n = "/" === t || "/*" === t;
                    return !!n || (e === t || (t = String(t).toLowerCase(),
                    e = String(e).toLowerCase(),
                    M(t, "*") ? !!(n = !(t = t.slice(0, -1)) || "/" === t) || (e === t || 0 === e.indexOf(t)) : (M(e, "/") || (e += "/"),
                    M(t, "/") || (t += "/"),
                    0 === e.indexOf(t))))
                }
                function St(e, t) {
                    var n, r, i;
                    for (n = 0; n < Se.length; n++)
                        if (r = G(Se[n]),
                        i = Et(Se[n]),
                        kt(e, r) && _t(t, i))
                            return !0;
                    return !1
                }
                function At(e) {
                    var t, n, r;
                    for (t = 0; t < Se.length; t++) {
                        if (e === (n = G(Se[t].toLowerCase())))
                            return !0;
                        if ("." === n.slice(0, 1)) {
                            if (e === n.slice(1))
                                return !0;
                            if ((r = e.length - n.length) > 0 && e.slice(r) === n)
                                return !0
                        }
                    }
                    return !1
                }
                function Ot(e, t) {
                    e = e.replace("send_image=0", "send_image=1");
                    var n = new Image(1,1);
                    n.onload = function() {
                        i = 0,
                        "function" == typeof t && t({
                            request: e,
                            trackerUrl: Te,
                            success: !0
                        })
                    }
                    ,
                    n.onerror = function() {
                        "function" == typeof t && t({
                            request: e,
                            trackerUrl: Te,
                            success: !1
                        })
                    }
                    ,
                    n.src = Te + (Te.indexOf("?") < 0 ? "?" : "&") + e
                }
                function Lt(e) {
                    return "POST" === me || e && (e.length > 2e3 || 0 === e.indexOf('{"requests"'))
                }
                function xt(e, t, n) {
                    if (!("object" == typeof c && "function" == typeof c.sendBeacon && "function" == typeof Blob))
                        return !1;
                    var r = {
                        type: "application/x-www-form-urlencoded; charset=UTF-8"
                    }
                      , i = !1
                      , o = Te;
                    try {
                        var a = new Blob([e],r);
                        n && !Lt(e) && (a = new Blob([],r),
                        o = o + (o.indexOf("?") < 0 ? "?" : "&") + e),
                        i = c.sendBeacon(o, a)
                    } catch (e) {
                        return !1
                    }
                    return i && "function" == typeof t && t({
                        request: e,
                        trackerUrl: Te,
                        success: !0,
                        isSendBeacon: !0
                    }),
                    i
                }
                function It(e, t, n) {
                    y(n) && null !== n || (n = !0),
                    b && xt(e, t, n) || setTimeout(function() {
                        if (!b || !xt(e, t, n))
                            try {
                                var r = l.XMLHttpRequest ? new l.XMLHttpRequest : l.ActiveXObject ? new ActiveXObject("Microsoft.XMLHTTP") : null;
                                r.open("POST", Te, !0),
                                r.onreadystatechange = function() {
                                    4 !== this.readyState || this.status >= 200 && this.status < 300 ? 4 === this.readyState && "function" == typeof t && t({
                                        request: e,
                                        trackerUrl: Te,
                                        success: !0,
                                        xhr: this
                                    }) : !(b && xt(e, t, n)) && n ? Ot(e, t) : "function" == typeof t && t({
                                        request: e,
                                        trackerUrl: Te,
                                        success: !1,
                                        xhr: this
                                    })
                                }
                                ,
                                r.setRequestHeader("Content-Type", ve),
                                r.withCredentials = !0,
                                r.send(e)
                            } catch (r) {
                                !(b && xt(e, t, n)) && n ? Ot(e, t) : "function" == typeof t && t({
                                    request: e,
                                    trackerUrl: Te,
                                    success: !1
                                })
                            }
                    }, 50)
                }
                function Rt(e) {
                    var t = (new Date).getTime() + e;
                    (!n || t > n) && (n = t)
                }
                function Pt() {
                    !0,
                    ut = (new Date).getTime()
                }
                function qt() {
                    var e = (new Date).getTime();
                    return !ut || e - ut > s
                }
                function Mt() {
                    qt() && p()
                }
                function Ut() {
                    "hidden" === u.visibilityState && qt() ? p() : "visible" === u.visibilityState && (ut = (new Date).getTime())
                }
                function jt() {
                    !st && s && (st = !0,
                    A(l, "focus", Pt),
                    A(l, "blur", Mt),
                    A(l, "visibilitychange", Ut),
                    T++,
                    o.addPlugin("HeartBeat" + T, {
                        unload: function() {
                            st && qt() && p()
                        }
                    }))
                }
                function Dt(e) {
                    var t = (new Date).getTime();
                    if (ct = t,
                    it && t < it) {
                        var n = it - t;
                        return setTimeout(e, n),
                        Rt(n + 50),
                        void (it += 50)
                    }
                    if (!1 === it) {
                        it = t + 800
                    }
                    e()
                }
                function Vt(e, t, n) {
                    wt(ce) ? mt = !1 : wt(se) && (mt = !0),
                    mt ? (Ct = !0,
                    !K && e && (gt && mt && (e += "&consent=1"),
                    Dt(function() {
                        Re && xt(e, n, !0) ? Rt(100) : (Lt(e) ? It(e, n) : Ot(e, n),
                        Rt(t))
                    })),
                    st || jt()) : pt.push(e)
                }
                function Wt(e, t) {
                    (function(e) {
                        return !K && e && e.length
                    }
                    )(e) && (mt ? (Ct = !0,
                    Dt(function() {
                        for (var n, r = function(e, t) {
                            if (!t || t >= e.length)
                                return [e];
                            for (var n = 0, r = e.length, i = []; n < r; n += t)
                                i.push(e.slice(n, n + t));
                            return i
                        }(e, 50), i = 0; i < r.length; i++)
                            n = '{"requests":["?' + r[i].join('","?') + '"],"send_image":0}',
                            Re && xt(n, null, !1) ? Rt(100) : It(n, null, !1);
                        Rt(t)
                    })) : pt.push(e))
                }
                function Gt(e) {
                    return Me + e + "." + ye + "." + ie
                }
                function Ht(e, t, n) {
                    yt(e, "", -86400, t, n)
                }
                function Bt() {
                    if (We)
                        return "0";
                    if (!y(l.showModalDialog) && y(c.cookieEnabled))
                        return c.cookieEnabled ? "1" : "0";
                    var e = Me + "testcookie";
                    yt(e, "1", void 0, F, H, De, Ve);
                    var t = "1" === wt(e) ? "1" : "0";
                    return Ht(e),
                    t
                }
                function Ft() {
                    ie = ft((H || le) + (F || "/")).slice(0, 4)
                }
                function zt() {
                    if (!bt)
                        return {};
                    if (y(tt.res))
                        return tt;
                    var e, t, n = {
                        pdf: "application/pdf",
                        qt: "video/quicktime",
                        realp: "audio/x-pn-realaudio-plugin",
                        wma: "application/x-mplayer2",
                        fla: "application/x-shockwave-flash",
                        java: "application/x-java-vm",
                        ag: "application/x-silverlight"
                    };
                    if (!new RegExp("MSIE").test(c.userAgent)) {
                        if (c.mimeTypes && c.mimeTypes.length)
                            for (e in n)
                                Object.prototype.hasOwnProperty.call(n, e) && (t = c.mimeTypes[n[e]],
                                tt[e] = t && t.enabledPlugin ? "1" : "0");
                        !new RegExp("Edge[ /](\\d+[\\.\\d]+)").test(c.userAgent) && "unknown" != typeof navigator.javaEnabled && y(c.javaEnabled) && c.javaEnabled() && (tt.java = "1"),
                        !y(l.showModalDialog) && y(c.cookieEnabled) ? tt.cookie = c.cookieEnabled ? "1" : "0" : tt.cookie = Bt()
                    }
                    var r = parseInt(f.width, 10)
                      , i = parseInt(f.height, 10);
                    return tt.res = parseInt(r, 10) + "x" + parseInt(i, 10),
                    tt
                }
                function Xt() {
                    var e = wt(Gt("cvar"));
                    return e && e.length && N(e = l.JSON.parse(e)) ? e : {}
                }
                function Jt() {
                    !1 === Ye && (Ye = Xt())
                }
                function Yt() {
                    var e = zt();
                    return ft((c.userAgent || "") + (c.platform || "") + l.JSON.stringify(e)).slice(0, 6)
                }
                function Qt() {
                    return Math.floor((new Date).getTime() / 1e3)
                }
                function $t(e) {
                    if (!at)
                        return "";
                    var t = D(e, Ue);
                    if (!t)
                        return "";
                    t = String(t);
                    var n = new RegExp("^[a-zA-Z0-9]+$");
                    if (32 === t.length && n.test(t) && function(e) {
                        e = String(e);
                        var t = Yt()
                          , n = t.length
                          , r = e.substr(-1 * n, n)
                          , i = parseInt(e.substr(0, e.length - n), 10);
                        if (i && r && r === t) {
                            var o = Qt();
                            if (je <= 0)
                                return !0;
                            if (o >= i && o <= i + je)
                                return !0
                        }
                        return !1
                    }(t.substr(16, 32)))
                        return t.substr(0, 16);
                    return ""
                }
                function Kt() {
                    ke || (ke = $t(de));
                    var e, t = new Date, n = Math.round(t.getTime() / 1e3), r = wt(Gt("id"));
                    return r ? ((e = r.split(".")).unshift("0"),
                    ke.length && (e[1] = ke),
                    e) : e = ["1", ke.length ? ke : "0" === Bt() ? "" : function() {
                        var e = zt();
                        return ft((c.userAgent || "") + (c.platform || "") + l.JSON.stringify(e) + (new Date).getTime() + Math.random()).slice(0, 16)
                    }(), n]
                }
                function Zt() {
                    var e = Kt();
                    return {
                        newVisitor: e[0],
                        uuid: e[1],
                        createTs: e[2]
                    }
                }
                function en(e) {
                    if (ye) {
                        var t = new Date;
                        Math.round(t.getTime() / 1e3);
                        y(e) || (e = Zt());
                        var n = e.uuid + "." + e.createTs + ".";
                        yt(Gt("id"), n, function() {
                            var e = (new Date).getTime()
                              , t = Zt().createTs;
                            return 1e3 * parseInt(t, 10) + Ge - e
                        }(), F, H, De, Ve)
                    }
                }
                function tn() {
                    var e = wt(Gt("ref"));
                    if (e.length)
                        try {
                            if (N(e = l.JSON.parse(e)))
                                return e
                        } catch (e) {}
                    return ["", "", 0, ""]
                }
                function nn() {
                    var e, t, n = We;
                    for (We = !1,
                    e = 0; e < ht.length; e++)
                        (t = Gt(ht[e])) !== ce && t !== se && 0 !== wt(t) && Ht(t, F, H);
                    We = n
                }
                function rn(e) {
                    if (e && N(e)) {
                        var t, n = [];
                        for (t in e)
                            Object.prototype.hasOwnProperty.call(e, t) && n.push(t);
                        var r = {};
                        n.sort();
                        var i, o = n.length;
                        for (i = 0; i < o; i++)
                            r[n[i]] = e[n[i]];
                        return r
                    }
                }
                function on(e) {
                    if ("" !== we)
                        return Xe = !0,
                        e += we;
                    if (!d)
                        return e;
                    var t = "object" == typeof d.timing && d.timing ? d.timing : void 0;
                    if (t || (t = "function" == typeof d.getEntriesByType && d.getEntriesByType("navigation") ? d.getEntriesByType("navigation")[0] : void 0),
                    !t)
                        return e;
                    var n = "";
                    if (t.connectEnd && t.fetchStart) {
                        if (t.connectEnd < t.fetchStart)
                            return;
                        n += "&pf_net=" + Math.round(t.connectEnd - t.fetchStart)
                    }
                    if (t.responseStart && t.requestStart) {
                        if (t.responseStart < t.requestStart)
                            return;
                        n += "&pf_srv=" + Math.round(t.responseStart - t.requestStart)
                    }
                    if (t.responseStart && t.responseEnd) {
                        if (t.responseEnd < t.responseStart)
                            return;
                        n += "&pf_tfr=" + Math.round(t.responseEnd - t.responseStart)
                    }
                    if (y(t.domLoading)) {
                        if (t.domInteractive && t.domLoading) {
                            if (t.domInteractive < t.domLoading)
                                return;
                            n += "&pf_dm1=" + Math.round(t.domInteractive - t.domLoading)
                        }
                    } else if (t.domInteractive && t.responseEnd) {
                        if (t.domInteractive < t.responseEnd)
                            return;
                        n += "&pf_dm1=" + Math.round(t.domInteractive - t.responseEnd)
                    }
                    if (t.domComplete && t.domInteractive) {
                        if (t.domComplete < t.domInteractive)
                            return;
                        n += "&pf_dm2=" + Math.round(t.domComplete - t.domInteractive)
                    }
                    if (t.loadEventEnd && t.loadEventStart) {
                        if (t.loadEventEnd < t.loadEventStart)
                            return;
                        n += "&pf_onl=" + Math.round(t.loadEventEnd - t.loadEventStart)
                    }
                    return e + n
                }
                function an(e, t, n) {
                    var i, o, a, s, c, f, d, g = new Date, m = Math.round(g.getTime() / 1e3), p = Ye, v = Gt("ses"), T = Gt("ref"), C = Gt("cvar"), b = wt(v), w = tn(), y = r || de;
                    if (We && nn(),
                    K)
                        return "";
                    var N = Zt()
                      , k = u.characterSet || u.charset;
                    if (k && "utf-8" !== k.toLowerCase() || (k = null),
                    f = w[0],
                    d = w[1],
                    o = w[2],
                    a = w[3],
                    !b) {
                        if (!ee || !f.length) {
                            for (i in Pe)
                                if (Object.prototype.hasOwnProperty.call(Pe, i) && (f = D(y, Pe[i])).length)
                                    break;
                            for (i in qe)
                                if (Object.prototype.hasOwnProperty.call(qe, i) && (d = D(y, qe[i])).length)
                                    break
                        }
                        s = R(he),
                        c = a.length ? R(a) : "",
                        !s.length || At(s) || ee && c.length && !At(c) || (a = he),
                        (a.length || f.length) && (w = [f, d, o = m, Nt(a.slice(0, 1024))],
                        yt(T, l.JSON.stringify(w), Be, F, H, De, Ve))
                    }
                    e += "&idsite=" + ye + "&rec=1&r=" + String(Math.random()).slice(2, 8) + "&h=" + g.getHours() + "&m=" + g.getMinutes() + "&s=" + g.getSeconds() + "&url=" + h(Nt(y)) + (he.length ? "&urlref=" + h(Nt(he)) : "") + (E(Ne) ? "&uid=" + h(Ne) : "") + "&_id=" + N.uuid + "&_idn=" + N.newVisitor + (f.length ? "&_rcn=" + h(f) : "") + (d.length ? "&_rck=" + h(d) : "") + "&_refts=" + o + (String(a).length ? "&_ref=" + h(Nt(a.slice(0, 1024))) : "") + (k ? "&cs=" + h(k) : "") + "&send_image=0";
                    var _ = zt();
                    for (i in _)
                        Object.prototype.hasOwnProperty.call(_, i) && (e += "&" + i + "=" + _[i]);
                    var S = [];
                    if (t)
                        for (i in t)
                            if (Object.prototype.hasOwnProperty.call(t, i) && /^dimension\d+$/.test(i)) {
                                var A = i.replace("dimension", "");
                                S.push(parseInt(A, 10)),
                                S.push(String(A)),
                                e += "&" + i + "=" + h(t[i]),
                                delete t[i]
                            }
                    for (i in t && function(e) {
                        if (!e)
                            return !0;
                        var t, n = !0;
                        for (t in e)
                            Object.prototype.hasOwnProperty.call(e, t) && (n = !1);
                        return n
                    }(t) && (t = null),
                    Ze)
                        Object.prototype.hasOwnProperty.call(Ze, i) && (e += "&" + i + "=" + h(Ze[i]));
                    for (i in Ke) {
                        if (Object.prototype.hasOwnProperty.call(Ke, i))
                            -1 === B(S, i) && (e += "&dimension" + i + "=" + h(Ke[i]))
                    }
                    function O(e, t) {
                        var n = l.JSON.stringify(e);
                        return n.length > 2 ? "&" + t + "=" + h(n) : ""
                    }
                    t ? e += "&data=" + h(l.JSON.stringify(t)) : U && (e += "&data=" + h(l.JSON.stringify(U)));
                    var L = rn(Qe)
                      , I = rn($e);
                    if (e += O(L, "cvar"),
                    e += O(I, "e_cvar"),
                    Ye) {
                        for (i in e += O(Ye, "_cvar"),
                        p)
                            Object.prototype.hasOwnProperty.call(p, i) && ("" !== Ye[i][0] && "" !== Ye[i][1] || delete Ye[i]);
                        Je && yt(C, l.JSON.stringify(Ye), He, F, H, De, Ve)
                    }
                    return Fe && ze && !Xe && (e = on(e),
                    Xe = !0),
                    oe && (e += "&pv_id=" + oe),
                    en(N),
                    yt(Gt("ses"), "1", He, F, H, De, Ve),
                    e += x(n, {
                        tracker: ae,
                        request: e
                    }),
                    be.length && (e += "&" + be),
                    function(e) {
                        return "function" == typeof e
                    }(te) && (e = te(e)),
                    e
                }
                function sn(e, t, n, r, i, o) {
                    var a, s = "idgoal=0", u = (new Date,
                    []), c = String(e).length;
                    if (c && (s += "&ec_id=" + h(e)),
                    s += "&revenue=" + t,
                    String(n).length && (s += "&ec_st=" + n),
                    String(r).length && (s += "&ec_tx=" + r),
                    String(i).length && (s += "&ec_sh=" + i),
                    String(o).length && (s += "&ec_dt=" + o),
                    et) {
                        for (a in et)
                            Object.prototype.hasOwnProperty.call(et, a) && (y(et[a][1]) || (et[a][1] = ""),
                            y(et[a][2]) || (et[a][2] = ""),
                            y(et[a][3]) && 0 !== String(et[a][3]).length || (et[a][3] = 0),
                            y(et[a][4]) && 0 !== String(et[a][4]).length || (et[a][4] = 1),
                            u.push(et[a]));
                        s += "&ec_items=" + h(l.JSON.stringify(u))
                    }
                    Vt(s = an(s, U, "ecommerce"), Ie),
                    c && (et = {})
                }
                function un(e, t, n) {
                    lt || (oe = function() {
                        var e, t = "", n = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ", r = n.length;
                        for (e = 0; e < 6; e++)
                            t += n.charAt(Math.floor(Math.random() * r));
                        return t
                    }());
                    var r = an("action_name=" + h(function(e) {
                        if (!k(e = e && e.text ? e.text : e)) {
                            var t = u.getElementsByTagName("title");
                            t && y(t[0]) && (e = t[0].text)
                        }
                        return e
                    }(e || Ee)), t, "log");
                    Fe && !Xe && (r = on(r)),
                    Vt(r, Ie, n)
                }
                function cn(e, t) {
                    var n, r = "(^| )(piwik[_-]" + t + "|matomo[_-]" + t;
                    if (e)
                        for (n = 0; n < e.length; n++)
                            r += "|" + e[n];
                    return r += ")( |$)",
                    new RegExp(r)
                }
                function fn(e) {
                    return Te && e && 0 === String(e).indexOf(Te)
                }
                function ln(e) {
                    var t;
                    for (t = e.parentNode; null !== t && y(t) && !z.isLinkElement(e); )
                        t = (e = t).parentNode;
                    return e
                }
                function dn(e) {
                    if (e = ln(e),
                    z.hasNodeAttribute(e, "href") && y(e.href)) {
                        z.getAttributeValueFromNode(e, "href");
                        var t = e.pathname || Et(e.href)
                          , n = e.hostname || R(e.href)
                          , r = n.toLowerCase()
                          , i = e.href.replace(n, r);
                        if (!new RegExp("^(javascript|vbscript|jscript|mocha|livescript|ecmascript|mailto|tel):","i").test(i)) {
                            var o = function(e, t, n, r) {
                                if (fn(t))
                                    return 0;
                                var i = cn(Le, "download")
                                  , o = cn(xe, "link")
                                  , a = new RegExp("\\.(" + _e.join("|") + ")([?&#]|$)","i");
                                return o.test(e) ? "link" : r || i.test(e) || a.test(t) ? "download" : n ? 0 : "link"
                            }(e.className, i, St(r, t), z.hasNodeAttribute(e, "download"));
                            if (o)
                                return {
                                    type: o,
                                    href: i
                                }
                        }
                    }
                }
                function hn(e, t, n, r) {
                    var i = X.buildInteractionRequestParams(e, t, n, r);
                    if (i)
                        return an(i, null, "contentInteraction")
                }
                function gn(e, t) {
                    if (!e || !t)
                        return !1;
                    var n = X.findTargetNode(e);
                    return !X.shouldIgnoreInteraction(n) && !((n = X.findTargetNodeNoDefault(e)) && !function(e, t) {
                        return !(!e || !t) && (e.contains ? e.contains(t) : e === t || !!e.compareDocumentPosition && !!(16 & e.compareDocumentPosition(t)))
                    }(n, t))
                }
                function mn(e) {
                    if (!nt || !nt.length)
                        return !1;
                    var t, n;
                    for (t = 0; t < nt.length; t++)
                        if ((n = nt[t]) && n.name === e.name && n.piece === e.piece && n.target === e.target)
                            return !0;
                    return !1
                }
                function pn(e) {
                    return function(t) {
                        if (e) {
                            var n, r = X.findParentContentNode(e);
                            if (t && (n = t.target || t.srcElement),
                            n || (n = e),
                            gn(r, n)) {
                                if (!r)
                                    return !1;
                                var i = X.findTargetNode(r);
                                if (!i || X.shouldIgnoreInteraction(i))
                                    return !1;
                                var o = dn(i);
                                return ot && o && o.type ? o.type : ae.trackContentInteractionNode(n, "click")
                            }
                        }
                    }
                }
                function vn(e, t) {
                    if (!e || !e.length)
                        return [];
                    var n, r;
                    for (n = 0; n < e.length; n++)
                        mn(e[n]) ? (e.splice(n, 1),
                        n--) : nt.push(e[n]);
                    if (!e || !e.length)
                        return [];
                    !function(e) {
                        var t, n;
                        if (e && e.length)
                            for (t = 0; t < e.length; t++)
                                (n = X.findTargetNode(e[t])) && !n.contentInteractionTrackingSetupDone && (n.contentInteractionTrackingSetupDone = !0,
                                A(n, "click", pn(n)))
                    }(t);
                    var i = [];
                    for (n = 0; n < e.length; n++)
                        (r = an(X.buildImpressionRequestParams(e[n].name, e[n].piece, e[n].target), void 0, "contentImpressions")) && i.push(r);
                    return i
                }
                function Tn(e) {
                    return vn(X.collectContent(e), e)
                }
                function Cn(e) {
                    if (!e || !e.length)
                        return [];
                    var t;
                    for (t = 0; t < e.length; t++)
                        X.isNodeVisible(e[t]) || (e.splice(t, 1),
                        t--);
                    return e && e.length ? Tn(e) : []
                }
                function bn(e, t, n, r, i, o) {
                    if (!E(e) || !E(t))
                        return _("Error while logging event: Parameters `category` and `action` must not be empty or filled with whitespaces"),
                        !1;
                    Vt(an(function(e, t, n, r) {
                        return "e_c=" + h(e) + "&e_a=" + h(t) + (y(n) ? "&e_n=" + h(n) : "") + (y(r) ? "&e_v=" + h(r) : "") + "&ca=1"
                    }(e, t, n, r), i, "event"), Ie, o)
                }
                function wn(e, t, n, r, i) {
                    var o = t + "=" + h(Nt(e))
                      , a = function(e, t, n) {
                        if (e) {
                            var r = X.findParentContentNode(e);
                            if (r && gn(r, e)) {
                                var i = X.buildContentBlock(r);
                                if (i)
                                    return !i.target && n && (i.target = n),
                                    X.buildInteractionRequestParams(t, i.name, i.piece, i.target)
                            }
                        }
                    }(i, "click", e);
                    a && (o += "&" + a),
                    Vt(an(o, n, "link"), Ie, r)
                }
                function yn(e, t) {
                    return "" !== e ? e + t.charAt(0).toUpperCase() + t.slice(1) : t
                }
                function Nn(e) {
                    var t, n, r, i = ["", "webkit", "ms", "moz"];
                    if (!Z)
                        for (n = 0; n < i.length; n++)
                            if (r = i[n],
                            Object.prototype.hasOwnProperty.call(u, yn(r, "hidden"))) {
                                "prerender" === u[yn(r, "visibilityState")] && (t = !0);
                                break
                            }
                    t ? A(u, r + "visibilitychange", function t() {
                        u.removeEventListener(r + "visibilitychange", t, !1),
                        e()
                    }) : e()
                }
                function kn() {
                    return ae.getVisitorId() + function() {
                        var e = Qt()
                          , t = Yt();
                        return String(e) + t
                    }()
                }
                function En(e) {
                    if (e && z.hasNodeAttribute(e, "href")) {
                        var t = z.getAttributeValueFromNode(e, "href");
                        if (t && !fn(t) && ae.getVisitorId()) {
                            t = j(t, Ue);
                            var n = kn();
                            t = function(e, t, n) {
                                e = String(e),
                                n || (n = "");
                                var r = e.indexOf("#")
                                  , i = e.length;
                                -1 === r && (r = i);
                                var o = e.substr(0, r)
                                  , a = e.substr(r, i - r);
                                return -1 === o.indexOf("?") ? o += "?" : M(o, "?") || (o += "&"),
                                o + h(t) + "=" + h(n) + a
                            }(t, Ue, n),
                            z.setAnyAttribute(e, "href", t)
                        }
                    }
                }
                function _n(e) {
                    var t = dn(e);
                    if (t && t.type)
                        return t.href = w(t.href),
                        void wn(t.href, t.type, void 0, null, e);
                    at && function(e) {
                        var t = z.getAttributeValueFromNode(e, "href");
                        if (!t)
                            return !1;
                        if (0 !== (t = String(t)).indexOf("//") && 0 !== t.indexOf("http://") && 0 !== t.indexOf("https://"))
                            return !1;
                        var n = e.pathname || Et(e.href)
                          , r = (e.hostname || R(e.href)).toLowerCase();
                        return !!St(r, n) && !kt(le, G(r))
                    }(e = ln(e)) && En(e)
                }
                function Sn(e) {
                    var t = e.which
                      , n = typeof e.button;
                    return t || "undefined" === n || (u.all && !u.addEventListener ? 1 & e.button ? t = 1 : 2 & e.button ? t = 3 : 4 & e.button && (t = 2) : 0 === e.button || "0" === e.button ? t = 1 : 1 & e.button ? t = 2 : 2 & e.button && (t = 3)),
                    t
                }
                function An(e) {
                    return "A" === e || "AREA" === e
                }
                function On(e) {
                    return function(t) {
                        var n = function(e) {
                            for (var t = function(e) {
                                return e.target || e.srcElement
                            }(e), n = t.nodeName, r = cn(Ae, "ignore"); !An(n) && t && t.parentNode; )
                                n = (t = t.parentNode).nodeName;
                            if (t && An(n) && !r.test(t.className))
                                return t
                        }(t = t || l.event);
                        if (n) {
                            var r = function(e) {
                                switch (Sn(e)) {
                                case 1:
                                    return "left";
                                case 2:
                                    return "middle";
                                case 3:
                                    return "right"
                                }
                            }(t);
                            if ("click" === t.type) {
                                var i = !1;
                                e && "middle" === r && (i = !0),
                                n && !i && _n(n)
                            } else
                                "mousedown" === t.type ? "middle" === r && n ? (ne = r,
                                re = n) : ne = re = null : "mouseup" === t.type ? (r === ne && n === re && _n(n),
                                ne = re = null) : "contextmenu" === t.type && _n(n)
                        }
                    }
                }
                function Ln(e, t, n) {
                    "undefined" === typeof t && (t = !0),
                    A(e, "click", On(t), n),
                    t && (A(e, "mouseup", On(t), n),
                    A(e, "mousedown", On(t), n),
                    A(e, "contextmenu", On(t), n))
                }
                mt = !wt(ce),
                p = function() {
                    var e = new Date;
                    return e = e.getTime(),
                    !!ct && (ct + s <= e && (ae.ping(),
                    !0))
                }
                ;
                var xn = {
                    enabled: !0,
                    requests: [],
                    timeout: null,
                    interval: 2500,
                    sendRequests: function() {
                        var e = this.requests;
                        this.requests = [],
                        1 === e.length ? Vt(e[0], Ie) : Wt(e, Ie)
                    },
                    canQueue: function() {
                        return !b && this.enabled
                    },
                    pushMultiple: function(e) {
                        var t;
                        if (this.canQueue())
                            for (t = 0; t < e.length; t++)
                                this.push(e[t]);
                        else
                            Wt(e, Ie)
                    },
                    push: function(e) {
                        if (e)
                            if (this.canQueue()) {
                                xn.requests.push(e),
                                this.timeout && (clearTimeout(this.timeout),
                                this.timeout = null),
                                this.timeout = setTimeout(function() {
                                    xn.timeout = null,
                                    xn.sendRequests()
                                }, xn.interval);
                                var t = "RequestQueue" + Tt;
                                Object.prototype.hasOwnProperty.call(a, t) || (a[t] = {
                                    unload: function() {
                                        xn.timeout && clearTimeout(xn.timeout),
                                        xn.sendRequests()
                                    }
                                })
                            } else
                                Vt(e, Ie)
                    }
                };
                Ft(),
                en(),
                this.hasConsent = function() {
                    return mt
                }
                ,
                this.getVisitorId = function() {
                    return Zt().uuid
                }
                ,
                this.getVisitorInfo = function() {
                    return Kt()
                }
                ,
                this.getAttributionInfo = function() {
                    return tn()
                }
                ,
                this.getAttributionCampaignName = function() {
                    return tn()[0]
                }
                ,
                this.getAttributionCampaignKeyword = function() {
                    return tn()[1]
                }
                ,
                this.getAttributionReferrerTimestamp = function() {
                    return tn()[2]
                }
                ,
                this.getAttributionReferrerUrl = function() {
                    return tn()[3]
                }
                ,
                this.setTrackerUrl = function(e) {
                    Te = e
                }
                ,
                this.getTrackerUrl = function() {
                    return Te
                }
                ,
                this.getMatomoUrl = function() {
                    return J(this.getTrackerUrl(), Ce)
                }
                ,
                this.getPiwikUrl = function() {
                    return this.getMatomoUrl()
                }
                ,
                this.addTracker = function(e, t) {
                    y(e) && null !== e || (e = this.getTrackerUrl());
                    var n = new $(e,t);
                    return m.push(n),
                    o.trigger("TrackerAdded", [this]),
                    n
                }
                ,
                this.getSiteId = function() {
                    return ye
                }
                ,
                this.setSiteId = function(e) {
                    !function(e) {
                        ye = e
                    }(e)
                }
                ,
                this.resetUserId = function() {
                    Ne = ""
                }
                ,
                this.setUserId = function(e) {
                    E(e) && (Ne = e)
                }
                ,
                this.setVisitorId = function(e) {
                    k(e) && /[0-9A-Fa-f]{16}/g.test(e) ? ke = e : _("Invalid visitorId set" + e)
                }
                ,
                this.getUserId = function() {
                    return Ne
                }
                ,
                this.setCustomData = function(e, t) {
                    N(e) ? U = e : (U || (U = {}),
                    U[e] = t)
                }
                ,
                this.getCustomData = function() {
                    return U
                }
                ,
                this.setCustomRequestProcessing = function(e) {
                    te = e
                }
                ,
                this.appendToTrackingUrl = function(e) {
                    be = e
                }
                ,
                this.getRequest = function(e) {
                    return an(e)
                }
                ,
                this.addPlugin = function(e, t) {
                    a[e] = t
                }
                ,
                this.setCustomDimension = function(e, t) {
                    (e = parseInt(e, 10)) > 0 && (y(t) || (t = ""),
                    k(t) || (t = String(t)),
                    Ke[e] = t)
                }
                ,
                this.getCustomDimension = function(e) {
                    if ((e = parseInt(e, 10)) > 0 && Object.prototype.hasOwnProperty.call(Ke, e))
                        return Ke[e]
                }
                ,
                this.deleteCustomDimension = function(e) {
                    (e = parseInt(e, 10)) > 0 && delete Ke[e]
                }
                ,
                this.setCustomVariable = function(e, t, n, r) {
                    var i;
                    y(r) || (r = "visit"),
                    y(t) && (y(n) || (n = ""),
                    e > 0 && (t = k(t) ? t : String(t),
                    n = k(n) ? n : String(n),
                    i = [t.slice(0, 200), n.slice(0, 200)],
                    "visit" === r || 2 === r ? (Jt(),
                    Ye[e] = i) : "page" === r || 3 === r ? Qe[e] = i : "event" === r && ($e[e] = i)))
                }
                ,
                this.getCustomVariable = function(e, t) {
                    var n;
                    return y(t) || (t = "visit"),
                    "page" === t || 3 === t ? n = Qe[e] : "event" === t ? n = $e[e] : "visit" !== t && 2 !== t || (Jt(),
                    n = Ye[e]),
                    !(!y(n) || n && "" === n[0]) && n
                }
                ,
                this.deleteCustomVariable = function(e, t) {
                    this.getCustomVariable(e, t) && this.setCustomVariable(e, "", "", t)
                }
                ,
                this.deleteCustomVariables = function(e) {
                    "page" === e || 3 === e ? Qe = {} : "event" === e ? $e = {} : "visit" !== e && 2 !== e || (Ye = {})
                }
                ,
                this.storeCustomVariablesInCookie = function() {
                    Je = !0
                }
                ,
                this.setLinkTrackingTimer = function(e) {
                    Ie = e
                }
                ,
                this.getLinkTrackingTimer = function() {
                    return Ie
                }
                ,
                this.setDownloadExtensions = function(e) {
                    k(e) && (e = e.split("|")),
                    _e = e
                }
                ,
                this.addDownloadExtensions = function(e) {
                    var t;
                    for (k(e) && (e = e.split("|")),
                    t = 0; t < e.length; t++)
                        _e.push(e[t])
                }
                ,
                this.removeDownloadExtensions = function(e) {
                    var t, n = [];
                    for (k(e) && (e = e.split("|")),
                    t = 0; t < _e.length; t++)
                        -1 === B(e, _e[t]) && n.push(_e[t]);
                    _e = n
                }
                ,
                this.setDomains = function(e) {
                    Se = k(e) ? [e] : e;
                    for (var t, n = !1, r = 0; r < Se.length; r++) {
                        if (t = String(Se[r]),
                        kt(le, G(t))) {
                            n = !0;
                            break
                        }
                        var i = Et(t);
                        if (i && "/" !== i && "/*" !== i) {
                            n = !0;
                            break
                        }
                    }
                    n || Se.push(le)
                }
                ,
                this.enableCrossDomainLinking = function() {
                    at = !0
                }
                ,
                this.disableCrossDomainLinking = function() {
                    at = !1
                }
                ,
                this.isCrossDomainLinkingEnabled = function() {
                    return at
                }
                ,
                this.setCrossDomainLinkingTimeout = function(e) {
                    je = e
                }
                ,
                this.getCrossDomainLinkingUrlParameter = function() {
                    return h(Ue) + "=" + h(kn())
                }
                ,
                this.setIgnoreClasses = function(e) {
                    Ae = k(e) ? [e] : e
                }
                ,
                this.setRequestMethod = function(e) {
                    "GET" === (me = e ? String(e).toUpperCase() : "GET") && this.disableAlwaysUseSendBeacon()
                }
                ,
                this.setRequestContentType = function(e) {
                    ve = e || pe
                }
                ,
                this.setGenerationTimeMs = function(e) {
                    _("setGenerationTimeMs is no longer supported since Matomo 4. The call will be ignored. The replacement is setPagePerformanceTiming.")
                }
                ,
                this.setPagePerformanceTiming = function(e, t, n, r, i, o) {
                    var a = {
                        pf_net: e,
                        pf_srv: t,
                        pf_tfr: n,
                        pf_dm1: r,
                        pf_dm2: i,
                        pf_onl: o
                    };
                    try {
                        if (a = function(e) {
                            var t, n = {};
                            for (t in e)
                                if (e.hasOwnProperty(t)) {
                                    if (!P(e[t]))
                                        throw new Error('Parameter "' + t + '" provided value "' + e[t] + '" is not valid. Please provide a numeric value.');
                                    n[t] = Math.round(e[t])
                                }
                            return n
                        }(a = function(e, t) {
                            var n, r = {};
                            for (n in e)
                                e.hasOwnProperty(n) && t(e[n]) && (r[n] = e[n]);
                            return r
                        }(a, y)),
                        "" === (we = function(e) {
                            var t, n = "";
                            for (t in e)
                                e.hasOwnProperty(t) && (n += "&" + h(t) + "=" + h(e[t]));
                            return n
                        }(a)))
                            return void _("setPagePerformanceTiming() called without parameters. This function needs to be called with at least one performance parameter.");
                        Xe = !1,
                        ze = !0
                    } catch (e) {
                        _("setPagePerformanceTiming: " + e.toString())
                    }
                }
                ,
                this.setReferrerUrl = function(e) {
                    he = e
                }
                ,
                this.setCustomUrl = function(e) {
                    r = function(e, t) {
                        var n;
                        return I(t) ? t : "/" === t.slice(0, 1) ? I(e) + "://" + R(e) + t : ((n = (e = Nt(e)).indexOf("?")) >= 0 && (e = e.slice(0, n)),
                        (n = e.lastIndexOf("/")) !== e.length - 1 && (e = e.slice(0, n + 1)),
                        e + t)
                    }(de, e)
                }
                ,
                this.getCurrentUrl = function() {
                    return r || de
                }
                ,
                this.setDocumentTitle = function(e) {
                    Ee = e
                }
                ,
                this.setPageViewId = function(e) {
                    oe = e,
                    lt = !0
                }
                ,
                this.setAPIUrl = function(e) {
                    Ce = e
                }
                ,
                this.setDownloadClasses = function(e) {
                    Le = k(e) ? [e] : e
                }
                ,
                this.setLinkClasses = function(e) {
                    xe = k(e) ? [e] : e
                }
                ,
                this.setCampaignNameKey = function(e) {
                    Pe = k(e) ? [e] : e
                }
                ,
                this.setCampaignKeywordKey = function(e) {
                    qe = k(e) ? [e] : e
                }
                ,
                this.discardHashTag = function(e) {
                    S = e
                }
                ,
                this.setCookieNamePrefix = function(e) {
                    Me = e,
                    Ye && (Ye = Xt())
                }
                ,
                this.setCookieDomain = function(e) {
                    var t = G(e);
                    We || function(e) {
                        var t = Me + "testcookie_domain"
                          , n = "testvalue";
                        return yt(t, n, 1e4, null, e, De, Ve),
                        wt(t) === n && (Ht(t, null, e),
                        !0)
                    }(t) ? (H = t,
                    Ft()) : _("Can't write cookie on domain " + e)
                }
                ,
                this.setExcludedQueryParams = function(e) {
                    Oe = k(e) ? [e] : e
                }
                ,
                this.getCookieDomain = function() {
                    return H
                }
                ,
                this.hasCookies = function() {
                    return "1" === Bt()
                }
                ,
                this.setSessionCookie = function(e, t, n) {
                    if (!e)
                        throw new Error("Missing cookie name");
                    y(n) || (n = He),
                    ht.push(e),
                    yt(Gt(e), t, n, F, H, De, Ve)
                }
                ,
                this.getCookie = function(e) {
                    var t = wt(Gt(e));
                    return 0 === t ? null : t
                }
                ,
                this.setCookiePath = function(e) {
                    F = e,
                    Ft()
                }
                ,
                this.getCookiePath = function(e) {
                    return F
                }
                ,
                this.setVisitorCookieTimeout = function(e) {
                    Ge = 1e3 * e
                }
                ,
                this.setSessionCookieTimeout = function(e) {
                    He = 1e3 * e
                }
                ,
                this.getSessionCookieTimeout = function() {
                    return He
                }
                ,
                this.setReferralCookieTimeout = function(e) {
                    Be = 1e3 * e
                }
                ,
                this.setConversionAttributionFirstReferrer = function(e) {
                    ee = e
                }
                ,
                this.setSecureCookie = function(e) {
                    e && "https:" !== location.protocol ? _("Error in setSecureCookie: You cannot use `Secure` on http.") : De = e
                }
                ,
                this.setCookieSameSite = function(e) {
                    "None" === (e = (e = String(e)).charAt(0).toUpperCase() + e.toLowerCase().slice(1)) || "Lax" === e || "Strict" === e ? ("None" === e && ("https:" === location.protocol ? this.setSecureCookie(!0) : (_("sameSite=None cannot be used on http, reverted to sameSite=Lax."),
                    e = "Lax")),
                    Ve = e) : _("Ignored value for sameSite. Please use either Lax, None, or Strict.")
                }
                ,
                this.disableCookies = function() {
                    We = !0,
                    ye && nn()
                }
                ,
                this.areCookiesEnabled = function() {
                    return !We
                }
                ,
                this.setCookieConsentGiven = function() {
                    We && !K && (We = !1,
                    bt = !0,
                    ye && Ct && (en(),
                    Vt(an("ping=1", null, "ping"), Ie)))
                }
                ,
                this.requireCookieConsent = function() {
                    return !this.getRememberedCookieConsent() && (this.disableCookies(),
                    !0)
                }
                ,
                this.getRememberedCookieConsent = function() {
                    return wt(ue)
                }
                ,
                this.forgetCookieConsentGiven = function() {
                    Ht(ue, F, H),
                    this.disableCookies()
                }
                ,
                this.rememberCookieConsentGiven = function(e) {
                    e = e ? 60 * e * 60 * 1e3 : 94608e7,
                    this.setCookieConsentGiven();
                    var t = (new Date).getTime();
                    yt(ue, t, e, F, H, De, Ve)
                }
                ,
                this.deleteCookies = function() {
                    nn()
                }
                ,
                this.setDoNotTrack = function(e) {
                    var t = c.doNotTrack || c.msDoNotTrack;
                    (K = e && ("yes" === t || "1" === t)) && this.disableCookies()
                }
                ,
                this.alwaysUseSendBeacon = function() {
                    Re = !0
                }
                ,
                this.disableAlwaysUseSendBeacon = function() {
                    Re = !1
                }
                ,
                this.addListener = function(e, t) {
                    Ln(e, t, !1)
                }
                ,
                this.enableLinkTracking = function(e) {
                    if (!ot) {
                        ot = !0;
                        L(function() {
                            !0,
                            Ln(u.body, e, !0)
                        })
                    }
                }
                ,
                this.enableJSErrorTracking = function() {
                    if (!ge) {
                        ge = !0;
                        var e = l.onerror;
                        l.onerror = function(t, n, r, i, o) {
                            return Nn(function() {
                                var e = "JavaScript Errors"
                                  , o = n + ":" + r;
                                i && (o += ":" + i),
                                -1 === B(vt, e + o + t) && (vt.push(e + o + t),
                                bn(e, o, t))
                            }),
                            !!e && e(t, n, r, i, o)
                        }
                    }
                }
                ,
                this.disablePerformanceTracking = function() {
                    Fe = !1
                }
                ,
                this.enableHeartBeatTimer = function(e) {
                    e = Math.max(e || 15, 5),
                    s = 1e3 * e,
                    null !== ct && jt()
                }
                ,
                this.disableHeartBeatTimer = function() {
                    (s || st) && (l.removeEventListener ? (l.removeEventListener("focus", Pt),
                    l.removeEventListener("blur", Mt),
                    l.removeEventListener("visibilitychange", Ut)) : l.detachEvent && (l.detachEvent("onfocus", Pt),
                    l.detachEvent("onblur", Mt),
                    l.detachEvent("visibilitychange", Ut))),
                    s = null,
                    st = !1
                }
                ,
                this.killFrame = function() {
                    l.location !== l.top.location && (l.top.location = l.location)
                }
                ,
                this.redirectFile = function(e) {
                    "file:" === l.location.protocol && (l.location = e)
                }
                ,
                this.setCountPreRendered = function(e) {
                    Z = e
                }
                ,
                this.trackGoal = function(e, t, n, r) {
                    Nn(function() {
                        !function(e, t, n, r) {
                            Vt(an("idgoal=" + e + (t ? "&revenue=" + t : ""), n, "goal"), Ie, r)
                        }(e, t, n, r)
                    })
                }
                ,
                this.trackLink = function(e, t, n, r) {
                    Nn(function() {
                        wn(e, t, n, r)
                    })
                }
                ,
                this.getNumTrackedPageViews = function() {
                    return dt
                }
                ,
                this.trackPageView = function(e, t, n) {
                    nt = [],
                    pt = [],
                    vt = [],
                    Y(ye) ? Nn(function() {
                        Q(Te, Ce, ye)
                    }) : Nn(function() {
                        dt++,
                        un(e, t, n)
                    })
                }
                ,
                this.disableBrowserFeatureDetection = function() {
                    bt = !1
                }
                ,
                this.enableBrowserFeatureDetection = function() {
                    bt = !0
                }
                ,
                this.trackAllContentImpressions = function() {
                    Y(ye) || Nn(function() {
                        L(function() {
                            var e = Tn(X.findContentNodes());
                            xn.pushMultiple(e)
                        })
                    })
                }
                ,
                this.trackVisibleContentImpressions = function(e, t) {
                    Y(ye) || (y(e) || (e = !0),
                    y(t) || (t = 750),
                    function(e, t, n) {
                        if (rt)
                            return !0;
                        rt = !0;
                        var r, i, o = !1;
                        function a() {
                            o = !0
                        }
                        O(function() {
                            if (e) {
                                for (r = ["scroll", "resize"],
                                i = 0; i < r.length; i++)
                                    u.addEventListener ? u.addEventListener(r[i], a, !1) : l.attachEvent("on" + r[i], a);
                                !function e(t) {
                                    setTimeout(function() {
                                        rt && (o && (o = !1,
                                        n.trackVisibleContentImpressions()),
                                        e(t))
                                    }, t)
                                }(100)
                            }
                            t && t > 0 && function e(t) {
                                setTimeout(function() {
                                    rt && (o = !1,
                                    n.trackVisibleContentImpressions(),
                                    e(t))
                                }, t)
                            }(t = parseInt(t, 10))
                        })
                    }(e, t, this),
                    Nn(function() {
                        O(function() {
                            var e = Cn(X.findContentNodes());
                            xn.pushMultiple(e)
                        })
                    }))
                }
                ,
                this.trackContentImpression = function(e, t, n) {
                    Y(ye) || (e = V(e),
                    t = V(t),
                    n = V(n),
                    e && (t = t || "Unknown",
                    Nn(function() {
                        var r = function(e, t, n) {
                            return an(X.buildImpressionRequestParams(e, t, n), null, "contentImpression")
                        }(e, t, n);
                        xn.push(r)
                    })))
                }
                ,
                this.trackContentImpressionsWithinNode = function(e) {
                    !Y(ye) && e && Nn(function() {
                        rt ? O(function() {
                            var t = Cn(X.findContentNodesWithinNode(e));
                            xn.pushMultiple(t)
                        }) : L(function() {
                            var t = Tn(X.findContentNodesWithinNode(e));
                            xn.pushMultiple(t)
                        })
                    })
                }
                ,
                this.trackContentInteraction = function(e, t, n, r) {
                    Y(ye) || (e = V(e),
                    t = V(t),
                    n = V(n),
                    r = V(r),
                    e && t && (n = n || "Unknown",
                    Nn(function() {
                        var i = hn(e, t, n, r);
                        i && xn.push(i)
                    })))
                }
                ,
                this.trackContentInteractionNode = function(e, t) {
                    if (!Y(ye) && e) {
                        var n = null;
                        return Nn(function() {
                            (n = function(e, t) {
                                if (e) {
                                    var n = X.findParentContentNode(e)
                                      , r = X.buildContentBlock(n);
                                    if (r)
                                        return t || (t = "Unknown"),
                                        hn(t, r.name, r.piece, r.target)
                                }
                            }(e, t)) && xn.push(n)
                        }),
                        n
                    }
                }
                ,
                this.logAllContentBlocksOnPage = function() {
                    var e = X.findContentNodes()
                      , t = X.collectContent(e);
                    "undefined" !== typeof console && console && console.log && console.log(t)
                }
                ,
                this.trackEvent = function(e, t, n, r, i, o) {
                    Nn(function() {
                        bn(e, t, n, r, i, o)
                    })
                }
                ,
                this.trackSiteSearch = function(e, t, n, r) {
                    nt = [],
                    Nn(function() {
                        !function(e, t, n, r) {
                            Vt(an("search=" + h(e) + (t ? "&search_cat=" + h(t) : "") + (y(n) ? "&search_count=" + n : ""), r, "sitesearch"), Ie)
                        }(e, t, n, r)
                    })
                }
                ,
                this.setEcommerceView = function(e, t, n, r) {
                    Ze = {},
                    E(n) && (n = String(n)),
                    y(n) && null !== n && !1 !== n && n.length ? n instanceof Array && (n = l.JSON.stringify(n)) : n = "";
                    var i = "_pkc";
                    Ze[i] = n,
                    y(r) && null !== r && !1 !== r && String(r).length && (Ze[i = "_pkp"] = r),
                    (E(e) || E(t)) && (E(e) && (Ze[i = "_pks"] = e),
                    E(t) || (t = ""),
                    Ze[i = "_pkn"] = t)
                }
                ,
                this.getEcommerceItems = function() {
                    return JSON.parse(JSON.stringify(et))
                }
                ,
                this.addEcommerceItem = function(e, t, n, r, i) {
                    E(e) && (et[e] = [String(e), t, n, r, i])
                }
                ,
                this.removeEcommerceItem = function(e) {
                    E(e) && (e = String(e),
                    delete et[e])
                }
                ,
                this.clearEcommerceCart = function() {
                    et = {}
                }
                ,
                this.trackEcommerceOrder = function(e, t, n, r, i, o) {
                    !function(e, t, n, r, i, o) {
                        String(e).length && y(t) && sn(e, t, n, r, i, o)
                    }(e, t, n, r, i, o)
                }
                ,
                this.trackEcommerceCartUpdate = function(e) {
                    !function(e) {
                        y(e) && sn("", e, "", "", "", "")
                    }(e)
                }
                ,
                this.trackRequest = function(e, t, n, r) {
                    Nn(function() {
                        Vt(an(e, t, r), Ie, n)
                    })
                }
                ,
                this.ping = function() {
                    this.trackRequest("ping=1", null, null, "ping")
                }
                ,
                this.disableQueueRequest = function() {
                    xn.enabled = !1
                }
                ,
                this.setRequestQueueInterval = function(e) {
                    if (e < 1e3)
                        throw new Error("Request queue interval needs to be at least 1000ms");
                    xn.interval = e
                }
                ,
                this.queueRequest = function(e) {
                    Nn(function() {
                        var t = an(e);
                        xn.push(t)
                    })
                }
                ,
                this.isConsentRequired = function() {
                    return gt
                }
                ,
                this.getRememberedConsent = function() {
                    var e = wt(se);
                    return wt(ce) ? (e && Ht(se, F, H),
                    null) : e && 0 !== e ? e : null
                }
                ,
                this.hasRememberedConsent = function() {
                    return !!this.getRememberedConsent()
                }
                ,
                this.requireConsent = function() {
                    gt = !0,
                    (mt = this.hasRememberedConsent()) || (We = !0),
                    a["CoreConsent" + ++v] = {
                        unload: function() {
                            mt || nn()
                        }
                    }
                }
                ,
                this.setConsentGiven = function(e) {
                    var t, n;
                    for (mt = !0,
                    bt = !0,
                    Ht(ce, F, H),
                    t = 0; t < pt.length; t++)
                        "string" === (n = typeof pt[t]) ? Vt(pt[t], Ie) : "object" === n && Wt(pt[t], Ie);
                    pt = [],
                    y(e) && !e || this.setCookieConsentGiven()
                }
                ,
                this.rememberConsentGiven = function(e) {
                    e = e ? 60 * e * 60 * 1e3 : 94608e7;
                    this.setConsentGiven(!0);
                    var t = (new Date).getTime();
                    yt(se, t, e, F, H, De, Ve)
                }
                ,
                this.forgetConsentGiven = function() {
                    Ht(se, F, H),
                    yt(ce, (new Date).getTime(), 94608e7, F, H, De, Ve),
                    this.forgetCookieConsentGiven(),
                    this.requireConsent()
                }
                ,
                this.isUserOptedOut = function() {
                    return !mt
                }
                ,
                this.optUserOut = this.forgetConsentGiven,
                this.forgetUserOptOut = function() {
                    this.setConsentGiven(!1)
                }
                ,
                O(function() {
                    setTimeout(function() {
                        ze = !0
                    }, 0)
                }),
                o.trigger("TrackerSetup", [this])
            }
            var K = ["addTracker", "forgetCookieConsentGiven", "requireCookieConsent", "disableBrowserFeatureDetection", "disableCookies", "setTrackerUrl", "setAPIUrl", "enableCrossDomainLinking", "setCrossDomainLinkingTimeout", "setSessionCookieTimeout", "setVisitorCookieTimeout", "setCookieNamePrefix", "setCookieSameSite", "setSecureCookie", "setCookiePath", "setCookieDomain", "setDomains", "setUserId", "setVisitorId", "setSiteId", "alwaysUseSendBeacon", "disableAlwaysUseSendBeacon", "enableLinkTracking", "setCookieConsentGiven", "requireConsent", "setConsentGiven", "disablePerformanceTracking", "setPagePerformanceTiming", "setExcludedQueryParams"];
            function Z(e, t) {
                var n = new $(e,t);
                for (m.push(n),
                _paq = function(e, t) {
                    var n, r, i = {};
                    for (n = 0; n < t.length; n++) {
                        var o = t[n];
                        for (i[o] = 1,
                        r = 0; r < e.length; r++)
                            if (e[r] && e[r][0]) {
                                var a = e[r][0];
                                o === a && (S(e[r]),
                                delete e[r],
                                i[a] > 1 && "addTracker" !== a && "enableLinkTracking" !== a && _("The method " + a + ' is registered more than once in "_paq" variable. Only the last call has an effect. Please have a look at the multiple Matomo trackers documentation: https://developer.matomo.org/guides/tracking-javascript-guide#multiple-piwik-trackers'),
                                i[a]++)
                            }
                    }
                    return e
                }(_paq, K),
                i = 0; i < _paq.length; i++)
                    _paq[i] && S(_paq[i]);
                return _paq = new function() {
                    return {
                        push: S
                    }
                }
                ,
                o.trigger("TrackerAdded", [n]),
                n
            }
            return A(l, "beforeunload", function() {
                var e;
                b = !0,
                x("unload");
                var t = (e = new Date).getTimeAlias();
                if (n - t > 3e3 && (n = t + 3e3),
                n)
                    do {
                        e = new Date
                    } while (e.getTimeAlias() < n)
            }, !1),
            A(l, "online", function() {
                y(c.serviceWorker) && c.serviceWorker.ready.then(function(e) {
                    if (e && e.sync)
                        return e.sync.register("matomoSync")
                }, function() {})
            }, !1),
            A(l, "message", function(e) {
                if (e && e.origin) {
                    var t, n, r = R(e.origin), i = o.getAsyncTrackers();
                    for (n = 0; n < i.length; n++)
                        if (R(i[n].getMatomoUrl()) === r) {
                            t = i[n];
                            break
                        }
                    if (t) {
                        var a = null;
                        try {
                            a = JSON.parse(e.data)
                        } catch (e) {
                            return
                        }
                        if (a)
                            if (y(a.maq_initial_value))
                                s({
                                    maq_opted_in: a.maq_initial_value && t.hasConsent(),
                                    maq_url: t.getMatomoUrl(),
                                    maq_optout_by_default: t.isConsentRequired()
                                });
                            else if (y(a.maq_opted_in)) {
                                for (i = o.getAsyncTrackers(),
                                n = 0; n < i.length; n++)
                                    t = i[n],
                                    a.maq_opted_in ? t.rememberConsentGiven() : t.forgetConsentGiven();
                                s({
                                    maq_confirm_opted_in: t.hasConsent(),
                                    maq_url: t.getMatomoUrl(),
                                    maq_optout_by_default: t.isConsentRequired()
                                })
                            }
                    }
                }
                function s(e) {
                    var t = u.getElementsByTagName("iframe");
                    for (n = 0; n < t.length; n++) {
                        var i = t[n]
                          , o = R(i.src);
                        if (i.contentWindow && y(i.contentWindow.postMessage) && o === r) {
                            var a = JSON.stringify(e);
                            i.contentWindow.postMessage(a, "*")
                        }
                    }
                }
            }, !1),
            Date.prototype.getTimeAlias = Date.prototype.getTime,
            o = {
                initialized: !1,
                JSON: l.JSON,
                DOM: {
                    addEventListener: function(e, t, n, r) {
                        "undefined" === typeof r && (r = !1),
                        A(e, t, n, r)
                    },
                    onLoad: O,
                    onReady: L,
                    isNodeVisible: F,
                    isOrWasNodeVisible: X.isNodeVisible
                },
                on: function(e, t) {
                    s[e] || (s[e] = []),
                    s[e].push(t)
                },
                off: function(e, t) {
                    if (s[e])
                        for (var n = 0; n < s[e].length; n++)
                            s[e][n] === t && s[e].splice(n, 1)
                },
                trigger: function(e, t, n) {
                    if (s[e])
                        for (var r = 0; r < s[e].length; r++)
                            s[e][r].apply(n || l, t)
                },
                addPlugin: function(e, t) {
                    a[e] = t
                },
                getTracker: function(e, t) {
                    return y(t) || (t = this.getAsyncTracker().getSiteId()),
                    y(e) || (e = this.getAsyncTracker().getTrackerUrl()),
                    new $(e,t)
                },
                getAsyncTrackers: function() {
                    return m
                },
                addTracker: function(e, t) {
                    return m.length ? m[0].addTracker(e, t) : Z(e, t)
                },
                getAsyncTracker: function(e, t) {
                    var n;
                    if (!(m && m.length && m[0]))
                        return Z(e, t);
                    if (n = m[0],
                    !t && !e)
                        return n;
                    y(t) && null !== t || !n || (t = n.getSiteId()),
                    y(e) && null !== e || !n || (e = n.getTrackerUrl());
                    for (var r, i = 0; i < m.length; i++)
                        if ((r = m[i]) && String(r.getSiteId()) === String(t) && r.getTrackerUrl() === e)
                            return r
                },
                retryMissedPluginCalls: function() {
                    var e = p;
                    p = [];
                    for (var t = 0; t < e.length; t++)
                        S(e[t])
                }
            },
            void 0 === (r = function() {
                return o
            }
            .apply(t, [])) || (e.exports = r),
            void 0 === (r = function() {
                return o
            }
            .apply(t, [])) || (e.exports = r),
            o
        }())/*!!! pluginTrackerHook */
        ,
        /*!!! pluginTrackerHook */
        function() {
            if (window && "object" == typeof window.matomoPluginAsyncInit && window.matomoPluginAsyncInit.length)
                for (var e = 0; e < window.matomoPluginAsyncInit.length; e++)
                    "function" == typeof window.matomoPluginAsyncInit[e] && window.matomoPluginAsyncInit[e]();
            window && window.piwikAsyncInit && window.piwikAsyncInit(),
            window && window.matomoAsyncInit && window.matomoAsyncInit(),
            window.Matomo.getAsyncTrackers().length || ("object" == typeof _paq && void 0 !== _paq.length && _paq.length ? window.Matomo.addTracker() : _paq = {
                push: function(e) {
                    "undefined" !== typeof console && console && console.error && console.error("_paq.push() was used but Matomo tracker was not initialized before the matomo_v4.8.0.js file was loaded. Make sure to configure the tracker via _paq.push before loading matomo_v4.8.0.js. Alternatively, you can create a tracker via Matomo.addTracker() manually and then use _paq.push but it may not fully work as tracker methods may not be executed in the correct order.", e)
                }
            }),
            window.Matomo.trigger("MatomoInitialized", []),
            window.Matomo.initialized = !0
        }(),
        void 0 === window.AnalyticsTracker && (window.AnalyticsTracker = window.Matomo),
        "function" != typeof window.piwik_log && (window.piwik_log = function(e, t, n, r) {
            function i(e) {
                try {
                    if (window["piwik_" + e])
                        return window["piwik_" + e]
                } catch (e) {}
            }
            var o, a = window.Matomo.getTracker(n, t);
            a.setDocumentTitle(e),
            a.setCustomData(r),
            (o = i("tracker_pause")) && a.setLinkTrackingTimer(o),
            (o = i("download_extensions")) && a.setDownloadExtensions(o),
            (o = i("hosts_alias")) && a.setDomains(o),
            (o = i("ignore_classes")) && a.setIgnoreClasses(o),
            a.trackPageView(),
            i("install_tracker") && (piwik_track = function(e, t, n, r) {
                a.setSiteId(t),
                a.setTrackerUrl(n),
                a.trackLink(e, r)
            }
            ,
            a.enableLinkTracking())
        }
        )
        /*!! @license-end */
    },
    6: function(e, t) {
        if (void 0 === s && (s = {}),
        !n)
            var n = "";
        if (!r)
            var r = "";
        if (!i)
            var i = "cc.naver.com";
        if (!o)
            var o = "decide.me";
        if (!a)
            var a = "";
        function s(e, t, n, r, i, o, a) {
            var u, c, f, l = e, d = e;
            return "nodeType"in e && e.nodeType >= 1 ? l = window.event || e : d = e.srcElement || e.currentTarget || e.target,
            o || (o = ""),
            f = s.gcp(d, l),
            c = s.gl(t, n, r, f, "", 0, s.st, o, a),
            u = s.l(d, c),
            s.sd(u),
            !0
        }
        s.vs = "0.3.2",
        s.md = "cc",
        s.pt = "https:" == window.location.protocol ? "https:" : "http:",
        s.ct = 0,
        s.ec = encodeURIComponent,
        s.st = 1,
        s.l = function(e, t) {
            var n, r, o;
            return e && e.href ? (r = e.tagName.toLowerCase(),
            (o = e.href.toLowerCase()) && 0 == o.indexOf(s.pt + "//" + i) ? n = e.href : o && 0 != o.indexOf(s.pt + "//" + i) && r && "img" != r && (n = t + "&u=" + s.ec(e.href)),
            n) : t + "&u=about%3Ablank"
        }
        ,
        s.sd = function(e, t) {
            var n, r = 0;
            s.ct > 0 && (e += "&nt=" + (new Date).getTime());
            "function" == typeof t && (r = 1);
            var i = new Image;
            i.src = e,
            i.onload = function() {
                n && clearTimeout(n),
                r && t(),
                i.onload = null
            }
            ,
            i.onerror = function() {
                n && clearTimeout(n),
                r && t(),
                i.onerror = null
            }
            ,
            r && (n = setTimeout(function() {
                t()
            }, 5e3)),
            s.ct++
        }
        ,
        s.gl = function(e, t, a, u, c, f, l, d, h) {
            var g = window;
            void 0 == f && (f = 1),
            void 0 == l && (l = 1);
            var m = s.pt + "//" + i + "/" + s.md + "?a=" + e + "&r=" + a + "&i=" + t + "&m=" + f;
            return 1 == l ? (g.g_ssc && (m += "&ssc=" + g_ssc),
            g.g_query && (m += "&q=" + s.ec(g_query)),
            g.g_sid && (m += "&s=" + r),
            h ? m += "&p=" + h : g.g_pid ? m += "&p=" + n : g.lcs_get_lpid ? m += "&p=" + lcs_get_lpid() : console.warn("'g_pid / lcs_get_lpid' is not exist.")) : (m += "&nsc=" + o,
            console.warn("[DEPRECATED] NSC mode")),
            d && (m += "&g=" + d),
            c && (m += "&u=" + s.ec(c)),
            u && (m += u),
            m
        }
        ,
        s.al = function(e, t) {
            var n = window;
            n.addEventListener ? n.addEventListener(e, t, !1) : n.attachEvent && n.attachEvent("on" + e, t)
        }
        ,
        s.oo = "",
        s.of = "",
        "onpageshow"in window && s.al("pageshow", function() {
            s.oo.onclick = s.of
        }),
        s.go = function(e) {
            var t, n = e.onclick;
            e.onclick = "",
            s.oo = e,
            s.of = n,
            document.createEvent ? ((t = document.createEvent("MouseEvents")).initMouseEvent("click", !1, !1, window, 0, 0, 0, 0, 0, !1, !1, !1, !1, 0, null),
            e.dispatchEvent(t)) : document.createEventObject ? e.fireEvent("onclick") : MouseEvent && (t = new MouseEvent("click",{
                bubbles: !1,
                cancelable: !1,
                view: window
            }),
            e.dispatchEvent(t)),
            e.onclick = n
        }
        ,
        s.gsbw = function() {
            var e = document.createElement("p");
            e.style.width = "200px",
            e.style.height = "200px";
            var t = document.createElement("div");
            t.style.position = "absolute",
            t.style.top = "0px",
            t.style.left = "0px",
            t.style.visibility = "hidden",
            t.style.width = "200px",
            t.style.height = "150px",
            t.style.overflow = "hidden",
            t.appendChild(e),
            document.body.appendChild(t);
            var n = e.offsetWidth;
            t.style.overflow = "scroll";
            var r = e.offsetWidth;
            return n == r && (r = t.clientWidth),
            document.body.removeChild(t),
            n - r
        }
        ,
        s.fp = function(e) {
            var t = curtop = 0;
            try {
                if (e.offsetParent)
                    do {
                        t += e.offsetLeft,
                        curtop += e.offsetTop
                    } while (e = e.offsetParent);
                else
                    (e.x || e.y) && (e.x && (t += e.x),
                    e.y && (curtop += e.y))
            } catch (e) {}
            return [t, curtop]
        }
        ,
        s.ws = function(e) {
            e || (e = window);
            var t = 0;
            if (e.innerWidth) {
                if (t = e.innerWidth,
                "number" == typeof e.innerWidth) {
                    var n = s.gsbw();
                    t = e.innerWidth - n
                }
            } else
                document.documentElement && document.documentElement.clientWidth ? t = document.documentElement.clientWidth : document.body && (document.body.clientWidth || document.body.clientHeight) && (t = document.body.clientWidth);
            return t
        }
        ,
        s.ci = function(e) {
            document.URL;
            var t, n = e.parentNode;
            if (null == n || void 0 == n)
                return !1;
            for (; ; )
                if ("#document" == n.nodeName.toLowerCase()) {
                    t = n.parentWindow ? n.parentWindow : n.defaultView;
                    try {
                        return null != t.frameElement && void 0 != t.frameElement && "iframe" == t.frameElement.nodeName.toLowerCase() && t.frameElement.id || !1
                    } catch (e) {
                        return !1
                    }
                } else if (null == (n = n.parentNode) || void 0 == n)
                    return !1
        }
        ,
        s.gcp = function(e, t) {
            var n, r, i, o = -1, a = -1, u = -1, c = -1, f = "", l = window.event ? window.event : e;
            t && (l = t || window.event);
            try {
                if (bw = s.ws(window),
                i = s.ci(e)) {
                    var d = s.fp(document.getElementById(i));
                    l.clientX && void 0 != l.clientX && ((n = document.body).clientLeft && n.clientTop ? (ifrSx = l.clientX - n.clientLeft,
                    ifrSy = l.clientY - n.clientTop) : (ifrSx = l.clientX,
                    ifrSy = l.clientY)),
                    u = d[0] + ifrSx,
                    c = d[1] + ifrSy,
                    document.body && (document.body.scrollTop || document.body.scrollLeft) ? (o = u - (n = document.body).scrollLeft,
                    a = c - n.scrollTop) : document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft) ? (o = u - (r = document.documentElement).scrollLeft,
                    a = c - r.scrollTop) : (o = u,
                    a = c)
                } else
                    l.clientX && void 0 != l.clientX && ((n = document.body).clientLeft && n.clientTop ? (o = l.clientX - n.clientLeft,
                    a = l.clientY - n.clientTop) : (o = l.clientX,
                    a = l.clientY)),
                    document.body && (document.body.scrollTop || document.body.scrollLeft) ? (u = document.body.scrollLeft + (o < 0 ? 0 : o),
                    c = document.body.scrollTop + (a < 0 ? 0 : a)) : document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft) ? (void 0 != (r = document.documentElement).scrollLeft && (u = r.scrollLeft + (o < 0 ? 0 : o)),
                    void 0 != r.scrollTop && (c = r.scrollTop + (a < 0 ? 0 : a))) : (u = o < 0 ? 0 : o,
                    c = a < 0 ? 0 : a),
                    l.pageX && (u = l.pageX),
                    l.pageY && (c = l.pageY)
            } catch (t) {}
            return -1 != u && -1 != c && (f += "&px=" + u + "&py=" + c),
            -1 != o && -1 != a && (f += "&sx=" + o + "&sy=" + a),
            f
        }
        ,
        e.exports = s
    }
});
