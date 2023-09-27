!function(e) {
    var t = {};
    function n(i) {
        if (t[i])
            return t[i].exports;
        var o = t[i] = {
            i: i,
            l: !1,
            exports: {}
        };
        return e[i].call(o.exports, o, o.exports, n),
        o.l = !0,
        o.exports
    }
    n.m = e,
    n.c = t,
    n.d = function(e, t, i) {
        n.o(e, t) || Object.defineProperty(e, t, {
            enumerable: !0,
            get: i
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
        var i = Object.create(null);
        if (n.r(i),
        Object.defineProperty(i, "default", {
            enumerable: !0,
            value: e
        }),
        2 & t && "string" != typeof e)
            for (var o in e)
                n.d(i, o, function(t) {
                    return e[t]
                }
                .bind(null, o));
        return i
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
    n(n.s = 107)
}([function(e, t) {
    var n = "https://nelo2-col.navercorp.com/_store"
      , i = 3e3
      , o = {
        projectName: "one-front",
        projectVersion: "1.0.0",
        ua: navigator.userAgent || "-",
        url: location.href || "-",
        host: svr || "-"
    }
      , r = !1
      , a = 1;
    function s(e) {
        try {
            if (!r)
                return;
            if (!e || !e.error || !XMLHttpRequest)
                return;
            if ("string" == typeof e.error) {
                var t = e.error || "-";
                e.textStatus && e.textStatus.length > 0 && (t = t + " / textStatus = " + e.textStatus),
                "object" == typeof e.jqXHR && (t = t + " / status = " + e.jqXHR.status + " / statusText = " + e.jqXHR.statusText),
                e.errorThrown && e.errorThrown.length > 0 && (t = t + " / errorThrown : " + e.errorThrown),
                o.body = t
            } else {
                var s = e.error || e.error.error;
                o.body = s.message || "-",
                o.lineno = s.lineno > -1 ? s.lineno : -1,
                o.colno = s.colno > -1 ? s.colno : -1,
                o.filename = s.filename || "-"
            }
            o.logLevel = e.logLevel;
            try {
                o.pid = lcs_get_lpid()
            } catch (e) {
                o.pid = ""
            }
            if (a > nelo.maxCount)
                return;
            a == nelo.maxCount && (o.body = o.body + " / " + nelo.maxSendMessage);
            var c = new XMLHttpRequest;
            c.open("POST", n, !0),
            c.timeout = i,
            c.send(JSON.stringify(o)),
            setTimeout(function() {
                4 !== c.readyState && c.abort()
            }, i),
            a++
        } catch (e) {}
    }
    e.exports = {
        init: function(e) {
            99 * Math.random() + 1 <= nelo.sampleNumber && function(e) {
                r = e
            }(!0),
            1 == e && window.addEventListener && window.addEventListener("error", this.sendErrorToNelo)
        },
        sendErrorToNelo: function(e, t, n, i) {
            s({
                logLevel: "ERROR",
                error: e,
                jqXHR: t,
                textStatus: n,
                errorThrown: i
            })
        },
        sendWarnToNelo: function(e, t, n, i) {
            s({
                logLevel: "WARN",
                error: e,
                jqXHR: t,
                textStatus: n,
                errorThrown: i
            })
        },
        sendInfoToNelo: function(e, t, n, i) {
            s({
                logLevel: "INFO",
                error: e,
                jqXHR: t,
                textStatus: n,
                errorThrown: i
            })
        }
    }
}
, function(e, t, n) {
    var i = n(0)
      , o = {
        NAVERAPP_NEWS_CHANNEL: "https://m.naver.com/naverapp/?cmd=onMenu&menuCode=NEWS&hash=MM_news_channel",
        NAVERAPP_NEWS_FEED: "https://m.naver.com/naverapp/?cmd=onMenu&menuCode=NEWS&version=5",
        NAVERAPP_NEWS: "https://m.naver.com/naverapp/?cmd=onMenu&menuCode=NEWS"
    }
      , r = {
        NAVERAPP_NEWS_CHANNEL: "https://m.naver.com/naverapp/?cmd=onMenu&menuCode=NEWS",
        NAVERAPP_NEWS_FEED: "https://m.naver.com/naverapp/?cmd=onMenu&menuCode=NEWS&version=5",
        NAVERAPP_NEWS: "https://m.naver.com/naverapp/?cmd=onMenu&menuCode=NEWS"
    }
      , a = {
        NAVERAPP_NEWS_CHANNEL: "https://m.naver.com/naverapp/?cmd=onMenu&menuCode=NEWS&version=5",
        NAVERAPP_NEWS_FEED: "https://m.naver.com/naverapp/?cmd=onMenu&menuCode=NEWS&version=5",
        NAVERAPP_NEWS: "https://m.naver.com/naverapp/?cmd=onMenu&menuCode=NEWS&version=5"
    }
      , s = {
        NAVERAPP_NEWS_CHANNEL: newsDomain,
        NAVERAPP_NEWS_FEED: newsDomain,
        NAVERAPP_NEWS: newsDomain
    }
      , c = new RegExp("[?&]type=[A-Za-z0-9+_]*","g")
      , u = new RegExp("[?&]");
    function l(e) {
        e.preventDefault(),
        g($(this))
    }
    function d(e) {
        e.preventDefault(),
        T($(this))
    }
    function h(e) {
        e.preventDefault(),
        O()
    }
    function f(e) {
        e.preventDefault(),
        O(!0)
    }
    function p(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("url-type") || ""
          , i = t.data("url") || ""
          , o = t.data("pc-url") || ""
          , r = t.attr("target") || "";
        !1 === y() && o && (i = o),
        n && (i = I(n)),
        i && setTimeout(function() {
            "_blank" === r ? window.open(i, "_blank") : location.href = i
        }, 100)
    }
    function m(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("target") || ""
          , i = t.data("toggle-target") || "";
        t.toggle(),
        $("#" + i).toggle(),
        $("._MORE_ITEM", "#" + n).toggle();
        var o = t.closest("._MORE_WRAP");
        o[0] && t.data("persist-meta") && o.attr("data-persist-meta", t.data("persist-meta"))
    }
    function _(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("template")
          , o = t.data("target")
          , r = t.data("class-target")
          , a = t.data("class-value");
        $.ajax({
            url: "/article/template/" + n,
            cache: !1,
            method: "GET",
            timeout: 5e3,
            data: {
                oid: article.officeId,
                aid: article.articleId,
                service: service.sports ? "sports" : ""
            },
            xhrFields: {
                withCredentials: !0
            },
            success: function(e) {
                e && e.renderedComponent && e.renderedComponent[n] ? ($("#" + o).html(e.renderedComponent[n]),
                r && $("#" + r).toggleClass(a)) : i.sendErrorToNelo("[service/gnb] Ajax 템플릿 요청 에러 : " + JSON.stringify(e))
            },
            error: function(e, t, n) {
                i.sendErrorToNelo("[service/gnb] Ajax 템플릿 요청 에러", e, t, n)
            }
        })
    }
    function v(e) {
        e.preventDefault();
        var t = $(this);
        setTimeout(function() {
            location.replace(t.data("url"))
        }, 50)
    }
    function E(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("cookie-name")
          , i = t.data("cookie-value")
          , o = t.data("cookie-expires");
        Cookies.set(n, i, {
            expires: o
        })
    }
    function g(e) {
        var t = e.data("target") || ""
          , n = e.attr("data-classValue") || ""
          , i = e.attr("data-dimmed") || ""
          , o = e.attr("data-prevent-scroll") || ""
          , r = e.attr("data-show-clk") || ""
          , a = e.attr("data-hide-clk") || ""
          , s = e.attr("data-cookie-name") || "";
        if (t) {
            var c = $("#" + t);
            if (n) {
                if (s) {
                    var u = c.hasClass(n) ? "0" : "1";
                    Cookies.set(s, u, {
                        expires: 3650
                    })
                }
                setTimeout(function() {
                    c.toggleClass(n),
                    !0 === c.hasClass(n) ? nclkWrap.send({
                        $this: e,
                        sArea: r
                    }) : nclkWrap.send({
                        $this: e,
                        sArea: a
                    })
                }, 50)
            } else
                setTimeout(function() {
                    c.toggle(),
                    "none" !== c.css("display") ? nclkWrap.send({
                        $this: e,
                        sArea: r
                    }) : nclkWrap.send({
                        $this: e,
                        sArea: a
                    })
                }, 50)
        }
        "true" === i && ($("#_LAYER_DIMMED").toggle(),
        $("html").toggleClass("is_stop_scroll")),
        "true" == o && $("html").toggleClass("is_stop_scroll")
    }
    function T(e) {
        var t = e.data("target") || "";
        t && $("#" + t).hide()
    }
    function N() {
        var e = navigator.userAgent;
        return /NAVER\(inapp; search;/.test(e) || /NAVER\(higgs; search;/.test(e)
    }
    function y() {
        var e = navigator.userAgent
          , t = /^.*Android.*/.test(e)
          , n = /^.*iPhone.*|^.*iPod.*/.test(e)
          , i = /^.*iPad.*/.test(e);
        return !0 === t || !0 === n || !0 === i
    }
    function O(e) {
        var t = N();
        if (1 === history.length) {
            if (t)
                return void (location.href = "naverapp://closewindow");
            e && window.close()
        }
        history.back(),
        setTimeout(function() {
            t && (location.href = "naverapp://closewindow")
        }, 600)
    }
    function I(e) {
        return 1 == service.newsType && 0 == y() ? s[e] : 1 == isNewGreendot ? a[e] : 1 == isGreendot ? r[e] : o[e]
    }
    e.exports = {
        init: function() {
            $("body").on("click", "._TOGGLE", l),
            $("body").on("click", "._CLOSE", d),
            $("body").on("click", "._BACK", h),
            $("body").on("click", "._BACK_ELSE_CLOSE", f),
            $("body").on("click", "._LINK", p),
            $("body").on("click", "._MORE", m),
            $("body").on("click", "._AJAX_TEMPLATE", _),
            $("body").on("click", "._LOCATION_REPLACE", v),
            $("body").on("click", "._COOKIE_SET", E)
        },
        login: function() {
            1 == y() ? location.assign("https://nid.naver.com/nidlogin.login?svctype=262144") : location.assign("https://nid.naver.com/nidlogin.login")
        },
        logout: function() {
            confirm("로그아웃 하시겠습니까?") && (1 == y() ? location.replace("https://nid.naver.com/nidlogin.logout?svctype=262144&url=" + encodeURIComponent(location.href)) : location.replace("https://nid.naver.com/nidlogin.logout?returl=" + encodeURIComponent(location.href)))
        },
        moveTop: function() {
            window.scrollTo(0, 0)
        },
        toggle: g,
        hide: T,
        isNaverApp: N,
        isMobile: y,
        isTouchDevice: function() {
            return "ontouchstart"in window || navigator.maxTouchPoints > 0 || navigator.msMaxTouchPoints > 0
        },
        stopFadeLayer: function() {
            $("._FADE_LAYER").stop(!0, !0)
        },
        doHistoryBack: O,
        getUrl: I,
        isLowerDevice: function() {
            var e = Agent().os;
            if ("ios" == e.name)
                try {
                    if (e.version.split(".")[0] <= 10)
                        return !0
                } catch (e) {}
            return !1
        },
        openModalLayer: function(e, t, n) {
            var i = $("body")
              , o = $("#" + e);
            i.addClass("is_stop_scroll"),
            o.removeClass("is_hidden"),
            o.data("init") || (o.on("click", "._MODAL_LAYER_NEGATIVE", function() {
                i.removeClass("is_stop_scroll"),
                o.addClass("is_hidden"),
                n && n()
            }),
            o.on("click", "._MODAL_LAYER_POSITIVE", function() {
                i.removeClass("is_stop_scroll"),
                o.addClass("is_hidden"),
                t && t()
            }),
            o.data("init", "true"))
        },
        getTypeImageUrl: function(e, t) {
            if (!e || !t)
                return e;
            c.test(e) && (e = e.replace(c, ""));
            var n = "?type=" + t;
            return u.test(e) ? e.replace(u, n + "&") : e + n
        },
        getPlatformType: function() {
            var e = "PC"
              , t = navigator.userAgent
              , n = /^.*Android.*/.test(t)
              , i = /^.*iPhone.*|^.*iPod.*/.test(t)
              , o = /^.*iPad.*/.test(t);
            return !0 !== n && !0 !== i && !0 !== o || (e = "MOBILE"),
            e
        },
        isInternalReferrer: function() {
            return /(www\.naver\.com)|(m\.naver\.com)|(media\.naver\.com)|(news\.naver\.com)/.test(document.referrer)
        },
        sendLog: function(e, t) {
            var n = $.extend({
                type: e
            }, t)
              , i = new Image;
            i.src = "https://n2.news.naver.com/l.gif?" + $.param(n),
            i.onload = function() {
                i.onload = null
            }
        }
    }
}
, , function(e, t, n) {
    (function(t) {
        var i = n(8);
        function o(e) {
            var n = e || {};
            if (n.$this && n.sArea) {
                n.sGdid = e.sGdid || "",
                n.sRank = e.sRank || "",
                n.sExtra = e.sExtra || "",
                -1 == e.sArea.indexOf(".") && (e.sArea = g_default_area + "." + e.sArea),
                t(e.$this[0], e.sArea, e.sGdid, e.sRank, 0, encodeURIComponent(e.sExtra));
                var o = {
                    a: e.sArea,
                    i: e.sGdid,
                    r: e.sRank,
                    p: lcs_get_lpid ? lcs_get_lpid() : ""
                };
                i.send("nclick", o)
            }
        }
        e.exports = {
            init: function() {
                window.nclk = t,
                $("body").on("click", "[data-clk]", function(e) {
                    if (!e.isTrigger) {
                        var t = $(e.currentTarget);
                        o({
                            $this: t,
                            sArea: t.attr("data-clk") || "",
                            sGdid: t.attr("data-gdid"),
                            sRank: t.attr("data-rank"),
                            sExtra: t.attr("data-extra")
                        })
                    }
                })
            },
            send: o
        }
    }
    ).call(this, n(6))
}
, function(e, t) {
    var n = $("#_MODAL_WRAP")
      , i = $("#_LAYER_DIMMED")
      , o = $("._MODAL_TEMPLATE").html();
    function r() {
        n.html(""),
        i.hide(),
        n.off(),
        $("html").removeClass("is_stop_scroll")
    }
    e.exports = {
        show: function(e, t, a) {
            e.confirmMessage = e.confirmMessage || "확인",
            e.cancelMessage = e.cancelMessage || "취소",
            n.on("click", "._MODAL_CONFIRM", function() {
                r(),
                t && t()
            }),
            n.on("click", "._MODAL_CANCEL", function() {
                r(),
                a && a()
            });
            var s = Mustache.render(o, e);
            i.show(),
            n.html(s),
            n.show(),
            $("html").addClass("is_stop_scroll")
        }
    }
}
, function(e, t, n) {
    /*!
 * Copyright (c) 2017 NAVER Corp.
 * @egjs/rotate project is licensed under the MIT <https://naver.github.io/egjs/license.txt> license
 *
 * @egjs/rotate JavaScript library
 * https://github.com/naver/egjs-rotate
 *
 * @version 2.1.0
 */
    window,
    e.exports = function(e) {
        var t = {};
        function n(i) {
            if (t[i])
                return t[i].exports;
            var o = t[i] = {
                i: i,
                l: !1,
                exports: {}
            };
            return e[i].call(o.exports, o, o.exports, n),
            o.l = !0,
            o.exports
        }
        return n.m = e,
        n.c = t,
        n.d = function(e, t, i) {
            n.o(e, t) || Object.defineProperty(e, t, {
                configurable: !1,
                enumerable: !0,
                get: i
            })
        }
        ,
        n.r = function(e) {
            Object.defineProperty(e, "__esModule", {
                value: !0
            })
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
        n(n.s = 0)
    }([function(e, t, n) {
        "use strict";
        var i, o = n(1), r = (i = o) && i.__esModule ? i : {
            default: i
        };
        r.default.VERSION = "2.1.0",
        e.exports = r.default
    }
    , function(e, t, n) {
        "use strict";
        t.__esModule = !0;
        var i = n(2);
        t.default = function() {
            var e, t, n, o = -1, r = null, a = [], s = (e = i.window.navigator.userAgent,
            t = e.match(/(iPhone OS|CPU OS|Android)\s([^\s;-]+)/),
            n = {
                os: "",
                version: "",
                ua: e
            },
            t && (n.os = t[1].replace(/(?:CPU|iPhone)\sOS/, "ios").toLowerCase(),
            n.version = t[2].replace(/\D/g, ".")),
            n), c = /android|ios/.test(s.os) || /Mobi/.test(s.ua);
            if (!c) {
                var u = function() {
                    return !1
                };
                return {
                    on: u,
                    off: u,
                    isVertical: u
                }
            }
            var l = "android" === s.os && "2.1" === s.version ? "resize" : "onorientationchange"in i.window ? "orientationchange" : "resize";
            function d() {
                var e = void 0
                  , t = void 0
                  , n = void 0;
                return "resize" === l ? (e = i.document.documentElement.clientWidth,
                n = -1 === o ? e < i.document.documentElement.clientHeight : e < o || e === o && r) : 0 === (t = i.window.orientation) || 180 === t ? n = !0 : 90 !== t && -90 !== t || (n = !1),
                n
            }
            function h(e) {
                var t = d();
                c && r !== t && (r = t,
                o = i.document.documentElement.clientWidth,
                a.forEach(function(t) {
                    return t(e, {
                        isVertical: r
                    })
                }))
            }
            function f(e) {
                var t = null;
                if ("resize" === l)
                    i.window.setTimeout(function() {
                        return h(e)
                    }, 0);
                else {
                    if ("android" === s.os) {
                        var n = i.document.documentElement.clientWidth;
                        if ("orientationchange" === e.type && n === o)
                            return i.window.setTimeout(function() {
                                return f(e)
                            }, 500),
                            !1
                    }
                    t && i.window.clearTimeout(t),
                    t = i.window.setTimeout(function() {
                        return h(e)
                    }, 300)
                }
            }
            return {
                on: function(e) {
                    "function" == typeof e && (r = d(),
                    o = i.document.documentElement.clientWidth,
                    a.push(e),
                    1 === a.length && i.window.addEventListener(l, f))
                },
                off: function(e) {
                    if ("function" == typeof e)
                        for (var t, n = 0; t = a[n]; n++)
                            if (t === e) {
                                a.splice(n, 1);
                                break
                            }
                    e && 0 !== a.length || (a.splice(0),
                    i.window.removeEventListener(l, f))
                },
                orientationChange: l,
                isVertical: d,
                triggerRotate: h,
                handler: f
            }
        }(),
        e.exports = t.default
    }
    , function(e, t, n) {
        "use strict";
        t.__esModule = !0;
        var i = "undefined" != typeof window && window.Math === Math ? window : "undefined" != typeof self && self.Math === Math ? self : Function("return this")()
          , o = i.document;
        t.window = i,
        t.document = o
    }
    ])
}
, function(e, t) {
    if (void 0 === s && (s = {}),
    !n)
        var n = "";
    if (!i)
        var i = "";
    if (!o)
        var o = "cc.naver.com";
    if (!r)
        var r = "decide.me";
    if (!a)
        var a = "";
    function s(e, t, n, i, o, r, a) {
        var c, u, l, d = e, h = e;
        return "nodeType"in e && e.nodeType >= 1 ? d = window.event || e : h = e.srcElement || e.currentTarget || e.target,
        r || (r = ""),
        l = s.gcp(h, d),
        u = s.gl(t, n, i, l, "", 0, s.st, r, a),
        c = s.l(h, u),
        s.sd(c),
        !0
    }
    s.vs = "0.3.2",
    s.md = "cc",
    s.pt = "https:" == window.location.protocol ? "https:" : "http:",
    s.ct = 0,
    s.ec = encodeURIComponent,
    s.st = 1,
    s.l = function(e, t) {
        var n, i, r;
        return e && e.href ? (i = e.tagName.toLowerCase(),
        (r = e.href.toLowerCase()) && 0 == r.indexOf(s.pt + "//" + o) ? n = e.href : r && 0 != r.indexOf(s.pt + "//" + o) && i && "img" != i && (n = t + "&u=" + s.ec(e.href)),
        n) : t + "&u=about%3Ablank"
    }
    ,
    s.sd = function(e, t) {
        var n, i = 0;
        s.ct > 0 && (e += "&nt=" + (new Date).getTime());
        "function" == typeof t && (i = 1);
        var o = new Image;
        o.src = e,
        o.onload = function() {
            n && clearTimeout(n),
            i && t(),
            o.onload = null
        }
        ,
        o.onerror = function() {
            n && clearTimeout(n),
            i && t(),
            o.onerror = null
        }
        ,
        i && (n = setTimeout(function() {
            t()
        }, 5e3)),
        s.ct++
    }
    ,
    s.gl = function(e, t, a, c, u, l, d, h, f) {
        var p = window;
        void 0 == l && (l = 1),
        void 0 == d && (d = 1);
        var m = s.pt + "//" + o + "/" + s.md + "?a=" + e + "&r=" + a + "&i=" + t + "&m=" + l;
        return 1 == d ? (p.g_ssc && (m += "&ssc=" + g_ssc),
        p.g_query && (m += "&q=" + s.ec(g_query)),
        p.g_sid && (m += "&s=" + i),
        f ? m += "&p=" + f : p.g_pid ? m += "&p=" + n : p.lcs_get_lpid ? m += "&p=" + lcs_get_lpid() : console.warn("'g_pid / lcs_get_lpid' is not exist.")) : (m += "&nsc=" + r,
        console.warn("[DEPRECATED] NSC mode")),
        h && (m += "&g=" + h),
        u && (m += "&u=" + s.ec(u)),
        c && (m += c),
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
        var i = e.offsetWidth;
        return n == i && (i = t.clientWidth),
        document.body.removeChild(t),
        n - i
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
        var n, i, o, r = -1, a = -1, c = -1, u = -1, l = "", d = window.event ? window.event : e;
        t && (d = t || window.event);
        try {
            if (bw = s.ws(window),
            o = s.ci(e)) {
                var h = s.fp(document.getElementById(o));
                d.clientX && void 0 != d.clientX && ((n = document.body).clientLeft && n.clientTop ? (ifrSx = d.clientX - n.clientLeft,
                ifrSy = d.clientY - n.clientTop) : (ifrSx = d.clientX,
                ifrSy = d.clientY)),
                c = h[0] + ifrSx,
                u = h[1] + ifrSy,
                document.body && (document.body.scrollTop || document.body.scrollLeft) ? (r = c - (n = document.body).scrollLeft,
                a = u - n.scrollTop) : document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft) ? (r = c - (i = document.documentElement).scrollLeft,
                a = u - i.scrollTop) : (r = c,
                a = u)
            } else
                d.clientX && void 0 != d.clientX && ((n = document.body).clientLeft && n.clientTop ? (r = d.clientX - n.clientLeft,
                a = d.clientY - n.clientTop) : (r = d.clientX,
                a = d.clientY)),
                document.body && (document.body.scrollTop || document.body.scrollLeft) ? (c = document.body.scrollLeft + (r < 0 ? 0 : r),
                u = document.body.scrollTop + (a < 0 ? 0 : a)) : document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft) ? (void 0 != (i = document.documentElement).scrollLeft && (c = i.scrollLeft + (r < 0 ? 0 : r)),
                void 0 != i.scrollTop && (u = i.scrollTop + (a < 0 ? 0 : a))) : (c = r < 0 ? 0 : r,
                u = a < 0 ? 0 : a),
                d.pageX && (c = d.pageX),
                d.pageY && (u = d.pageY)
        } catch (t) {}
        return -1 != c && -1 != u && (l += "&px=" + c + "&py=" + u),
        -1 != r && -1 != a && (l += "&sx=" + r + "&sy=" + a),
        l
    }
    ,
    e.exports = s
}
, function(e, t, n) {
    e.exports = function() {
        "use strict";
        function e(e, t) {
            e.prototype = Object.create(t.prototype),
            e.prototype.constructor = e,
            e.__proto__ = t
        }
        function t(e) {
            return void 0 === e
        }
        var n = function() {
            var e = function() {
                function e() {
                    this._eventHandler = {},
                    this.options = {}
                }
                var n = e.prototype;
                return n.trigger = function(e, t) {
                    void 0 === t && (t = {});
                    var n = this._eventHandler[e] || []
                      , i = n.length > 0;
                    if (!i)
                        return !0;
                    n = n.concat(),
                    t.eventType = e;
                    var o = !1
                      , r = [t]
                      , a = 0;
                    t.stop = function() {
                        o = !0
                    }
                    ,
                    t.currentTarget = this;
                    for (var s = arguments.length, c = new Array(s > 2 ? s - 2 : 0), u = 2; u < s; u++)
                        c[u - 2] = arguments[u];
                    for (c.length >= 1 && (r = r.concat(c)),
                    a = 0; n[a]; a++)
                        n[a].apply(this, r);
                    return !o
                }
                ,
                n.once = function(e, n) {
                    if ("object" == typeof e && t(n)) {
                        var i, o = e;
                        for (i in o)
                            this.once(i, o[i]);
                        return this
                    }
                    if ("string" == typeof e && "function" == typeof n) {
                        var r = this;
                        this.on(e, function t() {
                            for (var i = arguments.length, o = new Array(i), a = 0; a < i; a++)
                                o[a] = arguments[a];
                            n.apply(r, o),
                            r.off(e, t)
                        })
                    }
                    return this
                }
                ,
                n.hasOn = function(e) {
                    return !!this._eventHandler[e]
                }
                ,
                n.on = function(e, n) {
                    if ("object" == typeof e && t(n)) {
                        var i, o = e;
                        for (i in o)
                            this.on(i, o[i]);
                        return this
                    }
                    if ("string" == typeof e && "function" == typeof n) {
                        var r = this._eventHandler[e];
                        t(r) && (this._eventHandler[e] = [],
                        r = this._eventHandler[e]),
                        r.push(n)
                    }
                    return this
                }
                ,
                n.off = function(e, n) {
                    if (t(e))
                        return this._eventHandler = {},
                        this;
                    if (t(n)) {
                        if ("string" == typeof e)
                            return this._eventHandler[e] = void 0,
                            this;
                        var i, o = e;
                        for (i in o)
                            this.off(i, o[i]);
                        return this
                    }
                    var r, a, s = this._eventHandler[e];
                    if (s)
                        for (r = 0; void 0 !== (a = s[r]); r++)
                            if (a === n) {
                                s = s.splice(r, 1);
                                break
                            }
                    return this
                }
                ,
                e
            }();
            return e.VERSION = "2.1.2",
            e
        }();
        /*! Hammer.JS - v2.0.11 - 2018-10-22
   * http://naver.github.io/egjs
   *
   * Forked By Naver egjs
   * Copyright (c) hammerjs
   * Licensed under the MIT license */
        function i(e, t, n) {
            return t in e ? Object.defineProperty(e, t, {
                value: n,
                enumerable: !0,
                configurable: !0,
                writable: !0
            }) : e[t] = n,
            e
        }
        function o() {
            return (o = Object.assign || function(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = arguments[t];
                    for (var i in n)
                        Object.prototype.hasOwnProperty.call(n, i) && (e[i] = n[i])
                }
                return e
            }
            ).apply(this, arguments)
        }
        function r(e, t) {
            e.prototype = Object.create(t.prototype),
            e.prototype.constructor = e,
            e.__proto__ = t
        }
        function a(e) {
            if (void 0 === e)
                throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
            return e
        }
        var s, c = "function" != typeof Object.assign ? function(e) {
            if (void 0 === e || null === e)
                throw new TypeError("Cannot convert undefined or null to object");
            for (var t = Object(e), n = 1; n < arguments.length; n++) {
                var i = arguments[n];
                if (void 0 !== i && null !== i)
                    for (var o in i)
                        i.hasOwnProperty(o) && (t[o] = i[o])
            }
            return t
        }
        : Object.assign, u = ["", "webkit", "Moz", "MS", "ms", "o"], l = "undefined" == typeof document ? {
            style: {}
        } : document.createElement("div"), d = "function", h = Math.round, f = Math.abs, p = Date.now;
        function m(e, t) {
            for (var n, i, o = t[0].toUpperCase() + t.slice(1), r = 0; r < u.length; ) {
                if (n = u[r],
                (i = n ? n + o : t)in e)
                    return i;
                r++
            }
        }
        s = "undefined" == typeof window ? {} : window;
        var _ = m(l.style, "touchAction")
          , v = void 0 !== _
          , E = "auto"
          , g = "manipulation"
          , T = "none"
          , N = "pan-x"
          , y = "pan-y"
          , O = function() {
            if (!v)
                return !1;
            var e = {}
              , t = s.CSS && s.CSS.supports;
            return ["auto", "manipulation", "pan-y", "pan-x", "pan-x pan-y", "none"].forEach(function(n) {
                return e[n] = !t || s.CSS.supports("touch-action", n)
            }),
            e
        }()
          , I = "ontouchstart"in s
          , C = void 0 !== m(s, "PointerEvent")
          , w = I && /mobile|tablet|ip(ad|hone|od)|android/i.test(navigator.userAgent)
          , b = "touch"
          , S = "mouse"
          , x = 25
          , A = 1
          , P = 2
          , R = 4
          , $ = 8
          , M = 1
          , D = 2
          , L = 4
          , k = 8
          , U = 16
          , j = D | L
          , Y = k | U
          , B = j | Y
          , H = ["x", "y"]
          , F = ["clientX", "clientY"];
        function V(e, t, n) {
            var i;
            if (e)
                if (e.forEach)
                    e.forEach(t, n);
                else if (void 0 !== e.length)
                    for (i = 0; i < e.length; )
                        t.call(n, e[i], i, e),
                        i++;
                else
                    for (i in e)
                        e.hasOwnProperty(i) && t.call(n, e[i], i, e)
        }
        function W(e, t) {
            return typeof e === d ? e.apply(t && t[0] || void 0, t) : e
        }
        function G(e, t) {
            return e.indexOf(t) > -1
        }
        var z = function() {
            function e(e, t) {
                this.manager = e,
                this.set(t)
            }
            var t = e.prototype;
            return t.set = function(e) {
                "compute" === e && (e = this.compute()),
                v && this.manager.element.style && O[e] && (this.manager.element.style[_] = e),
                this.actions = e.toLowerCase().trim()
            }
            ,
            t.update = function() {
                this.set(this.manager.options.touchAction)
            }
            ,
            t.compute = function() {
                var e = [];
                return V(this.manager.recognizers, function(t) {
                    W(t.options.enable, [t]) && (e = e.concat(t.getTouchAction()))
                }),
                function(e) {
                    if (G(e, T))
                        return T;
                    var t = G(e, N)
                      , n = G(e, y);
                    return t && n ? T : t || n ? t ? N : y : G(e, g) ? g : E
                }(e.join(" "))
            }
            ,
            t.preventDefaults = function(e) {
                var t = e.srcEvent
                  , n = e.offsetDirection;
                if (this.manager.session.prevented)
                    t.preventDefault();
                else {
                    var i = this.actions
                      , o = G(i, T) && !O[T]
                      , r = G(i, y) && !O[y]
                      , a = G(i, N) && !O[N];
                    if (o) {
                        var s = 1 === e.pointers.length
                          , c = e.distance < 2
                          , u = e.deltaTime < 250;
                        if (s && c && u)
                            return
                    }
                    if (!a || !r)
                        return o || r && n & j || a && n & Y ? this.preventSrc(t) : void 0
                }
            }
            ,
            t.preventSrc = function(e) {
                this.manager.session.prevented = !0,
                e.preventDefault()
            }
            ,
            e
        }();
        function J(e, t) {
            for (; e; ) {
                if (e === t)
                    return !0;
                e = e.parentNode
            }
            return !1
        }
        function K(e) {
            var t = e.length;
            if (1 === t)
                return {
                    x: h(e[0].clientX),
                    y: h(e[0].clientY)
                };
            for (var n = 0, i = 0, o = 0; o < t; )
                n += e[o].clientX,
                i += e[o].clientY,
                o++;
            return {
                x: h(n / t),
                y: h(i / t)
            }
        }
        function X(e) {
            for (var t = [], n = 0; n < e.pointers.length; )
                t[n] = {
                    clientX: h(e.pointers[n].clientX),
                    clientY: h(e.pointers[n].clientY)
                },
                n++;
            return {
                timeStamp: p(),
                pointers: t,
                center: K(t),
                deltaX: e.deltaX,
                deltaY: e.deltaY
            }
        }
        function q(e, t, n) {
            n || (n = H);
            var i = t[n[0]] - e[n[0]]
              , o = t[n[1]] - e[n[1]];
            return Math.sqrt(i * i + o * o)
        }
        function Z(e, t, n) {
            n || (n = H);
            var i = t[n[0]] - e[n[0]]
              , o = t[n[1]] - e[n[1]];
            return 180 * Math.atan2(o, i) / Math.PI
        }
        function Q(e, t) {
            return e === t ? M : f(e) >= f(t) ? e < 0 ? D : L : t < 0 ? k : U
        }
        function ee(e, t, n) {
            return {
                x: t / e || 0,
                y: n / e || 0
            }
        }
        function te(e, t) {
            var n = e.session
              , i = t.pointers
              , o = i.length;
            n.firstInput || (n.firstInput = X(t)),
            o > 1 && !n.firstMultiple ? n.firstMultiple = X(t) : 1 === o && (n.firstMultiple = !1);
            var r = n.firstInput
              , a = n.firstMultiple
              , s = a ? a.center : r.center
              , c = t.center = K(i);
            t.timeStamp = p(),
            t.deltaTime = t.timeStamp - r.timeStamp,
            t.angle = Z(s, c),
            t.distance = q(s, c),
            function(e, t) {
                var n = t.center
                  , i = e.offsetDelta || {}
                  , o = e.prevDelta || {}
                  , r = e.prevInput || {};
                t.eventType !== A && r.eventType !== R || (o = e.prevDelta = {
                    x: r.deltaX || 0,
                    y: r.deltaY || 0
                },
                i = e.offsetDelta = {
                    x: n.x,
                    y: n.y
                }),
                t.deltaX = o.x + (n.x - i.x),
                t.deltaY = o.y + (n.y - i.y)
            }(n, t),
            t.offsetDirection = Q(t.deltaX, t.deltaY);
            var u = ee(t.deltaTime, t.deltaX, t.deltaY);
            t.overallVelocityX = u.x,
            t.overallVelocityY = u.y,
            t.overallVelocity = f(u.x) > f(u.y) ? u.x : u.y,
            t.scale = a ? function(e, t) {
                return q(t[0], t[1], F) / q(e[0], e[1], F)
            }(a.pointers, i) : 1,
            t.rotation = a ? function(e, t) {
                return Z(t[1], t[0], F) + Z(e[1], e[0], F)
            }(a.pointers, i) : 0,
            t.maxPointers = n.prevInput ? t.pointers.length > n.prevInput.maxPointers ? t.pointers.length : n.prevInput.maxPointers : t.pointers.length,
            function(e, t) {
                var n, i, o, r, a = e.lastInterval || t, s = t.timeStamp - a.timeStamp;
                if (t.eventType !== $ && (s > x || void 0 === a.velocity)) {
                    var c = t.deltaX - a.deltaX
                      , u = t.deltaY - a.deltaY
                      , l = ee(s, c, u);
                    i = l.x,
                    o = l.y,
                    n = f(l.x) > f(l.y) ? l.x : l.y,
                    r = Q(c, u),
                    e.lastInterval = t
                } else
                    n = a.velocity,
                    i = a.velocityX,
                    o = a.velocityY,
                    r = a.direction;
                t.velocity = n,
                t.velocityX = i,
                t.velocityY = o,
                t.direction = r
            }(n, t);
            var l = e.element;
            J(t.srcEvent.target, l) && (l = t.srcEvent.target),
            t.target = l
        }
        function ne(e, t, n) {
            var i = n.pointers.length
              , o = n.changedPointers.length
              , r = t & A && i - o == 0
              , a = t & (R | $) && i - o == 0;
            n.isFirst = !!r,
            n.isFinal = !!a,
            r && (e.session = {}),
            n.eventType = t,
            te(e, n),
            e.emit("hammer.input", n),
            e.recognize(n),
            e.session.prevInput = n
        }
        function ie(e) {
            return e.trim().split(/\s+/g)
        }
        function oe(e, t, n) {
            V(ie(t), function(t) {
                e.addEventListener(t, n, !1)
            })
        }
        function re(e, t, n) {
            V(ie(t), function(t) {
                e.removeEventListener(t, n, !1)
            })
        }
        function ae(e) {
            var t = e.ownerDocument || e;
            return t.defaultView || t.parentWindow || window
        }
        var se = function() {
            function e(e, t) {
                var n = this;
                this.manager = e,
                this.callback = t,
                this.element = e.element,
                this.target = e.options.inputTarget,
                this.domHandler = function(t) {
                    W(e.options.enable, [e]) && n.handler(t)
                }
                ,
                this.init()
            }
            var t = e.prototype;
            return t.handler = function() {}
            ,
            t.init = function() {
                this.evEl && oe(this.element, this.evEl, this.domHandler),
                this.evTarget && oe(this.target, this.evTarget, this.domHandler),
                this.evWin && oe(ae(this.element), this.evWin, this.domHandler)
            }
            ,
            t.destroy = function() {
                this.evEl && re(this.element, this.evEl, this.domHandler),
                this.evTarget && re(this.target, this.evTarget, this.domHandler),
                this.evWin && re(ae(this.element), this.evWin, this.domHandler)
            }
            ,
            e
        }();
        function ce(e, t, n) {
            if (e.indexOf && !n)
                return e.indexOf(t);
            for (var i = 0; i < e.length; ) {
                if (n && e[i][n] == t || !n && e[i] === t)
                    return i;
                i++
            }
            return -1
        }
        var ue = {
            pointerdown: A,
            pointermove: P,
            pointerup: R,
            pointercancel: $,
            pointerout: $
        }
          , le = {
            2: b,
            3: "pen",
            4: S,
            5: "kinect"
        }
          , de = "pointerdown"
          , he = "pointermove pointerup pointercancel";
        s.MSPointerEvent && !s.PointerEvent && (de = "MSPointerDown",
        he = "MSPointerMove MSPointerUp MSPointerCancel");
        var fe = function(e) {
            function t() {
                var n, i = t.prototype;
                return i.evEl = de,
                i.evWin = he,
                (n = e.apply(this, arguments) || this).store = n.manager.session.pointerEvents = [],
                n
            }
            r(t, e);
            var n = t.prototype;
            return n.handler = function(e) {
                var t = this.store
                  , n = !1
                  , i = e.type.toLowerCase().replace("ms", "")
                  , o = ue[i]
                  , r = le[e.pointerType] || e.pointerType
                  , a = r === b
                  , s = ce(t, e.pointerId, "pointerId");
                o & A && (0 === e.button || a) ? s < 0 && (t.push(e),
                s = t.length - 1) : o & (R | $) && (n = !0),
                s < 0 || (t[s] = e,
                this.callback(this.manager, o, {
                    pointers: t,
                    changedPointers: [e],
                    pointerType: r,
                    srcEvent: e
                }),
                n && t.splice(s, 1))
            }
            ,
            t
        }(se);
        function pe(e) {
            return Array.prototype.slice.call(e, 0)
        }
        function me(e, t, n) {
            for (var i = [], o = [], r = 0; r < e.length; ) {
                var a = t ? e[r][t] : e[r];
                ce(o, a) < 0 && i.push(e[r]),
                o[r] = a,
                r++
            }
            return n && (i = t ? i.sort(function(e, n) {
                return e[t] > n[t]
            }) : i.sort()),
            i
        }
        var _e = {
            touchstart: A,
            touchmove: P,
            touchend: R,
            touchcancel: $
        }
          , ve = "touchstart touchmove touchend touchcancel"
          , Ee = function(e) {
            function t() {
                return t.prototype.evTarget = ve,
                t.prototype.targetIds = {},
                e.apply(this, arguments) || this
            }
            r(t, e);
            var n = t.prototype;
            return n.handler = function(e) {
                var t = _e[e.type]
                  , n = function(e, t) {
                    var n, i, o = pe(e.touches), r = this.targetIds;
                    if (t & (A | P) && 1 === o.length)
                        return r[o[0].identifier] = !0,
                        [o, o];
                    var a = pe(e.changedTouches)
                      , s = []
                      , c = this.target;
                    if (i = o.filter(function(e) {
                        return J(e.target, c)
                    }),
                    t === A)
                        for (n = 0; n < i.length; )
                            r[i[n].identifier] = !0,
                            n++;
                    for (n = 0; n < a.length; )
                        r[a[n].identifier] && s.push(a[n]),
                        t & (R | $) && delete r[a[n].identifier],
                        n++;
                    return s.length ? [me(i.concat(s), "identifier", !0), s] : void 0
                }
                .call(this, e, t);
                n && this.callback(this.manager, t, {
                    pointers: n[0],
                    changedPointers: n[1],
                    pointerType: b,
                    srcEvent: e
                })
            }
            ,
            t
        }(se)
          , ge = {
            mousedown: A,
            mousemove: P,
            mouseup: R
        }
          , Te = "mousedown"
          , Ne = "mousemove mouseup"
          , ye = function(e) {
            function t() {
                var n, i = t.prototype;
                return i.evEl = Te,
                i.evWin = Ne,
                (n = e.apply(this, arguments) || this).pressed = !1,
                n
            }
            r(t, e);
            var n = t.prototype;
            return n.handler = function(e) {
                var t = ge[e.type];
                t & A && 0 === e.button && (this.pressed = !0),
                t & P && 1 !== e.which && (t = R),
                this.pressed && (t & R && (this.pressed = !1),
                this.callback(this.manager, t, {
                    pointers: [e],
                    changedPointers: [e],
                    pointerType: S,
                    srcEvent: e
                }))
            }
            ,
            t
        }(se)
          , Oe = 2500
          , Ie = 25;
        function Ce(e) {
            var t = e.changedPointers
              , n = t[0];
            if (n.identifier === this.primaryTouch) {
                var i = {
                    x: n.clientX,
                    y: n.clientY
                }
                  , o = this.lastTouches;
                this.lastTouches.push(i),
                setTimeout(function() {
                    var e = o.indexOf(i);
                    e > -1 && o.splice(e, 1)
                }, Oe)
            }
        }
        var we = function() {
            var e = function(e) {
                function t(t, n) {
                    var o;
                    return i(a(a(o = e.call(this, t, n) || this)), "handler", function(e, t, n) {
                        var i = n.pointerType === b
                          , r = n.pointerType === S;
                        if (!(r && n.sourceCapabilities && n.sourceCapabilities.firesTouchEvents)) {
                            if (i)
                                (function(e, t) {
                                    e & A ? (this.primaryTouch = t.changedPointers[0].identifier,
                                    Ce.call(this, t)) : e & (R | $) && Ce.call(this, t)
                                }
                                ).call(a(a(o)), t, n);
                            else if (r && function(e) {
                                for (var t = e.srcEvent.clientX, n = e.srcEvent.clientY, i = 0; i < this.lastTouches.length; i++) {
                                    var o = this.lastTouches[i]
                                      , r = Math.abs(t - o.x)
                                      , a = Math.abs(n - o.y);
                                    if (r <= Ie && a <= Ie)
                                        return !0
                                }
                                return !1
                            }
                            .call(a(a(o)), n))
                                return;
                            o.callback(e, t, n)
                        }
                    }),
                    o.touch = new Ee(o.manager,o.handler),
                    o.mouse = new ye(o.manager,o.handler),
                    o.primaryTouch = null,
                    o.lastTouches = [],
                    o
                }
                r(t, e);
                var n = t.prototype;
                return n.destroy = function() {
                    this.touch.destroy(),
                    this.mouse.destroy()
                }
                ,
                t
            }(se);
            return e
        }();
        function be(e, t, n) {
            return !!Array.isArray(e) && (V(e, n[t], n),
            !0)
        }
        var Se = 1
          , xe = 2
          , Ae = 4
          , Pe = 8
          , Re = Pe
          , $e = 16
          , Me = 1;
        function De(e, t) {
            var n = t.manager;
            return n ? n.get(e) : e
        }
        function Le(e) {
            return e & $e ? "cancel" : e & Pe ? "end" : e & Ae ? "move" : e & xe ? "start" : ""
        }
        var ke = function() {
            function e(e) {
                void 0 === e && (e = {}),
                this.options = o({
                    enable: !0
                }, e),
                this.id = Me++,
                this.manager = null,
                this.state = Se,
                this.simultaneous = {},
                this.requireFail = []
            }
            var t = e.prototype;
            return t.set = function(e) {
                return c(this.options, e),
                this.manager && this.manager.touchAction.update(),
                this
            }
            ,
            t.recognizeWith = function(e) {
                if (be(e, "recognizeWith", this))
                    return this;
                var t = this.simultaneous;
                return e = De(e, this),
                t[e.id] || (t[e.id] = e,
                e.recognizeWith(this)),
                this
            }
            ,
            t.dropRecognizeWith = function(e) {
                return be(e, "dropRecognizeWith", this) ? this : (e = De(e, this),
                delete this.simultaneous[e.id],
                this)
            }
            ,
            t.requireFailure = function(e) {
                if (be(e, "requireFailure", this))
                    return this;
                var t = this.requireFail;
                return e = De(e, this),
                -1 === ce(t, e) && (t.push(e),
                e.requireFailure(this)),
                this
            }
            ,
            t.dropRequireFailure = function(e) {
                if (be(e, "dropRequireFailure", this))
                    return this;
                e = De(e, this);
                var t = ce(this.requireFail, e);
                return t > -1 && this.requireFail.splice(t, 1),
                this
            }
            ,
            t.hasRequireFailures = function() {
                return this.requireFail.length > 0
            }
            ,
            t.canRecognizeWith = function(e) {
                return !!this.simultaneous[e.id]
            }
            ,
            t.emit = function(e) {
                var t = this
                  , n = this.state;
                function i(n) {
                    t.manager.emit(n, e)
                }
                n < Pe && i(t.options.event + Le(n)),
                i(t.options.event),
                e.additionalEvent && i(e.additionalEvent),
                n >= Pe && i(t.options.event + Le(n))
            }
            ,
            t.tryEmit = function(e) {
                if (this.canEmit())
                    return this.emit(e);
                this.state = 32
            }
            ,
            t.canEmit = function() {
                for (var e = 0; e < this.requireFail.length; ) {
                    if (!(this.requireFail[e].state & (32 | Se)))
                        return !1;
                    e++
                }
                return !0
            }
            ,
            t.recognize = function(e) {
                var t = c({}, e);
                if (!W(this.options.enable, [this, t]))
                    return this.reset(),
                    void (this.state = 32);
                this.state & (Re | $e | 32) && (this.state = Se),
                this.state = this.process(t),
                this.state & (xe | Ae | Pe | $e) && this.tryEmit(t)
            }
            ,
            t.process = function(e) {}
            ,
            t.getTouchAction = function() {}
            ,
            t.reset = function() {}
            ,
            e
        }()
          , Ue = {
            domEvents: !1,
            touchAction: "compute",
            enable: !0,
            inputTarget: null,
            inputClass: null,
            preset: [],
            cssProps: {
                userSelect: "none",
                touchSelect: "none",
                touchCallout: "none",
                contentZooming: "none",
                userDrag: "none",
                tapHighlightColor: "rgba(0,0,0,0)"
            }
        };
        function je(e, t) {
            var n, i = e.element;
            i.style && (V(e.options.cssProps, function(o, r) {
                n = m(i.style, r),
                t ? (e.oldCssProps[n] = i.style[n],
                i.style[n] = o) : i.style[n] = e.oldCssProps[n] || ""
            }),
            t || (e.oldCssProps = {}))
        }
        var Ye = function() {
            function e(e, t) {
                var n = this;
                this.options = c({}, Ue, t || {}),
                this.options.inputTarget = this.options.inputTarget || e,
                this.handlers = {},
                this.session = {},
                this.recognizers = [],
                this.oldCssProps = {},
                this.element = e,
                this.input = function(e) {
                    var t = e.options.inputClass;
                    return new (t || (C ? fe : w ? Ee : I ? we : ye))(e,ne)
                }(this),
                this.touchAction = new z(this,this.options.touchAction),
                je(this, !0),
                V(this.options.recognizers, function(e) {
                    var t = n.add(new e[0](e[1]));
                    e[2] && t.recognizeWith(e[2]),
                    e[3] && t.requireFailure(e[3])
                }, this)
            }
            var t = e.prototype;
            return t.set = function(e) {
                return c(this.options, e),
                e.touchAction && this.touchAction.update(),
                e.inputTarget && (this.input.destroy(),
                this.input.target = e.inputTarget,
                this.input.init()),
                this
            }
            ,
            t.stop = function(e) {
                this.session.stopped = e ? 2 : 1
            }
            ,
            t.recognize = function(e) {
                var t = this.session;
                if (!t.stopped) {
                    var n;
                    this.touchAction.preventDefaults(e);
                    var i = this.recognizers
                      , o = t.curRecognizer;
                    (!o || o && o.state & Re) && (t.curRecognizer = null,
                    o = null);
                    for (var r = 0; r < i.length; )
                        n = i[r],
                        2 === t.stopped || o && n !== o && !n.canRecognizeWith(o) ? n.reset() : n.recognize(e),
                        !o && n.state & (xe | Ae | Pe) && (t.curRecognizer = n,
                        o = n),
                        r++
                }
            }
            ,
            t.get = function(e) {
                if (e instanceof ke)
                    return e;
                for (var t = this.recognizers, n = 0; n < t.length; n++)
                    if (t[n].options.event === e)
                        return t[n];
                return null
            }
            ,
            t.add = function(e) {
                if (be(e, "add", this))
                    return this;
                var t = this.get(e.options.event);
                return t && this.remove(t),
                this.recognizers.push(e),
                e.manager = this,
                this.touchAction.update(),
                e
            }
            ,
            t.remove = function(e) {
                if (be(e, "remove", this))
                    return this;
                var t = this.get(e);
                if (e) {
                    var n = this.recognizers
                      , i = ce(n, t);
                    -1 !== i && (n.splice(i, 1),
                    this.touchAction.update())
                }
                return this
            }
            ,
            t.on = function(e, t) {
                if (void 0 === e || void 0 === t)
                    return this;
                var n = this.handlers;
                return V(ie(e), function(e) {
                    n[e] = n[e] || [],
                    n[e].push(t)
                }),
                this
            }
            ,
            t.off = function(e, t) {
                if (void 0 === e)
                    return this;
                var n = this.handlers;
                return V(ie(e), function(e) {
                    t ? n[e] && n[e].splice(ce(n[e], t), 1) : delete n[e]
                }),
                this
            }
            ,
            t.emit = function(e, t) {
                this.options.domEvents && function(e, t) {
                    var n = document.createEvent("Event");
                    n.initEvent(e, !0, !0),
                    n.gesture = t,
                    t.target.dispatchEvent(n)
                }(e, t);
                var n = this.handlers[e] && this.handlers[e].slice();
                if (n && n.length) {
                    t.type = e,
                    t.preventDefault = function() {
                        t.srcEvent.preventDefault()
                    }
                    ;
                    for (var i = 0; i < n.length; )
                        n[i](t),
                        i++
                }
            }
            ,
            t.destroy = function() {
                this.element && je(this, !1),
                this.handlers = {},
                this.session = {},
                this.input.destroy(),
                this.element = null
            }
            ,
            e
        }()
          , Be = function(e) {
            function t(t) {
                return void 0 === t && (t = {}),
                e.call(this, o({
                    pointers: 1
                }, t)) || this
            }
            r(t, e);
            var n = t.prototype;
            return n.attrTest = function(e) {
                var t = this.options.pointers;
                return 0 === t || e.pointers.length === t
            }
            ,
            n.process = function(e) {
                var t = this.state
                  , n = e.eventType
                  , i = t & (xe | Ae)
                  , o = this.attrTest(e);
                return i && (n & $ || !o) ? t | $e : i || o ? n & R ? t | Pe : t & xe ? t | Ae : xe : 32
            }
            ,
            t
        }(ke)
          , He = function(e) {
            function t(t) {
                return void 0 === t && (t = {}),
                e.call(this, o({
                    event: "rotate",
                    threshold: 0,
                    pointers: 2
                }, t)) || this
            }
            r(t, e);
            var n = t.prototype;
            return n.getTouchAction = function() {
                return [T]
            }
            ,
            n.attrTest = function(t) {
                return e.prototype.attrTest.call(this, t) && (Math.abs(t.rotation) > this.options.threshold || this.state & xe)
            }
            ,
            t
        }(Be)
          , Fe = function(e) {
            function t(t) {
                return void 0 === t && (t = {}),
                e.call(this, o({
                    event: "pinch",
                    threshold: 0,
                    pointers: 2
                }, t)) || this
            }
            r(t, e);
            var n = t.prototype;
            return n.getTouchAction = function() {
                return [T]
            }
            ,
            n.attrTest = function(t) {
                return e.prototype.attrTest.call(this, t) && (Math.abs(t.scale - 1) > this.options.threshold || this.state & xe)
            }
            ,
            n.emit = function(t) {
                if (1 !== t.scale) {
                    var n = t.scale < 1 ? "in" : "out";
                    t.additionalEvent = this.options.event + n
                }
                e.prototype.emit.call(this, t)
            }
            ,
            t
        }(Be);
        function Ve(e) {
            return e === U ? "down" : e === k ? "up" : e === D ? "left" : e === L ? "right" : ""
        }
        var We = function(e) {
            function t(t) {
                var n;
                return void 0 === t && (t = {}),
                (n = e.call(this, o({
                    event: "pan",
                    threshold: 10,
                    pointers: 1,
                    direction: B
                }, t)) || this).pX = null,
                n.pY = null,
                n
            }
            r(t, e);
            var n = t.prototype;
            return n.getTouchAction = function() {
                var e = this.options.direction
                  , t = [];
                return e & j && t.push(y),
                e & Y && t.push(N),
                t
            }
            ,
            n.directionTest = function(e) {
                var t = this.options
                  , n = !0
                  , i = e.distance
                  , o = e.direction
                  , r = e.deltaX
                  , a = e.deltaY;
                return o & t.direction || (t.direction & j ? (o = 0 === r ? M : r < 0 ? D : L,
                n = r !== this.pX,
                i = Math.abs(e.deltaX)) : (o = 0 === a ? M : a < 0 ? k : U,
                n = a !== this.pY,
                i = Math.abs(e.deltaY))),
                e.direction = o,
                n && i > t.threshold && o & t.direction
            }
            ,
            n.attrTest = function(e) {
                return Be.prototype.attrTest.call(this, e) && (this.state & xe || !(this.state & xe) && this.directionTest(e))
            }
            ,
            n.emit = function(t) {
                this.pX = t.deltaX,
                this.pY = t.deltaY;
                var n = Ve(t.direction);
                n && (t.additionalEvent = this.options.event + n),
                e.prototype.emit.call(this, t)
            }
            ,
            t
        }(Be)
          , Ge = function(e) {
            function t(t) {
                return void 0 === t && (t = {}),
                e.call(this, o({
                    event: "swipe",
                    threshold: 10,
                    velocity: .3,
                    direction: j | Y,
                    pointers: 1
                }, t)) || this
            }
            r(t, e);
            var n = t.prototype;
            return n.getTouchAction = function() {
                return We.prototype.getTouchAction.call(this)
            }
            ,
            n.attrTest = function(t) {
                var n, i = this.options.direction;
                return i & (j | Y) ? n = t.overallVelocity : i & j ? n = t.overallVelocityX : i & Y && (n = t.overallVelocityY),
                e.prototype.attrTest.call(this, t) && i & t.offsetDirection && t.distance > this.options.threshold && t.maxPointers === this.options.pointers && f(n) > this.options.velocity && t.eventType & R
            }
            ,
            n.emit = function(e) {
                var t = Ve(e.offsetDirection);
                t && this.manager.emit(this.options.event + t, e),
                this.manager.emit(this.options.event, e)
            }
            ,
            t
        }(Be)
          , ze = function(e) {
            function t(t) {
                var n;
                return void 0 === t && (t = {}),
                (n = e.call(this, o({
                    event: "tap",
                    pointers: 1,
                    taps: 1,
                    interval: 300,
                    time: 250,
                    threshold: 9,
                    posThreshold: 10
                }, t)) || this).pTime = !1,
                n.pCenter = !1,
                n._timer = null,
                n._input = null,
                n.count = 0,
                n
            }
            r(t, e);
            var n = t.prototype;
            return n.getTouchAction = function() {
                return [g]
            }
            ,
            n.process = function(e) {
                var t = this
                  , n = this.options
                  , i = e.pointers.length === n.pointers
                  , o = e.distance < n.threshold
                  , r = e.deltaTime < n.time;
                if (this.reset(),
                e.eventType & A && 0 === this.count)
                    return this.failTimeout();
                if (o && r && i) {
                    if (e.eventType !== R)
                        return this.failTimeout();
                    var a = !this.pTime || e.timeStamp - this.pTime < n.interval
                      , s = !this.pCenter || q(this.pCenter, e.center) < n.posThreshold;
                    this.pTime = e.timeStamp,
                    this.pCenter = e.center,
                    s && a ? this.count += 1 : this.count = 1,
                    this._input = e;
                    var c = this.count % n.taps;
                    if (0 === c)
                        return this.hasRequireFailures() ? (this._timer = setTimeout(function() {
                            t.state = Re,
                            t.tryEmit()
                        }, n.interval),
                        xe) : Re
                }
                return 32
            }
            ,
            n.failTimeout = function() {
                var e = this;
                return this._timer = setTimeout(function() {
                    e.state = 32
                }, this.options.interval),
                32
            }
            ,
            n.reset = function() {
                clearTimeout(this._timer)
            }
            ,
            n.emit = function() {
                this.state === Re && (this._input.tapCount = this.count,
                this.manager.emit(this.options.event, this._input))
            }
            ,
            t
        }(ke)
          , Je = function(e) {
            function t(t) {
                var n;
                return void 0 === t && (t = {}),
                (n = e.call(this, o({
                    event: "press",
                    pointers: 1,
                    time: 251,
                    threshold: 9
                }, t)) || this)._timer = null,
                n._input = null,
                n
            }
            r(t, e);
            var n = t.prototype;
            return n.getTouchAction = function() {
                return [E]
            }
            ,
            n.process = function(e) {
                var t = this
                  , n = this.options
                  , i = e.pointers.length === n.pointers
                  , o = e.distance < n.threshold
                  , r = e.deltaTime > n.time;
                if (this._input = e,
                !o || !i || e.eventType & (R | $) && !r)
                    this.reset();
                else if (e.eventType & A)
                    this.reset(),
                    this._timer = setTimeout(function() {
                        t.state = Re,
                        t.tryEmit()
                    }, n.time);
                else if (e.eventType & R)
                    return Re;
                return 32
            }
            ,
            n.reset = function() {
                clearTimeout(this._timer)
            }
            ,
            n.emit = function(e) {
                this.state === Re && (e && e.eventType & R ? this.manager.emit(this.options.event + "up", e) : (this._input.timeStamp = p(),
                this.manager.emit(this.options.event, this._input)))
            }
            ,
            t
        }(ke)
          , Ke = (function() {
            var e = function(e, t) {
                return void 0 === t && (t = {}),
                new Ye(e,o({
                    recognizers: [[He, {
                        enable: !1
                    }], [Fe, {
                        enable: !1
                    }, ["rotate"]], [Ge, {
                        direction: j
                    }], [We, {
                        direction: j
                    }, ["swipe"]], [ze], [ze, {
                        event: "doubletap",
                        taps: 2
                    }, ["tap"]], [Je]]
                }, t))
            };
            i(e, "VERSION", "2.0.11")
        }(),
        {
            touchstart: A,
            touchmove: P,
            touchend: R,
            touchcancel: $
        })
          , Xe = "touchstart"
          , qe = "touchstart touchmove touchend touchcancel";
        !function(e) {
            function t() {
                var n, i = t.prototype;
                return i.evTarget = Xe,
                i.evWin = qe,
                (n = e.apply(this, arguments) || this).started = !1,
                n
            }
            r(t, e);
            var n = t.prototype;
            n.handler = function(e) {
                var t = Ke[e.type];
                if (t === A && (this.started = !0),
                this.started) {
                    var n = function(e, t) {
                        var n = pe(e.touches)
                          , i = pe(e.changedTouches);
                        return t & (R | $) && (n = me(n.concat(i), "identifier", !0)),
                        [n, i]
                    }
                    /*! *****************************************************************************
  Copyright (c) Microsoft Corporation. All rights reserved.
  Licensed under the Apache License, Version 2.0 (the "License"); you may not use
  this file except in compliance with the License. You may obtain a copy of the
  License at http://www.apache.org/licenses/LICENSE-2.0

  THIS CODE IS PROVIDED ON AN *AS IS* BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION ANY IMPLIED
  WARRANTIES OR CONDITIONS OF TITLE, FITNESS FOR A PARTICULAR PURPOSE,
  MERCHANTABLITY OR NON-INFRINGEMENT.

  See the Apache Version 2.0 License for specific language governing permissions
  and limitations under the License.
  ***************************************************************************** */
                    .call(this, e, t);
                    t & (R | $) && n[0].length - n[1].length == 0 && (this.started = !1),
                    this.callback(this.manager, t, {
                        pointers: n[0],
                        changedPointers: n[1],
                        pointerType: b,
                        srcEvent: e
                    })
                }
            }
        }(se);
        var Ze = Object.setPrototypeOf || {
            __proto__: []
        }instanceof Array && function(e, t) {
            e.__proto__ = t
        }
        || function(e, t) {
            for (var n in t)
                t.hasOwnProperty(n) && (e[n] = t[n])
        }
          , Qe = Object.assign || function(e) {
            for (var t, n = 1, i = arguments.length; n < i; n++)
                for (var o in t = arguments[n])
                    Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
            return e
        }
        ;
        function et(e, t, n, i) {
            var o = e
              , r = [n[0] ? t[0] : i ? t[0] - i[0] : t[0], n[1] ? t[1] : i ? t[1] + i[1] : t[1]];
            return o = Math.max(r[0], o),
            +(o = Math.min(r[1], o)).toFixed(5)
        }
        function tt(e, t) {
            return e < t[0] || e > t[1]
        }
        function nt(e, t, n) {
            return n[1] && e > t[1] || n[0] && e < t[0]
        }
        function it(e, t, n) {
            var i = e
              , o = t[0]
              , r = t[1]
              , a = r - o;
            return n[1] && e > r && (i = (i - r) % a + o),
            n[0] && e < o && (i = (i - o) % a + r),
            +i.toFixed(5)
        }
        function ot(e, t) {
            for (var n in e)
                if (e[n] !== t[n])
                    return !1;
            return !0
        }
        var rt, at = function() {
            function e(e, t) {
                var n = this;
                this.axis = e,
                this.options = t,
                this._complementOptions(),
                this._pos = Object.keys(this.axis).reduce(function(e, t) {
                    return e[t] = n.axis[t].range[0],
                    e
                }, {})
            }
            var t = e.prototype;
            return t._complementOptions = function() {
                var e = this;
                Object.keys(this.axis).forEach(function(t) {
                    e.axis[t] = Qe({
                        range: [0, 100],
                        bounce: [0, 0],
                        circular: [!1, !1]
                    }, e.axis[t]),
                    ["bounce", "circular"].forEach(function(n) {
                        var i = e.axis
                          , o = i[t][n];
                        /string|number|boolean/.test(typeof o) && (i[t][n] = [o, o])
                    })
                })
            }
            ,
            t.getDelta = function(e, t) {
                var n = this.get(e);
                return this.map(this.get(t), function(e, t) {
                    return e - n[t]
                })
            }
            ,
            t.get = function(e) {
                var t = this;
                return e && Array.isArray(e) ? e.reduce(function(e, n) {
                    return n && n in t._pos && (e[n] = t._pos[n]),
                    e
                }, {}) : Qe({}, this._pos, e || {})
            }
            ,
            t.moveTo = function(e) {
                var t = this
                  , n = this.map(this._pos, function(n, i) {
                    return e[i] ? e[i] - t._pos[i] : 0
                });
                return this.set(e),
                {
                    pos: Qe({}, this._pos),
                    delta: n
                }
            }
            ,
            t.set = function(e) {
                for (var t in e)
                    t && t in this._pos && (this._pos[t] = e[t])
            }
            ,
            t.every = function(e, t) {
                var n = this.axis;
                for (var i in e)
                    if (i && !t(e[i], i, n[i]))
                        return !1;
                return !0
            }
            ,
            t.filter = function(e, t) {
                var n = {}
                  , i = this.axis;
                for (var o in e)
                    o && t(e[o], o, i[o]) && (n[o] = e[o]);
                return n
            }
            ,
            t.map = function(e, t) {
                var n = {}
                  , i = this.axis;
                for (var o in e)
                    o && (n[o] = t(e[o], o, i[o]));
                return n
            }
            ,
            t.isOutside = function(e) {
                return !this.every(e ? this.get(e) : this._pos, function(e, t, n) {
                    return !tt(e, n.range)
                })
            }
            ,
            e
        }();
        function st(e) {
            for (var t = [], n = 0, i = e.length; n < i; n++)
                t.push(e[n]);
            return t
        }
        (rt = "undefined" == typeof window ? {
            document: {},
            navigator: {
                userAgent: ""
            }
        } : window).document;
        var ct = rt.requestAnimationFrame || rt.webkitRequestAnimationFrame
          , ut = rt.cancelAnimationFrame || rt.webkitCancelAnimationFrame;
        if (ct && !ut) {
            var lt = {}
              , dt = ct;
            ct = function(e) {
                var t = dt(function(n) {
                    lt[t] && e(n)
                });
                return lt[t] = !0,
                t
            }
            ,
            ut = function(e) {
                delete lt[e]
            }
        } else
            ct && ut || (ct = function(e) {
                return rt.setTimeout(function() {
                    e(rt.performance && rt.performance.now && rt.performance.now() || (new Date).getTime())
                }, 16)
            }
            ,
            ut = rt.clearTimeout);
        function ht(e, t, n) {
            return Math.max(Math.min(e, n), t)
        }
        var ft = function() {
            function e(e) {
                var t = e.options
                  , n = e.itm
                  , i = e.em
                  , o = e.axm;
                this.options = t,
                this.itm = n,
                this.em = i,
                this.axm = o,
                this.animationEnd = this.animationEnd.bind(this)
            }
            var t = e.prototype;
            return t.getDuration = function(e, t, n) {
                var i, o = this;
                if (void 0 !== n)
                    i = n;
                else {
                    var r = this.axm.map(t, function(t, n) {
                        return function(e, t) {
                            var n = Math.sqrt(e / t * 2);
                            return n < 100 ? 0 : n
                        }(Math.abs(Math.abs(t) - Math.abs(e[n])), o.options.deceleration)
                    });
                    i = Object.keys(r).reduce(function(e, t) {
                        return Math.max(e, r[t])
                    }, -1 / 0)
                }
                return ht(i, this.options.minimumDuration, this.options.maximumDuration)
            }
            ,
            t.createAnimationParam = function(e, t, n) {
                var i = this.axm.get()
                  , o = e
                  , r = n && n.event || null;
                return {
                    depaPos: i,
                    destPos: o,
                    duration: ht(t, this.options.minimumDuration, this.options.maximumDuration),
                    delta: this.axm.getDelta(i, o),
                    inputEvent: r,
                    input: n && n.input || null,
                    isTrusted: !!r,
                    done: this.animationEnd
                }
            }
            ,
            t.grab = function(e, t) {
                if (this._animateParam && e.length) {
                    var n = this.axm.get(e)
                      , i = this.axm.map(n, function(e, t, n) {
                        return it(e, n.range, n.circular)
                    });
                    this.axm.every(i, function(e, t) {
                        return n[t] === e
                    }) || this.em.triggerChange(i, t, !!t),
                    this._animateParam = null,
                    this._raf && function(e) {
                        ut(e)
                    }(this._raf),
                    this._raf = null,
                    this.em.triggerAnimationEnd(!(!t || !t.event))
                }
            }
            ,
            t.getEventInfo = function() {
                return this._animateParam && this._animateParam.input && this._animateParam.inputEvent ? {
                    input: this._animateParam.input,
                    event: this._animateParam.inputEvent
                } : null
            }
            ,
            t.restore = function(e) {
                var t = this.axm.get()
                  , n = this.axm.map(t, function(e, t, n) {
                    return Math.min(n.range[1], Math.max(n.range[0], e))
                });
                this.animateTo(n, this.getDuration(t, n), e)
            }
            ,
            t.animationEnd = function() {
                var e = this.getEventInfo();
                this._animateParam = null;
                var t = this.axm.filter(this.axm.get(), function(e, t, n) {
                    return nt(e, n.range, n.circular)
                });
                Object.keys(t).length > 0 && this.setTo(this.axm.map(t, function(e, t, n) {
                    return it(e, n.range, n.circular)
                })),
                this.itm.setInterrupt(!1),
                this.em.triggerAnimationEnd(!!e),
                this.axm.isOutside() ? this.restore(e) : this.em.triggerFinish(!!e)
            }
            ,
            t.animateLoop = function(e, t) {
                if (this._animateParam = Qe({}, e),
                this._animateParam.startTime = (new Date).getTime(),
                e.duration) {
                    var n = this._animateParam
                      , i = this;
                    !function o() {
                        if (i._raf = null,
                        i.frame(n) >= 1)
                            return ot(e.destPos, i.axm.get(Object.keys(e.destPos))) || i.em.triggerChange(e.destPos),
                            void t();
                        i._raf = function(e) {
                            return ct(e)
                        }(o)
                    }()
                } else
                    this.em.triggerChange(e.destPos),
                    t()
            }
            ,
            t.getUserControll = function(e) {
                var t = e.setTo();
                return t.destPos = this.axm.get(t.destPos),
                t.duration = ht(t.duration, this.options.minimumDuration, this.options.maximumDuration),
                t
            }
            ,
            t.animateTo = function(e, t, n) {
                var i = this
                  , o = this.createAnimationParam(e, t, n)
                  , r = Qe({}, o.depaPos)
                  , a = this.em.triggerAnimationStart(o)
                  , s = this.getUserControll(o);
                if (!a && this.axm.every(s.destPos, function(e, t, n) {
                    return nt(e, n.range, n.circular)
                }) && console.warn("You can't stop the 'animation' event when 'circular' is true."),
                a && !ot(s.destPos, r)) {
                    var c = n && n.event || null;
                    this.animateLoop({
                        depaPos: r,
                        destPos: s.destPos,
                        duration: s.duration,
                        delta: this.axm.getDelta(r, s.destPos),
                        isTrusted: !!c,
                        inputEvent: c,
                        input: n && n.input || null
                    }, function() {
                        return i.animationEnd()
                    })
                }
            }
            ,
            t.frame = function(e) {
                var t = (new Date).getTime() - e.startTime
                  , n = this.easing(t / e.duration)
                  , i = e.depaPos;
                return i = this.axm.map(i, function(t, i, o) {
                    return it(t += e.delta[i] * n, o.range, o.circular)
                }),
                this.em.triggerChange(i),
                n
            }
            ,
            t.easing = function(e) {
                return e > 1 ? 1 : this.options.easing(e)
            }
            ,
            t.setTo = function(e, t) {
                void 0 === t && (t = 0);
                var n = Object.keys(e);
                this.grab(n);
                var i = this.axm.get(n);
                if (ot(e, i))
                    return this;
                this.itm.setInterrupt(!0);
                var o = this.axm.filter(e, function(e, t) {
                    return i[t] !== e
                });
                return Object.keys(o).length ? ot(o = this.axm.map(o, function(e, n, i) {
                    return i.circular && (i.circular[0] || i.circular[1]) ? t > 0 ? e : it(e, i.range, i.circular) : et(e, i.range, i.circular)
                }), i) ? this : (t > 0 ? this.animateTo(o, t) : (this.em.triggerChange(o),
                this.itm.setInterrupt(!1)),
                this) : this
            }
            ,
            t.setBy = function(e, t) {
                return void 0 === t && (t = 0),
                this.setTo(this.axm.map(this.axm.get(Object.keys(e)), function(t, n) {
                    return t + e[n]
                }), t)
            }
            ,
            e
        }()
          , pt = function() {
            function e(e) {
                this.axes = e
            }
            var t = e.prototype;
            return t.triggerHold = function(e, t) {
                this.axes.trigger("hold", {
                    pos: e,
                    input: t.input || null,
                    inputEvent: t.event || null,
                    isTrusted: !0
                })
            }
            ,
            t.triggerRelease = function(e) {
                e.setTo = this.createUserControll(e.destPos, e.duration),
                this.axes.trigger("release", e)
            }
            ,
            t.triggerChange = function(e, t, n) {
                void 0 === t && (t = null),
                void 0 === n && (n = !1);
                var i = this.am.getEventInfo()
                  , o = this.am.axm.moveTo(e)
                  , r = t && t.event || i && i.event || null
                  , a = {
                    pos: o.pos,
                    delta: o.delta,
                    holding: n,
                    inputEvent: r,
                    isTrusted: !!r,
                    input: t && t.input || i && i.input || null,
                    set: r ? this.createUserControll(o.pos) : function() {}
                };
                this.axes.trigger("change", a),
                r && this.am.axm.set(a.set().destPos)
            }
            ,
            t.triggerAnimationStart = function(e) {
                return e.setTo = this.createUserControll(e.destPos, e.duration),
                this.axes.trigger("animationStart", e)
            }
            ,
            t.triggerAnimationEnd = function(e) {
                void 0 === e && (e = !1),
                this.axes.trigger("animationEnd", {
                    isTrusted: e
                })
            }
            ,
            t.triggerFinish = function(e) {
                void 0 === e && (e = !1),
                this.axes.trigger("finish", {
                    isTrusted: e
                })
            }
            ,
            t.createUserControll = function(e, t) {
                void 0 === t && (t = 0);
                var n = {
                    destPos: Qe({}, e),
                    duration: t
                };
                return function(e, t) {
                    return e && (n.destPos = Qe({}, e)),
                    void 0 !== t && (n.duration = t),
                    n
                }
            }
            ,
            t.setAnimationManager = function(e) {
                this.am = e
            }
            ,
            t.destroy = function() {
                this.axes.off()
            }
            ,
            e
        }()
          , mt = function() {
            function e(e) {
                this.options = e,
                this._prevented = !1
            }
            var t = e.prototype;
            return t.isInterrupting = function() {
                return this.options.interruptable || this._prevented
            }
            ,
            t.isInterrupted = function() {
                return !this.options.interruptable && this._prevented
            }
            ,
            t.setInterrupt = function(e) {
                !this.options.interruptable && (this._prevented = e)
            }
            ,
            e
        }()
          , _t = function() {
            function e(e) {
                var t = e.options
                  , n = e.itm
                  , i = e.em
                  , o = e.axm
                  , r = e.am;
                this.isOutside = !1,
                this.moveDistance = null,
                this.options = t,
                this.itm = n,
                this.em = i,
                this.axm = o,
                this.am = r
            }
            var t = e.prototype;
            return t.atOutside = function(e) {
                var t = this;
                if (this.isOutside)
                    return this.axm.map(e, function(e, t, n) {
                        var i = n.range[0] - n.bounce[0]
                          , o = n.range[1] + n.bounce[1];
                        return e > o ? o : e < i ? i : e
                    });
                var n = this.am.easing(1e-5) / 1e-5;
                return this.axm.map(e, function(e, i, o) {
                    var r = o.range[0]
                      , a = o.range[1]
                      , s = o.bounce;
                    return e < r ? r - t.am.easing((r - e) / (s[0] * n)) * s[0] : e > a ? a + t.am.easing((e - a) / (s[1] * n)) * s[1] : e
                })
            }
            ,
            t.get = function(e) {
                return this.axm.get(e.axes)
            }
            ,
            t.hold = function(e, t) {
                if (!this.itm.isInterrupted() && e.axes.length) {
                    var n = {
                        input: e,
                        event: t
                    };
                    this.itm.setInterrupt(!0),
                    this.am.grab(e.axes, n),
                    !this.moveDistance && this.em.triggerHold(this.axm.get(), n),
                    this.isOutside = this.axm.isOutside(e.axes),
                    this.moveDistance = this.axm.get(e.axes)
                }
            }
            ,
            t.change = function(e, t, n) {
                if (this.itm.isInterrupting() && !this.axm.every(n, function(e) {
                    return 0 === e
                })) {
                    var i, o = this.axm.get(e.axes);
                    i = this.axm.map(this.moveDistance || o, function(e, t) {
                        return e + (n[t] || 0)
                    }),
                    this.moveDistance && (this.moveDistance = i),
                    i = this.axm.map(i, function(e, t, n) {
                        return it(e, n.range, n.circular)
                    }),
                    this.isOutside && this.axm.every(o, function(e, t, n) {
                        return !tt(e, n.range)
                    }) && (this.isOutside = !1),
                    i = this.atOutside(i),
                    this.em.triggerChange(i, {
                        input: e,
                        event: t
                    }, !0)
                }
            }
            ,
            t.release = function(e, t, n, i) {
                if (this.itm.isInterrupting() && this.moveDistance) {
                    var o = this.axm.get(e.axes)
                      , r = this.axm.get()
                      , a = this.axm.get(this.axm.map(n, function(e, t, n) {
                        return n.circular && (n.circular[0] || n.circular[1]) ? o[t] + e : et(o[t] + e, n.range, n.circular, n.bounce)
                    }))
                      , s = this.am.getDuration(a, o, i);
                    0 === s && (a = Qe({}, r));
                    var c = {
                        depaPos: r,
                        destPos: a,
                        duration: s,
                        delta: this.axm.getDelta(r, a),
                        inputEvent: t,
                        input: e,
                        isTrusted: !0
                    };
                    this.em.triggerRelease(c),
                    this.moveDistance = null;
                    var u = this.am.getUserControll(c)
                      , l = ot(u.destPos, r)
                      , d = {
                        input: e,
                        event: t
                    };
                    l || 0 === u.duration ? (!l && this.em.triggerChange(u.destPos, d, !0),
                    this.itm.setInterrupt(!1),
                    this.axm.isOutside() ? this.am.restore(d) : this.em.triggerFinish(!0)) : this.am.animateTo(u.destPos, u.duration, d)
                }
            }
            ,
            e
        }()
          , vt = function() {
            if ("undefined" == typeof document)
                return "";
            for (var e = (document.head || document.getElementsByTagName("head")[0]).style, t = ["transform", "webkitTransform", "msTransform", "mozTransform"], n = 0, i = t.length; n < i; n++)
                if (t[n]in e)
                    return t[n];
            return ""
        }()
          , Et = function(e) {
            function t(t, n, i) {
                void 0 === t && (t = {});
                var o = e.call(this) || this;
                return o.axis = t,
                o._inputs = [],
                o.options = Qe({
                    easing: function(e) {
                        return 1 - Math.pow(1 - e, 3)
                    },
                    interruptable: !0,
                    maximumDuration: 1 / 0,
                    minimumDuration: 0,
                    deceleration: 6e-4
                }, n),
                o.itm = new mt(o.options),
                o.axm = new at(o.axis,o.options),
                o.em = new pt(o),
                o.am = new ft(o),
                o.io = new _t(o),
                o.em.setAnimationManager(o.am),
                i && o.em.triggerChange(i),
                o
            }
            !function(e, t) {
                function n() {
                    this.constructor = e
                }
                Ze(e, t),
                e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype,
                new n)
            }(t, e);
            var n = t.prototype;
            return n.connect = function(e, t) {
                var n;
                if (n = "string" == typeof e ? e.split(" ") : e.concat(),
                ~this._inputs.indexOf(t) && this.disconnect(t),
                "hammer"in t) {
                    var i = this._inputs.filter(function(e) {
                        return e.hammer && e.element === t.element
                    });
                    i.length && (t.hammer = i[0].hammer)
                }
                return t.mapAxes(n),
                t.connect(this.io),
                this._inputs.push(t),
                this
            }
            ,
            n.disconnect = function(e) {
                if (e) {
                    var t = this._inputs.indexOf(e);
                    t >= 0 && (this._inputs[t].disconnect(),
                    this._inputs.splice(t, 1))
                } else
                    this._inputs.forEach(function(e) {
                        return e.disconnect()
                    }),
                    this._inputs = [];
                return this
            }
            ,
            n.get = function(e) {
                return this.axm.get(e)
            }
            ,
            n.setTo = function(e, t) {
                return void 0 === t && (t = 0),
                this.am.setTo(e, t),
                this
            }
            ,
            n.setBy = function(e, t) {
                return void 0 === t && (t = 0),
                this.am.setBy(e, t),
                this
            }
            ,
            n.isBounceArea = function(e) {
                return this.axm.isOutside(e)
            }
            ,
            n.destroy = function() {
                this.disconnect(),
                this.em.destroy()
            }
            ,
            t.VERSION = "2.5.7-snapshot",
            t.TRANSFORM = vt,
            t.DIRECTION_NONE = M,
            t.DIRECTION_LEFT = D,
            t.DIRECTION_RIGHT = L,
            t.DIRECTION_UP = k,
            t.DIRECTION_DOWN = U,
            t.DIRECTION_HORIZONTAL = j,
            t.DIRECTION_VERTICAL = Y,
            t.DIRECTION_ALL = B,
            t
        }(n)
          , gt = "PointerEvent"in rt || "MSPointerEvent"in rt
          , Tt = "ontouchstart"in rt
          , Nt = "_EGJS_AXES_INPUTTYPE_";
        function yt(e, t) {
            return t.reduce(function(t, n, i) {
                return e[i] && (t[e[i]] = n),
                t
            }, {})
        }
        function Ot(e, t, n) {
            return n ? !!(t === B || t & e && n & e) : !!(t & e)
        }
        var It, Ct = function() {
            function e(e, t) {
                if (this.axes = [],
                this.hammer = null,
                this.element = null,
                this.panRecognizer = null,
                void 0 === Ye)
                    throw new Error("The Hammerjs must be loaded before eg.Axes.PanInput.\nhttp://hammerjs.github.io/");
                this.element = function e(t, n) {
                    var i;
                    if (void 0 === n && (n = !1),
                    "string" == typeof t) {
                        var o = t.match(/^<([a-z]+)\s*([^>]*)>/);
                        if (o) {
                            var r = document.createElement("div");
                            r.innerHTML = t,
                            i = st(r.childNodes)
                        } else
                            i = st(document.querySelectorAll(t));
                        n || (i = i.length >= 1 ? i[0] : void 0)
                    } else
                        t === rt ? i = t : !t.nodeName || 1 !== t.nodeType && 9 !== t.nodeType ? "jQuery"in rt && t instanceof jQuery || t.constructor.prototype.jquery ? i = n ? t.toArray() : t.get(0) : Array.isArray(t) && (i = t.map(function(t) {
                            return e(t)
                        }),
                        n || (i = i.length >= 1 ? i[0] : void 0)) : i = t;
                    return i
                }(e),
                this.options = Qe({
                    inputType: ["touch", "mouse", "pointer"],
                    scale: [1, 1],
                    thresholdAngle: 45,
                    threshold: 0,
                    hammerManagerOptions: {
                        cssProps: {
                            userSelect: "none",
                            touchSelect: "none",
                            touchCallout: "none",
                            userDrag: "none"
                        }
                    }
                }, t),
                this.onHammerInput = this.onHammerInput.bind(this),
                this.onPanmove = this.onPanmove.bind(this),
                this.onPanend = this.onPanend.bind(this)
            }
            var t = e.prototype;
            return t.mapAxes = function(e) {
                var t = !!e[0]
                  , n = !!e[1];
                this._direction = t && n ? B : t ? j : n ? Y : M,
                this.axes = e
            }
            ,
            t.connect = function(e) {
                var t = {
                    direction: this._direction,
                    threshold: this.options.threshold
                };
                if (this.hammer)
                    this.removeRecognizer(),
                    this.dettachEvent();
                else {
                    var n = this.element[Nt];
                    n || (n = String(Math.round(Math.random() * (new Date).getTime())));
                    var i = function(e) {
                        void 0 === e && (e = []);
                        var t = !1
                          , n = !1
                          , i = !1;
                        return e.forEach(function(e) {
                            switch (e) {
                            case "mouse":
                                n = !0;
                                break;
                            case "touch":
                                t = Tt;
                                break;
                            case "pointer":
                                i = gt
                            }
                        }),
                        i ? fe : t && n ? we : t ? Ee : n ? ye : null
                    }(this.options.inputType);
                    if (!i)
                        throw new Error("Wrong inputType parameter!");
                    this.hammer = function(e, t) {
                        try {
                            return new Ye(e,Qe({}, t))
                        } catch (e) {
                            return null
                        }
                    }(this.element, Qe({
                        inputClass: i
                    }, this.options.hammerManagerOptions)),
                    this.element[Nt] = n
                }
                return this.panRecognizer = new We(t),
                this.hammer.add(this.panRecognizer),
                this.attachEvent(e),
                this
            }
            ,
            t.disconnect = function() {
                return this.removeRecognizer(),
                this.hammer && this.dettachEvent(),
                this._direction = M,
                this
            }
            ,
            t.destroy = function() {
                this.disconnect(),
                this.hammer && 0 === this.hammer.recognizers.length && this.hammer.destroy(),
                delete this.element[Nt],
                this.element = null,
                this.hammer = null
            }
            ,
            t.enable = function() {
                return this.hammer && (this.hammer.get("pan").options.enable = !0),
                this
            }
            ,
            t.disable = function() {
                return this.hammer && (this.hammer.get("pan").options.enable = !1),
                this
            }
            ,
            t.isEnable = function() {
                return !(!this.hammer || !this.hammer.get("pan").options.enable)
            }
            ,
            t.removeRecognizer = function() {
                this.hammer && this.panRecognizer && (this.hammer.remove(this.panRecognizer),
                this.panRecognizer = null)
            }
            ,
            t.onHammerInput = function(e) {
                this.isEnable() && (e.isFirst ? this.observer.hold(this, e) : e.isFinal && this.onPanend(e))
            }
            ,
            t.onPanmove = function(e) {
                var t = function(e, t) {
                    if (t < 0 || t > 90)
                        return M;
                    var n = Math.abs(e);
                    return n > t && n < 180 - t ? Y : j
                }(e.angle, this.options.thresholdAngle)
                  , n = this.hammer.session.prevInput;
                n ? (e.offsetX = e.deltaX - n.deltaX,
                e.offsetY = e.deltaY - n.deltaY) : (e.offsetX = 0,
                e.offsetY = 0);
                var i = this.getOffset([e.offsetX, e.offsetY], [Ot(j, this._direction, t), Ot(Y, this._direction, t)])
                  , o = i.some(function(e) {
                    return 0 !== e
                });
                o && (e.srcEvent.preventDefault(),
                e.srcEvent.stopPropagation()),
                e.preventSystemEvent = o,
                o && this.observer.change(this, e, yt(this.axes, i))
            }
            ,
            t.onPanend = function(e) {
                var t = this.getOffset([Math.abs(e.velocityX) * (e.deltaX < 0 ? -1 : 1), Math.abs(e.velocityY) * (e.deltaY < 0 ? -1 : 1)], [Ot(j, this._direction), Ot(Y, this._direction)]);
                t = function(e, t) {
                    var n = Math.sqrt(e[0] * e[0] + e[1] * e[1])
                      , i = Math.abs(n / -t);
                    return [e[0] / 2 * i, e[1] / 2 * i]
                }(t, this.observer.options.deceleration),
                this.observer.release(this, e, yt(this.axes, t))
            }
            ,
            t.attachEvent = function(e) {
                this.observer = e,
                this.hammer.on("hammer.input", this.onHammerInput).on("panstart panmove", this.onPanmove)
            }
            ,
            t.dettachEvent = function() {
                this.hammer.off("hammer.input", this.onHammerInput).off("panstart panmove", this.onPanmove),
                this.observer = null
            }
            ,
            t.getOffset = function(e, t) {
                var n = [0, 0]
                  , i = this.options.scale;
                return t[0] && (n[0] = e[0] * i[0]),
                t[1] && (n[1] = e[1] * i[1]),
                n
            }
            ,
            e
        }(), wt = (It = "undefined" == typeof window ? {
            document: {},
            navigator: {
                userAgent: ""
            }
        } : window).document, bt = {
            $: function(e) {
                var t = null;
                if ("string" == typeof e) {
                    var n = e.match(/^<([a-z]+)\s*([^>]*)>/);
                    n ? (t = wt.createElement(n[1]),
                    3 === n.length && n[2].split(" ").forEach(function(e) {
                        var n = e.split("=");
                        t.setAttribute(n[0], n[1].trim().replace(/(^["']|["']$)/g, ""))
                    })) : (t = wt.querySelectorAll(e)).length ? 1 === t.length && (t = t[0]) : t = null
                } else
                    e.nodeName && 1 === e.nodeType && (t = e);
                return t
            },
            toArray: function(e) {
                return [].slice.call(e)
            },
            isArray: function(e) {
                return e && e.constructor === Array
            },
            isObject: function(e) {
                return e && !e.nodeType && "object" == typeof e && !this.isArray(e)
            },
            extend: function(e) {
                for (var t = this, n = arguments.length, i = new Array(n > 1 ? n - 1 : 0), o = 1; o < n; o++)
                    i[o - 1] = arguments[o];
                if (!i.length || 1 === i.length && !i[0])
                    return e;
                var r = i.shift();
                return this.isObject(e) && this.isObject(r) && Object.keys(r).forEach(function(n) {
                    var i = r[n];
                    t.isObject(i) ? (!e[n] && (e[n] = {}),
                    e[n] = t.extend(e[n], i)) : e[n] = t.isArray(i) ? i.concat() : i
                }),
                this.extend.apply(this, [e].concat(i))
            },
            css: function(e, t, n) {
                if ("string" == typeof t) {
                    var i = e.style[t];
                    return (!i || "auto" === i || /\d/.test(i) && !/\d(px)?$/.test(i)) && (i = It.getComputedStyle(e)[t]),
                    n ? this.getNumValue(i) : i
                }
                var o = function(e, t) {
                    return Object.keys(t).forEach(function(n) {
                        e[n] = t[n]
                    })
                };
                return this.isArray(e) ? e.forEach(function(e) {
                    return o(e.style, t)
                }) : o(e.style, t),
                e
            },
            classList: function(e, t, n) {
                var i, o = "boolean" == typeof n;
                return e.classList ? i = e.classList[o && (n ? "add" : "remove") || "contains"](t) : (i = e.className,
                o ? n && -1 === i.indexOf(t) ? i = e.className = (i + " " + t).replace(/\s{2,}/g, " ") : n || (i = e.className = i.replace(t, "")) : i = new RegExp("\\b" + t + "\\b").test(i)),
                i
            },
            getNumValue: function(e, t) {
                var n = e;
                return isNaN(n = parseFloat(n)) ? t : n
            },
            getUnitValue: function(e) {
                return (parseFloat(e) || 0) + (String(e).match(/(?:[a-z]{2,}|%)$/) || "px")
            },
            getOuter: function(e, t) {
                var n = this
                  , i = 0;
                return ("outerWidth" === t ? ["Left", "Right"] : ["Top", "Bottom"]).forEach(function(t) {
                    ["padding", "margin"].forEach(function(o) {
                        i += n.css(e, "" + o + t, !0)
                    })
                }),
                this.css(e, t.replace("outer", "").toLocaleLowerCase(), !0) + i
            },
            outerWidth: function(e) {
                return this.getOuter(e, "outerWidth")
            },
            outerHeight: function(e) {
                return this.getOuter(e, "outerHeight")
            },
            translate: function(e, t, n) {
                return n ? "translate3d(" + e + "," + t + ",0)" : "translate(" + e + "," + t + ")"
            },
            hasClickBug: function() {
                var e = It.navigator.userAgent
                  , t = /iPhone|iPad/.test(e);
                return this.hasClickBug = function() {
                    return t
                }
                ,
                t
            }
        }, St = function() {
            function e(e) {
                this.superclass = e || function() {}
            }
            var t = e.prototype;
            return t.with = function() {
                for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++)
                    t[n] = arguments[n];
                return t.reduce(function(e, t) {
                    return t(e)
                }, this.superclass)
            }
            ,
            e
        }(), xt = {
            beforeFlickStart: "beforeFlickStart",
            beforeRestore: "beforeRestore",
            flick: "flick",
            flickEnd: "flickEnd",
            restore: "restore"
        }, At = {
            name: "transform"
        };
        At.support = function() {
            if (!wt.documentElement)
                return !1;
            var e = wt.documentElement.style;
            return At.name in e || (At.name = "webkitTransform")in e
        }();
        var Pt = It.CSS && It.CSS.supports && It.CSS.supports("will-change", "transform")
          , Rt = /Android 2\./.test(It.navigator.userAgent)
          , $t = {
            panel: {
                $list: null,
                index: 0,
                no: 0,
                currIndex: 0,
                currNo: 0,
                size: 0,
                count: 0,
                origCount: 0,
                changed: !1,
                animating: !1,
                minCount: 3
            },
            touch: {
                holdPos: 0,
                destPos: 0,
                distance: 0,
                direction: null,
                lastPos: 0,
                holding: !1,
                isTrusted: !1
            },
            customEvent: {
                flick: !0,
                restore: !1,
                restoreCall: !1
            },
            dirData: [],
            indexToMove: 0,
            $dummyAnchor: null
        }
          , Mt = {
            hwAccelerable: !0,
            prefix: "eg-flick",
            deceleration: 6e-4,
            horizontal: !0,
            circular: !1,
            previewPadding: null,
            bounce: null,
            threshold: 40,
            duration: 100,
            panelEffect: function(e) {
                return 1 - Math.pow(1 - e, 3)
            },
            defaultIndex: 0,
            inputType: ["touch", "mouse"],
            thresholdAngle: 45,
            adaptiveHeight: !1,
            zIndex: 2e3,
            useTranslate: !0
        }
          , Dt = function(t) {
            return function(t) {
                function n() {
                    return t.apply(this, arguments) || this
                }
                e(n, t);
                var i = n.prototype;
                return i._holdHandler = function(e) {
                    var t = this._conf
                      , n = t.touch
                      , i = e.pos.flick;
                    n.holdPos = i,
                    n.holding = !0,
                    n.isTrusted = !0,
                    t.panel.changed = !1,
                    this._adjustContainerCss("start", i)
                }
                ,
                i._changeHandler = function(e) {
                    var t, n, i = this._conf, o = i.touch, r = e.pos.flick, a = o.holdPos, s = null;
                    this._setPointerEvents(e),
                    e.inputEvent ? (t = e.inputEvent.direction,
                    n = e.inputEvent[this.options.horizontal ? "deltaX" : "deltaY"],
                    ~i.dirData.indexOf(t) || (t = i.dirData[+(Math.abs(o.lastPos) <= n)]),
                    o.lastPos = n) : o.lastPos = null,
                    i.customEvent.flick && (s = this._triggerEvent(xt.flick, {
                        pos: r,
                        holding: e.holding,
                        direction: t || o.direction,
                        distance: o.isTrusted ? r - a : null
                    })),
                    (s || null === s) && this._setTranslate([-r, 0])
                }
                ,
                i._releaseHandler = function(e) {
                    var t = this._conf
                      , n = t.touch
                      , i = n.holdPos
                      , o = t.panel.size
                      , r = t.customEvent
                      , a = n.holdPos < e.depaPos.flick;
                    n.distance = e.depaPos.flick - i,
                    n.direction = t.dirData[+!a],
                    n.destPos = i + (a ? o : -o);
                    var s = n.distance
                      , c = this.options.duration
                      , u = i;
                    this._isMovable() ? (!r.restoreCall && (r.restore = !1),
                    u = n.destPos) : Math.abs(s) > 0 ? this._triggerBeforeRestore(e) : c = 0,
                    e.setTo({
                        flick: u
                    }, c),
                    0 === s && this._adjustContainerCss("end"),
                    n.holding = !1,
                    this._setPointerEvents()
                }
                ,
                i._animationStartHandler = function(e) {
                    var t = this._conf
                      , n = t.panel
                      , i = t.customEvent
                      , o = e.inputEvent || t.touch.lastPos;
                    !i.restoreCall && o && !1 === this._setPhaseValue("start", {
                        depaPos: e.depaPos.flick,
                        destPos: e.destPos.flick
                    }) && e.stop(),
                    o && (e.duration = this.options.duration,
                    e.destPos.flick = n.size * (n.index + t.indexToMove)),
                    n.animating = !0
                }
                ,
                i._animationEndHandler = function() {
                    var e = this._conf;
                    e.panel.animating = !1,
                    this._setPhaseValue("end"),
                    this._triggerRestore(),
                    e.touch.isTrusted = !1
                }
                ,
                n
            }(t)
        };
        return function() {
            var t = function(t) {
                function n(e, n, i) {
                    var o;
                    (o = t.call(this) || this).$wrapper = bt.$(e),
                    o.plugins = [];
                    var r = o.$wrapper && o.$wrapper.children;
                    if (!o.$wrapper || !r || !r.length)
                        throw new Error("Given base element doesn't exist or it hasn't proper DOM structure to be initialized.");
                    return o._setOptions(n),
                    o._setConfig(r, i),
                    !bt.hasClickBug() && (o._setPointerEvents = function() {}
                    ),
                    o._build(),
                    o._bindEvents(!0),
                    o._applyPanelsCss(),
                    o._arrangePanels(),
                    o.options.hwAccelerable && Pt && o._setHint(),
                    o.options.adaptiveHeight && o._setAdaptiveHeight(),
                    o._adjustContainerCss("end"),
                    o
                }
                e(n, t);
                var i = n.prototype;
                return i._setOptions = function(e) {
                    var t = {
                        previewPadding: [0, 0],
                        bounce: [10, 10]
                    };
                    for (var n in this.options = bt.extend(bt.extend({}, Mt), t, e),
                    t) {
                        var i = this.options[n];
                        /(number|string)/.test(typeof i) ? i = [i, i] : bt.isArray(i) || (i = t[n]),
                        this.options[n] = i
                    }
                    Rt && (this.options.useTranslate = !1)
                }
                ,
                i._setConfig = function(e, t) {
                    var n = this.options
                      , i = n.previewPadding
                      , o = e;
                    bt.classList(o[0], n.prefix + "-container") && (o = o[0],
                    this.$container = o,
                    o = o.children),
                    o = bt.toArray(o);
                    var r = this._conf = bt.extend(bt.extend({}, $t), {
                        panel: {
                            $list: o,
                            minCount: i[0] + i[1] > 0 ? 5 : 3
                        },
                        origPanelStyle: {
                            wrapper: {
                                className: this.$wrapper.getAttribute("class") || null,
                                style: this.$wrapper.getAttribute("style") || null
                            },
                            container: {
                                className: this.$container && this.$container.getAttribute("class") || null,
                                style: this.$container && this.$container.getAttribute("style") || null
                            },
                            list: o.map(function(e) {
                                return {
                                    className: e.getAttribute("class") || null,
                                    style: e.getAttribute("style") || null
                                }
                            })
                        },
                        useLayerHack: n.hwAccelerable && !Pt,
                        eventPrefix: t || ""
                    });
                    [["LEFT", "RIGHT"], ["UP", "DOWN"]][+!n.horizontal].forEach(function(e) {
                        return r.dirData.push(Et["DIRECTION_" + e])
                    })
                }
                ,
                i._build = function() {
                    var e = this._conf.panel
                      , t = this.options
                      , n = e.$list
                      , i = t.previewPadding.concat()
                      , o = t.prefix
                      , r = t.horizontal
                      , a = e.count = e.origCount = n.length
                      , s = t.bounce;
                    this._setPadding(i, !0);
                    var c = this._getDataByDirection([e.size, "100%"])
                      , u = {
                        position: "relative",
                        zIndex: t.zIndex || 2e3,
                        width: "100%",
                        height: "100%"
                    };
                    if (r && (u.top = "0px"),
                    this.$container)
                        bt.css(this.$container, u);
                    else {
                        var l = n[0].parentNode
                          , d = wt.createElement("div");
                        d.className = o + "-container",
                        bt.css(d, u),
                        n.forEach(function(e) {
                            return d.appendChild(e)
                        }),
                        l.appendChild(d),
                        this.$container = d
                    }
                    n.forEach(function(e) {
                        bt.classList(e, o + "-panel", !0),
                        bt.css(e, {
                            position: "absolute",
                            width: bt.getUnitValue(c[0]),
                            height: bt.getUnitValue(c[1]),
                            boxSizing: "border-box",
                            top: 0,
                            left: 0
                        })
                    }),
                    this._addClonePanels() && (a = e.count = (e.$list = bt.toArray(this.$container.children)).length),
                    this._axesInst = new Et({
                        flick: {
                            range: [0, e.size * (a - 1)],
                            bounce: s
                        }
                    },{
                        easing: t.panelEffect,
                        deceleration: t.deceleration,
                        interruptable: !1
                    }),
                    this._setDefaultPanel(t.defaultIndex)
                }
                ,
                i._setPadding = function(e, t) {
                    var n = this.$wrapper
                      , i = this.options.horizontal
                      , o = this._conf.panel
                      , r = e.reduce(function(e, t) {
                        return parseFloat(e) + parseFloat(t)
                    })
                      , a = {};
                    !r && t || (i && e.reverse(),
                    a.padding = (i ? "0 " : "") + e.map(function(e) {
                        return isNaN(e) ? e : e + "px"
                    }).join(" 0 ")),
                    t && (a.overflow = "hidden",
                    a.boxSizing = "border-box"),
                    Object.keys(a).length && bt.css(n, a);
                    var s = i ? ["Left", "Right"] : ["Top", "Bottom"]
                      , c = Math.max(n["offset" + (i ? "Width" : "Height")], bt.css(n, i ? "width" : "height", !0));
                    o.size = c - (bt.css(n, "padding" + s[0], !0) + bt.css(n, "padding" + s[1], !0))
                }
                ,
                i._addClonePanels = function() {
                    var e, t = this, n = this._conf.panel, i = n.origCount, o = n.minCount - i, r = n.$list;
                    if (this.options.circular && i < n.minCount) {
                        for (e = r.map(function(e) {
                            return e.cloneNode(!0)
                        }); e.length < o; )
                            e = e.concat(r.map(function(e) {
                                return e.cloneNode(!0)
                            }));
                        return e.forEach(function(e) {
                            return t.$container.appendChild(e)
                        }),
                        !!e.length
                    }
                    return !1
                }
                ,
                i._movePanelPosition = function(e, t) {
                    var n = this._conf.panel
                      , i = n.$list
                      , o = i.splice(t ? 0 : n.count - e, e);
                    n.$list = t ? i.concat(o) : o.concat(i)
                }
                ,
                i._setDefaultPanel = function(e) {
                    var t, n, i = this._conf.panel, o = i.count - 1;
                    this.options.circular ? (e > 0 && e <= o && this._movePanelPosition(e, !0),
                    n = this._getBasePositionIndex(),
                    this._movePanelPosition(n, !1),
                    this._setPanelNo({
                        no: e,
                        currNo: e
                    })) : e > 0 && e <= o && (this._setPanelNo({
                        index: e,
                        no: e,
                        currIndex: e,
                        currNo: e
                    }),
                    t = [-i.size * e, 0],
                    this._setTranslate(t),
                    this._setAxes("setTo", Math.abs(t[0]), 0))
                }
                ,
                i._arrangePanels = function(e, t) {
                    var n, i = this._conf, o = i.panel, r = i.touch, a = i.dirData;
                    this.options.circular && (i.customEvent.flick = !1,
                    e && (t && (r.direction = a[+!(t > 0)]),
                    this._arrangePanelPosition(r.direction, t)),
                    n = this._getBasePositionIndex(),
                    this._setPanelNo({
                        index: n,
                        currIndex: n
                    }),
                    i.customEvent.flick = !!this._setAxes("setTo", o.size * o.index, 0)),
                    this._applyPanelsPos()
                }
                ,
                i._applyPanelsPos = function() {
                    this._conf.panel.$list.forEach(this._applyPanelsCss.bind(this))
                }
                ,
                i._setMoveStyle = function(e, t) {
                    var n = At
                      , i = this._conf.useLayerHack;
                    this._setMoveStyle = n.support ? function(e, t) {
                        var o;
                        bt.css(e, ((o = {})[n.name] = bt.translate(t[0], t[1], i),
                        o))
                    }
                    : function(e, t) {
                        bt.css(e, {
                            left: t[0],
                            top: t[1]
                        })
                    }
                    ,
                    this._setMoveStyle(e, t)
                }
                ,
                i._applyPanelsCss = function() {
                    var e = this._conf
                      , t = this.options.useTranslate;
                    t ? this._applyPanelsCss = function(e, t) {
                        var n = this._getDataByDirection([At.support ? 100 * t + "%" : this._conf.panel.size * t + "px", 0]);
                        this._setMoveStyle(e, n)
                    }
                    : (Rt && (e.$dummyAnchor = bt.$(".__dummy_anchor"),
                    !e.$dummyAnchor && this.$wrapper.appendChild(e.$dummyAnchor = bt.$('<a href="javascript:void(0)" class="__dummy_anchor" style="position:absolute;height:0px;width:0px">'))),
                    this._applyPanelsCss = function(e, t) {
                        var n = this._getDataByDirection([this._conf.panel.size * t + "px", 0]);
                        bt.css(e, {
                            left: n[0],
                            top: n[1]
                        })
                    }
                    )
                }
                ,
                i._adjustContainerCss = function(e, t) {
                    var n, i = this._conf, o = i.panel, r = this.options, a = r.useTranslate, s = r.horizontal, c = r.previewPadding[0], u = this.$container, l = t;
                    if (!a)
                        if (l || (l = -o.size * o.index),
                        "start" === e)
                            u = u.style,
                            n = parseFloat(u[s ? "left" : "top"]),
                            s ? n && (u.left = "0px") : n !== c && (u.top = "0px"),
                            this._setTranslate([-l, 0]);
                        else if ("end" === e) {
                            var d;
                            l = this._getCoordsValue([l, 0]),
                            bt.css(u, ((d = {
                                left: l.x,
                                top: l.y
                            })[At.name] = bt.translate(0, 0, i.useLayerHack),
                            d)),
                            i.$dummyAnchor && i.$dummyAnchor.focus()
                        }
                }
                ,
                i._setAxes = function(e, t, n) {
                    return this._axesInst[e]({
                        flick: t
                    }, n)
                }
                ,
                i._setHint = function() {
                    var e = {
                        willChange: "transform"
                    };
                    bt.css(this.$container, e),
                    bt.css(this._conf.panel.$list, e)
                }
                ,
                i._getDataByDirection = function(e) {
                    var t = e.concat();
                    return !this.options.horizontal && t.reverse(),
                    t
                }
                ,
                i._arrangePanelPosition = function(e, t) {
                    var n = e === this._conf.dirData[0];
                    this._movePanelPosition(Math.abs(t || 1), n)
                }
                ,
                i._getBasePositionIndex = function() {
                    return Math.floor(this._conf.panel.count / 2 - .1)
                }
                ,
                i._bindEvents = function(e) {
                    var t = this.options
                      , n = this.$wrapper
                      , i = this._axesInst;
                    e ? (this._panInput = new Ct(n,{
                        inputType: t.inputType,
                        thresholdAngle: t.thresholdAngle,
                        scale: this._getDataByDirection([-1, 0])
                    }),
                    i.on({
                        hold: this._holdHandler.bind(this),
                        change: this._changeHandler.bind(this),
                        release: this._releaseHandler.bind(this),
                        animationStart: this._animationStartHandler.bind(this),
                        animationEnd: this._animationEndHandler.bind(this)
                    }).connect(this._getDataByDirection(["flick", ""]), this._panInput)) : (this.disableInput(),
                    i.off())
                }
                ,
                i._setAdaptiveHeight = function(e) {
                    var t, n, i = this._conf, o = i.indexToMove, r = 0 === o ? this["get" + ((e === Et.DIRECTION_LEFT ? "Next" : e === Et.DIRECTION_RIGHT && "Prev") || "") + "Element"]() : i.panel.$list[i.panel.currIndex + o], a = r.querySelector(":first-child");
                    a && ((n = a.getAttribute("data-height")) || (t = r.children,
                    (n = bt.outerHeight(t.length > 1 ? (r.style.height = "auto",
                    r) : a)) > 0 && a.setAttribute("data-height", n)),
                    n > 0 && (this.$wrapper.style.height = n + "px"))
                }
                ,
                i._triggerBeforeRestore = function(e) {
                    var t = this._conf
                      , n = t.touch;
                    n.direction = +t.dirData.join("").replace(n.direction, ""),
                    t.customEvent.restore = this._triggerEvent(xt.beforeRestore, {
                        depaPos: e.depaPos.flick,
                        destPos: e.destPos.flick
                    }),
                    t.customEvent.restore || ("stop"in e && e.stop(),
                    t.panel.animating = !1)
                }
                ,
                i._triggerRestore = function() {
                    var e = this._conf.customEvent;
                    e.restore && this._triggerEvent(xt.restore),
                    e.restore = e.restoreCall = !1
                }
                ,
                i._setPhaseValue = function(e, t) {
                    var n = this._conf
                      , i = this.options
                      , o = n.panel
                      , r = i.useTranslate;
                    if ("start" === e && (o.changed = this._isMovable())) {
                        if (!this._triggerEvent(xt.beforeFlickStart, t))
                            return o.changed = o.animating = !1,
                            !1;
                        i.adaptiveHeight && this._setAdaptiveHeight(n.touch.direction),
                        0 === n.indexToMove && this._setPanelNo()
                    } else
                        "end" === e && (i.circular && o.changed && this._arrangePanels(!0, n.indexToMove),
                        r && this._setTranslate([-o.size * o.index, 0]),
                        n.touch.distance = n.indexToMove = 0,
                        o.changed && this._triggerEvent(xt.flickEnd));
                    return this._adjustContainerCss(e),
                    !0
                }
                ,
                i._getNumByDirection = function() {
                    var e = this._conf;
                    return e.touch.direction === e.dirData[0] ? 1 : -1
                }
                ,
                i._revertPanelNo = function() {
                    var e = this._conf.panel
                      , t = this._getNumByDirection()
                      , n = e.currIndex >= 0 ? e.currIndex : e.index - t
                      , i = e.currNo >= 0 ? e.currNo : e.no - t;
                    this._setPanelNo({
                        index: n,
                        no: i
                    })
                }
                ,
                i._setPanelNo = function(e) {
                    var t = this._conf.panel
                      , n = t.origCount - 1
                      , i = this._getNumByDirection();
                    if (bt.isObject(e))
                        for (var o in e)
                            t[o] = e[o];
                    else
                        t.currIndex = t.index,
                        t.currNo = t.no,
                        t.index += i,
                        t.no += i;
                    t.no > n ? t.no = 0 : t.no < 0 && (t.no = n)
                }
                ,
                i._setPointerEvents = function(e) {
                    var t, n = this.$container, i = bt.css(n, "pointerEvents");
                    e && e.holding && e.inputEvent && e.inputEvent.preventSystemEvent && "none" !== i ? t = "none" : e || "auto" === i || (t = "auto"),
                    t && bt.css(n, {
                        pointerEvents: t
                    })
                }
                ,
                i._getCoordsValue = function(e) {
                    var t = this._getDataByDirection(e);
                    return {
                        x: bt.getUnitValue(t[0]),
                        y: bt.getUnitValue(t[1])
                    }
                }
                ,
                i._setTranslate = function(e) {
                    var t = this._getCoordsValue(e);
                    this._setMoveStyle(this.$container, [t.x, t.y])
                }
                ,
                i._isMovable = function() {
                    var e, t, n = this.options, i = this._axesInst, o = Math.abs(this._conf.touch.distance) >= n.threshold;
                    return !(!n.circular && o && (e = i.axis.flick.range[1],
                    (t = i.get().flick) < 0 || t > e)) && o
                }
                ,
                i._triggerEvent = function(e, t) {
                    var n = this._conf
                      , i = n.panel;
                    return e === xt.flickEnd && (i.currNo = i.no,
                    i.currIndex = i.index),
                    this.trigger(n.eventPrefix + e, bt.extend({
                        eventType: e,
                        no: i.currNo,
                        direction: n.touch.direction,
                        isTrusted: n.touch.isTrusted
                    }, t))
                }
                ,
                i._getElement = function(e, t, n) {
                    var i, o, r = this._conf.panel, a = this.options.circular, s = r.currIndex, c = e === this._conf.dirData[0], u = null;
                    n ? (i = r.count,
                    o = s) : (i = r.origCount,
                    o = r.currNo);
                    var l = o;
                    return c ? o < i - 1 ? o++ : a && (o = 0) : o > 0 ? o-- : a && (o = i - 1),
                    l !== o && (u = t ? r.$list[c ? s + 1 : s - 1] : o),
                    u
                }
                ,
                i._setValueToMove = function(e) {
                    var t = this._conf;
                    t.touch.distance = this.options.threshold + 1,
                    t.touch.direction = t.dirData[+!e]
                }
                ,
                i.getIndex = function(e) {
                    return this._conf.panel[e ? "currIndex" : "currNo"]
                }
                ,
                i.getElement = function() {
                    var e = this._conf.panel;
                    return e.$list[e.currIndex]
                }
                ,
                i.getNextElement = function() {
                    return this._getElement(this._conf.dirData[0], !0)
                }
                ,
                i.getNextIndex = function(e) {
                    return this._getElement(this._conf.dirData[0], !1, e)
                }
                ,
                i.getAllElements = function() {
                    return this._conf.panel.$list
                }
                ,
                i.getPrevElement = function() {
                    return this._getElement(this._conf.dirData[1], !0)
                }
                ,
                i.getPrevIndex = function(e) {
                    return this._getElement(this._conf.dirData[1], !1, e)
                }
                ,
                i.isPlaying = function() {
                    return this._conf.panel.animating
                }
                ,
                i._movePanelByPhase = function(e, t, n) {
                    var i = bt.getNumValue(n, this.options.duration);
                    !1 !== this._setPhaseValue("start") && (this._setAxes(e, t, i),
                    !i && this._setPhaseValue("end"))
                }
                ,
                i.next = function(e) {
                    var t = this.getNextIndex();
                    return "number" != typeof t ? this : this.moveTo(t, e)
                }
                ,
                i.prev = function(e) {
                    var t = this.getPrevIndex();
                    return "number" != typeof t ? this : this.moveTo(t, e)
                }
                ,
                i.moveTo = function(e, t) {
                    var n, i, o = this._conf, r = o.panel, a = this.options.circular, s = r.index, c = e;
                    return (c = bt.getNumValue(c, -1)) < 0 || c >= r.origCount || c === r.no || r.animating || o.touch.holding ? this : (n = c - (a ? r.no : s),
                    i = n > 0,
                    a && Math.abs(n) > (i ? r.count - (s + 1) : s) && (n += (i ? -1 : 1) * r.count,
                    i = n > 0),
                    this._setPanelNo(a ? {
                        no: c
                    } : {
                        no: c,
                        index: c
                    }),
                    this._conf.indexToMove = n,
                    this._setValueToMove(i),
                    this._movePanelByPhase(a ? "setBy" : "setTo", r.size * (a ? n : c), t),
                    this)
                }
                ,
                i.resize = function() {
                    var e, t = this._conf, n = this.options, i = t.panel, o = n.horizontal, r = n.useTranslate;
                    if (!this.isPlaying()) {
                        var a;
                        if (bt.isArray(n.previewPadding) && "number" == typeof +n.previewPadding.join("") ? (this._setPadding(n.previewPadding.concat()),
                        e = i.size) : o && (e = i.size = bt.css(this.$wrapper, "width", !0)),
                        bt.css(i.$list, ((a = {})[o ? "width" : "height"] = bt.getUnitValue(e),
                        a)),
                        n.adaptiveHeight) {
                            var s = this.$container.querySelectorAll("[data-height]");
                            s.length && (bt.toArray(s).forEach(function(e) {
                                return e.removeAttribute("data-height")
                            }),
                            this._setAdaptiveHeight())
                        }
                        this._axesInst.axis.flick.range = [0, e * (i.count - 1)],
                        this._setAxes("setTo", e * i.index, 0),
                        r || (this._applyPanelsPos(),
                        this._adjustContainerCss("end"))
                    }
                    return this
                }
                ,
                i.restore = function(e) {
                    var t, n = this._conf, i = n.panel, o = this._axesInst.get().flick, r = e;
                    return o !== i.currIndex * i.size ? (n.customEvent.restoreCall = !0,
                    r = bt.getNumValue(r, this.options.duration),
                    this._revertPanelNo(),
                    t = i.size * i.index,
                    this._triggerBeforeRestore({
                        depaPos: o,
                        destPos: t
                    }),
                    this._setAxes("setTo", t, r),
                    r || (this._adjustContainerCss("end"),
                    this._triggerRestore())) : i.changed && (this._revertPanelNo(),
                    n.touch.distance = n.indexToMove = 0),
                    this
                }
                ,
                i.enableInput = function() {
                    return this._panInput.enable(),
                    this
                }
                ,
                i.disableInput = function() {
                    return this._panInput.disable(),
                    this
                }
                ,
                i.getStatus = function(e) {
                    var t = this._conf.panel
                      , n = /((?:-webkit-)?transform|left|top|will-change|box-sizing|width):[^;]*;/g
                      , i = {
                        panel: {
                            index: t.index,
                            no: t.no,
                            currIndex: t.currIndex,
                            currNo: t.currNo
                        },
                        $list: t.$list.map(function(e) {
                            return {
                                style: e.style.cssText.replace(n, "").trim(),
                                className: e.className,
                                html: e.innerHTML
                            }
                        })
                    };
                    return e ? JSON.stringify(i) : i
                }
                ,
                i.setStatus = function(e) {
                    var t = this._conf.panel
                      , n = this.options.adaptiveHeight
                      , i = "string" == typeof e ? JSON.parse(e) : e;
                    if (i) {
                        for (var o in i.panel)
                            o in t && (t[o] = i.panel[o]);
                        t.$list.forEach(function(e, t) {
                            var n = i.$list[t]
                              , o = n.style
                              , r = n.className
                              , a = n.html;
                            o && (e.style.cssText += o),
                            r && (e.className = r),
                            a && (e.innerHTML = a)
                        }),
                        n && this._setAdaptiveHeight()
                    }
                }
                ,
                i.destroy = function() {
                    var e = this
                      , t = this._conf
                      , n = t.origPanelStyle
                      , i = n.wrapper
                      , o = n.container
                      , r = n.list;
                    this._bindEvents(!1),
                    this.off(),
                    this._axesInst.destroy(),
                    this._panInput.destroy();
                    var a = this.$wrapper;
                    a.setAttribute("class", i.className),
                    a[i.style ? "setAttribute" : "removeAttribute"]("style", i.style);
                    var s = this.$container
                      , c = [].slice.call(s.children);
                    n.container.className ? (s.setAttribute("class", o.className),
                    s[o.style ? "setAttribute" : "removeAttribute"]("style", o.style)) : (c.forEach(function(e) {
                        return a.appendChild(e)
                    }),
                    s.parentNode.removeChild(s));
                    for (var u, l = 0; u = c[l]; l++)
                        if (l > r.length - 1)
                            u.parentNode.removeChild(u);
                        else {
                            var d = r[l].className
                              , h = r[l].style;
                            u[d ? "setAttribute" : "removeAttribute"]("class", d),
                            u[h ? "setAttribute" : "removeAttribute"]("style", h)
                        }
                    for (var f in this.plugins.forEach(function(t) {
                        e.plugins[t].$componentWillUnmount()
                    }),
                    this)
                        this[f] = null
                }
                ,
                i.plugin = function(e) {
                    var t = this;
                    return e.forEach(function(e) {
                        0 === t.plugins.filter(function(t) {
                            return t.constructor === e.constructor
                        }).length && t.plugins.push(e.$componentWillMount(t))
                    }),
                    this
                }
                ,
                n
            }(function(e) {
                return new St(e)
            }(n).with(Dt));
            return t.utils = bt,
            t.VERSION = "2.4.2",
            t.consts = {
                EVENTS: xt,
                TRANSFORM: At,
                SUPPORT_WILLCHANGE: Pt,
                IS_ANDROID2: Rt
            },
            t.DIRECTION_NONE = Et.DIRECTION_NONE,
            t.DIRECTION_LEFT = Et.DIRECTION_LEFT,
            t.DIRECTION_RIGHT = Et.DIRECTION_RIGHT,
            t.DIRECTION_UP = Et.DIRECTION_UP,
            t.DIRECTION_DOWN = Et.DIRECTION_DOWN,
            t.DIRECTION_HORIZONTAL = Et.DIRECTION_HORIZONTAL,
            t.DIRECTION_VERTICAL = Et.DIRECTION_VERTICAL,
            t.DIRECTION_ALL = Et.DIRECTION_ALL,
            t
        }()
    }()
}
, function(e, t) {
    e.exports = {
        init: function() {},
        send: function(e, t) {
            if ("undefined" != typeof PREMIUM_LOG_DOMAIN) {
                var n = t
                  , i = {};
                if ("object" == typeof t && (t.u = location.href,
                n = $.param(t)),
                !e || !n)
                    return;
                var o = new Image;
                o.src = PREMIUM_LOG_DOMAIN + "/premium?action_name=" + e + "&" + n,
                o.onload = function() {
                    o.onload = null
                }
                ,
                i.action_name = e,
                i.P_SES = Cookies.get("P_SES");
                var r = n.split("&") || [];
                $.each(r, function(e, t) {
                    var n = t.split("=");
                    if ("object" == typeof n) {
                        var o = n[0]
                          , r = n[1] || "";
                        i[o] = r
                    }
                }),
                ntm_premium_analytics.push({
                    event: "custom-premium",
                    nlogEvt: i
                })
            }
        }
    }
}
, function(e, t, n) {
    var i = n(0);
    e.exports = {
        init: function() {},
        set: function(e, t) {
            try {
                window.localStorage && window.localStorage.setItem(e, JSON.stringify(t))
            } catch (e) {
                i.sendErrorToNelo("[common/resources] localStorage set 에러 : " + e)
            }
        },
        get: function(e, t) {
            var n = t || {};
            try {
                if (window.localStorage) {
                    var o = window.localStorage.getItem(e);
                    o && (n = JSON.parse(o))
                }
            } catch (e) {
                i.sendErrorToNelo("[common/resources] localStorage get 에러 : " + e)
            }
            return n
        },
        remove: function(e) {
            try {
                window.localStorage && window.localStorage.removeItem(e)
            } catch (e) {
                i.sendErrorToNelo("[common/resources] localStorage removeItem 에러 : " + e)
            }
        }
    }
}
, function(e, t, n) {
    var i = n(0)
      , o = n(1)
      , r = $("#frontDetect")
      , a = !1;
    function s() {
        1 != a && (a = !0,
        setTimeout(function() {
            c(),
            a = !1
        }, 100))
    }
    function c() {
        0 !== r.length && (window.pageYOffset + window.innerHeight >= r.offset().top && l(!0),
        (!1 === o.isMobile() || window.innerWidth >= 1025) && l(!0))
    }
    function u() {
        l(),
        $("iframe").each(function() {
            var e = $(this)
              , t = e.attr("data-src");
            t && (e.attr("src", t),
            e.removeAttr("data-src"))
        }),
        $("._LAZY_LOADING_IFRAME").each(function() {
            var e = $(this);
            e.after(e.html())
        }),
        !0 !== service.newsType && !0 !== service.sports || d()
    }
    function l(e) {
        $("._LAZY_LOADING").each(function() {
            var t = $(this)
              , n = t.attr("data-src")
              , o = "true" == t.attr("data-scroll");
            !n || 0 != o && 1 != e || (t.attr("src", n),
            t.removeAttr("data-src"),
            t.hasClass("_LAZY_LOADING_INIT_HIDE") && t.show(),
            t.on("error", function() {
                var e = t.closest("._LAZY_LOADING_WRAP");
                $("._LAZY_LOADING_ERROR_HIDE", e).hide(),
                $("._LAZY_LOADING_ERROR_SHOW", e).show(),
                0 == ("true" == e.attr("data-loading-error-allowed") || !1) && i.sendErrorToNelo("[common/lazyLoading] image onerror : " + n)
            }))
        }),
        1 == e && $(window).off("scroll", c)
    }
    function d(e) {
        e = e || $("._LAZY_LOADING_TEMPLATE");
        $.each(e, function() {
            var e = $(this)
              , t = e.data("template")
              , n = e.data("query")
              , o = e.data("delay") || 0;
            setTimeout(function() {
                $.ajax({
                    url: "/article/template/" + t,
                    cache: !1,
                    method: "GET",
                    timeout: 5e3,
                    data: n,
                    success: function(n) {
                        var i = t.split(",");
                        $.each(i, function(t, i) {
                            var o = n.renderedComponent[i];
                            o && e.append(o)
                        })
                    },
                    error: function(e, o, r) {
                        i.sendErrorToNelo("[common/lazyLoading] 동적 템플릿 " + t + " 조회 요청 에러 : " + JSON.stringify(n), e, o, r)
                    }
                })
            }, o)
        })
    }
    e.exports = {
        init: function() {
            u(),
            c(),
            $(window).on("scroll", s),
            $(window).on("resize", s)
        },
        lazyLoading: u,
        lazyLoadingImage: l,
        lazyLoadingTemplate: d
    }
}
, , function(e, t, n) {
    var i = n(1);
    function o(e) {
        e.each(function() {
            var e = $(this)
              , t = e.data("scroll-id")
              , n = e.closest("._SCROLL_WRAP")
              , o = n.find("._SCROLL_PREV")
              , a = n.find("._SCROLL_NEXT")
              , s = new IScroll(this,{
                scrollX: !0,
                scrollY: !1,
                preventDefault: !1,
                eventPassthrough: !0,
                disablePointer: !0,
                disableTouch: !i.isMobile(),
                disableMouse: !i.isMobile()
            });
            e.css("touch-action", "pan-y pinch-zoom");
            var c, u, l = {}, d = e.width() * ((e.data("scroll-offset") || 33) / 100);
            if (f(),
            p(),
            o.click(function() {
                s.scrollBy(c, 0, 100)
            }),
            a.click(function() {
                s.scrollBy(-u, 0, 100)
            }),
            "ios" === Agent(navigator.userAgent).os.name) {
                var h = {};
                this.addEventListener("touchstart", function(e) {
                    h.x = e.touches[0].pageX,
                    h.y = e.touches[0].pageY
                }),
                this.addEventListener("touchmove", function(e) {
                    return Math.abs(h.x - e.touches[0].pageX) > Math.abs(h.y - e.touches[0].pageY) && e.preventDefault(),
                    h
                })
            }
            function f() {
                l.left = -s.x,
                l.right = -1 * (s.maxScrollX - s.x),
                c = Math.min(-s.x, d),
                u = Math.min(l.right, d)
            }
            function p() {
                if (!0 === i.isMobile())
                    return o.css("display", "none"),
                    void a.css("display", "none");
                o.css("display", o.data("display-type") || "block"),
                a.css("display", a.data("display-type") || "block"),
                0 == l.right && a.css("display", "none"),
                0 == l.left && o.css("display", "none")
            }
            s.on("scrollEnd", function() {
                f(),
                p()
            }),
            "undefined" != typeof TEvent && this.addEventListener("touchstart", function(e) {
                TEvent.touchStartEvent()
            }, !1),
            r(s),
            t && (window.__htScroll = window.__htScroll || {},
            window.__htScroll[t] = s)
        })
    }
    function r(e) {
        var t, n = $(e.wrapper), i = n.closest("._SCROLL_WRAP").find("._SCROLL_ITEM_WRAP");
        n.find("._SCROLL_ITEM").each(function(e, n) {
            if (1 == $(n).data("selected"))
                return t = $(n),
                !1
        });
        var o = 0
          , r = 0;
        t && (r = i.offset().left - t.offset().left + (n.width() - t.width()) / 2,
        o = Math.max(n.width() - i.width(), r)),
        e.scrollTo(Math.min(0, o), 0, 100)
    }
    e.exports = {
        init: function() {
            o($("._SCROLL"))
        },
        setScroll: o,
        focusScroll: r
    }
}
, function(e, t, n) {
    var i = n(0)
      , o = n(1)
      , r = ["JOURNALIST", "SERIES"]
      , a = {
        JOURNALIST: {
            wrapperDom: $("#_MODAL_LAYER_FOR_UNSUBSCRIBER_PROMOTION_JOURNALIST"),
            cookieName: "UNSUB_PR_CLOSED_J"
        },
        SERIES: {
            wrapperDom: $("#_MODAL_LAYER_FOR_UNSUBSCRIBER_PROMOTION_SERIES"),
            cookieName: "UNSUB_PR_CLOSED_S"
        }
    }
      , s = {}
      , c = ajaxDomain + "/media/myfeed/subscribe"
      , u = ajaxDomain + "/media/myfeed/unsubscribe"
      , l = "/article/template/MYFEED_SUBSCRIBE"
      , d = "/article/template/MYFEED_COUNT"
      , h = "통신 에러입니다."
      , f = $("#_MY_FEED_CANCEL_MODAL");
    function p(e, t) {
        var n = []
          , i = {};
        return $.each(e, function(e, o) {
            var r = $(o)
              , a = r.attr("data-subscribe-type") || ""
              , s = r.find("._SUBSCRIBE").attr("data-channelKey") || "";
            s && t == a && -1 == n.indexOf(s) && (n.push(s),
            i[s] = r)
        }),
        {
            subscribeEle: i,
            channelKeys: n
        }
    }
    function m(e, t) {
        if (!($("#newsct_article").height() < window.innerHeight)) {
            var n = function() {
                $(document).scrollTop() > 0 ? e.addClass("is_active") : e.removeClass("is_active")
            };
            $(window).on("scroll", n),
            n();
            var i = {
                subscribeType: t,
                oid: article.officeId,
                aid: article.articleId
            };
            o.sendLog("unsubscriberPromotion", i)
        }
    }
    function _(e, t, n) {
        $.each(e, function() {
            var e = $(this);
            n == e.find("._SUBSCRIBE").attr("data-channelKey") && function(e, t) {
                var n = e.find("._SUBSCRIBE")
                  , i = e.find("._SUBSCRIBE_COUNT_TEXT_WRAP")
                  , o = e.find("._SUBSCRIBE_COUNT_TEXT")
                  , r = $.number(t)
                  , a = o.data("maxcount") || ""
                  , s = $.number(a) + "+";
                a ? o.text(t > a ? s : r) : o.text(r);
                t > 0 ? i.show() : i.hide();
                var c = n.attr("data-count");
                if (c) {
                    var u = e.find("#" + c);
                    !0 === n.is(":visible") ? u.removeClass("on") : u.addClass("on"),
                    t > 0 ? u.show() : u.hide()
                }
            }(e, t)
        })
    }
    function v(e, t, n) {
        $.each(e, function() {
            var e = $(this);
            n == e.find("._SUBSCRIBE").attr("data-channelKey") && function(e, t) {
                var n = e.find("._SUBSCRIBE")
                  , i = e.find("._UNSUBSCRIBE");
                1 == t ? (n.hide(),
                i.show()) : (n.show(),
                i.hide())
            }(e, t)
        })
    }
    function E() {
        setTimeout(function() {
            location.href = o.getUrl("NAVERAPP_NEWS")
        }, 50)
    }
    function g(e, t) {
        $.each(s[e], function(e, n) {
            "function" == typeof n && n(t)
        })
    }
    e.exports = {
        init: function() {
            $("body").on("click", "._MOVE_TO_NEWS", function(e) {
                e.preventDefault(),
                E()
            });
            var e = $("._SUBSCRIBE_ELE");
            $.each(r, function(t, n) {
                isLogin && function(e, t) {
                    var n = p(e, t).channelKeys;
                    if (0 != n.length) {
                        var r = {
                            oid: article.officeId,
                            aid: article.articleId,
                            channelKeys: n.join(",")
                        };
                        $.ajax({
                            url: l,
                            cache: !1,
                            method: "GET",
                            timeout: 5e3,
                            data: r,
                            xhrFields: {
                                withCredentials: !0
                            },
                            success: function(n) {
                                try {
                                    var r = n.component.MYFEED_SUBSCRIBE_V2.value
                                      , s = !1;
                                    $.each(r.channelKeys, function(t, n) {
                                        v(e, !0, n),
                                        s = !0
                                    }),
                                    !1 === s && function(e) {
                                        var t = a[e].cookieName
                                          , n = a[e].wrapperDom;
                                        !1 !== o.isInternalReferrer() && ("JOURNALIST" === e && 1 == /[?|&]type=journalists(&|$)/.test(location.href) && "1" !== Cookies.get(t) ? setTimeout(function() {
                                            m(n, e)
                                        }, 1e3) : "SERIES" === e && 1 == /[?|&]type=series(&|$)/.test(location.href) && "1" !== Cookies.get(t) && setTimeout(function() {
                                            m(n, e)
                                        }, 1e3))
                                    }(t)
                                } catch (e) {
                                    i.sendErrorToNelo("[common/myFeed] 구독 여부 확인 요청 응답 에러 : " + JSON.stringify(n))
                                }
                            },
                            error: function(e, t, n) {
                                i.sendErrorToNelo("[common/myFeed] 구독 여부 확인 요청 에러 : " + JSON.stringify(r), e, t, n)
                            }
                        })
                    }
                }(e, n),
                function(e, t) {
                    var n = p(e, t).channelKeys;
                    if (0 != n.length) {
                        var o = {
                            oid: article.officeId,
                            aid: article.articleId,
                            channelKeys: n.join(",")
                        };
                        $.ajax({
                            url: d,
                            cache: !1,
                            method: "GET",
                            timeout: 5e3,
                            data: o,
                            success: function(t) {
                                try {
                                    var n = t.component.MYFEED_COUNT.value;
                                    $.each(n.result, function(t, n) {
                                        var i = n.channelKey
                                          , o = n.count;
                                        o >= 0 && _(e, o, i)
                                    })
                                } catch (e) {
                                    i.sendErrorToNelo("[common/myFeed] 구독 갯수 조회 요청 응답 에러 : " + JSON.stringify(t))
                                }
                            },
                            error: function(e, t, n) {
                                i.sendErrorToNelo("[common/myFeed] 구독 갯수 조회 요청 에러 : " + JSON.stringify(o), e, t, n)
                            }
                        })
                    }
                }(e, n)
            }),
            f.on("click", "._CANCEL_YES_BTN", function(e) {
                e.preventDefault(),
                function(e) {
                    if (0 != isLogin) {
                        var t = e.attr("data-channelKey");
                        t && t.length && $.ajax({
                            url: u,
                            cache: !1,
                            method: "POST",
                            timeout: 5e3,
                            data: {
                                channelKey: t
                            },
                            dataType: "json",
                            xhrFields: {
                                withCredentials: !0
                            },
                            success: function(e) {
                                "SUCCESS" == e.message ? function(e, t) {
                                    var n = $("._SUBSCRIBE_ELE");
                                    v(n, !1, e),
                                    _(n, t, e),
                                    g("UNSUBSCRIBE_" + e.split("_")[0], {
                                        channelKey: e
                                    })
                                }(t, e.count) : (i.sendErrorToNelo("[common/myFeed] 구독 해지 요청 응답 에러 : ", e),
                                alert(h))
                            },
                            error: function(e, t, n) {
                                i.sendErrorToNelo("[common/myFeed] 구독 해지 요청 에러", e, t, n)
                            }
                        })
                    } else
                        o.login()
                }($(e.currentTarget))
            })
        },
        subscribe: function(e, t) {
            if (0 != isLogin) {
                var n = e.attr("data-channelKey");
                n && n.length && $.ajax({
                    url: c,
                    cache: !1,
                    method: "POST",
                    timeout: 5e3,
                    data: {
                        channelKey: n
                    },
                    dataType: "json",
                    xhrFields: {
                        withCredentials: !0
                    },
                    success: function(e) {
                        "SUCCESS" == e.message ? (function(e, t, n) {
                            var i = $("._SUBSCRIBE_ELE");
                            v(i, !0, n),
                            _(i, t, n),
                            a.JOURNALIST.wrapperDom.addClass("is_hidden"),
                            a.SERIES.wrapperDom.addClass("is_hidden"),
                            g("SUBSCRIBE_" + n.split("_")[0], {
                                channelKey: n
                            })
                        }(0, e.count, n),
                        t && t()) : (i.sendErrorToNelo("[common/myFeed] 구독 요청 응답 에러 : ", e),
                        alert(h))
                    },
                    error: function(e, t, n) {
                        i.sendErrorToNelo("[common/myFeed] 구독 요청 에러", e, t, n)
                    }
                })
            } else
                o.login()
        },
        showCancelModal: function(e) {
            var t = $("._MY_FEED_CANCEL_MODAL_TEMPLATE")
              , n = $("._MY_FFED_CANCEL_MODAL_MESSAGE")
              , i = t.html()
              , o = e.attr("data-type")
              , r = e.attr("data-messageValue")
              , a = e.attr("data-channelKey")
              , s = {};
            s[o] = {
                value: r
            };
            var c = Mustache.render(i, s);
            $("._CANCEL_YES_BTN").attr("data-channelKey", a),
            n.html(c),
            f.removeClass("is_hidden"),
            f.show()
        },
        moveToMynews: function() {
            setTimeout(function() {
                location.href = o.getUrl("NAVERAPP_NEWS_FEED")
            }, 50)
        },
        moveToNews: E,
        UNSUBSCRIBER_PROMOTION_INFO: a,
        attachEvent: function(e, t) {
            var n = [];
            !0 === Array.isArray(e) ? n = e : n.push(e),
            $.each(n, function(e, n) {
                s[n] = s[n] || [],
                s[n].push(t)
            })
        }
    }
}
, function(e, t, n) {
    var i = n(1)
      , o = $("footer")
      , r = $("._MOVE_TOP");
    function a(e) {
        e.preventDefault(),
        i.logout()
    }
    function s(e) {
        e.preventDefault(),
        i.moveTop()
    }
    e.exports = {
        init: function() {
            o.on("click", "._LOGOUT", a),
            1 == i.isNaverApp() ? r.hide(0) : (r.on("click", s),
            $(window).scrollend({
                delay: 250
            }, function() {
                window.pageYOffset > 0 ? r.show(0) : r.hide(0)
            }))
        }
    }
}
, function(e, t, n) {
    var i = n(0);
    function o() {
        var e = {}
          , t = []
          , n = "";
        if ($.each($("._COMMENT_COUNT_LIST"), function() {
            var i = $(this)
              , o = i.data("object-id") || "";
            0 == (i.data("processed") || !1) && (e[o] = i,
            t.push(o),
            n = i.data("ticket"))
        }),
        0 != t.length) {
            var o = {
                ticket: n,
                objectIds: t.join(",")
            };
            $.ajax({
                url: ajaxDomain + "/main/template/SCS_COMMENT_COUNT_LIST",
                cache: !1,
                method: "GET",
                timeout: 5e3,
                data: o,
                success: function(t) {
                    try {
                        var n = t.component.SCS_COMMENT_COUNT_LIST.value;
                        $.each(n, function() {
                            0 == this.count && 0 == e[this.objectId].data("zero-allow") ? e[this.objectId].html("") : e[this.objectId].html($.number(this.count)),
                            e[this.objectId].attr("data-processed", !0)
                        })
                    } catch (e) {
                        i.sendErrorToNelo("[service/premium/list] 댓글 리스트 조회 요청 응답 에러 : " + JSON.stringify(t))
                    }
                },
                error: function(e, t, n) {
                    i.sendErrorToNelo("[service/premium/list] 댓글 리스트 조회 요청 에러 : " + JSON.stringify(o), e, t, n)
                }
            })
        }
    }
    function r() {
        var e = {}
          , t = [];
        if ($.each($("._VIDEO_VIEW_COUNT_LIST"), function() {
            var n = $(this)
              , i = n.data("video-id") || "";
            0 == (n.data("processed") || !1) && (e[i] ? e[i].push(n) : (e[i] = [],
            e[i].push(n)),
            -1 === t.indexOf(i) && t.push(i))
        }),
        0 != t.length) {
            var n = {
                videoIds: t.join(",")
            };
            $.ajax({
                url: ajaxDomain + "/main/template/SCS_PREMIUM_VIDEO_VIEW_COUNT_LIST",
                cache: !1,
                method: "GET",
                timeout: 5e3,
                data: n,
                success: function(t) {
                    try {
                        var n = t.component.SCS_PREMIUM_VIDEO_VIEW_COUNT_LIST.value;
                        $.each(n, function() {
                            var t = $.number(this.count)
                              , n = e[this.videoId];
                            $.each(n, function() {
                                this.html(t),
                                this.attr("data-processed", !0),
                                this.closest("._VIDEO_VIEW_COUNT_LIST_WRAP").show()
                            })
                        })
                    } catch (e) {
                        i.sendErrorToNelo("[service/premium/list] 동영상 재생수 조회 요청 응답 에러 : " + JSON.stringify(t))
                    }
                },
                error: function(e, t, o) {
                    i.sendErrorToNelo("[service/premium/list] 동영상 재생수 조회 요청 에러 : " + JSON.stringify(n), e, t, o)
                }
            })
        }
    }
    function a() {
        if (!1 !== isLogin) {
            var e = $("._CONTENT_AUTHORITY_LIST")
              , t = []
              , n = ""
              , o = "";
            if ($.each(e, function() {
                var e = $(this)
                  , i = e.data("content-id") || "";
                0 == (e.data("processed") || !1) && (t.push(i),
                n = e.data("cp-name"),
                o = e.data("sub-id"))
            }),
            0 != t.length) {
                e.attr("data-processed", !0);
                var r = {
                    cpName: n,
                    subId: o,
                    contentIds: t.join(",")
                };
                $.ajax({
                    url: ajaxDomain + "/main/template/SCS_PAY_CONTENT_LIST_AUTHORITY",
                    cache: !1,
                    method: "GET",
                    timeout: 5e3,
                    data: r,
                    success: function(e) {
                        try {
                            var t = e.component.SCS_PAY_CONTENT_LIST_AUTHORITY.value;
                            t && $.each(t, function() {
                                var e = $("._CONTENT_AUTHORITY_LIST[data-content-id=" + this.contentId + "]");
                                !0 === this.auth ? e.hide() : e.show()
                            })
                        } catch (t) {
                            i.sendErrorToNelo("[service/premium/list] 콘텐츠 권한 리스트 조회 요청 응답 에러 : " + JSON.stringify(e))
                        }
                    },
                    error: function(e, t, n) {
                        i.sendErrorToNelo("[service/premium/list] 콘텐츠 권한 리스트 조회 요청 에러 : " + JSON.stringify(r), e, t, n)
                    }
                })
            }
        }
    }
    function s() {
        var e = $("._CONTENT_LIST")
          , t = e.data("group-title") || "";
        $.each($("._CONTENT_LIST_GROUP_TITLE[data-processed=false]"), function() {
            var e = $(this)
              , n = e.data("group-title") || "";
            t !== n && (t = n,
            e.show()),
            e.data("processed", !0)
        }),
        e.data("group-title", t)
    }
    function c() {
        if (!1 !== isLogin) {
            var e = $("._VIDEO_PLAYTIME_PROGRESS")
              , t = function(e) {
                var t = [];
                return $.each(e, function(e, n) {
                    var i = $(n)
                      , o = i.data("content-id") || ""
                      , r = i.data("processed") || !1;
                    o && !1 === r && (-1 === t.indexOf(o) && t.push(o),
                    i.attr("data-processed", !0))
                }),
                t
            }(e);
            if (0 !== t.length) {
                var n = {
                    contentIds: t.join(",")
                };
                $.ajax({
                    url: ajaxDomain + "/main/template/SCS_VOD_PLAYTIME_LIST",
                    cache: !1,
                    method: "GET",
                    timeout: 5e3,
                    data: n,
                    success: function(t) {
                        try {
                            var n = t.component.SCS_HYPERGRAPE_VOD_PLAYTIME_LIST.value;
                            n.data && $.each(n.data, function(t, n) {
                                n.data.currentTime > 0 && function(e, t) {
                                    $.each(e, function() {
                                        var e = $(this);
                                        t.contentId === e.attr("data-content-id") && (e.show(),
                                        e.val(t.currentTime))
                                    })
                                }(e, n.data)
                            })
                        } catch (e) {
                            i.sendErrorToNelo("[service/premium/list] 동영상 이어보기 목록 조회 응답 에러 : " + JSON.stringify(t))
                        }
                    },
                    error: function(e, t, o) {
                        i.sendErrorToNelo("[service/premium/list] 동영상 이어보기 목록 조회 요청 에러 : " + JSON.stringify(n), e, t, o)
                    }
                })
            }
        }
    }
    e.exports = {
        init: function() {
            o(),
            r(),
            function() {
                var e = $("._CONTENT_LIST")
                  , t = $("._CONTENT_LIST_LOADING")
                  , n = !1;
                if (0 !== e.length && 0 !== t.length) {
                    var u = function() {
                        if (!0 !== n && $(document).scrollTop() > t.offset().top - window.innerHeight + t.outerHeight()) {
                            n = !0;
                            var u = e.data("cp-name")
                              , l = e.data("sub-id")
                              , d = e.data("category-id")
                              , h = e.data("tag")
                              , f = e.data("type")
                              , p = e.data("stype")
                              , m = e.data("search-query")
                              , _ = e.data("template")
                              , v = e.data("cursor")
                              , E = e.data("cursor-name")
                              , g = e.data("author-id")
                              , T = e.data("alliance-id")
                              , N = e.data("has-next") || !1;
                            if (!1 === N)
                                return;
                            if (!v)
                                return;
                            var y = {
                                cpName: u,
                                subId: l,
                                categoryId: d,
                                tag: h,
                                authorId: g,
                                allianceId: T,
                                type: f,
                                stype: p,
                                searchQuery: m
                            };
                            y[E] = v,
                            $.ajax({
                                url: ajaxDomain + "/main/template/" + _,
                                cache: !1,
                                method: "GET",
                                timeout: 5e3,
                                data: y,
                                success: function(u) {
                                    setTimeout(function() {
                                        var l = u.renderedComponent[_]
                                          , d = $(l)
                                          , h = d.find("._CONTENT_LIST")
                                          , f = h.data("has-next") || !1;
                                        if (!1 === f && t.hide(),
                                        0 == h.length)
                                            return n = !1,
                                            e.data("has-next", !1),
                                            void i.sendErrorToNelo("[service/premium/list] 콘텐츠 리스트 더보기 조회 응답 에러 : " + JSON.stringify(y));
                                        e.append(h.html()),
                                        e.data("cursor", h.data("cursor")),
                                        e.data("has-next", h.data("has-next")),
                                        "object" == typeof reaction && reaction.instance && reaction.instance.update(),
                                        o(),
                                        r(),
                                        a(),
                                        s(),
                                        c(),
                                        n = !1
                                    }, 500)
                                },
                                error: function(o, r, a) {
                                    setTimeout(function() {
                                        t.hide(),
                                        n = !1,
                                        e.data("has-next", !1)
                                    }, 500),
                                    i.sendErrorToNelo("[service/premium/list] 콘텐츠 리스트 더보기 조회 요청 에러 : " + JSON.stringify(y), o, r, a)
                                }
                            })
                        }
                    };
                    $(window).on("scroll", u),
                    u()
                }
            }(),
            a(),
            s(),
            c()
        },
        updateCommentCount: o,
        updateVideoViewCount: r,
        updateVodPlaytimeProgressbar: c
    }
}
, function(e, t, n) {
    var i = n(0);
    function o(e, t, n) {
        if (!1 !== isLogin || Cookies.get("NNB")) {
            var o = "/hg/proxy/v1/" + (!0 === isLogin ? "user" : "browser") + "/" + e.type + "?idPrefix=" + t.idPrefix;
            $.ajax({
                url: ajaxDomain + o,
                cache: !1,
                method: e.method,
                timeout: 5e3,
                contentType: "application/json",
                data: JSON.stringify(t),
                dataType: "json",
                success: function(e) {
                    e.isSuccess ? n && n() : i.sendErrorToNelo("[common/hypergrape] HyperGrape 응답 에러 : " + JSON.stringify(e))
                },
                error: function(e, n, o) {
                    i.sendErrorToNelo("[common/hypergrape] HyperGrape 요청 에러 : " + JSON.stringify(t), e, n, o)
                }
            })
        }
    }
    e.exports = {
        HYPERGRAPE_INFO: {
            VISITED: {
                type: "VISITED",
                method: "POST"
            },
            DELETE_VISITED: {
                type: "VISITED",
                method: "DELETE"
            },
            METERED_PAYWALL_UPSERT: {
                type: "METERED_PAYWALL_UPSERT",
                method: "PUT"
            },
            VOD_PLAYTIME: {
                type: "VOD_PLAYTIME",
                method: "POST"
            }
        },
        add: o,
        addUsingBeacon: function(e, t, n) {
            if (!0 === Boolean(navigator.sendBeacon) && "local" != envPhase) {
                if (!1 === isLogin && !Cookies.get("NNB"))
                    return;
                var i = "/hg/proxy/v1/" + (!0 === isLogin ? "user" : "browser") + "/" + e.type + "?idPrefix=" + t.idPrefix;
                if (!0 === navigator.sendBeacon(ajaxDomain + i, JSON.stringify(t)))
                    return
            }
            o(e, t, n)
        }
    }
}
, , , function(e, t, n) {
    var i = n(7)
      , o = n(5)
      , r = n(1);
    function a(e, t, n) {
        if (e[0] && t[0]) {
            for (var i = e.attr("data-count"), o = e.data("indicator-show") || !1, r = "", a = t.html(), s = 0; s < i; s++) {
                var c = {
                    number: s + 1,
                    selected: s == n
                };
                r += Mustache.render(a, c)
            }
            r && (e.html(r),
            !0 === o && e.show())
        }
    }
    e.exports = {
        init: function(e, t) {
            var n = $(e)
              , s = (t = t || {
                circular: !0
            }).defaultIndex || 0
              , c = n.find("._FLICKING")
              , u = n.find("._FLICKING_INDICATOR")
              , l = n.find("._FLICKING_INDICATOR_TEMPLATE")
              , d = c.data("disable-resize") || !1
              , h = new i(c[0],t).on("flickEnd", function(e) {
                a(u, l, e.no)
            });
            return u.on("click", "._FLICKING_TAB", function(e) {
                h.moveTo($(e.currentTarget).attr("data-index"), 100)
            }),
            setTimeout(function() {
                c.fadeTo(50, 1),
                a(u, l, s)
            }, 0),
            !1 === d && (!0 === r.isMobile() ? o.on(function() {
                h.resize()
            }) : $(window).resize(function() {
                h.resize()
            })),
            h
        }
    }
}
, , function(e, t) {
    var n = {
        3003: "판매 중단된 콘텐츠로<br>구매할 수 없습니다.",
        3005: "판매 개수가 소진되어<br>더 이상 구매할 수 없습니다.",
        4007: "본 채널의 이용권을 이미 구독 중입니다.",
        4008: "본 이용권에 설정된 초대 가능 멤버 수를<br>초과하였습니다.",
        4010: "지금은 등록 가능한 기간이 아닙니다.<br>구독 해지가 완료된 이후<br>다시 구독하여 이용해 주시기 바랍니다.",
        4016: "본 채널의 이용권을 이미 구독 중입니다.",
        4021: "결제에 실패하였습니다<br>결제 수단 확인 후 다시 이용해주세요.",
        4022: "결제에 실패하였습니다.<br>정상적인 결제를 위해<br>5분 후 다시 시도 해주세요.",
        4501: "초대 유효 기간이 지났습니다.",
        6002: "현재 이 상품을 구매하실 수 없습니다.<br>자세한 사유는 판매자에게 문의해 주세요.",
        6003: "현재 이 상품을 구독하실 수 없습니다.<br>자세한 사유는 판매자에게 문의해 주세요.",
        6004: "단체 회원 계정으로 이용하실 수 없습니다.",
        8004: "쿠폰 등록이 불가능합니다. 유효기간을 확인하거나 판매자에게 문의해주세요.",
        8005: "쿠폰 지급 횟수를 초과했습니다. 판매자에게 문의해 주세요.",
        8008: "쿠폰 등록을 5회 실패하여 등록이 불가능합니다. 고객센터로 문의해주세요.",
        8009: "이미 지급 완료된 쿠폰으로 등록이 불가능합니다. 다른 쿠폰 코드를 입력하시거나 판매자에게 문의해주세요.",
        8010: "유효하지 않은 쿠폰번호입니다.",
        8013: "안전한 결제를 위해 결제예정일 당일에는 쿠폰 선택이 불가합니다."
    };
    e.exports = {
        getMessage: function(e) {
            return e ? n[e] : null
        }
    }
}
, function(e, t, n) {
    var i = n(12)
      , o = n(15)
      , r = n(0)
      , a = n(1)
      , s = n(9)
      , c = n(16)
      , u = n(3)
      , l = n(4)
      , d = window.__htVodOption ? window.__htVodOption.SERVICE_CODE : ""
      , h = {}
      , f = ""
      , p = !1
      , m = {}
      , _ = {}
      , v = ""
      , E = {
        prev: {},
        next: {}
    }
      , g = "VOD_UPNEXT"
      , T = ""
      , N = "1"
      , y = "2"
      , O = [.5, .75, 1, 1.25, 1.5, 1.75, 2]
      , I = {
        muted: !1,
        volume: .7
    }
      , C = {}
      , w = $("#_VIDEO_AREA")
      , b = $("#_VIDEO_AREA_WRAP")
      , S = $("._VOD_PLAYER_WRAP")
      , x = $("._VOD_CONTINUOUS_PLAY_BTN")
      , A = $("._VIEWER_VIDEO_PLAYER_PAYWALL")
      , P = $("._PLAYLIST_NEXT_ITEM_STATUS")
      , R = $("._VIEWER_PLAYER_CLOSE_BTN")
      , M = $("._VIDEO_AUTOPLAY_FALSE");
    function D() {
        f = S.data("video-id") || "",
        m[f] = S.data("video-playtime") || 0;
        var e = S.data("inkey") || "", t = S.data("trailer-url") || "", n = S.data("cover-image-url") || "", i = S.data("is-membership") || false, o = isProduction === true ? "real" : "dev", c = {
            videoTracks: [{
                src: t
            }],
            poster: n
        }, l, g = document.querySelector("#_VIDEO_AREA");
        if (a.isMobile()) {
            h = playerMobile.PrismMobilePlayer.upgrade(g);
            l = new playerMobile.DataProvider(c)
        } else {
            h = playerPC.PrismPCPlayer.upgrade(g);
            l = new playerPC.DataProvider(c)
        }
        if (function() {
            var e = w.height()
              , t = !0 === a.isMobile() ? 0 : e
              , n = !1;
            h.autoplay = 0 === M.length,
            h.muted = _.muted,
            h.volume = $.isNumeric(_.volume) ? _.volume : I.volume,
            h.addEventListener("loadedmetadata", function(n) {
                w = $("#_VIDEO_AREA"),
                e = w.height(),
                t = !0 === a.isMobile() ? 0 : e;
                var i = S.data("cover-image-url") || "";
                h.poster = i
            }),
            h.addEventListener("play", function(e) {
                A.length > 0 && A.hide(),
                !1 === p && function() {
                    var e = S.data("cp-name")
                      , t = S.data("sub-id")
                      , n = S.data("content-id")
                      , i = S.data("right-request-key");
                    if (i) {
                        var o = ajaxDomain + "/main/proxy/auth/channel/" + e + "/" + t + "/exhaust?contentId=" + n;
                        $.ajax({
                            url: o,
                            cache: !1,
                            method: "POST",
                            timeout: 5e3,
                            contentType: "application/json",
                            data: JSON.stringify({
                                rightRequestKey: i
                            }),
                            dataType: "json",
                            xhrFields: {
                                withCredentials: !0
                            },
                            success: function(e) {
                                0 == e.success ? r.sendErrorToNelo("[service/premium/vod] 동영상 유형 > 이용권/상품 권한 소진 응답 에러 : message = " + e.message) : p = !0
                            },
                            error: function(e, t, n) {
                                r.sendErrorToNelo("[service/premium/vod] 동영상 유형 > 이용권/상품 권한 소진 요청 에러 : message = " + e.responseJSON.message, e, t, n)
                            }
                        })
                    }
                }(),
                P.removeClass("as_stop"),
                P.show(),
                n = !0,
                u.send({
                    $this: $(this),
                    sArea: v + ".play"
                })
            }),
            h.addEventListener("pause", function(e) {
                P.addClass("as_stop"),
                n = !1,
                u.send({
                    $this: $(this),
                    sArea: v + ".pause"
                })
            }),
            h.addEventListener("ended", function(e) {
                if (L(),
                A.length > 0) {
                    A.show();
                    var t = h.querySelector("pzp-pc-fullscreen-button") || h.querySelector("pzp-fullscreen-button");
                    !0 === t.fullscreen && h.exitFullscreen(),
                    u.send({
                        $this: $(this),
                        sArea: v + ".paywallshow"
                    })
                }
                P.hide(),
                P.removeClass("as_stop"),
                n = !1
            }),
            h.addEventListener("volumechange", function(e) {
                _ = {
                    muted: h.muted,
                    volume: h.volume
                },
                s.set("vodVolume", _)
            }),
            h.addEventListener("seeked", function(e) {
                u.send({
                    $this: $(this),
                    sArea: v + ".seeked"
                }),
                L()
            }),
            h.addEventListener("error", function(e) {
                var t = ""
                  , n = ""
                  , i = "";
                h.error && (t = h.error.code,
                2 === h.error.code && h.srcObject && h.srcObject.error && (n = h.srcObject.error.code,
                i = h.srcObject.error.message)),
                C[f] || (r.sendErrorToNelo("[service/premium/vod] 동영상 유형 > 플레이어 재생 에러 : videoId = " + f + ", errorCode = " + t + ", srcErrorCode = " + n + ", srcErrorMessage = " + i),
                C[f] = !0)
            });
            var i = h.querySelector("pzp-prev-button") || h.shadowRoot.querySelector(".pzp-pc-custom-button__prev")
              , o = h.querySelector("pzp-next-button") || h.shadowRoot.querySelector(".pzp-pc-custom-button__next");
            i && i.addEventListener("click", function(e) {
                location.href = E.prev.url
            });
            o && o.addEventListener("click", function(e) {
                location.href = E.next.url
            });
            var c = h.querySelector("pzp-pc-viewmode-button");
            c && c.addEventListener("click", function() {
                c.checked = !c.checked,
                !0 === c.checked ? $("body").addClass("as_video_wide") : $("body").removeClass("as_video_wide")
            });
            var l = !0 === a.isMobile() ? "is_fixed_m" : "is_fixed_p";
            if ($(window).on("scroll", function() {
                window.scrollY <= t ? b.removeClass(l) : !0 === n && b.addClass(l)
            }),
            R.on("click", function(e) {
                b.addClass("is_fixed_disabled")
            }),
            !0 === isLogin) {
                var d = function(e) {
                    return m[e] || 0
                }(f);
                d > 0 && (h.currentTime = d);
                var g = navigator.userAgent
                  , T = /^.*iPhone.*|^.*iPod.*/.test(g);
                h.addEventListener("play", L),
                $(window).on(!0 === T ? "pagehide" : "beforeunload", L)
            }
        }(),
        !0 === i && e) {
            h.src = "vod://" + d + ":" + e + "@" + f + "?env=" + o;
            v = "chlh_playerf"
        } else if (t) {
            h.srcObject = l;
            v = "chlh_playert"
        }
        Y(),
        k()
    }
    function L() {
        if (!0 === isLogin) {
            var e = parseInt(h.currentTime);
            m[f] = e;
            var t = S.data("cp-name")
              , n = S.data("sub-id")
              , i = S.data("content-id");
            c.addUsingBeacon(c.HYPERGRAPE_INFO.VOD_PLAYTIME, {
                idPrefix: i,
                data: {
                    cpName: t + "",
                    subId: n + "",
                    contentId: i,
                    vid: f,
                    currentTime: e
                }
            })
        }
    }
    function k() {
        var e = "replay"
          , t = !1
          , n = Cookies.get(g);
        if (N !== n && y !== n || (t = !0,
        0 === A.length && (e = "upnext replay")),
        $("._VOD_CONTINUOUS_PLAY_BTN").attr("aria-pressed", t),
        $("._VOD_CONTINUOUS_PLAY_BTN").removeClass("as_clip"),
        $("._VOD_CONTINUOUS_PLAY_BTN").text("연속재생"),
        !0 === t && n === y && ($("._VOD_CONTINUOUS_PLAY_BTN").addClass("as_clip"),
        $("._VOD_CONTINUOUS_PLAY_BTN").text("반복재생")),
        h && h.querySelector) {
            (h.querySelector("pzp-mobile-layout") || h.querySelector("pzp-pc-layout")).setAttribute("feature", e);
            var i = h.querySelector("pzp-setting-playbackrate") || h.querySelector("pzp-pc-setting-playbackrate-pane");
            i.options ? i.options = O : i.playbackRates && (i.playbackRates = O)
        }
    }
    function U(e) {
        e.preventDefault();
        var t = $(this)
          , n = "false" === t.attr("aria-pressed")
          , i = t.hasClass("as_clip");
        j(!0 === n ? N : i ? T : y),
        Y(),
        k()
    }
    function j(e) {
        T === e ? Cookies.remove(g) : Cookies.set(g, e, {
            expires: 3650
        })
    }
    function Y() {
        if (0 === A.length) {
            var e = !1
              , t = {}
              , n = Cookies.get(g) === N;
            if ($.each($("._PLAYLIST_NEXT_ITEM"), function() {
                var i = $(this)
                  , o = {};
                $.each(["next", "current", "prev"], function(e, t) {
                    o[t] = {
                        subject: i.data(t + "-subject"),
                        author: i.data(t + "-author"),
                        image: i.data(t + "-image"),
                        url: i.data(t + "-url")
                    }
                }),
                t = n ? o.next : o.current,
                E.next = o.next,
                E.prev = o.prev,
                E.next && E.prev && ($("._VOD_PREV_BUTTON").show(),
                $("._VOD_NEXT_BUTTON").show()),
                t.subject && t.url && (e = !0)
            }),
            !0 === e && h && h.querySelector) {
                var i = h.querySelector("pzp-upnext") || h.querySelector("pzp-pc-upnext-endscreen");
                i.setAttribute("subject", t.subject),
                i.setAttribute("author", t.author),
                i.setAttribute("image", t.image),
                i.setAttribute("backgroundUrl", t.image),
                i.addEventListener("next", function(e) {
                    setTimeout(function() {
                        location.href = t.url
                    }, 50)
                })
            }
        }
    }
    e.exports = {
        init: function() {
            $("body").on("click", "._VOD_UPNEXT_CONTINUOUS_PLAY", function(e) {
                e.preventDefault(),
                j(N);
                var t = $(this);
                setTimeout(function() {
                    location.href = t.attr("href")
                }, 100)
            }),
            0 !== S.length && (_ = s.get("vodVolume", I),
            function() {
                var e = window.__htExternalUrl.prismplayer || {};
                e && $.cachedScript(e).done(function() {
                    D()
                }).fail(function(e, t, n) {
                    r.sendErrorToNelo("[service/premium/vod] prismPlayer 가져오던 중 에러 발생", e, t, n)
                })
            }())
        },
        initLazy: function() {
            x = $("._VOD_CONTINUOUS_PLAY_BTN"),
            P = $("._PLAYLIST_NEXT_ITEM_STATUS"),
            !0 !== x.data("processed") && (x.on("click", U),
            x.data("processed", !0)),
            Y(),
            k(),
            function() {
                var e = $("._VIDEO_PLAYLIST_ITEM[aria-current='true']");
                if (e.length > 0) {
                    var t = e.innerHeight() || 0
                      , n = e.data("index") || 0;
                    $("._VIDEO_PLAYLIST_VSCROLL_WRAP").scrollTop(n * t)
                }
            }(),
            o.updateVideoViewCount(),
            i.setScroll($("._VIDEO_PLAYLIST_SCROLL"))
        },
        setPlayerTime: function(e) {
            h && ("number" != typeof e || h.duration < e ? l.show({
                title: "잘못된 시간정보 입니다."
            }, function() {
                r.sendWarnToNelo("[service/premium/vod] 댓글 내 동영상 timestamp 이동 실패, timestamp : " + e + ", duration : " + h.duration),
                h.currentTime = 0
            }) : h.currentTime = e)
        }
    }
}
, , , , , , , , , , , , , , , , , , , , , , function(e, t, n) {
    var i = n(1);
    e.exports = {
        init: function() {
            if (unitIds.length > 0 && divIds.length > 0)
                for (var e = 0; e < divIds.length; e++)
                    gladsdk.displayAd(divIds[e]);
            ArticleAd && ArticleAd.init && ArticleAd.init(document.querySelector("._article_body"), {
                bodySelector: "._article_content",
                adSelector: "._article_ad",
                onDisplayableBodyAd: function() {
                    var e = []
                      , t = gladsdk.findAdDedupManager("article_body_dedup");
                    if (syncUnitIds.length > 0 && syncDivIds.length > 0) {
                        for (var n = 0; n < syncDivIds.length; n++)
                            e.push(gladsdk.findAdSlot(syncDivIds[n]));
                        t.displayAds(e)
                    }
                },
                onNotDisplayableBodyAd: function() {
                    if (syncUnitIdsForNonArticle.length > 0 && syncDivIdsForNonArticle.length > 0)
                        for (var e = 0; e < syncDivIdsForNonArticle.length; e++)
                            gladsdk.displayAd(syncDivIdsForNonArticle[e])
                }
            }),
            !0 === service.mnews && SearchAutoComplete && new SearchAutoComplete({
                content: document.querySelector("._SEARCH_WRAP"),
                contentToggleBtn: document.querySelector("._SEARCH_CONTENT_TOGGLE_BUTTON"),
                isMobile: i.isMobile(),
                nClickType: "newsOne"
            })
        }
    }
}
, function(e, t, n) {
    var i = n(0)
      , o = $("#spiLayer")
      , r = $("#ct");
    function a(e) {
        e.preventDefault(),
        $.each(window.closeLayer, function() {
            this.fn()
        })
    }
    e.exports = {
        init: function() {
            if (o.length) {
                r.on("click", "._SHARE_BUTTON", a);
                var e = window.__htExternalUrl.share + "?v=" + Math.floor((new Date).getTime() / 12e5)
                  , t = function() {
                    o.show(0),
                    window.__splugin = SocialPlugIn_Core(window.__htShareOption)
                }
                  , n = function(e, t, n) {
                    i.sendErrorToNelo("[external/social_plugin] 공유하기 스크립트 가져오던 중 에러 발생", e, t, n)
                };
                $.cachedScript(e).done(t).fail(function(o, r, a) {
                    i.sendWarnToNelo("[external/social_plugin] 공유하기 스크립트 가져오던 중 에러 발생", o, r, a),
                    setTimeout(function() {
                        $.cachedScript(e).done(t).fail(n)
                    }, 5e3)
                })
            }
        }
    }
}
, function(e, t, n) {
    var i = n(0)
      , o = n(1)
      , r = n(3)
      , a = n(22)
      , s = n(4)
      , c = $("._COMMENT")
      , u = $("#_COMMENT_NOTICE")
      , l = $("#_SE_VIEWER_CONTENT, ._VOD_PLAYER_WRAP")
      , d = "/article"
      , h = "/article/comment"
      , f = "entertain.naver.com"
      , p = 1e5
      , m = $.number(p - 1) + "+"
      , _ = {
        mine: {
            cookieName: "CMT_FOLLOW_MINE",
            className: "comment_follow_tutorial_layer_mine",
            text: "마음에 드는 댓글러를 팔로우하면 팔로우 댓글만 모아볼 수 있습니다.",
            nclkPrefix: "RPC.mine"
        },
        others: {
            cookieName: "CMT_FOLLOW_OTHERS",
            className: "comment_follow_tutorial_layer_others",
            text: "이 댓글러가 마음에 든다면 팔로우해보세요!",
            nclkPrefix: "RPC.others"
        }
    }
      , v = $("._MODAL_COMMENT_FOLLOW_TUTORIAL_TEMPLATE").html();
    function E(e, t, n) {
        return null == e.split(t + "=")[1] ? n : e.split(t + "=")[1].split("&")[0]
    }
    function g(e) {
        if (e.metaInfo && e.metaInfo.url) {
            var t = E(e.metaInfo.url, "oid", "")
              , n = E(e.metaInfo.url, "aid", "");
            if (t && n) {
                var i = "/article/";
                -1 != e.metaInfo.url.indexOf(f) ? i = "/entertain" + i : 1 == service.mnews && (i = "/mnews" + i),
                e.metaInfo.url = domain + i + t + "/" + n + "?lfrom=comment"
            }
        }
        e.metaInfo && e.metaInfo.imageUrl && (e.metaInfo.imageUrl = o.getTypeImageUrl(e.metaInfo.imageUrl, "nf176_128"))
    }
    function T(e) {
        if (null != e && "undefined" != e) {
            var t = e.url
              , n = e.objectId
              , i = e.commentNo;
            null != t && "" != t && (null != n && n.indexOf("event.star.") > -1 && (t = "https://m.star.naver.com/comment/redirect?objectId=" + n),
            null != i && "" != i ? (-1 != t.indexOf(d) && -1 == t.indexOf(h) && (t = t.replace(d, h)),
            t = -1 != t.indexOf("?") ? t + "&commentNo=" + i : t + "?commentNo=" + i) : -1 != t.indexOf(d) && -1 == t.indexOf(h) && (t = t.replace(d, h)),
            window.location.href = t)
        }
    }
    e.exports = {
        init: function() {
            if (window._commentCountApi && function() {
                var e = $("._COMMENT_COUNT");
                if (e.length) {
                    var t = e.attr("data-gno")
                      , n = e.attr("data-ticket")
                      , o = {
                        oid: article.officeId,
                        aid: article.articleId,
                        ticket: n,
                        gnos: t
                    };
                    $.ajax({
                        url: window._commentCountApi,
                        cache: !1,
                        method: "GET",
                        timeout: 5e3,
                        data: o,
                        success: function(e) {
                            try {
                                var t = window._commentCountApi.replace("/article/template/", "")
                                  , n = e.component[t].value
                                  , o = n.comment;
                                o >= 0 && $("._COMMENT_COUNT_VIEW").each(function() {
                                    var e = $(this);
                                    0 == o ? !1 !== e.data("zero-allow") && e.text(o) : !0 === e.data("max-limit") ? e.html(o >= p ? m : $.number(o)) : e.text($.number(o))
                                })
                            } catch (t) {
                                i.sendErrorToNelo("[external/comment] 댓글 조회 요청 응답 에러 : " + JSON.stringify(e))
                            }
                        },
                        error: function(e, t, n) {
                            i.sendErrorToNelo("[external/comment] 댓글 조회 요청 에러 : " + JSON.stringify(o), e, t, n)
                        }
                    })
                }
            }(),
            c.length) {
                var e = 1 == service.premium ? "" : "댓글"
                  , t = $("#_MODAL_COMMENT_FOLLOW_TUTORIAL");
                t.on("click", "._MODAL_COMMENT_FOLLOW_TUTORIAL_CLOSE", function() {
                    setTimeout(function() {
                        t.html(""),
                        t.hide()
                    }, 0)
                });
                var n = !1;
                if (setTimeout(function() {
                    !1 === n && i.sendErrorToNelo("[external/comment] 댓글 로딩 실패 10000ms 이내")
                }, 1e4),
                window.__htCboxOption.htEventHandler = {
                    loadList: function(t) {
                        var o = t.oJson;
                        if (o.success) {
                            if ($("#comment_count, ._COMMENT_COUNT")) {
                                var r = o.result.count[__htCboxOption.sCountType]
                                  , a = $("#comment_count, ._COMMENT_COUNT");
                                null != a && (0 == r ? (a.addClass("is_zero"),
                                a.html(e)) : (a.removeClass("is_zero"),
                                a.html(r >= p ? m : $.number(r))))
                            }
                        } else
                            i.sendErrorToNelo("[external/comment] 댓글 loadList 콜백 실패 : code = " + o.code + ", message = " + o.message);
                        n = !0
                    },
                    loadCreate: function(t) {
                        var n = t.oJson;
                        if (n.success && $("#comment_count, ._COMMENT_COUNT")) {
                            var i = n.result.count[__htCboxOption.sCountType]
                              , o = $("#comment_count, ._COMMENT_COUNT");
                            null != o && (0 == i ? o.html(e) : (o.removeClass("is_zero"),
                            o.html(i >= p ? m : $.number(i))))
                        }
                    },
                    afterRemove: function(t) {
                        var n = t.oJson;
                        if (n.success && $("#comment_count, ._COMMENT_COUNT")) {
                            var i = n.result.count[__htCboxOption.sCountType]
                              , o = n.result.count.delCommentByUser
                              , r = $("#comment_count, ._COMMENT_COUNT");
                            null != r && (0 == i ? (r.addClass("is_zero"),
                            r.html(e)) : r.html(i >= p ? m : $.number(i)));
                            var a = n.result.currentTab;
                            "list" == a ? 0 == i && $(".u_cbox_view_comment") ? $(".u_cbox_view_comment").hide() : $(".u_cbox_view_comment").show() : "deletedList" == a ? 0 == o && $(".u_cbox_view_comment") ? $(".u_cbox_view_comment").hide() : $(".u_cbox_view_comment").show() : 0 == i && 0 == o && $(".u_cbox_view_comment") && $(".u_cbox_view_comment").hide()
                        }
                    },
                    afterList: function(e) {
                        var t = e.oJson;
                        if (t.success) {
                            var n = t.result.count[__htCboxOption.sCountType]
                              , i = t.result.count.delCommentByUser
                              , o = t.result.currentTab;
                            "list" == o ? 0 == n && $(".u_cbox_view_comment") ? $(".u_cbox_view_comment").hide() : $(".u_cbox_view_comment").show() : "deletedList" == o ? 0 == i && $(".u_cbox_view_comment") ? $(".u_cbox_view_comment").hide() : $(".u_cbox_view_comment").show() : 0 == n && 0 == i && $(".u_cbox_view_comment") && $(".u_cbox_view_comment").hide()
                        }
                        if (window.location.href.indexOf("highlight=on") > -1) {
                            var r = location.search.split("commentNo=")[1].split("&")[0];
                            $(".cbox_module__comment_" + r).addClass("highlight")
                        }
                        !function(e) {
                            u.length && (c.prepend(u),
                            0 == e && u.show())
                        }("COMMENT_OFF" == t.result.exposureConfig.status)
                    },
                    afterShowUserCommentLayer: function(e) {
                        if (!0 === service.newsType) {
                            var n = e.mine
                              , i = e.followCount;
                            !0 === isLogin && i <= 2 && function(e) {
                                if ("1" !== Cookies.get(e.cookieName)) {
                                    var n = Mustache.render(v, e);
                                    t.html(n),
                                    t.show(),
                                    Cookies.set(e.cookieName, "1", {
                                        expires: 7
                                    }),
                                    r.send({
                                        $this: $(this),
                                        sArea: e.nclkPrefix + "tutshow"
                                    })
                                }
                            }(n ? _.mine : _.others)
                        }
                    }
                },
                window.__htCboxOption.sCommentNo = E(location.search, "commentNo", ""),
                window.__htCboxOption.vCommentLinkHandler = T,
                window.__htCboxOption.fCommentItemHandler = g,
                window.__htCboxOption.htErrorHandler[9999] = function(e) {
                    alert("정상적으로 처리되지 않았습니다."),
                    i.sendErrorToNelo("[external/comment] 댓글 응답 에러 발생, code: " + e.code + ", message: " + e.message)
                }
                ,
                window.__htCboxOption.htErrorHandler.onerror = function() {
                    alert("정상적으로 처리되지 않았습니다."),
                    i.sendErrorToNelo("[external/comment] 댓글 ajax 요청 에러 발생")
                }
                ,
                1 == service.premium) {
                    "VIDEO" === l.data("type") && (window.__htCboxOption.vTimestampHandler = function(e) {
                        a.setPlayerTime(e)
                    }
                    ),
                    window.__htCboxOption.fCommentItemHandler = function(e) {
                        if (!1 === e.manager && e.extension) {
                            var t = decodeURIComponent(e.extension);
                            try {
                                e.levelCode = JSON.parse(t).auth
                            } catch (e) {}
                        }
                    }
                    ;
                    var d = c.data("write-auth");
                    window.__htCboxOption.htEventHandler.beforeCreate = function(e) {
                        var t = e.htParams
                          , n = $("#_SE_VIEWER_CONTENT, ._VOD_PLAYER_WRAP, ._COMMENT_AUTHORITY")
                          , r = 1 == n.data("content-auth")
                          , a = n.data("subscription-month") || ""
                          , u = n.data("member-subscribe-type") || ""
                          , l = n.data("product-for-subscription") || !1
                          , h = n.data("product-for-sale") || !1
                          , f = c.data("user-activity-restricted") || !1;
                        if (!0 !== window.__htCboxOption.bManager && !0 === f)
                            return s.show({
                                title: "현재 이 콘텐츠에 댓글을 작성할 수 없습니다.<br>자세한 사유는 판매자에게 문의해주세요."
                            }),
                            i.sendWarnToNelo("[external/comment] 구매제한 이용자의 댓글 작성 시도 발생"),
                            o.sendLog("userActivityRestricted", {
                                category: "comment"
                            }),
                            void e.stop();
                        if (!0 !== window.__htCboxOption.bManager && "PURCHASER" === d && !1 === r)
                            return s.show({
                                title: "해당 채널은 구매자에게만 댓글쓰기를 허용하고 있습니다."
                            }),
                            i.sendWarnToNelo("[external/comment] 권한 없는 사용자의 댓글 작성 시도 발생"),
                            o.sendLog("userUnauthorized", {
                                category: "comment"
                            }),
                            void e.stop();
                        var p = "MEMBERSHIP_USER" === u ? "SG" : "SM";
                        !1 === l && !0 === h && (p = "S",
                        a = ""),
                        !0 === r && (t.extension = encodeURIComponent(JSON.stringify({
                            auth: p + a
                        })))
                    }
                    ,
                    "PURCHASER" === d && (window.__htCboxOption.htMessage.template.write_placeholder = window.__htCboxOption.htMessage.template._write_placeholder_purchaser,
                    window.__htCboxOption.htMessage.template.write_reply_placeholder = window.__htCboxOption.htMessage.template._write_placeholder_purchaser)
                }
                var h = window.__htExternalUrl.comment + "?v=" + Math.floor((new Date).getTime() / 12e5)
                  , f = function(e, t, n) {
                    $("._COMMENT_HIDE").hide(),
                    i.sendErrorToNelo("[external/comment] 댓글 스크립트 가져오던 중 에러 발생", e, t, n)
                };
                $.cachedScript(h).done().fail(function(e, t, n) {
                    i.sendWarnToNelo("[external/comment] 댓글 스크립트 가져오던 중 에러 발생", e, t, n),
                    /^40|^50/.test(e.status) && setTimeout(function() {
                        $.cachedScript(h).done().fail(f)
                    }, 5e3)
                })
            }
        }
    }
}
, function(e, t, n) {
    var i = n(0)
      , o = n(48)
      , r = n(49)
      , a = $("#ct_wrap");
    e.exports = {
        init: function() {
            if ($("#likeItCountViewDiv").length) {
                window.__htLikeOption.callback = {
                    updated: function(e) {
                        var t = e.contents.filter(function(e) {
                            return "NEWS_SUMMARY" === e.serviceId
                        })[0] || {};
                        $("._SUMMARY").length > 0 && o.init({
                            oid: article.officeId,
                            aid: article.articleId,
                            feedbackDataList: t.reactions
                        })
                    },
                    click: function(e) {
                        var t = $(e.target).parents("._reactionModule");
                        if (t.length && "NEWS_SUMMARY" === t.attr("data-sid"))
                            return !1 === isLogin || o.confirmApplyFeedback()
                    },
                    clicked: function(e) {
                        if (e && e.content && e.content.displayId && ("NEWS_MAIN" === e.content.displayId || "ENTERTAIN_MAIN" === e.content.displayId || "SPORTS_MAIN" === e.content.displayId)) {
                            if (e.content.isReacted)
                                return void r.showRecommandLayer();
                            r.showCancelLayer()
                        }
                    }
                };
                var e = window.__htExternalUrl.like + "?v=" + Math.floor((new Date).getTime() / 12e5)
                  , t = function() {
                    reaction.init(window.__htLikeOption),
                    a.on("click", "._LIKE_BUTTON", function() {
                        $.each(window.closeLayer, function() {
                            this.fn()
                        })
                    })
                }
                  , n = function(e, t, n) {
                    $("._LIKE_HIDE").hide(),
                    i.sendErrorToNelo("[external/like] 좋아요 스크립트 가져오던 중 에러 발생", e, t, n)
                };
                $.cachedScript(e).done(t).fail(function(o, r, a) {
                    i.sendWarnToNelo("[external/like] 좋아요 스크립트 가져오던 중 에러 발생", o, r, a),
                    setTimeout(function() {
                        $.cachedScript(e).done(t).fail(n)
                    }, 5e3)
                })
            }
        }
    }
}
, function(e, t, n) {
    var i = n(0)
      , o = $("._SUMMARY_LAYER")
      , r = $("._SUMMARY_CONTENT_BODY")
      , a = $("._SUMMARY_BTN")
      , s = $("._SUMMARY_DIMMED")
      , c = $("._SUMMARY_CLOSE_BTN")
      , u = $("._FEEDBACK_DONE_MESSAGE")
      , l = $("._FEEDBACK_UI")
      , d = "https://tts.news.naver.com/"
      , h = "autosummary_active"
      , f = "선택하신 의견을 반영하겠습니까?"
      , p = "자동 요약문을 불러오는데 실패했습니다."
      , m = {};
    function _(e) {
        e.preventDefault(),
        o.css("display", "none"),
        $("html").removeClass(h),
        s.hide()
    }
    function v(e) {
        e.preventDefault(),
        o.css("height", ""),
        $.ajax({
            url: d + "article/" + m.oid + "/" + m.aid + "/summary",
            cache: !1,
            method: "GET",
            dataType: "jsonp",
            jsonpCallback: "callback",
            data: "JSON",
            timeout: 5e3
        }).done(function(e) {
            1 == e.result_code ? E(e) : i.sendErrorToNelo("[service/summary] 요약 요청 응답 에러 : " + JSON.stringify(e))
        }).fail(function(e, t, n) {
            E({
                summary: p
            }),
            g(),
            i.sendErrorToNelo("[service/summary] 요약 요청 에러", e, t, n)
        })
    }
    function E(e) {
        var t = e.summary;
        void 0 !== typeof t && (r.html(t),
        e.title && r.prepend('<strong class="media_end_head_autosummary_layer_tit">' + e.title + "</strong>"),
        o.css("display", "flex"),
        $("html").addClass(h),
        s.show())
    }
    function g() {
        l.css("display", "none"),
        u.css("display", "none")
    }
    e.exports = {
        init: function(e) {
            m = e,
            $(m.feedbackDataList).filter(function(e, t) {
                return 1 == t.isReacted
            }).length ? g() : (u.css("display", "none"),
            l.css("display", "block")),
            c.on("click", _),
            a.on("click", v)
        },
        confirmApplyFeedback: function() {
            return !!confirm(f) && (u.css("display", "block"),
            l.css("display", "none"),
            !0)
        }
    }
}
, function(e, t, n) {
    var i = n(1);
    e.exports = {
        showRecommandLayer: function() {
            i.stopFadeLayer();
            var e = $("._TOMAIN_RECOMMAND_LAYER");
            e.fadeIn("fast", function() {
                e.fadeOut(2e3, "linear")
            })
        },
        showCancelLayer: function() {
            i.stopFadeLayer();
            var e = $("._TOMAIN_CANCEL_LAYER");
            e.fadeIn("fast", function() {
                e.fadeOut(2e3, "linear")
            })
        }
    }
}
, function(e, t, n) {
    var i = n(5)
      , o = {}
      , r = ["a", ".u_hsft button", "._persist_btn", "._da_banner"]
      , a = "persist_data";
    function s(e) {
        c(function() {
            var e = {}
              , t = {}
              , n = window.orientation || "";
            return $("._PERSIST_HEIGHT").each(function() {
                e[$(this).attr("data-persist")] = $(this).height()
            }),
            $("._PERSIST_META").each(function() {
                $(this).attr("data-persist-meta") && (t[$(this).attr("data-persist")] = $(this).attr("data-persist-meta"))
            }),
            {
                scrollTop: $(document).scrollTop(),
                heights: e,
                metas: t,
                orientation: n
            }
        }())
    }
    function c(e) {
        var t = o.get(a) || {};
        $.each(e, function(e, n) {
            t[e] = n
        }),
        o.set(a, t)
    }
    function u(e) {
        var t, n = o.get(a);
        return n && (t = n[e]),
        t
    }
    e.exports = {
        init: function() {
            o = new Persist("one-service"),
            r.forEach(function(e) {
                $("body").on("click", e, s)
            }),
            function() {
                var e = u("metas");
                e && $.each(e, function(e, t) {
                    var n = $("[data-persist='" + e + "']");
                    n.length && n.attr("data-persist-meta", t)
                })
            }()
        },
        set: c,
        get: u,
        restoreHeight: function() {
            if ((window.orientation || "") == (u("orientation") || "")) {
                var e = u("heights");
                e && $.each(e, function(e, t) {
                    var n = $("[data-persist='" + e + "']");
                    n.length && (n.height(t),
                    i.on(function() {
                        n.height("")
                    }))
                });
                var t = u("scrollTop");
                t && setTimeout(function() {
                    $(document).scrollTop(t)
                }, 800)
            }
        }
    }
}
, function(e, t) {
    var n = ["_MAIN_ASIDE", "_OUTSIDE_AREA"]
      , i = {}
      , o = $("._STICKY_CONTENT")
      , r = $("._STICKY_FOOTER")
      , a = $("#_LNB_PARENT_WRAP[data-scroll-fixed=true]")
      , s = a.height();
    function c(e) {
        if ("function" != typeof window.requestAnimationFrame)
            return e;
        var t = null;
        return function() {
            t && window.cancelAnimationFrame(t),
            t = window.requestAnimationFrame(function() {
                e()
            })
        }
    }
    function u() {
        $.each(n, function() {
            !function(e) {
                try {
                    var t = i[e].target
                      , n = i[e].wrapper
                      , c = o[0].getBoundingClientRect().height
                      , u = t[0].getBoundingClientRect().height
                      , l = window.innerHeight
                      , d = window.pageYOffset
                      , h = d + l
                      , f = a.length > 0 ? s : n[0].getBoundingClientRect().top + d
                      , p = l - f
                      , m = f + u
                      , _ = function(e) {
                        var t = 0;
                        if (0 === e.length)
                            return t;
                        return $.each(e, function() {
                            var e = $(this);
                            t += e[0].getBoundingClientRect().height
                        }),
                        t
                    }(r)
                      , v = document.body.scrollHeight
                      , E = v - _;
                    c > u ? u > p ? d > 0 ? (h > m ? (n.removeClass("is_fixing_at_top"),
                    n.addClass("is_fixing_at_bottom")) : n.removeClass("is_fixing_at_bottom"),
                    h > E ? n.addClass("is_stop_fixing") : n.removeClass("is_stop_fixing")) : n.removeClass("is_fixing_at_bottom") : d > 0 ? (n.removeClass("is_fixing_at_bottom"),
                    n.addClass("is_fixing_at_top"),
                    d + m > E ? n.addClass("is_stop_fixing") : n.removeClass("is_stop_fixing")) : n.removeClass("is_fixing_at_top") : (n.removeClass("is_fixing_at_top"),
                    n.removeClass("is_fixing_at_bottom"),
                    n.removeClass("is_stop_fixing"))
                } catch (e) {}
            }(this)
        })
    }
    e.exports = {
        init: function() {
            !0 === service.premium && (n = ["_CONTAINER_ASIDE"]);
            var e = !0;
            if ($.each(n, function(t, n) {
                i[n] = {
                    wrapper: $("." + n),
                    target: $("." + n + "_INNER")
                };
                var o = i[n].target;
                0 !== o.length && 0 != o.children().length || (e = !1)
            }),
            e && o && r) {
                var t = 0
                  , a = setInterval(function() {
                    c(u)(),
                    10 == ++t && clearInterval(a)
                }, 100);
                $(window).on("scroll", c(u))
            }
        }
    }
}
, , , , , function(e, t, n) {
    var i = n(4)
      , o = n(0)
      , r = n(1);
    e.exports = {
        subscribePartnerChannel: function(e, t) {
            var n = ajaxDomain + "/main/proxy/partner/" + e + "/" + t;
            $.ajax({
                url: n,
                cache: !1,
                method: "POST",
                async: !1,
                timeout: 5e3,
                xhrFields: {
                    withCredentials: !0
                },
                success: function(n) {
                    if (1 == n.success) {
                        var a = [{
                            url: ajaxDomain + "/my/subscriptions",
                            title: "MY프리미엄 바로가기",
                            description: ""
                        }];
                        !0 === r.isMobile() && a.push({
                            url: "https://m.naver.com/naverapp/?cmd=onMenu&version=6&menuCode=MYFEED",
                            title: "추천·구독 바로가기",
                            description: "방금 구독한 채널의 콘텐츠부터<br>나를 위한 새로운 추천 콘텐츠까지<br>모두 만나보세요."
                        });
                        var s = {
                            title: "구독 완료",
                            description: "구독 채널 관리는 MY프리미엄에서<br>확인하실 수 있습니다.",
                            isClose: !0,
                            isHiddenConfirm: !0,
                            popupClass: "as_partner_subscribe",
                            linkButtonList: a
                        };
                        i.show(s, function() {
                            setTimeout(function() {
                                location.replace(location.href)
                            }, 50)
                        }, function() {
                            setTimeout(function() {
                                location.replace(location.href)
                            }, 50)
                        })
                    } else
                        i.show({
                            title: "정상적으로 처리되지 않았습니다."
                        }),
                        o.sendErrorToNelo("[service/premium/home] 파트너 채널 구독 응답 에러  : message = " + n.message + ", cpName = " + e + ", subId = " + t)
                },
                error: function(n, i, r) {
                    o.sendErrorToNelo("[service/premium/home] 파트너 채널 구독 요청 에러 : cpName = " + e + ", subId = " + t, n, i, r)
                }
            })
        },
        unsubscribePartnerChannel: function(e, t, n) {
            var r = ajaxDomain + "/main/proxy/partner/" + e + "/" + t;
            i.show({
                title: "구독을 해지하시겠습니까?",
                isCancel: !0
            }, function() {
                $.ajax({
                    url: r,
                    cache: !1,
                    method: "DELETE",
                    async: !1,
                    timeout: 5e3,
                    xhrFields: {
                        withCredentials: !0
                    },
                    success: function(r) {
                        1 == r.success ? setTimeout(function() {
                            location.replace(n)
                        }, 50) : (i.show({
                            title: "정상적으로 처리되지 않았습니다."
                        }),
                        o.sendErrorToNelo("[service/premium/refund] 파트너 채널 구독 해지 응답 에러 : cpName = " + e + ", subId = " + t))
                    },
                    error: function(n, r, a) {
                        i.show({
                            title: "정상적으로 처리되지 않았습니다."
                        }),
                        o.sendErrorToNelo("[service/premium/refund] 파트너 채널 구독 해지 요청 에러 : cpName = " + e + ", subId = " + t, n, r, a)
                    }
                })
            })
        }
    }
}
, function(e, t) {
    var n, i = $("#_TOAST_WRAP"), o = $("._TOAST_TEMPLATE").html();
    e.exports = {
        show: function(e, t) {
            if (e.text) {
                var r = Mustache.render(o, e);
                t || (t = 3e3),
                n && clearTimeout(n),
                i.html(r),
                i.show(),
                n = setTimeout(function() {
                    i.hide()
                }, t)
            }
        }
    }
}
, function(e, t, n) {
    var i = n(57)
      , o = n(0)
      , r = n(4)
      , a = n(21)
      , s = $("#ct_wrap")
      , c = $("._COUPON_ALL_DOWNLOAD_BUTTON")
      , u = $("._COUPON_REDEEM_DOWNLOAD_BUTTON")
      , l = 8
      , d = [8004, 8005]
      , h = {}
      , f = {}
      , p = []
      , m = "YYYY-MM-DD HH:mm:ss"
      , _ = "YYYY.MM.DD. HH:mm";
    function v(e) {
        var t = $(this)
          , n = t.val().toUpperCase() || ""
          , i = t.attr("maxlength") || l;
        if (0 == /^[A-Z0-9+]*$/.test(n))
            return !1;
        n.length == i ? u.attr("disabled", !1) : u.attr("disabled", !0)
    }
    function E(e) {
        e.preventDefault(),
        N([$(this).data("coupon-id") || ""])
    }
    function g(e) {
        e.preventDefault(),
        N(T())
    }
    function T() {
        var e = [];
        return $.each(h, function(t, n) {
            "downloaded" !== n.status && "failed" !== n.status && e.push(t)
        }),
        e
    }
    function N(e, t, n) {
        var a, s = $.map(e, function(e) {
            return "couponIds=" + e
        }), u = ajaxDomain + "/main/proxy/coupon/download?" + s.join("&");
        if (!0 === n) {
            u = ajaxDomain + "/main/proxy/coupon/event-coupons/download";
            var l = [];
            $.each(e, function(e, t) {
                var n = f[t] || {}
                  , i = n.eventType
                  , o = n.eventData
                  , r = $.extend({}, {
                    couponId: t,
                    eventType: i
                }, o);
                l.push(r)
            }),
            a = JSON.stringify(l)
        }
        $.ajax({
            url: u,
            cache: !1,
            method: "POST",
            timeout: 5e3,
            async: !1,
            contentType: "application/json",
            data: a,
            dataType: "json",
            xhrFields: {
                withCredentials: !0
            },
            success: function(n) {
                if (!0 === n.success && !0 === Array.isArray(n.result)) {
                    var a = 0;
                    $.each(n.result, function(e, t) {
                        var n = t.coupon.id;
                        !0 === t.success ? (h[n] = {
                            status: "downloaded",
                            userUseStartYmdt: t.coupon.userUseStartYmdt,
                            userUseEndYmdt: t.coupon.userUseEndYmdt
                        },
                        a++) : -1 !== d.indexOf(t.code) && (h[n] = {
                            status: "failed"
                        })
                    }),
                    a > 0 ? !0 !== t && i.show({
                        text: "쿠폰 발급이 완료되었습니다."
                    }) : (!0 !== t && r.show({
                        title: "쿠폰을 다운로드 할 수 없습니다."
                    }),
                    o.sendErrorToNelo("[service/premium/coupon] 쿠폰 다운로드 응답 에러 : couponList = " + e.join(",") + ", response = " + JSON.stringify(n))),
                    $("._COUPON_DOWNLOAD_BUTTON").each(function() {
                        var e = $(this)
                          , t = e.closest("._COUPON_DOWNLOAD_WRAP")
                          , n = e.data("coupon-id") || ""
                          , i = h[n];
                        if ("downloaded" === i.status) {
                            if (t.addClass("is_get"),
                            t.find("._COUPON_DOWNLOADABLE_TEXT").html("발급완료"),
                            e.addClass("is_downloaded"),
                            e.removeClass("_COUPON_DOWNLOAD_BUTTON"),
                            i.userUseEndYmdt) {
                                var o = dayjs(i.userUseEndYmdt, m);
                                o.isValid() && t.find("._COUPON_DOWNLOADED_USER_USE_END_DATE").html(o.format(_) + "까지 사용 가능")
                            }
                            t.find("._COUPON_DOWNLOADED_MY_PAGE").show()
                        } else
                            "failed" === i.status && t.remove()
                    }),
                    0 === T().length && (c.attr("disabled", !0),
                    c.removeClass("_COUPON_ALL_DOWNLOAD_BUTTON"),
                    c.html("쿠폰 전체 발급 완료"))
                } else
                    !0 !== t && r.show({
                        title: "쿠폰을 다운로드 할 수 없습니다."
                    }),
                    o.sendErrorToNelo("[service/premium/coupon] 쿠폰 다운로드 응답 에러 : couponList = " + e.join(",") + ", response = " + JSON.stringify(n))
            },
            error: function(n, i, a) {
                !0 !== t && r.show({
                    title: "쿠폰을 다운로드 할 수 없습니다."
                }),
                o.sendErrorToNelo("[service/premium/coupon] 쿠폰 다운로드 요청 에러 : couponList = " + e.join(","), n, i, a)
            }
        })
    }
    function y(e) {
        e.preventDefault(),
        r.show({
            title: "판매 중단된 상품입니다."
        })
    }
    function O(e) {
        e.preventDefault();
        var t = $("._COUPON_REDEEM_CODE_INPUT").val().toUpperCase();
        t && function(e) {
            var t = ajaxDomain + "/main/proxy/coupon/download?promotionCodes=" + e;
            $.ajax({
                url: t,
                cache: !1,
                method: "POST",
                timeout: 5e3,
                async: !1,
                dataType: "json",
                xhrFields: {
                    withCredentials: !0
                },
                success: function(t) {
                    if (!0 === t.success && !0 === Array.isArray(t.result)) {
                        var n = t.result[0];
                        if (!0 === n.success)
                            r.show({
                                title: "쿠폰이 등록되었습니다."
                            }, function() {
                                setTimeout(function() {
                                    location.reload()
                                }, 50)
                            });
                        else {
                            var i = a.getMessage(n.code) || "쿠폰을 다운로드 할 수 없습니다.";
                            r.show({
                                title: i
                            })
                        }
                    } else
                        r.show({
                            title: "쿠폰을 다운로드 할 수 없습니다."
                        }),
                        o.sendErrorToNelo("[service/premium/coupon] 쿠폰 리딤 다운로드 응답 에러 : redeemCode = " + e + ", response = " + JSON.stringify(t))
                },
                error: function(t, n, i) {
                    r.show({
                        title: "쿠폰을 다운로드 할 수 없습니다."
                    }),
                    o.sendErrorToNelo("[service/premium/coupon] 쿠폰 리딤 다운로드 요청 에러 : redeemCode = " + e, t, n, i)
                }
            })
        }(t)
    }
    function I(e) {
        e.preventDefault(),
        $("._COUPON_REDEEM_CODE_INPUT").val("")
    }
    e.exports = {
        init: function() {
            $("._COUPON_DOWNLOAD_BUTTON").each(function() {
                var e = $(this)
                  , t = e.data("coupon-id") || ""
                  , n = e.data("auto-download") || !1
                  , i = e.data("event-type") || ""
                  , o = e.data("event-data") || "";
                h[t] = {},
                !0 === n && p.push(t),
                i && (f[t] = {
                    eventType: i,
                    eventData: o
                })
            }),
            s.on("click", "._COUPON_DOWNLOAD_BUTTON", E),
            s.on("click", "._COUPON_ALL_DOWNLOAD_BUTTON", g),
            s.on("click", "._STOPPED_TICKET_DETAIL", y),
            s.on("click", "._COUPON_REDEEM_DOWNLOAD_BUTTON", O),
            s.on("keyup", "._COUPON_REDEEM_CODE_INPUT", v),
            s.on("click", "._COUPON_REDEEM_RESET_BTN", I),
            p.length > 0 && N(p, !0, !0)
        },
        getDownloadableCouponList: T
    }
}
, , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , , function(e, t, n) {
    var i = n(44)
      , o = n(45)
      , r = n(46)
      , a = n(47)
      , s = n(108)
      , c = n(109)
      , u = n(110)
      , l = n(111)
      , d = n(112)
      , h = n(113)
      , f = n(114)
      , p = n(12)
      , m = n(115)
      , _ = n(14)
      , v = n(15)
      , E = n(116)
      , g = n(117)
      , T = n(118)
      , N = n(119)
      , y = n(121)
      , O = n(122)
      , I = n(58)
      , C = n(123)
      , w = n(22)
      , b = n(124)
      , S = n(3)
      , x = n(1)
      , A = n(0)
      , P = n(10)
      , R = n(50)
      , M = n(13)
      , D = n(125)
      , L = n(9)
      , k = n(8)
      , U = n(51);
    jQuery.cachedScript = function(e, t) {
        return t = $.extend(t || {}, {
            dataType: "script",
            cache: !0,
            url: e,
            timeout: 1e4
        }),
        jQuery.ajax(t)
    }
    ,
    $(window).on("load", function() {
        setTimeout(function() {
            var e = [A, i, o, R, r, a, s, c, u, l, d, h, y, O, I, f, p, m, _, v, E, g, T, N, C, S, x, P, M, D, L, k, U, w, b];
            if ($.each(e, function(t, n) {
                try {
                    n.init(),
                    t == e.length - 1 && R.restoreHeight()
                } catch (e) {
                    A.sendErrorToNelo("[entry/init] init function 실행 중 에러 발생 : " + e)
                }
            }),
            window.nclkWrap = S,
            window.home = E,
            window.vod = w,
            $(".header_wrap").length > 0) {
                var t = $(".header_wrap").offset().top;
                $(window).scroll(function() {
                    $(window).scrollTop() > t ? $(".header_wrap").addClass("is_fixed") : $(".header_wrap").removeClass("is_fixed")
                })
            }
            var n, j = "*";
            setTimeout(V, 100),
            window.addEventListener("resize", V, !1),
            $("body").on("click", "._IFRAME_RESIZE", function() {
                setTimeout(V, 100)
            });
            var Y = $("#_CHANNEL_HOME_DESC")
              , B = $("#_CHANNEL_HOME_DESC_WRAP")
              , H = $("#_CHANNEL_HOME_DESC_INNER")
              , F = $("#_CHANNEL_HOME_DESC_TOGGLE");
            function V() {
                Y.width() == H.width() ? F.show() : 0 == B.hasClass("is_active") && F.hide();
                var e = ($("#ct_wrap").outerHeight() || 0) + ($("footer").outerHeight() || 0);
                n !== e && (window.parent.postMessage({
                    type: "iframe_resize",
                    value: e
                }, j),
                n = e)
            }
            if (setInterval(V, 3e3),
            lcsResult) {
                var W = "";
                !0 === isPremiumReferer && (W = L.get("P_LAYOUT", "")),
                k.send("lcs", "layout=" + layoutName + (W ? "&previous_layout=" + W : "") + "&" + lcsResult)
            }
            L.set("P_LAYOUT", layoutName),
            $.each($("._LAZY_LOADING_TEMPLATE"), function() {
                var e = $(this)
                  , t = e.data("template")
                  , n = e.data("query")
                  , i = e.data("delay") || 0
                  , o = e.data("is-updatable-reaction-comment") || !1
                  , r = e.data("is-updatable-video-info") || !1;
                setTimeout(function() {
                    $.ajax({
                        url: ajaxDomain + "/main/template/rendered/" + t,
                        cache: !1,
                        method: "GET",
                        timeout: 5e3,
                        data: n,
                        success: function(n) {
                            var i = t.split(",")
                              , a = !1;
                            $.each(i, function(t, i) {
                                var o = n.renderedComponent[i];
                                o && (e.append(o),
                                a = !0)
                            }),
                            !0 === a && (!0 === o && ("object" == typeof reaction && reaction.instance && reaction.instance.update(),
                            v.updateCommentCount()),
                            !0 === r && (v.updateVideoViewCount(),
                            v.updateVodPlaytimeProgressbar()))
                        },
                        error: function(e, i, o) {
                            A.sendErrorToNelo("[entry/premium/init] 동적 템플릿 " + t + " 조회 요청 에러 : " + JSON.stringify(n), e, i, o)
                        }
                    })
                }, i)
            })
        }, 0)
    })
}
, function(e, t, n) {
    var i = n(0)
      , o = $("._OPENMAIN");
    e.exports = {
        init: function() {
            0 !== o.length && 1 != /napp=mysection/.test(location.href) && $.cachedScript("https://openmain.pstatic.net/js/openmain.js?20230926").done(function() {
                o.show()
            }).fail(function(e, t, n) {
                i.sendErrorToNelo("[external/openmain] 오픈메인 스크립트 가져오던 중 에러 발생", e, t, n)
            })
        }
    }
}
, function(e, t) {
    e.exports = {
        init: function() {
            var e = $("#_SE_VIEWER_CONTENT, ._VOD_PLAYER_WRAP");
            0 != e.length && !1 !== e.hasClass("_NIL_SEND") && function(e, t) {
                t = t || "ntm",
                window["ntm_" + e] = t,
                window[t] = window[t] || [],
                window[t].push({
                    "ntm.start": +new Date
                }),
                e = document.getElementsByTagName("script")[0],
                (t = document.createElement("script")).async = !0,
                t.src = "https://ntm.pstatic.net/scripts/ntm_11f85b28e425.js",
                e.parentNode.insertBefore(t, e)
            }("11f85b28e425", "ntm")
        }
    }
}
, function(e, t) {
    e.exports = {
        init: function() {
            analyticsNtmUrl && function(e, t) {
                t = t || "ntm",
                window["ntm_" + e] = t,
                window[t] = window[t] || [],
                window[t].push({
                    "ntm.start": +new Date
                }),
                e = document.getElementsByTagName("script")[0],
                (t = document.createElement("script")).async = !0,
                t.src = analyticsNtmUrl,
                e.parentNode.insertBefore(t, e)
            }("774a0c8e7c40", "ntm_premium_analytics")
        }
    }
}
, function(e, t, n) {
    var i = n(0)
      , o = n(4)
      , r = n(1)
      , a = n(21)
      , s = $("#ct")
      , c = $("._AGREEMENT")
      , u = $("._PAY_SUBSCRIPTION_COMPLETE")
      , l = {};
    function d(e) {
        var t = $(this)
          , n = t.data("check-clk") || ""
          , i = t.data("uncheck-clk") || "";
        $.each(l, function(e, n) {
            l[e] = t.is(":checked")
        }),
        !0 === t.is(":checked") ? nclkWrap.send({
            $this: t,
            sArea: n
        }) : nclkWrap.send({
            $this: t,
            sArea: i
        }),
        $.each(l, function(e, t) {
            var n = $("#" + e).closest("._AGREEMENT_WRAP");
            1 == n.is(":visible") && $("#" + e).prop("checked", t)
        })
    }
    function h(e) {
        var t = $(this)
          , n = t.data("check-clk") || ""
          , i = t.data("uncheck-clk") || ""
          , o = t.attr("id");
        l[o] = t.is(":checked"),
        !0 === t.is(":checked") ? nclkWrap.send({
            $this: t,
            sArea: n
        }) : nclkWrap.send({
            $this: t,
            sArea: i
        }),
        function() {
            var e = !0;
            $.each(l, function(t, n) {
                var i = $("#" + t).closest("._AGREEMENT_WRAP");
                0 == l[t] && i.is(":visible") && (e = !1)
            }),
            1 == e ? $("._AGREEMENT_ALL").prop("checked", !0) : $("._AGREEMENT_ALL").prop("checked", !1)
        }()
    }
    function f(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("action") || "";
        if ($("._AGREEMENT:not([data-optional=true]):not(:checked)").length > 0) {
            var s = "reserve_ticket" === n ? "구매진행 동의에 체크를 하셔야 예약이 진행됩니다." : "구매진행 동의에 체크를 하셔야 결제가 진행됩니다.";
            o.show({
                title: s
            })
        } else {
            var c = t.data("cp-name") || ""
              , u = t.data("sub-id") || ""
              , l = t.data("ticket-id") || ""
              , d = t.data("r-content-id") || ""
              , h = t.data("content-id") || ""
              , f = t.data("product-id") || ""
              , m = t.data("product-unit-id") || ""
              , _ = t.data("user-realnm") || "N"
              , v = t.data("inventory-no") || ""
              , E = $("._MARKETING_OPTION").prop("checked") || !1
              , g = $("._PREMIUM_MARKETING_OPTION").prop("checked") || !1
              , T = t.data("order-restrictions") || !1
              , N = t.data("user-activity-restricted") || !1
              , y = t.data("coupon-reserved") || !1
              , O = Cookies.get("SUBS_REFERRAL-" + c + "-" + u) || ""
              , I = ""
              , C = ""
              , w = ""
              , b = r.getPlatformType()
              , S = "PC" === b;
            if (!0 !== T) {
                if (!0 === N)
                    return o.show({
                        title: "현재 이 상품을 구매하실 수 없습니다.<br>자세한 사유는 판매자에게 문의해 주세요."
                    }),
                    i.sendWarnToNelo("[service/premium/order] 이용제한 사용자의 상품 구매 시도 발생"),
                    void r.sendLog("userActivityRestricted", {
                        category: "order"
                    });
                if ("N" != _) {
                    if ("subscribe" == n)
                        C = domain + "/" + c + "/" + u + "/subscriptions/" + l + "/payment/complete?subscribe" + (E ? "&agreeMarketing=" + E : "") + (d ? "&rContentId=" + d : "") + (g ? "&agreePremiumMarketing=" + g : ""),
                        w = ajaxDomain + "/main/proxy/user/channel/" + c + "/" + u + "/subscribe?ticketId=" + l + "&platformType=" + b + "&rurl=" + encodeURIComponent(C);
                    else if ("purchase" == n)
                        I = domain + "/" + c + "/" + u + "/contents/" + h,
                        C = domain + "/" + c + "/" + u + "/products/" + h + "/payment/complete?purchase" + (E ? "&agreeMarketing=" + E : "") + (g ? "&agreePremiumMarketing=" + g : ""),
                        w = ajaxDomain + "/main/proxy/user/channel/" + c + "/" + u + "/purchase?productId=" + f + "&productUnitId=" + m + "&platformType=" + b + "&rurl=" + encodeURIComponent(C);
                    else if ("purchase_ticket" == n)
                        C = domain + "/" + c + "/" + u + "/subscriptions/" + l + "/payment/complete?subscribe" + (E ? "&agreeMarketing=" + E : "") + (d ? "&rContentId=" + d : "") + (g ? "&agreePremiumMarketing=" + g : ""),
                        w = ajaxDomain + "/main/proxy/user/channel/" + c + "/" + u + "/purchase/ticket?ticketId=" + l + "&platformType=" + b + "&rurl=" + encodeURIComponent(C);
                    else if ("reserve_ticket" == n)
                        return void function(e, t, n) {
                            $.ajax({
                                url: e,
                                cache: !1,
                                method: "POST",
                                async: !1,
                                timeout: 5e3,
                                xhrFields: {
                                    withCredentials: !0
                                },
                                success: function(e) {
                                    if (!0 === e.success && e.result && !0 === e.result.isReserv) {
                                        var r = e.result.membershipId
                                          , a = e.result.transTicketId;
                                        r && a ? location.href = domain + "/" + t + "/" + n + "/subscriptions/" + a + "/reserve/complete?membershipId=" + r : (o.show({
                                            title: "정상적으로 처리되지 않았습니다."
                                        }),
                                        i.sendErrorToNelo("[service/premium/order] 이용권 예약 응답 에러 : message = " + e.message))
                                    } else
                                        o.show({
                                            title: "정상적으로 처리되지 않았습니다."
                                        }),
                                        i.sendErrorToNelo("[service/premium/order] 이용권 예약 응답 에러 : message = " + e.message)
                                },
                                error: function(e, t, n) {
                                    var r = "정상적으로 처리되지 않았습니다.";
                                    e.responseJSON && e.responseJSON.code && a.getMessage(e.responseJSON.code) && (r = a.getMessage(e.responseJSON.code)),
                                    o.show({
                                        title: r
                                    }),
                                    i.sendErrorToNelo("[service/premium/order] 이용권 예약 요청 에러 : message = " + e.responseJSON.message, e, t, n)
                                }
                            })
                        }(w = ajaxDomain + "/main/proxy/user/channel/" + c + "/" + u + "/subscribe-trans/reserv?ticketId=" + l, c, u);
                    v && (w = w + "&couponInventoryNo=" + v),
                    O && (w = w + "&referralId=" + O),
                    y ? o.show({
                        description: "선택하신 쿠폰은 다른 채널 정기 결제에 사용 예정인 쿠폰입니다.<br>이 쿠폰을 지금 채널 구독에 사용하시겠습니까?",
                        isCancel: !0
                    }, function() {
                        p(w, I, S)
                    }) : p(w, I, S)
                } else
                    setTimeout(function() {
                        location.href = (0 == r.isMobile() ? "https://nid.naver.com/user2/help/realNameCheck.nhn?type=2" : "https://nid.naver.com/mobile/user/help/realNameCheck.nhn?type=2") + "&rurl=" + encodeURIComponent(location.href) + "&surl=" + encodeURIComponent(location.href)
                    }, 50)
            } else
                o.show({
                    title: "신규 구독 제한",
                    description: "최근 1개월간 새로운 콘텐츠가 발행되지 않은 채널로 신규 구독이 일시적으로 제한되었습니다. 판매자에게 문의해 주세요!"
                })
        }
    }
    function p(e, t, n) {
        $.ajax({
            url: e,
            cache: !1,
            method: "POST",
            async: !1,
            timeout: 5e3,
            xhrFields: {
                withCredentials: !0
            },
            success: function(e) {
                if (1 == e.success) {
                    var t = e.result.redirectUrl;
                    setTimeout(function() {
                        if (!0 === n)
                            window.open(t, "oBillingPopup", "width=575,height=625,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no");
                        else
                            location.href = t
                    }, 50)
                } else
                    o.show({
                        title: "정상적으로 처리되지 않았습니다."
                    }),
                    i.sendErrorToNelo("[service/premium/order] 이용권/상품 구매 응답 에러 : message = " + e.message)
            },
            error: function(e, n, r) {
                var s = "정상적으로 처리되지 않았습니다.";
                e.responseJSON && e.responseJSON.code && a.getMessage(e.responseJSON.code) && (s = a.getMessage(e.responseJSON.code)),
                o.show({
                    title: s
                }, function() {
                    t && setTimeout(function() {
                        location.href = t
                    }, 50)
                }),
                i.sendErrorToNelo("[service/premium/order] 이용권/상품 구매 요청 에러 : message = " + e.responseJSON.message, e, n, r)
            }
        })
    }
    function m(e) {
        e.preventDefault();
        var t = $(this);
        !function(e, t) {
            var n = {
                contentId: e
            }
              , r = function() {
                setTimeout(function() {
                    location.href = t
                }, 50)
            }
              , a = function() {
                o.show({
                    title: "콘텐츠 열람 시 환불이 제한됩니다.<br>지금 열람하시겠습니까?",
                    isCancel: !0
                }, function() {
                    r()
                })
            };
            if (!e)
                return void a();
            $.ajax({
                url: ajaxDomain + "/main/template/SCS_PREMIUM_MY_PRODUCT",
                cache: !1,
                method: "GET",
                timeout: 5e3,
                async: !1,
                data: n,
                xhrFields: {
                    withCredentials: !0
                },
                success: function(e) {
                    var t = e.component.SCS_PAY_MY_PRODUCT.value;
                    t && t.data && !0 === t.data.isRefundable ? a() : r()
                },
                error: function(e, t, r) {
                    o.show({
                        title: "정상적으로 처리되지 않았습니다."
                    }),
                    i.sendErrorToNelo("[service/premium/order] 상품 권한 조회 요청 에러 : " + JSON.stringify(n), e, t, r)
                }
            })
        }(t.data("content-id") || "", t.data("rurl") || "")
    }
    function _(e) {
        var t = $(this)
          , n = t.data("clk") || "";
        nclkWrap.send({
            $this: t,
            sArea: n
        }),
        v(t)
    }
    function v(e) {
        var t = e.find("option:selected")
          , n = t.data("discount-price") || 0
          , i = t.data("deducted-price") || 0
          , o = t.data("inventory-no") || ""
          , r = t.data("expected-mileage-price") || 0
          , a = t.val() || ""
          , s = t.data("reserved-another-channel") || !1;
        $("._SUBSCRIPTION_DISCOUNT_PRICE").html(n),
        $("._SUBSCRIPTION_DEDUCTED_PRICE").html(i),
        $("._EXPECTED_MILEAGE_PRICE").html(r),
        $("._ORDER_APPLY_COUPON").text(a),
        o ? ($("._SUBSCRIPTION_COUPON_ELEMENT").show(),
        $("._SUBSCRIPTION_COST_PRICE").show()) : ($("._SUBSCRIPTION_COUPON_ELEMENT").hide(),
        $("._SUBSCRIPTION_COST_PRICE").hide()),
        $("._ORDER").data("inventory-no", o),
        $("._ORDER").data("coupon-reserved", s)
    }
    e.exports = {
        init: function() {
            $.each(c, function(e, t) {
                var n = $(this)
                  , i = t.id
                  , o = n.is(":checked");
                l[i] = o
            }),
            s.on("click", "._AGREEMENT_ALL", d),
            s.on("click", "._AGREEMENT", h),
            s.on("click", "._ORDER", f),
            s.on("click", "._CONTENT_END_CONFIRM", m),
            s.on("change", "#_ORDER_APPLY_COUPONS", _);
            var e = $("#_ORDER_APPLY_COUPONS");
            if (e.length > 0 && v(e),
            u.length > 0) {
                var t = u.data("cp-name") || ""
                  , n = u.data("sub-id") || "";
                Cookies.set("PAYMENT_COMPLETED_" + t + "_" + n, "1", {
                    expires: 1
                })
            }
        }
    }
}
, function(e, t, n) {
    var i = n(4)
      , o = n(0)
      , r = n(21)
      , a = n(56)
      , s = $("#ct")
      , c = $("._REFUND_REASON")
      , u = $("._MY_TICKET_CANCEL_REFUND_AGREE_TEMPLATE").html();
    function l(e) {
        e.preventDefault(),
        $("._COUPON_DOWNLOAD_BUTTON").length > 0 ? i.show({
            title: "쿠폰을 다운로드 받으세요!",
            description: "쿠폰을 다운로드 받으셔야<br>다음달 구독료가 할인됩니다."
        }) : history.back()
    }
    function d(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("content-id") || "";
        h(t.data("rurl") || "", "PRODUCT", n, "")
    }
    function h(e, t, n, r) {
        var a = ajaxDomain + "/main/proxy/my/purchase/" + t + "/" + n;
        $.ajax({
            url: a,
            cache: !1,
            method: "DELETE",
            timeout: 5e3,
            async: !1,
            contentType: "application/json",
            data: JSON.stringify({
                reason: r
            }),
            dataType: "json",
            xhrFields: {
                withCredentials: !0
            },
            success: function(t) {
                1 == t.success ? i.show({
                    title: "환불 신청 완료",
                    description: "결제 취소 내역은 <em>영업일 기준 3일</em> 이후 <br>해당 금융기관 또는 통신사를 통해 <br>확인할 수 있습니다."
                }, function() {
                    setTimeout(function() {
                        location.href = e
                    }, 50)
                }) : (i.show({
                    title: "정상적으로 처리되지 않았습니다."
                }),
                o.sendErrorToNelo("[service/premium/refund] 상품 환불 응답 에러 : contentId = " + contentId + ", message = " + t.message))
            },
            error: function(e, t, n) {
                i.show({
                    title: "정상적으로 처리되지 않았습니다."
                }),
                o.sendErrorToNelo("[service/premium/refund] 상품 환불 요청 에러 : contentId = " + contentId + ", message = " + e.responseJSON.message, e, t, n)
            }
        })
    }
    function f(e) {
        var t = $(this)
          , n = $("._REFUND_REASON_ETC_INPUT");
        t.hasClass("_REFUND_REASON_ETC") ? n.attr("disabled", !1) : n.attr("disabled", !0)
    }
    function p(e) {
        e.preventDefault();
        var t = "해지 사유를 선택해주세요."
          , n = "";
        if ($.each(c, function() {
            var e = $(this)
              , i = e.data("target-id") || "";
            if (e.is(":checked"))
                return n = e.data("reason"),
                i && (n = $("#" + i).val().trim()),
                void (1 == e.hasClass("_REFUND_REASON_ETC") && (t = "해지 사유를 입력해주세요."))
        }),
        "" != n) {
            var o = $(this)
              , r = o.data("has-ticket-coupon-for-existing-purchase-user") || !1
              , a = o.data("membership-id") || ""
              , s = o.data("ticket-id") || ""
              , u = o.data("rurl") || ""
              , l = o.data("ticket-refund-type") || "";
            "NORMAL" !== (o.data("ticket-sale-type") || "") ? !0 === r ? i.show({
                title: "다음 정기결제일에 사용 가능한 쿠폰이 있습니다. 구독 해지시 해당 쿠폰은 사용할 수 없습니다.<br>구독 해지하시겠습니까?",
                isCancel: !0
            }, function() {
                m(a, s, u, l, n)
            }) : m(a, s, u, l, n) : h(u, "TICKET", s, n)
        } else
            i.show({
                title: t
            })
    }
    function m(e, t, n, r, a) {
        var s = ajaxDomain + "/main/proxy/my/membership/" + e + "/unsubscribe/" + t;
        "TERMINATE" == r ? s += "/stop" : "DAY_REFUND" == r && (s += "/dayRefund"),
        $.ajax({
            url: s,
            cache: !1,
            method: "DELETE",
            timeout: 5e3,
            async: !1,
            contentType: "application/json",
            data: JSON.stringify({
                reason: a
            }),
            dataType: "json",
            xhrFields: {
                withCredentials: !0
            },
            success: function(e) {
                1 == e.success ? "REFUND" == r ? i.show({
                    title: "환불 신청 완료",
                    description: "결제 취소 내역은 <em>영업일 기준 3일</em> 이후 <br>해당 금융기관 또는 통신사를 통해 <br>확인할 수 있습니다."
                }, function() {
                    setTimeout(function() {
                        location.replace(n)
                    }, 50)
                }) : i.show({
                    title: "정기 결제 해지 완료",
                    description: "종료 예정일까지 이용 가능하며 다음부터 정기결제가 진행되지 않습니다.<br>(이미 다음 이용 회차 결제가 일어난 경우 자동으로 환불처리 됩니다.)"
                }, function() {
                    setTimeout(function() {
                        location.replace(n)
                    }, 50)
                }) : (i.show({
                    title: "정상적으로 처리되지 않았습니다."
                }),
                o.sendErrorToNelo("[service/premium/refund] 이용권 환불 응답 에러 : message = " + e.message))
            },
            error: function(e, t, n) {
                i.show({
                    title: "정상적으로 처리되지 않았습니다."
                }),
                o.sendErrorToNelo("[service/premium/refund] 이용권 환불 요청 에러 : message = " + e.responseJSON.message, e, t, n)
            }
        })
    }
    function _(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("membership-id") || ""
          , o = t.data("ticket-id") || ""
          , r = t.data("rurl") || ""
          , a = t.data("change-sale-start-md") || ""
          , s = t.data("change-price") || "";
        if (a && s) {
            var c = {
                ticketPriceChangeSaleStartMdText: a,
                changePriceText: s
            };
            i.show({
                title: "가격 인상 안내",
                description: Mustache.render(u, c),
                isCancel: !0
            }, function() {
                v(n, o, r)
            })
        } else
            v(n, o, r)
    }
    function v(e, t, n) {
        var a = ajaxDomain + "/main/proxy/my/membership/" + e + "/unsubscribe/" + t + "/stopCancel";
        $.ajax({
            url: a,
            cache: !1,
            method: "POST",
            async: !1,
            timeout: 5e3,
            dataType: "json",
            xhrFields: {
                withCredentials: !0
            },
            success: function(e) {
                1 == e.success ? i.show({
                    title: "정기결제가 다시 등록되었습니다."
                }, function() {
                    setTimeout(function() {
                        location.href = n
                    }, 50)
                }) : (i.show({
                    title: "정상적으로 처리되지 않았습니다."
                }),
                o.sendErrorToNelo("[service/premium/refund] 이용권 정기결제 다시 등록 응답 에러 : message = " + e.message))
            },
            error: function(e, t, n) {
                var a = "정상적으로 처리되지 않았습니다.";
                e.responseJSON && e.responseJSON.code && r.getMessage(e.responseJSON.code) && (a = r.getMessage(e.responseJSON.code)),
                i.show({
                    title: a
                }),
                o.sendErrorToNelo("[service/premium/refund] 이용권 정기결제 다시 등록 요청 에러 : message = " + e.responseJSON.message, e, t, n)
            }
        })
    }
    function E(e) {
        e.preventDefault();
        var t = $(this).data("rurl");
        i.show({
            title: "프로모션 해지",
            description: "프로모션 상품은 구독 해지만 가능합니다.<br>해지 후에는 첫 달 무료 혜택을<br>다시 받을 수 없습니다.",
            isCancel: !0
        }, function() {
            setTimeout(function() {
                location.href = t
            }, 50)
        })
    }
    function g(e) {
        e.preventDefault();
        var t = $(this).data("rurl");
        i.show({
            title: "구독 해지 시 구독 상품 변경 예약도 함께 취소됩니다.<br><br>계속하시겠습니까?",
            isCancel: !0
        }, function() {
            setTimeout(function() {
                location.href = t
            }, 50)
        })
    }
    function T(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("auto-refund")
          , o = t.data("usage-end-date");
        1 == n && i.show({
            title: "운영 중단 예정인 상품으로<br>" + o + "까지 이용 후 자동<br>해지됩니다."
        })
    }
    function N(e) {
        var t = $(this)
          , n = t.data("membership-id") || ""
          , r = t.data("ticket-id") || ""
          , a = t.data("rurl")
          , s = ajaxDomain + "/main/proxy/my/subscribe/" + n + "/delay/" + r + "/stop";
        i.show({
            title: "구독을 해지하시겠습니까?",
            isCancel: !0
        }, function() {
            $.ajax({
                url: s,
                cache: !1,
                method: "DELETE",
                async: !1,
                timeout: 5e3,
                xhrFields: {
                    withCredentials: !0
                },
                success: function(e) {
                    1 == e.success ? setTimeout(function() {
                        location.href = a
                    }, 50) : (i.show({
                        title: "정상적으로 처리되지 않았습니다."
                    }),
                    o.sendErrorToNelo("[service/premium/refund] 결제 지연 상태 구독 해지 응답 에러 : membershipId = " + n))
                },
                error: function(e, t, r) {
                    i.show({
                        title: "정상적으로 처리되지 않았습니다."
                    }),
                    o.sendErrorToNelo("[service/premium/refund] 결제 지연 상태 구독 해지 요청 에러 : membershipId = " + n, e, t, r)
                }
            })
        })
    }
    function y(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("cp-name") || ""
          , i = t.data("sub-id") || ""
          , o = t.data("rurl") || "";
        a.unsubscribePartnerChannel(n, i, o)
    }
    e.exports = {
        init: function() {
            s.on("click", "._REFUND", d),
            s.on("click", "._REFUND_REASON", f),
            s.on("click", "._MY_SUBSCRIPTION_REFUND", p),
            s.on("click", "._MY_SUBSCRIPTION_REFUND_CANCEL", _),
            s.on("click", "._MY_SUBSCRIPTION_REFUND_EVENT", E),
            s.on("click", "._MY_SUBSCRIPTION_RESERVE_CANCEL_AND_REFUND", g),
            s.on("click", "._MY_SUBSCRIPTION_REFUND_APPLY", T),
            s.on("click", "._MY_SUBSCRIPTION_REFUND_PAY_DELAY_APPLY", N),
            s.on("click", "._MY_SUBSCRIPTION_REFUND_DISSUADE_EVENT", l),
            s.on("click", "._MY_SUBSCRIPTION_PARTNER_UNSUBSCRIBE", y)
        }
    }
}
, function(e, t, n) {
    var i = n(0)
      , o = n(4)
      , r = n(1)
      , a = n(21)
      , s = $("#ct")
      , c = $("#_PRODUCT_INVITE_HEAD");
    function u(e) {
        e.preventDefault();
        var t = $(this).data("membership-id")
          , n = ajaxDomain + "/main/proxy/my/membership/" + t + "/inviteToken";
        $.ajax({
            url: n,
            cache: !1,
            method: "POST",
            async: !1,
            timeout: 5e3,
            xhrFields: {
                withCredentials: !0
            },
            success: function(e) {
                if (1 == e.success) {
                    var n = e.result.data.cpName
                      , r = e.result.data.subId
                      , a = e.result.data.ticketId
                      , s = e.result.data.token
                      , c = domain + "/" + n + "/" + r + "/subscriptions/" + a + "/invitation?tokenId=" + s;
                    $("._SUBSCRIPTIONS_INVITATION_SHARE").attr({
                        "data-url": c,
                        "data-mail-url": c + "&lfrom=mail",
                        "data-blog-url": c + "&lfrom=blog",
                        "data-cafe-url": c + "&lfrom=cafe",
                        "data-calendar-url": c + "&lfrom=calendar",
                        "data-band-url": c + "&lfrom=band",
                        "data-line-url": c + "&lfrom=line",
                        "data-kakaotalk-url": c + "&lfrom=kakao",
                        "data-facebook-url": c + "&lfrom=facebook",
                        "data-twitter-url": c + "&lfrom=twitter",
                        "data-mypeople-url": c + "&lfrom=mypeople",
                        "data-friend-url": c + "&lfrom=friend"
                    }),
                    $("._SUBSCRIPTIONS_INVITATION_SHARE").trigger("click")
                } else
                    o.show({
                        title: "정상적으로 처리되지 않았습니다."
                    }),
                    i.sendErrorToNelo("[service/premium/member] 멤버 초대장 발행 응답 에러 : membershipId = " + t)
            },
            error: function(e, n, r) {
                o.show({
                    title: "정상적으로 처리되지 않았습니다."
                }),
                i.sendErrorToNelo("[service/premium/member] 멤버 초대장 발행 요청 에러 : membershipId = " + t, e, n, r)
            }
        })
    }
    function l(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("membership-id")
          , r = t.data("member-id")
          , a = ajaxDomain + "/main/proxy/my/membership/" + n + "/member/" + r;
        o.show({
            title: "선택한 멤버의 이용권을 회수하고<br>그룹 멤버에서 제외하시겠습니까?",
            isCancel: !0
        }, function() {
            $.ajax({
                url: a,
                cache: !1,
                method: "DELETE",
                async: !1,
                timeout: 5e3,
                xhrFields: {
                    withCredentials: !0
                },
                success: function(e) {
                    1 == e.success ? location.reload() : (o.show({
                        title: "정상적으로 처리되지 않았습니다."
                    }),
                    i.sendErrorToNelo("[service/premium/member] 멤버 제외 요청 응답 에러 : membershipId = " + n + ", memberId = " + r + ", message = " + e.message))
                },
                error: function(e, t, a) {
                    o.show({
                        title: "정상적으로 처리되지 않았습니다."
                    }),
                    i.sendErrorToNelo("[service/premium/member] 멤버 제외 요청 에러 : membershipId = " + n + ", memberId = " + r + ", message = " + e.responseJSON.message, e, t, a)
                }
            })
        })
    }
    function d(e) {
        if (e.preventDefault(),
        $("._AGREEMENT:not([data-optional=true]):not(:checked)").length > 0)
            o.show({
                title: "동의에 체크를 하셔야 구독이 완료됩니다."
            });
        else {
            var t = $(this)
              , n = t.data("cp-name")
              , s = t.data("sub-id")
              , c = t.data("ticket-id")
              , u = t.data("token-id")
              , l = t.data("user-realnm") || "N"
              , d = t.data("user-activity-restricted") || !1
              , h = $("._MARKETING_OPTION").prop("checked") || !1
              , f = $("._PREMIUM_MARKETING_OPTION").prop("checked") || !1;
            if (!0 === d)
                return o.show({
                    title: "현재 이 상품을 구독하실 수 없습니다.<br>자세한 사유는 판매자에게 문의해 주세요."
                }),
                i.sendWarnToNelo("[service/premium/member] 이용제한 사용자의 초대장 상품 구독 시도 발생"),
                void r.sendLog("userActivityRestricted", {
                    category: "invitation"
                });
            if ("N" != l) {
                var p = ajaxDomain + "/main/proxy/my/inviteToken/" + u;
                $.ajax({
                    url: p,
                    cache: !1,
                    method: "POST",
                    async: !1,
                    timeout: 5e3,
                    xhrFields: {
                        withCredentials: !0
                    },
                    success: function(e) {
                        1 == e.success ? setTimeout(function() {
                            location.href = urlPrefix + "/" + n + "/" + s + "/subscriptions/" + c + "/invitation/complete?tokenId=" + u + (h ? "&agreeMarketing=" + h : "") + (f ? "&agreePremiumMarketing=" + f : "")
                        }, 50) : (o.show({
                            title: "이용권을<br>구독할 수 없습니다."
                        }),
                        i.sendErrorToNelo("[service/premium/member] 멤버 추가 응답 에러 : tokenId = " + u + ", message = " + e.message))
                    },
                    error: function(e, t, n) {
                        var r = "";
                        e.responseJSON && e.responseJSON.code && a.getMessage(e.responseJSON.code) && (r = a.getMessage(e.responseJSON.code)),
                        o.show({
                            title: "이용권을<br>구독할 수 없습니다.",
                            description: r
                        }),
                        i.sendErrorToNelo("[service/premium/member] 멤버 추가 요청 에러 : tokenId = " + u + ", message = " + e.responseJSON.message, e, t, n)
                    }
                })
            } else
                setTimeout(function() {
                    location.href = (0 == r.isMobile() ? "https://nid.naver.com/user2/help/realNameCheck.nhn?type=2" : "https://nid.naver.com/mobile/user/help/realNameCheck.nhn?type=2") + "&rurl=" + encodeURIComponent(location.href) + "&surl=" + encodeURIComponent(location.href)
                }, 50)
        }
    }
    function h(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("rurl") || ""
          , r = t.data("membership-id")
          , a = ajaxDomain + "/main/proxy/my/membership/" + r;
        o.show({
            description: "구독 해지 시 멤버십 전용 콘텐츠<br>열람이 불가합니다.<br>해지하시겠습니까?",
            isCancel: !0
        }, function() {
            $.ajax({
                url: a,
                cache: !1,
                method: "DELETE",
                async: !1,
                timeout: 5e3,
                xhrFields: {
                    withCredentials: !0
                },
                success: function(e) {
                    1 == e.success ? setTimeout(function() {
                        location.href = n
                    }, 50) : (o.show({
                        title: "정상적으로 처리되지 않았습니다."
                    }),
                    i.sendErrorToNelo("[service/premium/member] 멤버 탈퇴 응답 에러 : membershipId = " + r + ", message = " + e.message))
                },
                error: function(e, t, n) {
                    o.show({
                        title: "정상적으로 처리되지 않았습니다."
                    }),
                    i.sendErrorToNelo("[service/premium/member] 멤버 탈퇴 요청 에러 : membershipId = " + r + ", message = " + e.responseJSON.message, e, t, n)
                }
            })
        })
    }
    e.exports = {
        init: function() {
            0 !== c.length && function() {
                var e = $("._SUBSCRIPTIONS_GROUP_INVITATION_APPROVE")
                  , t = e.data("token-id") || ""
                  , n = ajaxDomain + "/main/proxy/my/inviteToken/" + t + "/check"
                  , r = e.data("cp-name")
                  , s = e.data("sub-id")
                  , c = domain + "/" + r + "/" + s;
                $.ajax({
                    url: n,
                    cache: !1,
                    method: "GET",
                    timeout: 5e3,
                    xhrFields: {
                        withCredentials: !0
                    },
                    error: function(e, n, r) {
                        if (e.responseJSON && e.responseJSON.code) {
                            var s = a.getMessage(e.responseJSON.code) || "";
                            o.show({
                                title: "이용권을<br>구독할 수 없습니다.",
                                description: s
                            }, function() {
                                setTimeout(function() {
                                    location.href = c
                                }, 50)
                            })
                        }
                        i.sendErrorToNelo("[service/premium/member] 멤버 초대장 유효성 검증 에러 : inviteToken = " + t, e, n, r)
                    }
                })
            }(),
            s.on("click", "._SUBSCRIPTIONS_INVITATION", u),
            s.on("click", "._SUBSCRIPTIONS_GROUP_REMOVE", l),
            s.on("click", "._SUBSCRIPTIONS_GROUP_INVITATION_APPROVE", d),
            s.on("click", "._SUBSCRIPTIONS_GROUP_LEAVE", h)
        }
    }
}
, function(e, t, n) {
    n(7);
    var i = n(5)
      , o = n(19)
      , r = n(1);
    e.exports = {
        init: function() {
            $("._FLICKING_WRAP").each(function(e, t) {
                var n = $(t)
                  , a = !0;
                n.attr("data-is-circular") && (a = n.data("is-circular"));
                var s = !0;
                n.attr("data-is-height") && (s = n.data("is-height"));
                var c = 100;
                n.attr("data-flicking-duration") && (c = n.data("flicking-duration"));
                var u = o.init(t, {
                    circular: a
                })
                  , l = n.find("._FLICKING_PREV")
                  , d = n.find("._FLICKING_NEXT")
                  , h = n.find("._FLICKING")
                  , f = n.find("._FLICKING_PANEL");
                function p(e) {
                    if (e) {
                        var t = f.children().first().outerHeight();
                        h.css("height", t)
                    }
                }
                if (l.on("click", function(e) {
                    e.preventDefault(),
                    u.prev(c)
                }),
                d.on("click", function(e) {
                    e.preventDefault(),
                    u.next(c)
                }),
                p(s),
                !0 === r.isMobile() ? i.on(function() {
                    p(s)
                }) : $(window).resize(function() {
                    p(s)
                }),
                !1 === r.isMobile() && (l.show(),
                d.show(),
                u.disableInput()),
                1 === h.data("length") && u.disableInput(),
                !0 === h.data("auto-flicking")) {
                    var m = h.data("auto-flicking-timeout") || 3e3
                      , _ = setInterval(function() {
                        u.next(c)
                    }, m);
                    u.on("flickEnd", function(e) {
                        clearTimeout(_),
                        _ = setInterval(function() {
                            u.next(c)
                        }, m)
                    })
                }
                "undefined" != typeof TEvent && t.addEventListener("touchstart", function(e) {
                    TEvent.touchStartEvent()
                }, !1)
            })
        }
    }
}
, function(e, t) {
    e.exports = {
        init: function() {
            $("._ROLLING_WRAP").each(function(e, t) {
                var n = $(t)
                  , i = n.data("interval") || 3e3
                  , o = $("._ROLLING", n)
                  , r = 0
                  , a = o.length;
                setInterval(function() {
                    a === ++r && (r = 0),
                    $.each(o, function(e) {
                        var t = $(this);
                        e == r ? t.show() : t.hide()
                    })
                }, i)
            })
        }
    }
}
, function(e, t, n) {
    n(12);
    var i = n(15)
      , o = (n(10),
    n(0))
      , r = n(4)
      , a = n(1)
      , s = n(56)
      , c = n(16)
      , u = n(9)
      , l = n(8)
      , d = $("#ct_wrap")
      , h = $("._AGREEMENT_OPTIONAL")
      , f = $("._MARKETING_INFORM")
      , p = $("._MARKETING_INFORM[data-enabled=true]")
      , m = $("._MARKETING_INFORM[data-enabled=false]")
      , _ = $("._PREMIUM_MARKETING_INFORM")
      , v = $("._PREMIUM_MARKETING_INFORM[data-enabled=true]")
      , E = $("._PREMIUM_MARKETING_INFORM[data-enabled=false]")
      , g = $("#_HOME_SUBSCRIPTION_CONTAINER")
      , T = $("._HOME_SUBSCRIPTION_CHANNEL")
      , N = $("._HOME_SUBSCRIPTION_CONTENT_AREA")
      , y = 30;
    function O(e) {
        e.preventDefault(),
        function(e) {
            r.show({
                description: "해당 콘텐츠를 최근 본 콘텐츠 목록에서 삭제하시겠습니까?",
                isCancel: !0,
                confirmMessage: "확인"
            }, function() {
                c.add(c.HYPERGRAPE_INFO.DELETE_VISITED, {
                    idPrefix: e
                }, function() {
                    setTimeout(function() {
                        location.reload()
                    }, 50)
                })
            })
        }($(this).data("content-id") || "")
    }
    function I(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("idx") || 0
          , i = t.data("length");
        $("._PROMOTION_LIST").hide(),
        n = (n + 1) % i,
        $("._PROMOTION_LIST[data-idx=" + n + "]").show(),
        t.data("idx", n)
    }
    function C(e) {
        e.preventDefault();
        var t = $(this);
        T.attr("aria-selected", !1),
        t.attr("aria-selected", !0);
        var n = t.data();
        w(n.cpName, n.subId)
    }
    function w(e, t) {
        var n = $("._HOME_SUBSCRIPTION_CONTENT_AREA[data-channel-key=" + e + "-" + t + "]");
        if (!(n.length <= 0)) {
            var r = n.find("ul")
              , a = n.find("._HOME_SUBSCRIPTION_ERROR_SHOW")
              , s = {
                cpName: e,
                subId: t
            };
            $.ajax({
                url: ajaxDomain + "/main/template/SCS_PREMIUM_HOME_SUBSCRIPTION_CONTENT_LIST",
                cache: !1,
                method: "GET",
                timeout: 5e3,
                data: s,
                xhrFields: {
                    withCredentials: !0
                },
                success: function(e) {
                    try {
                        a.hide(),
                        r.empty(),
                        r.append(e.renderedComponent.SCS_PREMIUM_HOME_SUBSCRIPTION_CONTENT_LIST),
                        "object" == typeof reaction && reaction.instance && reaction.instance.update(),
                        i.updateCommentCount(),
                        i.updateVideoViewCount(),
                        r.show(),
                        e.renderedComponent.SCS_PREMIUM_HOME_SUBSCRIPTION_CONTENT_LIST || (r.hide(),
                        a.show())
                    } catch (t) {
                        r.hide(),
                        a.show(),
                        o.sendErrorToNelo("[service/premium/home] 구독채널 개인화영역 응답 에러 : " + JSON.stringify(e))
                    }
                },
                error: function(e, t, n) {
                    r.hide(),
                    a.show(),
                    o.sendErrorToNelo("[service/premium/home] 구독채널 개인화영역 요청 에러 : " + JSON.stringify(s), e, t, n)
                },
                complete: function() {
                    N.hide(),
                    n.show()
                }
            })
        }
    }
    function b(e) {
        if (e.preventDefault(),
        0 != isLogin) {
            var t = $(this)
              , n = t.data("cp-name") || ""
              , i = t.data("sub-id") || "";
            s.subscribePartnerChannel(n, i)
        } else
            a.login()
    }
    e.exports = {
        init: function() {
            if (d.on("click", "._HOME_SUBSCRIPTION_CHANNEL", C),
            d.on("click", "._PROMOTION_ROLLING_BUTTON", I),
            d.on("click", "._PARTNER_CHANNEL_SUBSCRIBE_BUTTON", b),
            d.on("click", "._DELETE_VISITED_CONTENT", O),
            (f.length > 0 || _.length > 0) && !0 === isLogin && function() {
                var e = f.data("cp-name")
                  , t = f.data("sub-id")
                  , n = {
                    cpName: e,
                    subId: t
                };
                $.ajax({
                    url: ajaxDomain + "/main/template/SCS_PREMIUM_MY_NOTIFICATION_MARKETING",
                    cache: !1,
                    method: "GET",
                    timeout: 5e3,
                    data: n,
                    xhrFields: {
                        withCredentials: !0
                    },
                    success: function(e) {
                        try {
                            var t = e.component.SCS_PAY_MARKETING_NOTIFICATION_CONFIG.value
                              , n = t.isAlerted;
                            n ? (p.show(),
                            m.hide()) : (p.hide(),
                            m.show(),
                            h.show());
                            var i = e.component.SCS_PAY_PREMIUM_MARKETING_NOTIFICATION_CONFIG.value
                              , r = i.isAlerted;
                            r ? (v.show(),
                            E.hide()) : (v.hide(),
                            E.show(),
                            h.show())
                        } catch (t) {
                            o.sendErrorToNelo("[service/premium/home] 프리미엄 및 채널 마케팅 알림 설정 여부 응답 에러 : " + JSON.stringify(e))
                        }
                    },
                    error: function(e, t, i) {
                        o.sendErrorToNelo("[service/premium/home] 프리미엄 및 채널 마케팅 알림 설정 여부 요청 에러 : " + JSON.stringify(n), e, t, i)
                    }
                })
            }(),
            g.length > 0 && T.length > 0) {
                var e = T.first().data();
                w(e.cpName, e.subId)
            }
            var t = $("._TEMPLATE[data-template-id=SCS_PREMIUM_CHANNEL_HOME_COMMON]");
            if ("home" === layoutName) {
                var n = "PAYMENT_COMPLETED_" + (t.data("cpName") || "") + "_" + (t.data("subId") || "");
                !0 === a.isMobile() && Cookies.get(n) && (r.show({
                    description: "구독한 채널의 콘텐츠부터<br>나를 위한 새로운 추천 콘텐츠까지<br>추천·구독에서 모두 만나보세요.",
                    isClose: !0,
                    popupClass: "as_premium_subscribe",
                    confirmMessage: "추천 · 구독 바로가기"
                }, function() {
                    setTimeout(function() {
                        location.href = "https://m.naver.com/naverapp/?cmd=onMenu&version=6&menuCode=MYFEED"
                    }, 50)
                }),
                Cookies.remove(n))
            }
        },
        initGenderChart: function() {
            var e = window.__htExternalUrl.billboard
              , t = [];
            $("._GENDER").each(function() {
                var e = $(this)
                  , n = [e.data("id"), e.data("percent")];
                t.push(n)
            }),
            $.cachedScript(e).done(function() {
                bb.generate({
                    bindto: $("#_CHANNEL_HOME_PROFILE_SUBSCRIBER_GENDER")[0],
                    size: {
                        width: 130,
                        height: 130
                    },
                    padding: !1,
                    data: {
                        type: "donut",
                        columns: t,
                        colors: {
                            male: "#6687bb",
                            female: "#e89393"
                        }
                    },
                    donut: {
                        width: 18,
                        label: {
                            show: !0,
                            ratio: .4,
                            threshold: 0,
                            format: $.proxy(function(e, t) {
                                return Math.round(100 * t) + "%"
                            }, this)
                        },
                        padAngle: .05
                    },
                    legend: {
                        show: !1
                    },
                    interaction: {
                        enabled: !1
                    }
                })
            }).fail(function(e, t, n) {
                $("._GENDER").hide(),
                o.sendErrorToNelo("[service/premium/home] 빌보드 스크립트 가져오던 중 에러 발생", e, t, n)
            })
        },
        showEventCouponModal: function() {
            var e = $("._COUPON_EVENT_MODAL_WRAP")
              , t = $("._COUPON_EVENT_MODAL")
              , n = $("#_LAYER_DIMMED")
              , i = t.data("coupon-id") || ""
              , o = t.data("coupon-no") || ""
              , r = i + "-" + o;
            if ("" !== i && "" !== o) {
                var a = u.get("COUPON_CONFIRM", []);
                if (!(a.indexOf(r) > -1)) {
                    a.push(r),
                    a = a.slice(Math.max(a.length - y, 0)),
                    u.set("COUPON_CONFIRM", a),
                    t.on("click", "._MODAL_CANCEL", function() {
                        t.off(),
                        setTimeout(function() {
                            e.html("")
                        }, 0),
                        n.hide(),
                        $("html").removeClass("is_stop_scroll")
                    }),
                    t.show(),
                    n.show(),
                    $("html").addClass("is_stop_scroll");
                    var s = {
                        type: "eventCouponModal",
                        coupon_id: i,
                        coupon_no: o
                    };
                    l.send("event", s)
                }
            }
        }
    }
}
, function(e, t, n) {
    var i = n(8)
      , o = n(9)
      , r = n(0)
      , a = $("#_SEARCH_INPUT")
      , s = $("#_SEARCH_RESET_BTN")
      , c = a.closest("._SEARCH_INPUT_WRAP")
      , u = $("._SEARCH_RESULT_LIST")
      , l = $("._CLEAR_SEARCH_HISTORY_BTN")
      , d = $("._AUTO_SAVE_BUTTON")
      , h = $("._AUTO_SAVE_BUTTON[data-enable=true]")
      , f = $("._AUTO_SAVE_BUTTON[data-enable=false]")
      , p = $("#_SEARCH_HISTORY_LIST_WRAP")
      , m = $("._SEARCH_HISTORY_AREA")
      , _ = $("._CLOSE_SEARCH_HISTORY_BTN")
      , v = $("._SEARCH_RESULT_AREA")
      , E = $("._TOP_SEARCH_KEYWORD")
      , g = $("._SEARCH_HISTORY_LIST").html()
      , T = "SEARCH_HISTORY"
      , N = 10
      , y = {}
      , O = {
        data: [],
        autoSave: !0
    };
    function I(e) {
        m.show(),
        E.show(),
        v.hide()
    }
    function C(e) {
        e.preventDefault(),
        m.hide(),
        E.hide(),
        v.show()
    }
    function w(e) {
        e.preventDefault();
        var t = $(this).data("keyword") + "";
        setTimeout(function() {
            !function(e) {
                D(e),
                k()
            }(t),
            L()
        }, 0)
    }
    function b(e) {
        e.preventDefault(),
        P($(this).data("keyword") + "", a.data("url"))
    }
    function S(e) {
        var t = a.val();
        t && 0 !== t.trim().length ? (c.removeClass("non_searching"),
        "Enter" === e.key && P(a.val(), a.data("url"))) : c.addClass("non_searching")
    }
    function x(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("url")
          , i = t.data("search-value")
          , o = a.data("search-query");
        i && (o = a.val()),
        P(o += "", n)
    }
    function A(e) {
        e.preventDefault(),
        a.val(""),
        a.focus(),
        c.addClass("non_searching")
    }
    function P(e, t) {
        if (e.trim()) {
            t += (-1 === t.indexOf("?") ? "?" : "&") + "searchQuery=" + encodeURIComponent(e.trim());
            try {
                !function(e) {
                    if (!1 === y.autoSave)
                        return;
                    var t = {
                        keyword: e,
                        timestamp: Date.now(),
                        layoutName: layoutName
                    };
                    D(e),
                    y.data.length >= N && y.data.pop();
                    y.data.unshift(t),
                    k()
                }(e)
            } catch (e) {
                r.sendErrorToNelo("[service/search] createSearchHistory 에러 : " + e)
            }
            setTimeout(function() {
                location.href = t
            }, 50)
        } else
            alert("검색어를 입력해 주세요.")
    }
    function R(e) {
        e.preventDefault(),
        confirm("최근 검색어를 모두 삭제하시겠습니까?") && (y.data = [],
        k(),
        L())
    }
    function M(e) {
        e.preventDefault();
        var t = $(this).data("enable");
        confirm(t ? "최근 검색어 자동저장 기능을 사용 하시겠습니까?" : "최근 검색어 자동저장 기능을 사용 중지하시겠습니까?") && (!function(e) {
            y.autoSave = e,
            k()
        }(t),
        L())
    }
    function D(e) {
        y.data = $.grep(y.data, function(t) {
            return t.keyword !== e
        })
    }
    function L() {
        var e = p.data("nclk-prefix")
          , t = y.autoSave
          , n = y.data
          , i = Mustache.render(g, {
            keywords: n,
            autoSave: t,
            nclkPrefix: e,
            hasKeywords: n.length > 0
        });
        p.html(i),
        t ? (h.hide(),
        f.show(),
        l.show()) : (h.show(),
        f.hide(),
        l.hide())
    }
    function k() {
        !1 === U() && (y = O),
        o.set(T, y)
    }
    function U() {
        if (!1 === Array.isArray(y.data) || "boolean" != typeof y.autoSave)
            return r.sendErrorToNelo("[service/search] 검색 기록 valid 실패 : data, autoSave"),
            !1;
        var e = !0;
        return $.each(y.data, function(t, n) {
            if ("string" != typeof n.keyword || "number" != typeof n.timestamp || "string" != typeof n.layoutName)
                return e = !1,
                !1
        }),
        !1 === e && r.sendErrorToNelo("[service/search] 검색 기록 valid 실패 : keyword, timestamp, layoutName"),
        e
    }
    e.exports = {
        init: function() {
            a.on("keyup", S),
            s.on("click", A),
            l.on("click", R),
            d.on("click", M),
            a.on("focus", I),
            p.on("click", "._DELETE_SEARCH_HISTORY_BTN", w),
            p.on("click", "._SEARCH_KEYWORD_LINK", b),
            _.on("click", C),
            $("body").on("click", "._SEARCH_SUBMIT_BTN", x),
            y = o.get(T, O),
            !1 === U() && (y = O),
            function() {
                var e = {
                    type: "searchKeyword",
                    search_query: a.val(),
                    layout: layoutName
                };
                $.each(u, function() {
                    var t = $(this)
                      , n = t.data("type")
                      , i = t.data("totalCount")
                      , o = t.data("searchQuery");
                    e[n + "_search_result_count"] = i,
                    e.search_query = o
                }),
                e.search_query && i.send("event", e)
            }(),
            p.length > 0 && L()
        }
    }
}
, function(e, t, n) {
    var i = n(4)
      , o = n(0)
      , r = n(1)
      , a = n(21)
      , s = $("#ct")
      , c = $("#_TICKET_PRICE_CHANGE_AGREE_MODAL")
      , u = $("._MY_TICKET_PRICE_CHANGE_AGREE_TEMPLATE").html()
      , l = $("._TICKET_PRICE_CHANGE_AGREE_TEMPLATE").html();
    function d(e, t, n, o) {
        i.show({
            title: e,
            isCancel: t
        }, function() {
            setTimeout(function() {
                location.href = n
            }, 100)
        }, function() {
            setTimeout(function() {
                location.href = o
            }, 100)
        })
    }
    function h(e) {
        e.preventDefault();
        var t = $(this).data("membership-id")
          , n = r.getPlatformType()
          , i = "PC" === n
          , a = domain + "/my/subscriptions/" + t
          , s = ajaxDomain + "/main/proxy/my/subscribe/" + t + "/payMethodChangeUrl?platformType=" + n + "&redirectUrl=" + a;
        $.ajax({
            url: s,
            cache: !1,
            method: "GET",
            async: !1,
            timeout: 5e3,
            xhrFields: {
                withCredentials: !0
            },
            success: function(e) {
                if (1 == e.success) {
                    var n = e.result.data;
                    n ? setTimeout(function() {
                        if (!0 === i)
                            window.open(n, "oBillingPopup", "width=575,height=625,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no");
                        else
                            location.href = n
                    }, 50) : o.sendErrorToNelo("[service/premium/pay] 결제 수단 변경 응답 에러 : membershipId = " + t)
                }
            },
            error: function(e, n, i) {
                o.sendErrorToNelo("[service/premium/pay] 결제 수단 변경 요청 에러 : membershipId = " + t, e, n, i)
            }
        })
    }
    function f(e) {
        e.preventDefault();
        var t = $(this).data("membership-id")
          , n = ajaxDomain + "/main/proxy/my/subscribe/" + t + "/paynow";
        i.show({
            title: "지금 바로<br>결제하시겠습니까?",
            isCancel: !0
        }, function() {
            $.ajax({
                url: n,
                cache: !1,
                method: "POST",
                async: !1,
                timeout: 5e3,
                xhrFields: {
                    withCredentials: !0
                },
                success: function(e) {
                    if (1 == e.success) {
                        var n = e.result.data.purchasePrice || "";
                        if (n) {
                            var r = $.number(n) + "원";
                            i.show({
                                title: "결제가 완료되었습니다.<br>결제 금액: " + r
                            }, function() {
                                setTimeout(function() {
                                    location.reload()
                                }, 50)
                            })
                        } else
                            o.sendErrorToNelo("[service/premium/pay] 결제 지연 상태 즉시 결제 응답 에러 : membershipId = " + t + ", purchasePrice = " + n)
                    } else
                        o.sendErrorToNelo("[service/premium/pay] 결제 지연 상태 즉시 결제 응답 에러 : membershipId = " + t)
                },
                error: function(e, n, r) {
                    var s = "정상적으로 처리되지 않았습니다.";
                    e.responseJSON && e.responseJSON.code && a.getMessage(e.responseJSON.code) && (s = a.getMessage(e.responseJSON.code)),
                    i.show({
                        title: s
                    }),
                    o.sendErrorToNelo("[service/premium/pay] 결제 지연 상태 즉시 결제 요청 에러 : membershipId = " + t, e, n, r)
                }
            })
        })
    }
    function p(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("ticket-id") || ""
          , r = t.data("membership-id") || ""
          , a = {
            ticketPriceChangeSaleStartMdText: t.data("change-sale-start-md") || "",
            changePriceText: t.data("change-price") || ""
        };
        i.show({
            title: "가격 인상 안내",
            description: Mustache.render(u, a),
            isCancel: !0
        }, function() {
            !function(e, t) {
                $.ajax({
                    url: ajaxDomain + "/main/proxy/my/membership/" + e + "/agreeTicketPriceChange/" + t,
                    cache: !1,
                    method: "POST",
                    async: !1,
                    timeout: 5e3,
                    xhrFields: {
                        withCredentials: !0
                    },
                    success: function(e) {
                        1 == e.success ? setTimeout(function() {
                            location.reload()
                        }, 50) : (i.show({
                            title: "정상적으로 처리되지 않았습니다."
                        }),
                        o.sendErrorToNelo("[service/premium/pay] MY 구독관리 가격 변경 동의 응답 에러", jqXHR, textStatus, errorThrown))
                    },
                    error: function(e, t, n) {
                        i.show({
                            title: "정상적으로 처리되지 않았습니다."
                        }),
                        o.sendErrorToNelo("[service/premium/pay] MY 구독관리 가격 변경 동의 요청 에러", e, t, n)
                    }
                })
            }(r, n)
        })
    }
    function m(e) {
        e.preventDefault(),
        1 == $(this).hasClass("is_disabled") && i.show({
            title: "안전한 결제를 위해 결제예정일 당일에는 쿠폰 선택이 불가합니다."
        })
    }
    function _(e) {
        e.preventDefault(),
        $("#_CONTENT_LAYER_NEXT_COUPON").toggle()
    }
    function v(e) {
        e.preventDefault();
        var t = $("._NEXT_COUPON_SELECT_LIST")
          , n = t.find("input[name=coupon]:checked")
          , r = t.data("reserved-inventory-no")
          , s = t.data("ticket-id")
          , c = t.data("cp-name")
          , u = t.data("sub-id");
        if ("_NEXT_COUPON_AUTO" !== n.attr("id")) {
            var l = n.data("inventory-no");
            if (l != r)
                n.data("reserved-another-channel") ? i.show({
                    description: "선택하신 쿠폰은 다른 채널 정기 결제에 사용 예정된 쿠폰입니다.<br>쿠폰 사용 채널을 변경하시겠습니까?",
                    isCancel: !0
                }, function() {
                    g(l, s, c, u)
                }) : g(l, s, c, u);
            else
                location.reload()
        } else
            r ? function(e, t, n, r) {
                $.ajax({
                    url: ajaxDomain + "/main/proxy/coupon/cancel-reserved?couponInventoryNo=" + e + "&ticketId=" + t + "&cpName=" + n + "&channelName=" + r,
                    cache: !1,
                    method: "POST",
                    async: !1,
                    timeout: 5e3,
                    xhrFields: {
                        withCredentials: !0
                    },
                    success: function(e) {
                        1 == e.success ? setTimeout(function() {
                            location.reload()
                        }, 50) : (i.show({
                            title: "정상적으로 처리되지 않았습니다."
                        }),
                        o.sendErrorToNelo("[service/premium/pay] MY 구독관리 > 다음에 사용할 쿠폰 취소 응답 에러", jqXHR, textStatus, errorThrown))
                    },
                    error: function(e, t, n) {
                        var r = "정상적으로 처리되지 않았습니다.";
                        e.responseJSON && e.responseJSON.code && a.getMessage(e.responseJSON.code) && (r = a.getMessage(e.responseJSON.code)),
                        i.show({
                            title: r
                        }),
                        o.sendErrorToNelo("[service/premium/pay] MY 구독관리 > 다음에 사용할 쿠폰 취소 요청: 결제 당일 에러", e, t, n)
                    }
                })
            }(r, s, c, u) : location.reload()
    }
    function E(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("talktalk-url") || ""
          , i = t.data("purchase-no") || ""
          , r = ajaxDomain + "/main/proxy/talktalk/inquiry/purchase/" + i;
        $.ajax({
            url: r,
            cache: !1,
            method: "POST",
            async: !1,
            timeout: 5e3,
            xhrFields: {
                withCredentials: !0
            },
            success: function(e) {
                1 == e.success ? n = e.result || n : o.sendErrorToNelo("[service/premium/pay] 톡톡 문의하기 응답 에러 : message = " + e.message),
                setTimeout(function() {
                    location.href = -1 === n.indexOf("https://") ? "https://" + n : n
                }, 50)
            },
            error: function(e, t, i) {
                o.sendErrorToNelo("[service/premium/pay] 톡톡 문의하기 요청 에러", e, t, i),
                setTimeout(function() {
                    location.href = -1 === n.indexOf("https://") ? "https://" + n : n
                }, 50)
            }
        })
    }
    function g(e, t, n, r) {
        $.ajax({
            url: ajaxDomain + "/main/proxy/coupon/reserve?couponInventoryNo=" + e + "&ticketId=" + t + "&cpName=" + n + "&channelName=" + r,
            cache: !1,
            method: "POST",
            async: !1,
            timeout: 5e3,
            xhrFields: {
                withCredentials: !0
            },
            success: function(e) {
                1 == e.success ? setTimeout(function() {
                    location.reload()
                }, 50) : (i.show({
                    title: "정상적으로 처리되지 않았습니다."
                }),
                o.sendErrorToNelo("[service/premium/pay] MY 구독관리 > 다음에 사용할 쿠폰 예약 응답 에러", jqXHR, textStatus, errorThrown))
            },
            error: function(e, t, n) {
                var r = "정상적으로 처리되지 않았습니다.";
                e.responseJSON && e.responseJSON.code && a.getMessage(e.responseJSON.code) && (r = a.getMessage(e.responseJSON.code)),
                i.show({
                    title: r
                }),
                o.sendErrorToNelo("[service/premium/pay] MY 구독관리 > 다음에 사용할 쿠폰 예약 요청: 결제 당일 에러", e, t, n)
            }
        })
    }
    function T(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("cp-name") || ""
          , r = t.data("sub-id") || ""
          , a = t.data("membership-id") || "";
        !0 !== (t.data("is-today-nextpublishdate") || !1) ? i.show({
            title: "취소 시 다음 결제 예정일에 예약한 이용권으로 결제가 진행되지 않습니다.<br><br>계속하시겠습니까?",
            isCancel: !0
        }, function() {
            !function(e, t, n) {
                var r = ajaxDomain + "/main/proxy/user/channel/" + e + "/" + t + "/subscribe-trans/cancel?membershipId=" + n;
                $.ajax({
                    url: r,
                    cache: !1,
                    method: "DELETE",
                    async: !1,
                    timeout: 5e3,
                    xhrFields: {
                        withCredentials: !0
                    },
                    success: function(e) {
                        !0 === e.success && e.result && !1 === e.result.isReserv ? location.reload() : (i.show({
                            title: "정상적으로 처리되지 않았습니다."
                        }),
                        o.sendErrorToNelo("[service/premium/pay] 이용권 예약 취소 응답 에러 : membershipId = " + n))
                    },
                    error: function(e, t, r) {
                        i.show({
                            title: "정상적으로 처리되지 않았습니다."
                        }),
                        o.sendErrorToNelo("[service/premium/pay] 이용권 예약 취소 요청 에러 : membershipId = " + n, e, t, r)
                    }
                })
            }(n, r, a)
        }) : i.show({
            title: "안전한 결제를 위해 결제예정일 당일에는 예약 취소가 불가합니다."
        })
    }
    e.exports = {
        init: function() {
            if (!1 !== isLogin) {
                c.length > 0 && function(e) {
                    var t = "PRICE_AGREE_" + e.membershipId
                      , n = {
                        saleStartYmdtText: e.saleStartYmdtText,
                        priceText: e.priceText
                    };
                    "1" !== Cookies.get(t) && (Cookies.set(t, "1", {
                        expires: 1
                    }),
                    i.show({
                        title: "가격 인상 안내",
                        description: Mustache.render(l, n),
                        confirmMessage: "동의하러가기",
                        isCancel: !0
                    }, function() {
                        location.href = e.mySubscriptionUrl
                    }))
                }({
                    membershipId: c.data("membership-id") || "",
                    priceText: c.data("price-text") || "",
                    saleStartYmdtText: c.data("sale-start-ymdt-text") || "",
                    mySubscriptionUrl: c.data("my-subscription-url") || ""
                }),
                s.on("click", "._PAY_METHOD_CHANGE", h),
                s.on("click", "._PAY_DIRECT", f),
                s.on("click", "._TICKET_PRICE_CHANGE_AGREE_BUTTON", p),
                s.on("click", "._CHANGE_NEXT_COUPON_BUTTON", m),
                s.on("click", "._NEXT_COUPON_CANCEL_BUTTON", _),
                s.on("click", "._NEXT_COUPON_CONFIRM_BUTTON", v),
                s.on("click", "._TALKTALK_INQUIRY", E),
                s.on("click", "._SUBSCRIPTION_RESERVE_CANCEL_BUTTON", T);
                var e = $("._PAY_ORDER_CONTENT");
                if (0 !== e.length) {
                    var t = e.data("cp-name") || ""
                      , n = e.data("sub-id") || ""
                      , r = e.data("ticket-id") || ""
                      , a = e.data("content-id") || ""
                      , u = e.data("ticket-sale-type") || ""
                      , g = e.data("is-price-change-notice-duration") || !1
                      , N = e.data("is-price-change-is-reserve") || !1
                      , y = {
                        cpName: t,
                        subId: n
                    };
                    r ? (y.ticketId = r,
                    y.ticketSaleType = u,
                    y.isPriceChangeNoticeDuration = g,
                    y.isPriceChangeIsReserve = N,
                    function(e) {
                        $.ajax({
                            url: ajaxDomain + "/main/template/SCS_PAY_CHANNEL_AUTHORITY",
                            cache: !1,
                            method: "GET",
                            timeout: 5e3,
                            data: e,
                            xhrFields: {
                                withCredentials: !0
                            },
                            success: function(t) {
                                var n = t.component.SCS_PAY_CHANNEL_AUTHORITY || {}
                                  , o = n.value;
                                if (o && 0 !== o.length) {
                                    var r = {}
                                      , a = ""
                                      , s = !1;
                                    if ($.each(o, function(t, n) {
                                        if (r = n,
                                        a = n.membershipId,
                                        e.ticketId === n.ticketId)
                                            return s = !0,
                                            !1
                                    }),
                                    !1 === s && "MEMBERSHIP_USER" === r.memberSubscribeType)
                                        d("현재 " + r.ticketName + " 구독 중입니다.<br>기존 이용권 해지 후 선택하신 이용권으로 변경하시겠습니까?", !0, ajaxDomain + "/my/subscriptions/" + a, ajaxDomain + "/" + e.cpName + "/" + e.subId);
                                    else if (!1 === s && "MEMBERSHIP_USER" !== r.memberSubscribeType && "CANCEL" === r.subscribeStatus) {
                                        var c = dayjs(r.subscribeEndDate);
                                        d(r.ticketName + " 구독이 " + c.format("YYYY년 MM월 DD일") + " 해지될 예정입니다. 이용기한 소진 후 구매 가능합니다.", !1, ajaxDomain + "/" + e.cpName + "/" + e.subId)
                                    } else if (!1 === s && "MEMBERSHIP_USER" !== r.memberSubscribeType && "COMPLETE" === r.subscribeStatus) {
                                        var u = r.ticketPriceChangeInfo && r.ticketPriceChangeInfo.notice || e.isPriceChangeNoticeDuration || e.isPriceChangeIsReserve
                                          , l = "NORMAL" === r.ticketSaleType || "NORMAL" === e.ticketSaleType
                                          , h = u || l
                                          , f = r.userSubscribeTransReserv || {};
                                        f.transTicketId ? e.ticketId !== f.transTicketId ? d("현재 다른 상품으로 구독 변경이 예약되어 있습니다.<br>이 상품으로 신규 구독 또는 구독 변경 예약을 진행하려면 먼저 기존 예약을 취소해주세요.", !0, ajaxDomain + "/my/subscriptions/" + a, ajaxDomain + "/" + e.cpName + "/" + e.subId) : d("현재 이 상품으로 구독 변경이 예약되어 있습니다.", !1, ajaxDomain + "/" + e.cpName + "/" + e.subId) : h ? d("현재 " + r.ticketName + " 구독 중입니다.<br>기존 이용권 해지 후 이용 가능합니다. 단 기존 이용권의 즉시 환불이 불가능한 경우, 이용기한 소진 후 변경 가능합니다.", !0, ajaxDomain + "/my/subscriptions/" + a, ajaxDomain + "/" + e.cpName + "/" + e.subId) : "subscription_reserve" !== layoutName && i.show({
                                            title: "현재 " + r.ticketName + " 구독 중입니다.<br>이 상품으로 구독 변경을 예약할 수 있습니다.<br><br>예약 시 다음 결제일부터 적용되며, 변경 이후에도 이전의 구독 이력(개월)은 계속 유지됩니다.<br>(단, 결제회차는 1회차로 초기화)<br><br>계속하시겠습니까?",
                                            isCancel: !0
                                        }, function() {
                                            var t = ajaxDomain + "/" + e.cpName + "/" + e.subId + "/subscriptions/" + e.ticketId + "/reserve";
                                            "subscription" === layoutName ? $("._PURCHASE_PRODUCT_BUTTON").attr("href", t) : "subscription_order" === layoutName && setTimeout(function() {
                                                location.href = t
                                            }, 100)
                                        }, function() {
                                            setTimeout(function() {
                                                location.href = ajaxDomain + "/" + e.cpName + "/" + e.subId
                                            }, 100)
                                        })
                                    } else
                                        "MEMBERSHIP_USER" === r.memberSubscribeType ? d("이미 구독한 상품입니다.", !1, ajaxDomain + "/" + e.cpName + "/" + e.subId) : d("이미 구매한 상품입니다.", !1, ajaxDomain + "/" + e.cpName + "/" + e.subId)
                                } else
                                    "subscription_reserve" === layoutName && (location.href = ajaxDomain + "/" + e.cpName + "/" + e.subId + "/subscriptions/" + e.ticketId)
                            },
                            error: function(t, n, i) {
                                o.sendErrorToNelo("[service/premium/pay] 채널 권한 조회 요청 에러 : " + JSON.stringify(e), t, n, i)
                            }
                        })
                    }(y)) : a && (y.contentId = a,
                    function(e) {
                        $.ajax({
                            url: ajaxDomain + "/main/template/SCS_PREMIUM_MY_PRODUCT",
                            cache: !1,
                            method: "GET",
                            timeout: 5e3,
                            data: e,
                            xhrFields: {
                                withCredentials: !0
                            },
                            success: function(t) {
                                var n = t.component.SCS_PAY_MY_PRODUCT.value;
                                if (n && e.contentId === n.data.contentId && n.data.usagePeriod) {
                                    var o = dayjs(svt)
                                      , r = dayjs(n.data.usagePeriod);
                                    if (o.isAfter(r))
                                        return;
                                    i.show({
                                        title: "이미 구매한 상품입니다.",
                                        isCancel: !1
                                    }, function() {
                                        setTimeout(function() {
                                            location.href = ajaxDomain + "/" + e.cpName + "/" + e.subId
                                        }, 100)
                                    })
                                }
                            },
                            error: function(t, n, i) {
                                o.sendErrorToNelo("[service/premium/pay] 상품 권한 조회 요청 에러 : " + JSON.stringify(e), t, n, i)
                            }
                        })
                    }(y))
                }
            }
        }
    }
}
, function(e, t, n) {
    var i = n(0)
      , o = n(1)
      , r = n(9)
      , a = n(16)
      , s = n(3)
      , c = n(120)
      , u = $("#_SE_VIEWER_CONTENT")
      , l = $("._VOD_PLAYER_WRAP")
      , d = u.length > 0 ? u : l
      , h = $("#_MP_LAYER")
      , f = $("#_SUBSCRIPTION_PROMOTION_LAYER")
      , p = $("#_SUBSCRIPTION_PROMOTION_LAYER_CLOSE")
      , m = $("._CONTENT_FONT_SIZE")
      , _ = $("#_CONTENT_INDICATOR_WRAP")
      , v = $("#_CONTENT_INDICATOR")
      , E = 0
      , g = [0, 1]
      , T = [.5, .75, 1, 1.25, 1.5, 1.75, 2]
      , N = "SUB_PR_CLOSED"
      , y = 3
      , O = window.__htVodOption ? window.__htVodOption.SERVICE_CODE : "";
    function I(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("font-size")
          , i = t.data("clk");
        s.send({
            $this: t,
            sArea: i
        }),
        C(n)
    }
    function C(e) {
        -1 === g.indexOf(e) && (e = E),
        $.each(m, function() {
            var t = $(this)
              , n = t.data("font-size");
            t.attr("disabled", e === n)
        }),
        "object" == typeof seViewer && (seViewer.changeDocFontSize(e),
        E === e ? Cookies.remove("SE_FS") : Cookies.set("SE_FS", e, {
            expires: 3650
        }))
    }
    e.exports = {
        init: function() {
            !function() {
                if (0 !== u.length) {
                    var e = u.data("isMembership")
                      , t = window.__htExternalUrl.seViewerScriptUrl;
                    if (t) {
                        var n = Agent().os.name
                          , r = function() {
                            window.seViewer = new SmartEditorViewer,
                            seViewer.bootstrap({
                                productEnv: {
                                    deviceType: !0 === o.isMobile() ? "mobile" : "desktop",
                                    viewerType: "normal",
                                    buildEnv: !0 === isProduction ? "real" : "dev"
                                },
                                serviceConfig: {
                                    serviceId: "scs",
                                    inApp: !1
                                },
                                productConfig: {
                                    language: "ko-KR",
                                    imageThumbnailType: "w1"
                                },
                                plugins: {
                                    oglink: {
                                        youtubePlay: !0
                                    },
                                    video: {
                                        serviceId: {
                                            dev: 22054,
                                            stage: 2054,
                                            real: 2054
                                        },
                                        player: {
                                            contextmenu: [{
                                                id: "help",
                                                label: "도움말"
                                            }, {
                                                id: "license",
                                                label: "라이선스"
                                            }],
                                            controls: {
                                                appLink: "android" === n || "ios" === n
                                            }
                                        }
                                    },
                                    file: {
                                        downloadTypes: !1
                                    }
                                },
                                events: {
                                    initialize: function() {},
                                    ready: function() {
                                        seViewer.onLinkResolver({
                                            img: {
                                                isStop: !0,
                                                callback: function(e, n) {
                                                    (e.src || e.link) && (e.link ? location.href = e.link : c.init(t, e.id, $("#ct")[0]))
                                                }
                                            },
                                            map: {
                                                isStop: !0,
                                                callback: function(e, t) {
                                                    var n = e.searchEngine || ""
                                                      , i = e.searchType || ""
                                                      , r = e.placeId || ""
                                                      , a = e.latitude || ""
                                                      , s = e.longitude || ""
                                                      , c = e.name || ""
                                                      , u = "";
                                                    "naver" === n ? r && "" === i ? u = !0 === o.isMobile() ? "https://m.place.naver.com/place/" + r + "/home" : "https://map.naver.com/v5/entry/place/" + r : a && s && (u = !0 === o.isMobile() ? "https://m.map.naver.com/map.nhn?lng=" + s + "&lat=" + a + "&title=" + encodeURIComponent(c) : "https://map.naver.com/v5/?lng=" + s + "&lat=" + a + "&title=" + encodeURIComponent(c)) : "google" === n && (u = "https://www.google.com/maps/search/?api=1&query=" + encodeURIComponent(c) + "&query_place_id=" + r),
                                                    u && window.open(u, "_blank")
                                                }
                                            }
                                        }),
                                        seViewer.onEventByType("v2_video", {
                                            onLoadPlayer: function(e) {
                                                var t = e.player.querySelector("pzp-setting-playbackrate") || e.player.querySelector("pzp-pc-setting-playbackrate-pane");
                                                t.options ? t.options = T : t.playbackRates && (t.playbackRates = T)
                                            },
                                            onClickContextMenu: function(e) {
                                                "help" === e.menuId ? window.open("https://help.naver.com/index.help", "_blank") : "license" === e.menuId && window.open("https://developers.naver.com/notice/compliance/", "_blank")
                                            },
                                            onClickAppLink: function(e) {
                                                const t = seViewer.getInstance(e.id).getPlayerInstance()
                                                  , i = t.currentTime || 0;
                                                "android" === n ? location.href = "intent://vod_play?masterVideoId=" + e.vid + "&serviceId=" + O + "&currentTime=" + i + "&curVideoEncodingOptionId=AUTO&watchedAdvertise=false&minAppVersion=50000#Intent;scheme=naverplayer;action=android.intent.action.VIEW;category=android.intent.category.BROWSABLE;package=com.nhn.android.naverplayer;end" : "ios" === n && (location.href = "https://ul.tv.naver.com/universal/listen.vod_play?masterVideoId=" + e.vid + "&serviceId=" + O + "&currentTime=" + i + "&curVideoEncodingOptionId=AUTO&watchedAdvertise=false&iOSMinAppVersion=2.2.25")
                                            }
                                        }),
                                        $(".se-image-resource").each(function() {
                                            var e = $(this)
                                              , t = e.attr("src") || "";
                                            if (t && 0 !== t.indexOf("http")) {
                                                var n = e.closest(".se-module-image-link")
                                                  , i = n.data("linkdata")
                                                  , o = i.src;
                                                0 !== o.indexOf("https://dthumb-phinf.pstatic.net/dthumb") && 0 !== o.indexOf("https://beta.ssl.phinf.net/dthumb") || (o += -1 === o.indexOf("?") ? "?" : "&",
                                                o += "type=origin"),
                                                n.data("org-src", o),
                                                0 !== i.src.indexOf("https://scs-phinf.pstatic.net/") && 0 !== i.src.indexOf("https://beta-scs.ssl.phinf.net/") && 0 !== i.src.indexOf("https://dthumb-phinf.pstatic.net/dthumb") && 0 !== i.src.indexOf("https://beta.ssl.phinf.net/dthumb") || (i.src += -1 === i.src.indexOf("?") ? "?" : "&",
                                                i.src += "type=w800"),
                                                e.attr("src", i.src)
                                            }
                                        }),
                                        $(".se-inline-image-resource").each(function() {
                                            var e = $(this)
                                              , t = e.attr("src") || "";
                                            if (t && 0 !== t.indexOf("http")) {
                                                var n = e.closest(".se-module-image")
                                                  , i = n.data("linkdata")
                                                  , o = i.src;
                                                0 !== o.indexOf("https://dthumb-phinf.pstatic.net/dthumb") && 0 !== o.indexOf("https://beta.ssl.phinf.net/dthumb") || (o += -1 === o.indexOf("?") ? "?" : "&",
                                                o += "type=origin"),
                                                n.data("org-src", o),
                                                0 !== i.src.indexOf("https://scs-phinf.pstatic.net/") && 0 !== i.src.indexOf("https://beta-scs.ssl.phinf.net/") && 0 !== i.src.indexOf("https://dthumb-phinf.pstatic.net/dthumb") && 0 !== i.src.indexOf("https://beta.ssl.phinf.net/dthumb") || (i.src += -1 === i.src.indexOf("?") ? "?" : "&",
                                                i.src += "type=w800"),
                                                e.attr("src", i.src)
                                            }
                                        });
                                        var t = [];
                                        $(".se-image-resource, .se-inline-image-resource").each(function() {
                                            var e = $(this)
                                              , n = e.closest(".se-module-image-link")
                                              , i = n.data("linkdata")
                                              , o = e.closest(".se-section")
                                              , r = o.find(".se-caption p span").text();
                                            i && t.push({
                                                id: i.id,
                                                itemType: "image",
                                                orgUrl: n.data("org-src"),
                                                thumbUrl: i.src,
                                                width: i.originalWidth,
                                                height: i.originalHeight,
                                                caption: {
                                                    title: document.title,
                                                    desc: r,
                                                    svcName: "프리미엄콘텐츠",
                                                    link: window.location.href
                                                }
                                            })
                                        }),
                                        "alliance_content" === layoutName && (t = []),
                                        !0 === e && $(".se-main-container .se-text-paragraph").each(function() {
                                            var e = $(this);
                                            return e.prepend('<img src="https://n2.news.naver.com/l.gif?type=content">'),
                                            !1
                                        }),
                                        u.on("click", "._CONTENT_FONT_SIZE", I);
                                        var i = parseInt(Cookies.get("SE_FS")) || 0;
                                        C(i)
                                    }
                                }
                            })
                        }
                          , a = function(e, t, n) {
                            i.sendErrorToNelo("[service/premium/content] SE 뷰어 스크립트 가져오던 중 에러 발생", e, t, n)
                        };
                        $.cachedScript(t).done(r).fail(function(e, n, o) {
                            i.sendWarnToNelo("[service/premium/content] SE 뷰어 스크립트 가져오던 중 에러 발생", e, n, o),
                            setTimeout(function() {
                                $.cachedScript(t).done(r).fail(a)
                            }, 5e3)
                        })
                    }
                }
            }(),
            function() {
                if (0 !== u.length) {
                    var e = u.data("cp-name")
                      , t = u.data("sub-id")
                      , n = u.data("content-id")
                      , o = u.data("right-request-key");
                    if (o) {
                        var r = ajaxDomain + "/main/proxy/auth/channel/" + e + "/" + t + "/exhaust?contentId=" + n;
                        $.ajax({
                            url: r,
                            cache: !1,
                            method: "POST",
                            timeout: 5e3,
                            contentType: "application/json",
                            data: JSON.stringify({
                                rightRequestKey: o
                            }),
                            dataType: "json",
                            xhrFields: {
                                withCredentials: !0
                            },
                            success: function(e) {
                                0 == e.success && i.sendErrorToNelo("[service/premium/content] 이용권/상품 권한 소진 응답 에러 : message = " + e.message)
                            },
                            error: function(e, t, n) {
                                i.sendErrorToNelo("[service/premium/content] 이용권/상품 권한 소진 요청 에러 : message = " + e.responseJSON.message, e, t, n)
                            }
                        })
                    }
                }
            }(),
            function() {
                if (!1 !== isLogin && h.length > 0) {
                    var e = h.data("cp-name")
                      , t = h.data("sub-id")
                      , n = h.data("current-meter-count")
                      , o = {
                        cpName: e + "",
                        subId: t + ""
                    };
                    !0 === h.data("enabled") && (h.show(),
                    $.ajax({
                        url: ajaxDomain + "/main/template/SCS_PREMIUM_USER_METERED_PAYWALL_EXHAUST",
                        cache: !1,
                        method: "GET",
                        timeout: 5e3,
                        data: o,
                        success: function(e) {
                            try {
                                var t = e.component.SCS_PREMIUM_USER_METERED_PAYWALL_EXHAUST.value.count;
                                t !== n && i.sendErrorToNelo("[service/premium/content] 미터드 페이월 소진 응답 에러 : " + JSON.stringify(e))
                            } catch (t) {
                                i.sendErrorToNelo("[service/premium/content] 미터드 페이월 소진 응답 에러 : " + JSON.stringify(e))
                            }
                        },
                        error: function(e, t, n) {
                            i.sendErrorToNelo("[service/premium/content] 미터드 페이월 소진 요청 에러 : " + JSON.stringify(o), e, t, n)
                        }
                    })),
                    !0 === h.data("hypergrape-enabled") && a.add(a.HYPERGRAPE_INFO.METERED_PAYWALL_UPSERT, {
                        idPrefix: e + "-" + t,
                        data: o
                    })
                }
            }(),
            function() {
                if ((0 !== u.length || 0 !== l.length) && "content" === layoutName) {
                    var e = d.data("cp-name")
                      , t = d.data("sub-id")
                      , n = d.data("content-id")
                      , i = d.data("is-updatable-fever-read")
                      , o = {
                        cpName: e,
                        subId: t,
                        contentId: n
                    }
                      , s = r.get("CONTENT_VISITED", {})[timestamp] || [];
                    s.push(o),
                    s = s.slice(Math.max(s.length - y, 0));
                    var c = {};
                    c[timestamp] = s,
                    r.set("CONTENT_VISITED", c),
                    a.add(a.HYPERGRAPE_INFO.VISITED, {
                        idPrefix: n,
                        data: {
                            cpName: e + "",
                            subId: t + "",
                            contentId: n,
                            readDatetime: dayjs(svt).format("YYYY-MM-DDTHH:mm:ss.SSS")
                        },
                        isUpdatableFeverRead: i
                    })
                }
            }(),
            function() {
                if (0 !== u.length || 0 !== l.length) {
                    var e = d.data("cp-name")
                      , t = d.data("sub-id");
                    if ("1" != Cookies.get(N) && !0 !== h.data("enabled") && 0 !== $("._PAYWALL_BUTTON[data-is-ticket=true]").length) {
                        var n = r.get("CONTENT_VISITED", {})[timestamp] || []
                          , i = [];
                        if ($.each(n, function(n, o) {
                            e === o.cpName && t === o.subId && -1 === i.indexOf(o.contentId) && i.push(o.contentId)
                        }),
                        !(i.length < y)) {
                            var o = $($("._PAYWALL_BUTTON[data-is-ticket=true]")[0])
                              , a = o.data("price") || ""
                              , c = o.data("url") || "";
                            if (a && c) {
                                c += (-1 === c.indexOf("?") ? "?" : "&") + "from=spl",
                                f.find("._SUBSCRIPTION_PROMOTION_LAYER_PRICE").html(a + "원"),
                                f.find("._SUBSCRIPTION_PROMOTION_LAYER_URL").attr("href", c),
                                f.show(),
                                setTimeout(function() {
                                    f.fadeOut(100)
                                }, 1e4),
                                Cookies.set(N, "1", {
                                    expires: .25
                                });
                                var p = {
                                    $this: f,
                                    sArea: "chlh_cont.splshow"
                                };
                                s.send(p)
                            }
                        }
                    }
                }
            }(),
            function() {
                var e = "alliance_content" === layoutName ? window.innerHeight : 0;
                if (u.length > 0 && !0 === u.hasClass("_NIL_SEND")) {
                    _.show();
                    var t = u.data("paywallRatio")
                      , n = u.data("isMembership")
                      , i = !0 === n ? 100 : t
                      , o = function() {
                        var t = u.height() + u.offset().top - e;
                        if (window.scrollY <= t) {
                            var n = i * window.scrollY / t;
                            v.attr("value", n.toFixed(2))
                        } else
                            v.attr("value", i)
                    };
                    o(),
                    $(window).on("scroll", o)
                }
            }();
            var e = o.isTouchDevice() ? "contextmenu" : "contextmenu mousedown";
            u.on(e, function(e) {
                e.preventDefault()
            }),
            0 !== u.length && $("body").on("keydown", function(e) {
                "TEXTAREA" !== e.target.tagName && (e.ctrlKey || e.metaKey) && -1 !== "cvxa".indexOf(e.key) && e.preventDefault()
            }),
            p.on("click", function(e) {
                e.preventDefault(),
                Cookies.set(N, "1", {
                    expires: 1
                })
            })
        }
    }
}
, function(e, t, n) {
    var i, o = n(0), r = !1;
    e.exports = {
        init: function(e, t, n) {
            if (0 !== e.length) {
                var a = 0;
                $.each(e, function(e, n) {
                    if (n.id === t)
                        return a = e,
                        !1
                }),
                !0 !== r ? $.cachedScript(window.__htExternalUrl.mediaViewer).done(function() {
                    (i = new window.MediaViewer.Viewer({
                        elRoot: $("body")[0],
                        elItemList: n,
                        itemData: e
                    })).open(a),
                    r = !0
                }).fail(function(e, t, n) {
                    o.sendWarnToNelo("[external/mediaViewer] 미디어뷰어 스크립트 가져오던 중 에러 발생", e, t, n)
                }) : i.open(a)
            }
        }
    }
}
, function(e, t) {
    var n = $("#ct")
      , i = $("._TICKET_LIST")
      , o = $("._PURCHASE_PRODUCT_DETAIL_LIST_WRAP");
    function r(e) {
        e.preventDefault();
        var t = $(this)
          , n = t.data("ticket-id");
        t.hasClass("_DIMMED_TICKET") || a(n)
    }
    function a(e) {
        e && (function(e) {
            i.removeClass("is_selected"),
            i.attr("data-selected", null),
            $.each(i, function(t, n) {
                var i = $(n)
                  , o = i.find("._TICKET_INPUT")
                  , r = i.data("ticket-id");
                e === r && (o.prop("checked", !0),
                i.addClass("is_selected"),
                i.attr("data-selected", !0))
            })
        }(e),
        function(e) {
            o.hide(),
            $.each(o, function(t, n) {
                var i = $(n)
                  , o = i.data("ticket-id");
                e === o && i.css("display", "block")
            })
        }(e))
    }
    e.exports = {
        init: function() {
            n.on("click", "._TICKET_LIST", r),
            a(function() {
                var e = ""
                  , t = "";
                return $.each(i, function(n, i) {
                    var o = $(i)
                      , r = o.find("._TICKET_INPUT")
                      , a = o.data("ticket-id");
                    if ("" == t && 0 == o.hasClass("_DIMMED_TICKET") && (t = a),
                    !0 === r.prop("checked"))
                        return e = a,
                        !1
                }),
                e || t
            }())
        }
    }
}
, function(e, t, n) {
    var i = n(57)
      , o = n(4)
      , r = n(0)
      , a = (n(1),
    $("#ct"))
      , s = $("._REFUND_REASON")
      , c = $("._NEWSLETTER_UNSUBSCRIBE")
      , u = $("._PAY_COMPLETE")
      , l = "YYYY-MM-DD HH:mm:ss"
      , d = "YYYY. MM. DD. HH:mm";
    function h(e) {
        if (!1 !== isLogin) {
            e.preventDefault();
            var t, n = $(this), i = n.data("cp-name"), r = n.data("sub-id"), a = n.data("on-clk") || "", s = n.data("off-clk") || "", c = n.data("enabled"), u = ajaxDomain + "/main/proxy/talkfriend/channel/Premium/" + i + "/" + r;
            c ? (t = {
                title: "소식받기를 취소하시겠습니까?",
                description: "채널이 전송하는 혜택과 소식 정보를 더 이상 받지 않게 됩니다.",
                isCancel: !0
            },
            o.show(t, function() {
                f(u, c, a, s, n)
            })) : f(u, c, a, s, n)
        }
    }
    function f(e, t, n, i, a) {
        $.ajax({
            url: e,
            cache: !1,
            method: t ? "DELETE" : "POST",
            async: !1,
            timeout: 5e3,
            xhrFields: {
                withCredentials: !0
            },
            success: function(e) {
                if (!0 === e.success) {
                    var s = e.result
                      , c = s.currentStatus;
                    if (t !== c) {
                        var u = c ? n : i;
                        if (nclkWrap.send({
                            $this: a,
                            sArea: u
                        }),
                        !0 === c) {
                            a.closest("._MARKETING_BUTTON_WRAP").children("._MARKETING_BUTTON[data-enabled=true]").show(),
                            a.closest("._MARKETING_BUTTON_WRAP").children("._MARKETING_BUTTON[data-enabled=false]").hide();
                            var h = dayjs(s.addDate, l);
                            h.isValid() ? o.show({
                                title: "채널 소식받기 알림설정이 완료되었습니다.",
                                itemList: [{
                                    key: "수신동의",
                                    value: h.format(d)
                                }, {
                                    key: "수신거부",
                                    value: "프리미엄콘텐츠 &gt; MY &gt; 소식받기 &gt; 소식받기 취소"
                                }]
                            }) : o.show({
                                title: "이미 채널 소식받기를 하고 있습니다."
                            })
                        } else {
                            a.closest("._MARKETING_BUTTON_WRAP").children("._MARKETING_BUTTON[data-enabled=false]").show(),
                            a.closest("._MARKETING_BUTTON_WRAP").children("._MARKETING_BUTTON[data-enabled=true]").hide();
                            var f = dayjs(s.deleteDate, l);
                            f.isValid() ? o.show({
                                title: "소식받기가 취소되었습니다.",
                                description: f.format(d)
                            }) : o.show({
                                title: "현재 채널 소식받기 미동의 상태입니다."
                            })
                        }
                    } else
                        o.show({
                            title: "정상적으로 처리되지 않았습니다."
                        }),
                        r.sendErrorToNelo("[service/premium/notification] MY 마케팅 알림 설정 변경 응답 에러 result = " + e.result)
                } else
                    o.show({
                        title: "정상적으로 처리되지 않았습니다."
                    }),
                    r.sendErrorToNelo("[service/premium/notification] MY 마케팅 알림 설정 변경 응답 에러 message = " + e.message)
            },
            error: function(e, t, n) {
                r.sendErrorToNelo("[service/premium/notification] MY 마케팅 알림 설정 변경 요청 에러", e, t, n)
            }
        })
    }
    function p(e) {
        if (!1 !== isLogin) {
            e.preventDefault();
            var t, n = $(this), i = n.data("on-clk") || "", r = n.data("off-clk") || "", a = "true" === n.attr("aria-pressed"), s = ajaxDomain + "/main/proxy/marketing/Premium";
            a ? (t = {
                title: "소식받기를 취소하시겠습니까?",
                description: "프리미엄콘텐츠가 전송하는 혜택과 소식 정보를 더 이상 받지 않게 됩니다.",
                isCancel: !0
            },
            o.show(t, function() {
                m(s, a, i, r, n)
            })) : m(s, a, i, r, n)
        }
    }
    function m(e, t, n, i, a) {
        $.ajax({
            url: e,
            cache: !1,
            method: t ? "DELETE" : "POST",
            async: !1,
            timeout: 5e3,
            xhrFields: {
                withCredentials: !0
            },
            success: function(e) {
                if (!0 === e.success) {
                    var s = e.result
                      , c = s.currentStatus;
                    if (t !== c) {
                        var u = c ? n : i;
                        if (nclkWrap.send({
                            $this: a,
                            sArea: u
                        }),
                        !0 === c) {
                            a.attr("aria-pressed", !0);
                            var h = dayjs(s.addDate, l);
                            h.isValid() ? o.show({
                                title: "프리미엄콘텐츠 소식받기 알림설정이 완료되었습니다.",
                                itemList: [{
                                    key: "수신동의",
                                    value: h.format(d)
                                }, {
                                    key: "수신거부",
                                    value: "프리미엄콘텐츠 &gt; MY &gt; 소식받기 &gt; 소식받기 취소"
                                }]
                            }) : o.show({
                                title: "이미 프리미엄콘텐츠 소식받기를 하고 있습니다."
                            })
                        } else {
                            a.attr("aria-pressed", !1);
                            var f = dayjs(s.deleteDate, l);
                            f.isValid() ? o.show({
                                title: "소식받기가 취소되었습니다.",
                                description: f.format(d)
                            }) : o.show({
                                title: "현재 프리미엄콘텐츠 소식받기 미동의 상태입니다."
                            })
                        }
                    } else
                        o.show({
                            title: "정상적으로 처리되지 않았습니다."
                        }),
                        r.sendErrorToNelo("[service/premium/notification] MY 프리미엄 마케팅 알림 설정 변경 응답 에러 result = " + e.result)
                } else
                    o.show({
                        title: "정상적으로 처리되지 않았습니다."
                    }),
                    r.sendErrorToNelo("[service/premium/notification] MY 프리미엄 마케팅 알림 설정 변경 응답 에러 message = " + e.message)
            },
            error: function(e, t, n) {
                r.sendErrorToNelo("[service/premium/notification] MY 마케팅 알림 설정 변경 요청 에러", e, t, n)
            }
        })
    }
    function _(e) {
        var t = $(this)
          , n = "true" == t.attr("aria-pressed")
          , a = t.data("is-newsletter")
          , s = t.data("is-content")
          , c = t.data("unsubscribe-url")
          , u = t.data("channel-name");
        !function(e) {
            var t = ajaxDomain + "/main/proxy/user/noti-info/" + e.cpName + "/" + e.subId
              , n = {};
            1 == e.isNewsletter ? n = {
                newsletterSendYn: !e.isPressed
            } : 1 == e.isContent && (n = {
                newContentsSendYn: !e.isPressed
            });
            $.ajax({
                url: t,
                cache: !1,
                method: "POST",
                async: !1,
                data: JSON.stringify(n),
                contentType: "application/json",
                timeout: 5e3,
                xhrFields: {
                    withCredentials: !0
                },
                success: function(t) {
                    if (1 == t.success) {
                        var n;
                        1 == e.isNewsletter ? n = t.result.newsletterSendYn : 1 == e.isContent && (n = t.result.newContentsSendYn);
                        var a = function(e) {
                            var t = "<em>" + e.channelName + "</em>";
                            if (1 == e.isNewsletter && 1 == e.isPressed)
                                t += " 뉴스레터 수신이 설정되었습니다.";
                            else if (1 == e.isNewsletter && 0 == e.isPressed)
                                t += " 뉴스레터 수신이 해제되었습니다.";
                            else if (1 == e.isContent && 1 == e.isPressed)
                                t += " 알림 수신이 설정되었습니다.";
                            else {
                                if (1 != e.isContent || 0 != e.isPressed)
                                    return;
                                t += " 알림 수신이 해제되었습니다."
                            }
                            return t
                        }({
                            channelName: e.channelName,
                            isNewsletter: e.isNewsletter,
                            isContent: e.isContent,
                            isPressed: n
                        });
                        if (n == !e.isPressed) {
                            var s = n ? e.onClk : e.offClk;
                            nclkWrap.send({
                                $this: e.$this,
                                sArea: s
                            }),
                            e.$this.attr("aria-pressed", n),
                            0 == n && 1 == e.isNewsletter ? setTimeout(function() {
                                location.href = e.unsubscibeUrl
                            }, 50) : i.show({
                                text: a
                            })
                        } else
                            o.show({
                                title: "정상적으로 처리되지 않았습니다."
                            }),
                            r.sendErrorToNelo("[service/premium/notification] MY 알람 / 뉴스레터 설정 변경 에러 message = " + t.message)
                    }
                },
                error: function(e, t, n) {
                    r.sendErrorToNelo("[service/premium/notification] MY 알람 / 뉴스레터 설정 변경 에러", e, t, n)
                }
            })
        }({
            cpName: t.data("cp-name"),
            subId: t.data("sub-id"),
            channelName: u,
            isNewsletter: a,
            isContent: s,
            isPressed: n,
            unsubscibeUrl: c,
            onClk: t.data("on-clk") || "",
            offClk: t.data("off-clk") || "",
            $this: t
        })
    }
    function v(e) {
        e.preventDefault();
        var t = "수신거부 사유를 선택해주세요."
          , n = "";
        if ($.each(s, function() {
            var e = $(this)
              , i = e.data("target-id") || "";
            if (e.is(":checked"))
                return n = e.data("reason"),
                i && (n = $("#" + i).val().trim()),
                void (1 == e.hasClass("_REFUND_REASON_ETC") && (t = "수신거부 사유를 입력해주세요."))
        }),
        n) {
            var i = $(this)
              , a = i.data("cp-name")
              , u = i.data("sub-id")
              , l = i.data("unsubscribe-complete-url")
              , d = ""
              , h = c.data("is-request");
            if (1 == h) {
                var f = c.data("token-id");
                d = PREMIUM_GW_DOMAIN + "/plutus-premium/noti/reject/" + f
            } else
                d = ajaxDomain + "/main/proxy/user/noti-info/" + a + "/" + u;
            $.ajax({
                url: d,
                cache: !1,
                method: "POST",
                timeout: 5e3,
                async: !1,
                contentType: "application/json",
                data: JSON.stringify({
                    newsletterSendYnText: n
                }),
                dataType: "json",
                xhrFields: {
                    withCredentials: 0 == h
                },
                success: function(e) {
                    1 == e.success ? setTimeout(function() {
                        location.replace(l)
                    }, 50) : r.sendErrorToNelo("[service/premium/notification] 뉴스레터 수신거부 사유 설정 응답 에러 : message = " + e.message)
                },
                error: function(e, t, n) {
                    o.show({
                        title: "정상적으로 처리되지 않았습니다."
                    }),
                    r.sendErrorToNelo("[service/premium/notification] 뉴스레터 수신거부 사유 설정 요청 에러 : message = " + e.responseJSON.message, e, t, n)
                }
            })
        } else
            o.show({
                title: t
            })
    }
    e.exports = {
        init: function() {
            1 == c.data("is-request") && function() {
                var e = c.data("token-id")
                  , t = PREMIUM_GW_DOMAIN + "/plutus-premium/noti/reject/" + e;
                $.ajax({
                    url: t,
                    cache: !1,
                    method: "POST",
                    timeout: 5e3,
                    async: !1,
                    data: JSON.stringify({
                        newsletterSendYn: !1
                    }),
                    contentType: "application/json",
                    dataType: "json",
                    success: function(e) {
                        1 != e.success && (o.show({
                            title: "정상적으로 처리되지 않았습니다."
                        }, function() {
                            setTimeout(function() {
                                location.href = urlPrefix + "/main/error"
                            }, 50)
                        }),
                        r.sendErrorToNelo("[service/premium/notification] 뉴스레터 수신거부 요청 실패 : message = " + e.message))
                    },
                    error: function(e, t, n) {
                        o.show({
                            title: "정상적으로 처리되지 않았습니다."
                        }, function() {
                            setTimeout(function() {
                                location.href = urlPrefix + "/main/error"
                            }, 50)
                        }),
                        r.sendErrorToNelo("[service/premium/notification] 뉴스레터 수신거부 요청 응답 실패", e, t, n)
                    }
                })
            }(),
            u.length > 0 && !0 === u.data("agree-marketing") && function() {
                var e = u.data("cp-name")
                  , t = u.data("sub-id")
                  , n = ajaxDomain + "/main/proxy/talkfriend/channel/Premium/" + e + "/" + t;
                $.ajax({
                    url: n,
                    cache: !1,
                    method: "POST",
                    async: !1,
                    timeout: 5e3,
                    xhrFields: {
                        withCredentials: !0
                    },
                    success: function(e) {
                        !0 !== e.success && r.sendErrorToNelo("[service/premium/notification] 구독/결제 완료 후, 마케팅 알림 설정 변경 응답 에러 result = " + e.result)
                    },
                    error: function(e, t, n) {
                        r.sendErrorToNelo("[service/premium/notification] 구독/결제 완료 후, 마케팅 알림 설정 변경 요청 에러", e, t, n)
                    }
                })
            }(),
            u.length > 0 && !0 === u.data("agree-premium-marketing") && function() {
                var e = ajaxDomain + "/main/proxy/marketing/Premium";
                $.ajax({
                    url: e,
                    cache: !1,
                    method: "POST",
                    async: !1,
                    timeout: 5e3,
                    xhrFields: {
                        withCredentials: !0
                    },
                    success: function(e) {
                        !0 !== e.success && r.sendErrorToNelo("[service/premium/notification] 구독/결제 완료 후, 프리미엄 마케팅 알림 설정 변경 응답 에러 result = " + e.result)
                    },
                    error: function(e, t, n) {
                        r.sendErrorToNelo("[service/premium/notification] 구독/결제 완료 후, 프리미엄 마케팅 알림 설정 변경 요청 에러", e, t, n)
                    }
                })
            }(),
            a.on("click", "._NOTIFICATION_BUTTON", _),
            a.on("click", "._NEWSLETTER_UNSUBSCRIBE", v),
            a.on("click", "._MARKETING_BUTTON", h),
            a.on("click", "._PREMIUM_MARKETING_BUTTON", p)
        }
    }
}
, function(e, t) {
    var n = $("._GRID_TEMPLATE_COLUMN")
      , i = $("._GRID_TEMPLATE_COLUMN_ASIDE")
      , o = $("._GRID_TEMPLATE_COLUMN_OUTSIDE")
      , r = $("._GRID_TEMPLATE_COLUMN_SIDEBAR");
    e.exports = {
        init: function() {
            var e = n.children();
            $.each(e, function() {
                var e = $(this);
                !0 === e.data("grid-template-column-aside") && (i.append(e),
                e.removeClass("is_hidden")),
                !0 === e.data("grid-template-column-outside") && (o.append(e),
                e.removeClass("is_hidden")),
                !0 === e.data("grid-template-column-sidebar") && (r.append(e),
                e.removeClass("is_hidden"))
            })
        }
    }
}
, function(e, t, n) {
    var i = n(58)
      , o = n(4)
      , r = "SUBS_REFERRAL"
      , a = $("#ct")
      , s = $("._REFERRAL_EVENT_COUPON");
    function c(e) {
        if (e.preventDefault(),
        i.getDownloadableCouponList().length > 0)
            o.show({
                title: "쿠폰을 다운로드 받으세요!",
                description: "쿠폰을 다운로드 받으셔야<br>신규 구독 할인 혜택을 받을 수 있습니다."
            });
        else {
            var t = $(this)
              , n = t.data("cp-name") || ""
              , a = t.data("sub-id") || ""
              , s = t.data("referral-id") || ""
              , c = r + "-" + n + "-" + a;
            Cookies.set(c, s, {
                expires: 1
            }),
            setTimeout(function() {
                location.replace(t.attr("href"))
            }, 50)
        }
    }
    e.exports = {
        init: function() {
            a.on("click", "._SUBSCRIPTION_REFERRAL_EVENT", c),
            function() {
                if (!0 === s.data("has-error")) {
                    var e = s.data("cp-name")
                      , t = s.data("sub-id");
                    o.show({
                        title: "이벤트가 유효하지 않거나 이벤트 대상자가 아닙니다.",
                        isCancel: !1
                    }, function() {
                        setTimeout(function() {
                            location.replace(ajaxDomain + "/" + e + "/" + t)
                        }, 100)
                    })
                }
            }()
        }
    }
}
, function(e, t) {
    var n = $("#ct_wrap");
    function i(e) {
        e.preventDefault(),
        function(e) {
            var t = e.closest("._REFRESH_VIEW_WRAP")
              , n = t.data("length")
              , i = ((t.data("index") || 0) + 1) % n
              , o = t.find("._REFRESH_VIEW[data-index=" + i + "]");
            setTimeout(function() {
                t.find("._REFRESH_VIEW").hide(),
                o.show()
            }, 100);
            var r = o.find("._REFRESH_IMAGE");
            $.each(r, function() {
                var e = $(this)
                  , t = e.attr("data-src");
                t && (e.attr("src", e.attr("data-src")),
                e.removeAttr("data-src"))
            }),
            t.data("index", i)
        }($(this))
    }
    e.exports = {
        init: function() {
            n.on("click", "._REFRESH_VIEW_BUTTON", i)
        }
    }
}
]);
