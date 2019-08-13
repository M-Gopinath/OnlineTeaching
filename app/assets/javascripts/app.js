/*!
 * Beagle v1.5.2
 * https://foxythemes.net
 *
 * Copyright (c) 2018 Foxy Themes
 */

var App = function() {
    "use strict";
    var e, t, o, i, a, n, r, l, s, c, d, u, p, h, f, g, m = {
            assetsPath: "",
            imgPath: "img",
            jsPath: "js",
            libsPath: "lib",
            leftSidebarSlideSpeed: 200,
            leftSidebarToggleSpeed: 300,
            enableLeftSidebar: !0,
            enableSwipe: !0,
            swipeTreshold: 100,
            scrollTop: !0,
            openRightSidebarClass: "open-right-sidebar",
            openLeftSidebarClass: "open-left-sidebar",
            disabledLeftSidebarClass: "be-left-sidebar-disabled",
            offCanvasLeftSidebarClass: "be-offcanvas-menu",
            toggleLeftSidebarButton: $(".be-toggle-left-sidebar"),
            closeRsOnClickOutside: !0,
            removeLeftSidebarClass: "be-nosidebar-left",
            collapsibleSidebarClass: "be-collapsible-sidebar",
            collapsibleSidebarCollapsedClass: "be-collapsible-sidebar-collapsed",
            openLeftSidebarOnClick: !0,
            transitionClass: "be-animate",
            openSidebarDelay: 400
        },
        b = {},
        v = {};

    function w(e) {
        var t = $("<div>", {
                class: e
            }).appendTo("body"),
            o = t.css("background-color");
        return t.remove(), o
    }

    function k(e) {
        e.update()
    }

    function y(e) {
        e.destroy()
    }

    function C(e) {
        return new PerfectScrollbar(e[0], {
            wheelPropagation: !1
        })
    }

    function S() {
        $(".be-scroller", i);
        var t = $(".be-scroller-chat", i),
            o = $(".be-scroller-todo", i),
            a = $(".be-scroller-settings", i);

        function n() {
            e.removeClass(m.openRightSidebarClass).addClass(m.transitionClass), x()
        }
        i.length > 0 && ($(".be-toggle-right-sidebar").on("click", function(t) {
            r && e.hasClass(m.openRightSidebarClass) ? n() : r || (e.addClass(m.openRightSidebarClass + " " + m.transitionClass), r = !0), t.preventDefault()
        }), $(document).on("mousedown touchstart", function(t) {
            !$(t.target).closest(i).length && e.hasClass(m.openRightSidebarClass) && (m.closeRsOnClickOutside || $.isSm()) && n()
        })), void 0 !== u && u && u.nodeName || (u = C(t)), void 0 !== p && p && p.nodeName || (p = C(o)), void 0 !== h && h && h.nodeName || (h = C(a)), $(window).resize(function() {
            M(function() {
                k(u), k(p), k(h)
            }, 500, "be_rs_update_scroller")
        }), $('a[data-toggle="tab"]', i).on("shown.bs.tab", function(e) {
            k(u), k(p), k(h)
        })
    }

    function x() {
        r = !0, setTimeout(function() {
            r = !1
        }, m.openSidebarDelay)
    }

    function A() {
        var e = $(".be-right-sidebar .tab-chat"),
            t = $(".chat-contacts", e),
            o = $(".chat-window", e),
            i = $(".chat-messages", o),
            a = $(".content ul", i),
            n = $(".be-scroller-messages", i),
            r = $(".chat-input", o),
            l = $("input", r),
            s = $(".send-msg", r);

        function c(e, t) {
            var o = $('<li class="' + (t ? "self" : "friend") + '"></li>');
            "" != e && ($('<div class="msg">' + e + "</div>").appendTo(o), o.appendTo(a), n.stop().animate({
                scrollTop: n.prop("scrollHeight")
            }, 900, "swing"), k(f))
        }
        $(".user a", t).on("click", function(t) {
            e.hasClass("chat-opened") || (e.addClass("chat-opened"), void 0 !== f && f && f.nodeName || (f = C(n))), t.preventDefault()
        }), $(".title .return", o).on("click", function(t) {
            e.hasClass("chat-opened") && e.removeClass("chat-opened"), T()
        }), l.keypress(function(e) {
            var t = e.keyCode ? e.keyCode : e.which,
                o = $(this).val();
            "13" == t && (c(o, !0), $(this).val("")), e.stopPropagation()
        }), s.on("click", function() {
            c(l.val(), !0), l.val("")
        })
    }

    function T() {
        void 0 !== l && l && l.nodeName || (l = C(n))
    }
    var _, M = (_ = {}, function(e, t, o) {
        o || (o = "x1x2x3x4"), _[o] && clearTimeout(_[o]), _[o] = setTimeout(e, t)
    });
    return {
        conf: m,
        color: b,
        scroller: v,
        init: function(_) {
            var E, P;
            e = $("body"), t = $(".be-wrapper"), o = $(".be-left-sidebar"), i = $(".be-right-sidebar"), a = $(".be-scroller-aside"), n = $(".be-scroller-notifications"), r = !1, $.extend(m, _), FastClick.attach(document.body), m.enableLeftSidebar ? function() {
                var i, a, n = $(".sidebar-elements > li > a", o),
                    l = $(".sidebar-elements li a", o),
                    u = $(".left-sidebar-scroll", o),
                    p = $(".left-sidebar-toggle", o),
                    h = !!m.openLeftSidebarOnClick;

                function f() {
                    return t.hasClass(m.collapsibleSidebarCollapsedClass)
                }

                function g(e, i) {
                    var a = $(i.currentTarget),
                        n = $(e).parent(),
                        r = $("li.open", n),
                        l = !a.closest(o).length,
                        c = m.leftSidebarSlideSpeed,
                        d = a.parents().eq(1).hasClass("sidebar-elements");
                    !$.isSm() && f() && (d || l) ? (n.removeClass("open"), e.removeClass("visible"), r.removeClass("open").removeAttr("style")) : e.slideUp({
                        duration: c,
                        complete: function() {
                            n.removeClass("open"), $(this).removeAttr("style"), r.removeClass("open").removeAttr("style"), t.hasClass("be-fixed-sidebar") && !$.isSm() && k(s)
                        }
                    })
                }

                function b(e, o) {
                    var i = $(e),
                        a = $(i).parent(),
                        n = $(i).next(),
                        r = m.leftSidebarSlideSpeed,
                        l = $(o.currentTarget).parents().eq(1).hasClass("sidebar-elements"),
                        c = a.siblings(".open");
                    c && g($("> ul", c), o), !$.isSm() && f() && l ? (a.addClass("open"), n.addClass("visible"), void 0 !== d && y(d), void 0 !== d && d && d.nodeName || (d = C(a.find(".be-scroller"))), $(window).resize(function() {
                        M(function() {
                            $.isXs() || void 0 !== d && k(d)
                        }, 500, "am_check_phone_classes")
                    })) : n.slideDown({
                        duration: r,
                        complete: function() {
                            a.addClass("open"), $(this).removeAttr("style"), t.hasClass("be-fixed-sidebar") && !$.isSm() && k(s)
                        }
                    })
                }
                t.hasClass(m.collapsibleSidebarClass) && (a = void 0 !== i ? i : $(".sidebar-elements > li", o), $.each(a, function() {
                    var e = $(this).find("> a span").html(),
                        t = $(this).find("> ul"),
                        o = $("> li", t);
                    e = $('<li class="title">' + e + "</li>");
                    var i = $('<li class="nav-items"><div class="be-scroller"><div class="content"><ul></ul></div></div></li>');
                    t.find("> li.title").length || (t.prepend(e), o.appendTo(i.find(".content ul")), i.appendTo(t))
                }), $(".be-toggle-left-sidebar").on("click", function() {
                    t.hasClass(m.collapsibleSidebarCollapsedClass) ? (t.removeClass(m.collapsibleSidebarCollapsedClass), $("li.open", o).removeClass("open"), $("li.active", o).parents(".parent").addClass("active open"), o.trigger("shown.left-sidebar.collapse"), void 0 !== c && c && c.nodeName || (c = C($(".be-scroller", o))), y(c), void 0 !== d && y(d)) : (t.addClass(m.collapsibleSidebarCollapsedClass), $("li.active", o).parents(".parent").removeClass("open"), $("li.open", o).removeClass("open"), o.trigger("hidden.left-sidebar.collapse"))
                }), function() {
                    for (var e = $(".sidebar-elements > li > a", o), i = 0; i <= e.length; i++) {
                        var a = e[i],
                            n = $("> span", a).text();
                        $(a).attr({
                            "data-toggle": "tooltip",
                            "data-placement": "right",
                            title: n
                        }), $(a).tooltip({
                            trigger: "manual"
                        })
                    }
                    e.on("mouseenter", function() {
                        !$.isSm() && t.hasClass(m.collapsibleSidebarCollapsedClass) && $(this).tooltip("show")
                    }), e.on("mouseleave", function() {
                        $(this).tooltip("hide")
                    })
                }(), h || (n.on("mouseover", function(e) {
                    f() && b(this, e)
                }), n.on("touchstart", function(e) {
                    var t = $(this),
                        o = t.parent(),
                        i = t.next();
                    f() && !$.isSm() && (o.hasClass("open") ? g(i, e) : b(this, e), $(this).next().is("ul") && e.preventDefault())
                }), n.on("mouseleave", function(e) {
                    var t = $(this),
                        o = t.parent(),
                        i = o.find("> ul");
                    !$.isSm() && f() && (i.length > 0 ? setTimeout(function() {
                        i.is(":hover") ? i.on("mouseleave", function() {
                            setTimeout(function() {
                                t.is(":hover") || (g(i, e), i.off("mouseleave"))
                            }, 300)
                        }) : g(i, e)
                    }, 300) : o.removeClass("open"))
                })), $(document).on("mousedown touchstart", function(e) {
                    $(e.target).closest(o).length || $.isSm() || g($("ul.visible", o), e)
                })), l.on("click", function(e) {
                    var t = $(this),
                        o = t.parent(),
                        i = t.next();
                    t.parents().eq(1).hasClass("sidebar-elements"), o.siblings(".open"), o.hasClass("open") ? g(i, e) : b(this, e), t.next().is("ul") && e.preventDefault()
                }), t.hasClass(m.collapsibleSidebarCollapsedClass) ? $("li.active", o).parents(".parent").addClass("active") : $("li.active", o).parents(".parent").addClass("active open"), t.hasClass("be-fixed-sidebar") && ($.isSm() && !t.hasClass(m.offCanvasLeftSidebarClass) || void 0 !== s && s && s.nodeName || (s = C(u)), $(window).resize(function() {
                    M(function() {
                        $.isSm() && !t.hasClass(m.offCanvasLeftSidebarClass) ? y(s) : u.hasClass("ps") ? k(s) : void 0 !== s && s && s.nodeName || (s = C(u))
                    }, 500, "be_update_scroller")
                })), p.on("click", function(e) {
                    var t = $(this).next(".left-sidebar-spacer");
                    $(this).toggleClass("open"), t.slideToggle(m.leftSidebarToggleSpeed, function() {
                        $(this).removeAttr("style").toggleClass("open")
                    })
                }), t.hasClass(m.offCanvasLeftSidebarClass) && (m.toggleLeftSidebarButton.on("click", function(t) {
                    r && e.hasClass(m.openLeftSidebarClass) ? (e.removeClass(m.openLeftSidebarClass), x()) : (e.addClass(m.openLeftSidebarClass + " " + m.transitionClass), r = !0), t.preventDefault()
                }), $(document).on("mousedown touchstart", function(t) {
                    $(t.target).closest(o).length || $(t.target).closest(m.toggleLeftSidebarButton).length || !e.hasClass(m.openLeftSidebarClass) || (e.removeClass(m.openLeftSidebarClass), x())
                }))
            }() : t.addClass(m.disabledLeftSidebarClass), i.length && (S(), A()), m.enableSwipe && t.swipe({
                allowPageScroll: "vertical",
                preventDefaultEvents: !1,
                fallbackToMouseEvents: !1,
                swipeLeft: function(t) {
                    !r && i.length > 0 && (e.addClass(m.openRightSidebarClass + " " + m.transitionClass), r = !0)
                },
                threshold: m.swipeTreshold
            }), m.scrollTop && ((E = $('<div class="be-scroll-top"></div>')).appendTo("body"), $(window).on("scroll", function() {
                $(this).scrollTop() > 220 ? E.fadeIn(500) : E.fadeOut(500)
            }), E.on("touchstart mouseup", function(e) {
                $("html, body").animate({
                    scrollTop: 0
                }, 500), e.preventDefault()
            })), a.length && (P = a, g = C(a), $(window).resize(function() {
                $.isSm() && !t.hasClass(m.offCanvasLeftSidebarClass) ? y(g) : P.hasClass("ps") ? k(g) : void 0 !== g && g && g.nodeName || (g = C(a))
            })), n.length && T(), b.primary = w("clr-primary"), b.success = w("clr-success"), b.warning = w("clr-warning"), b.danger = w("clr-danger"), b.grey = w("clr-grey"), v.be_scroller_notifications = l, v.left_sidebar_scroll = s, v.be_left_sidebar_scroll = c, v.sub_menu_scroll = d, v.chat_scroll = u, v.todo_scroll = p, v.settings_scroll = h, v.messages_scroll = f, v.aside_scroll = g, v.updateScroller = k, v.destroyScroller = y, v.initScroller = C, $(".be-connections").on("click", function(e) {
                e.stopPropagation()
            }), $(".be-icons-nav .dropdown").on("shown.bs.dropdown", function() {
                k(l)
            }), $('[data-toggle="tooltip"]').tooltip(), $('[data-toggle="popover"]').popover(), $(".modal").on("show.bs.modal", function() {
                $("html").addClass("be-modal-open")
            }), $(".modal").on("hidden.bs.modal", function() {
                $("html").removeClass("be-modal-open")
            })
        },
        activeItemLeftSidebar: function(e) {
            var t = $(e).parent(),
                i = $(t).parents("li");
            t.hasClass("active") || ($("li.active", o).removeClass("active"), $(i).addClass("active"), $(t).addClass("active"))
        }
    }
}();

function FastClick(e, t) {
    "use strict";
    var o;
    if (t = t || {}, this.trackingClick = !1, this.trackingClickStart = 0, this.targetElement = null, this.touchStartX = 0, this.touchStartY = 0, this.lastTouchIdentifier = 0, this.touchBoundary = t.touchBoundary || 10, this.layer = e, this.tapDelay = t.tapDelay || 200, !FastClick.notNeeded(e)) {
        for (var i = ["onMouse", "onClick", "onTouchStart", "onTouchMove", "onTouchEnd", "onTouchCancel"], a = 0, n = i.length; a < n; a++) this[i[a]] = r(this[i[a]], this);
        deviceIsAndroid && (e.addEventListener("mouseover", this.onMouse, !0), e.addEventListener("mousedown", this.onMouse, !0), e.addEventListener("mouseup", this.onMouse, !0)), e.addEventListener("click", this.onClick, !0), e.addEventListener("touchstart", this.onTouchStart, !1), e.addEventListener("touchmove", this.onTouchMove, !1), e.addEventListener("touchend", this.onTouchEnd, !1), e.addEventListener("touchcancel", this.onTouchCancel, !1), Event.prototype.stopImmediatePropagation || (e.removeEventListener = function(t, o, i) {
            var a = Node.prototype.removeEventListener;
            "click" === t ? a.call(e, t, o.hijacked || o, i) : a.call(e, t, o, i)
        }, e.addEventListener = function(t, o, i) {
            var a = Node.prototype.addEventListener;
            "click" === t ? a.call(e, t, o.hijacked || (o.hijacked = function(e) {
                e.propagationStopped || o(e)
            }), i) : a.call(e, t, o, i)
        }), "function" == typeof e.onclick && (o = e.onclick, e.addEventListener("click", function(e) {
            o(e)
        }, !1), e.onclick = null)
    }

    function r(e, t) {
        return function() {
            return e.apply(t, arguments)
        }
    }
}
var deviceIsAndroid = navigator.userAgent.indexOf("Android") > 0,
    deviceIsIOS = /iP(ad|hone|od)/.test(navigator.userAgent),
    deviceIsIOS4 = deviceIsIOS && /OS 4_\d(_\d)?/.test(navigator.userAgent),
    deviceIsIOSWithBadTarget = deviceIsIOS && /OS ([6-9]|\d{2})_\d/.test(navigator.userAgent),
    deviceIsBlackBerry10 = navigator.userAgent.indexOf("BB10") > 0;
FastClick.prototype.needsClick = function(e) {
        "use strict";
        switch (e.nodeName.toLowerCase()) {
            case "button":
            case "select":
            case "textarea":
                if (e.disabled) return !0;
                break;
            case "input":
                if (deviceIsIOS && "file" === e.type || e.disabled) return !0;
                break;
            case "label":
            case "video":
                return !0
        }
        return /\bneedsclick\b/.test(e.className)
    }, FastClick.prototype.needsFocus = function(e) {
        "use strict";
        switch (e.nodeName.toLowerCase()) {
            case "textarea":
                return !0;
            case "select":
                return !deviceIsAndroid;
            case "input":
                switch (e.type) {
                    case "button":
                    case "checkbox":
                    case "file":
                    case "image":
                    case "radio":
                    case "submit":
                        return !1
                }
                return !e.disabled && !e.readOnly;
            default:
                return /\bneedsfocus\b/.test(e.className)
        }
    }, FastClick.prototype.sendClick = function(e, t) {
        "use strict";
        var o, i, a, n;
        document.activeElement && document.activeElement !== e && document.activeElement.blur(), n = t.changedTouches[0], (a = document.createEvent("MouseEvents")).initMouseEvent("mousedown", !0, !0, window, 1, n.screenX, n.screenY, n.clientX, n.clientY, !1, !1, !1, !1, 0, null), a.forwardedTouchEvent = !0, e.dispatchEvent(a), (i = document.createEvent("MouseEvents")).initMouseEvent("mouseup", !0, !0, window, 1, n.screenX, n.screenY, n.clientX, n.clientY, !1, !1, !1, !1, 0, null), i.forwardedTouchEvent = !0, e.dispatchEvent(i), (o = document.createEvent("MouseEvents")).initMouseEvent(this.determineEventType(e), !0, !0, window, 1, n.screenX, n.screenY, n.clientX, n.clientY, !1, !1, !1, !1, 0, null), o.forwardedTouchEvent = !0, e.dispatchEvent(o)
    }, FastClick.prototype.determineEventType = function(e) {
        "use strict";
        return deviceIsAndroid && "select" === e.tagName.toLowerCase() ? "mousedown" : "click"
    }, FastClick.prototype.focus = function(e) {
        "use strict";
        var t;
        deviceIsIOS && e.setSelectionRange && 0 !== e.type.indexOf("date") && "time" !== e.type ? (t = e.value.length, e.setSelectionRange(t, t)) : e.focus()
    }, FastClick.prototype.updateScrollParent = function(e) {
        "use strict";
        var t, o;
        if (!(t = e.fastClickScrollParent) || !t.contains(e)) {
            o = e;
            do {
                if (o.scrollHeight > o.offsetHeight) {
                    t = o, e.fastClickScrollParent = o;
                    break
                }
                o = o.parentElement
            } while (o)
        }
        t && (t.fastClickLastScrollTop = t.scrollTop)
    }, FastClick.prototype.getTargetElementFromEventTarget = function(e) {
        "use strict";
        return e.nodeType === Node.TEXT_NODE ? e.parentNode : e
    }, FastClick.prototype.onTouchStart = function(e) {
        "use strict";
        var t, o, i;
        if (e.targetTouches.length > 1) return !0;
        if (t = this.getTargetElementFromEventTarget(e.target), o = e.targetTouches[0], deviceIsIOS) {
            if ((i = window.getSelection()).rangeCount && !i.isCollapsed) return !0;
            if (!deviceIsIOS4) {
                if (o.identifier && o.identifier === this.lastTouchIdentifier) return e.preventDefault(), !1;
                this.lastTouchIdentifier = o.identifier, this.updateScrollParent(t)
            }
        }
        return this.trackingClick = !0, this.trackingClickStart = e.timeStamp, this.targetElement = t, this.touchStartX = o.pageX, this.touchStartY = o.pageY, e.timeStamp - this.lastClickTime < this.tapDelay && e.preventDefault(), !0
    }, FastClick.prototype.touchHasMoved = function(e) {
        "use strict";
        var t = e.changedTouches[0],
            o = this.touchBoundary;
        return Math.abs(t.pageX - this.touchStartX) > o || Math.abs(t.pageY - this.touchStartY) > o
    }, FastClick.prototype.onTouchMove = function(e) {
        "use strict";
        return !this.trackingClick || ((this.targetElement !== this.getTargetElementFromEventTarget(e.target) || this.touchHasMoved(e)) && (this.trackingClick = !1, this.targetElement = null), !0)
    }, FastClick.prototype.findControl = function(e) {
        "use strict";
        return void 0 !== e.control ? e.control : e.htmlFor ? document.getElementById(e.htmlFor) : e.querySelector("button, input:not([type=hidden]), keygen, meter, output, progress, select, textarea")
    }, FastClick.prototype.onTouchEnd = function(e) {
        "use strict";
        var t, o, i, a, n, r = this.targetElement;
        if (!this.trackingClick) return !0;
        if (e.timeStamp - this.lastClickTime < this.tapDelay) return this.cancelNextClick = !0, !0;
        if (this.cancelNextClick = !1, this.lastClickTime = e.timeStamp, o = this.trackingClickStart, this.trackingClick = !1, this.trackingClickStart = 0, deviceIsIOSWithBadTarget && (n = e.changedTouches[0], (r = document.elementFromPoint(n.pageX - window.pageXOffset, n.pageY - window.pageYOffset) || r).fastClickScrollParent = this.targetElement.fastClickScrollParent), "label" === (i = r.tagName.toLowerCase())) {
            if (t = this.findControl(r)) {
                if (this.focus(r), deviceIsAndroid) return !1;
                r = t
            }
        } else if (this.needsFocus(r)) return e.timeStamp - o > 100 || deviceIsIOS && window.top !== window && "input" === i ? (this.targetElement = null, !1) : (this.focus(r), this.sendClick(r, e), deviceIsIOS && "select" === i || (this.targetElement = null, e.preventDefault()), !1);
        return !(!deviceIsIOS || deviceIsIOS4 || !(a = r.fastClickScrollParent) || a.fastClickLastScrollTop === a.scrollTop) || (this.needsClick(r) || (e.preventDefault(), this.sendClick(r, e)), !1)
    }, FastClick.prototype.onTouchCancel = function() {
        "use strict";
        this.trackingClick = !1, this.targetElement = null
    }, FastClick.prototype.onMouse = function(e) {
        "use strict";
        return !(this.targetElement && !e.forwardedTouchEvent && e.cancelable && (!this.needsClick(this.targetElement) || this.cancelNextClick) && (e.stopImmediatePropagation ? e.stopImmediatePropagation() : e.propagationStopped = !0, e.stopPropagation(), e.preventDefault(), 1))
    }, FastClick.prototype.onClick = function(e) {
        "use strict";
        var t;
        return this.trackingClick ? (this.targetElement = null, this.trackingClick = !1, !0) : "submit" === e.target.type && 0 === e.detail || ((t = this.onMouse(e)) || (this.targetElement = null), t)
    }, FastClick.prototype.destroy = function() {
        "use strict";
        var e = this.layer;
        deviceIsAndroid && (e.removeEventListener("mouseover", this.onMouse, !0), e.removeEventListener("mousedown", this.onMouse, !0), e.removeEventListener("mouseup", this.onMouse, !0)), e.removeEventListener("click", this.onClick, !0), e.removeEventListener("touchstart", this.onTouchStart, !1), e.removeEventListener("touchmove", this.onTouchMove, !1), e.removeEventListener("touchend", this.onTouchEnd, !1), e.removeEventListener("touchcancel", this.onTouchCancel, !1)
    }, FastClick.notNeeded = function(e) {
        "use strict";
        var t, o, i;
        if (void 0 === window.ontouchstart) return !0;
        if (o = +(/Chrome\/([0-9]+)/.exec(navigator.userAgent) || [, 0])[1]) {
            if (!deviceIsAndroid) return !0;
            if (t = document.querySelector("meta[name=viewport]")) {
                if (-1 !== t.content.indexOf("user-scalable=no")) return !0;
                if (o > 31 && document.documentElement.scrollWidth <= window.outerWidth) return !0
            }
        }
        if (deviceIsBlackBerry10 && (i = navigator.userAgent.match(/Version\/([0-9]*)\.([0-9]*)/))[1] >= 10 && i[2] >= 3 && (t = document.querySelector("meta[name=viewport]"))) {
            if (-1 !== t.content.indexOf("user-scalable=no")) return !0;
            if (document.documentElement.scrollWidth <= window.outerWidth) return !0
        }
        return "none" === e.style.msTouchAction
    }, FastClick.attach = function(e, t) {
        "use strict";
        return new FastClick(e, t)
    }, "function" == typeof define && "object" == typeof define.amd && define.amd ? define(function() {
        "use strict";
        return FastClick
    }) : "undefined" != typeof module && module.exports ? (module.exports = FastClick.attach, module.exports.FastClick = FastClick) : window.FastClick = FastClick,
    function(e) {
        "function" == typeof define && define.amd && define.amd.jQuery ? define(["jquery"], e) : e("undefined" != typeof module && module.exports ? require("jquery") : jQuery)
    }(function(e) {
        "use strict";

        function t(t) {
            return !t || void 0 !== t.allowPageScroll || void 0 === t.swipe && void 0 === t.swipeStatus || (t.allowPageScroll = s), void 0 !== t.click && void 0 === t.tap && (t.tap = t.click), t || (t = {}), t = e.extend({}, e.fn.swipe.defaults, t), this.each(function() {
                var T = e(this),
                    _ = T.data(A);
                _ || (_ = new function(t, T) {
                    function _(t) {
                        if (!(!0 === Ce.data(A + "_intouch") || e(t.target).closest(T.excludedElements, Ce).length > 0)) {
                            var r = t.originalEvent ? t.originalEvent : t;
                            if (!r.pointerType || "mouse" != r.pointerType || 0 != T.fallbackToMouseEvents) {
                                var l, s = r.touches,
                                    c = s ? s[0] : r;
                                return $e = w, s ? Se = s.length : !1 !== T.preventDefaultEvents && t.preventDefault(), pe = 0, he = null, fe = null, ke = null, ge = 0, me = 0, be = 0, ve = 1, we = 0, (d = {})[o] = te(o), d[i] = te(i), d[a] = te(a), d[n] = te(n), ye = d, V(), Z(0, c), !s || Se === T.fingers || T.fingers === b || Y() ? (Ae = ne(), 2 == Se && (Z(1, s[1]), me = be = ie(xe[0].start, xe[1].start)), (T.swipeStatus || T.pinchStatus) && (l = D(r, $e))) : l = !1, !1 === l ? (D(r, $e = C), l) : (T.hold && (Le = setTimeout(e.proxy(function() {
                                    Ce.trigger("hold", [r.target]), T.hold && (l = T.hold.call(Ce, r, r.target))
                                }, this), T.longTapThreshold)), J(!0), null)
                            }
                        }
                        var d
                    }

                    function M(t) {
                        var d, u, p, h, f, v, w, $, S = t.originalEvent ? t.originalEvent : t;
                        if ($e !== y && $e !== C && !Q()) {
                            var x, A = S.touches,
                                _ = A ? A[0] : S,
                                M = K(_);
                            if (Te = ne(), A && (Se = A.length), T.hold && clearTimeout(Le), $e = k, 2 == Se && (0 == me ? (Z(1, A[1]), me = be = ie(xe[0].start, xe[1].start)) : (K(A[1]), be = ie(xe[0].end, xe[1].end), xe[0].end, xe[1].end, ke = ve < 1 ? l : r), ve = (be / me * 1).toFixed(2), we = Math.abs(me - be)), Se === T.fingers || T.fingers === b || !A || Y()) {
                                if (he = ae(M.start, M.end), fe = ae(M.last, M.end), function(e, t) {
                                        if (!1 !== T.preventDefaultEvents)
                                            if (T.allowPageScroll === s) e.preventDefault();
                                            else {
                                                var r = T.allowPageScroll === c;
                                                switch (t) {
                                                    case o:
                                                        (T.swipeLeft && r || !r && T.allowPageScroll != g) && e.preventDefault();
                                                        break;
                                                    case i:
                                                        (T.swipeRight && r || !r && T.allowPageScroll != g) && e.preventDefault();
                                                        break;
                                                    case a:
                                                        (T.swipeUp && r || !r && T.allowPageScroll != m) && e.preventDefault();
                                                        break;
                                                    case n:
                                                        (T.swipeDown && r || !r && T.allowPageScroll != m) && e.preventDefault()
                                                }
                                            }
                                    }(t, fe), w = M.start, $ = M.end, pe = Math.round(Math.sqrt(Math.pow($.x - w.x, 2) + Math.pow($.y - w.y, 2))), ge = oe(), v = pe, (f = he) != s && (v = Math.max(v, ee(f)), ye[f].distance = v), x = D(S, $e), !T.triggerOnTouchEnd || T.triggerOnTouchLeave) {
                                    var E = !0;
                                    if (T.triggerOnTouchLeave) {
                                        var P = {
                                            left: (h = (p = e(p = this)).offset()).left,
                                            right: h.left + p.outerWidth(),
                                            top: h.top,
                                            bottom: h.top + p.outerHeight()
                                        };
                                        d = M.end, u = P, E = d.x > u.left && d.x < u.right && d.y > u.top && d.y < u.bottom
                                    }!T.triggerOnTouchEnd && E ? $e = F(k) : T.triggerOnTouchLeave && !E && ($e = F(y)), $e != C && $e != y || D(S, $e)
                                }
                            } else D(S, $e = C);
                            !1 === x && D(S, $e = C)
                        }
                    }

                    function E(e) {
                        var t, o = e.originalEvent ? e.originalEvent : e,
                            i = o.touches;
                        if (i) {
                            if (i.length && !Q()) return t = o, _e = ne(), Me = t.touches.length + 1, !0;
                            if (i.length && Q()) return !0
                        }
                        return Q() && (Se = Me), Te = ne(), ge = oe(), O() || !R() ? D(o, $e = C) : T.triggerOnTouchEnd || !1 === T.triggerOnTouchEnd && $e === k ? (!1 !== T.preventDefaultEvents && !1 !== e.cancelable && e.preventDefault(), D(o, $e = y)) : !T.triggerOnTouchEnd && j() ? I(o, $e = y, p) : $e === k && D(o, $e = C), J(!1), null
                    }

                    function P() {
                        Se = 0, Te = 0, Ae = 0, me = 0, be = 0, ve = 1, V(), J(!1)
                    }

                    function L(e) {
                        var t = e.originalEvent ? e.originalEvent : e;
                        T.triggerOnTouchLeave && ($e = F(y), D(t, $e))
                    }

                    function B() {
                        Ce.unbind(le, _), Ce.unbind(ue, P), Ce.unbind(se, M), Ce.unbind(ce, E), de && Ce.unbind(de, L), J(!1)
                    }

                    function F(e) {
                        var t = e,
                            o = N(),
                            i = R(),
                            a = O();
                        return !o || a ? t = C : !i || e != k || T.triggerOnTouchEnd && !T.triggerOnTouchLeave ? !i && e == y && T.triggerOnTouchLeave && (t = C) : t = y, t
                    }

                    function D(e, t) {
                        var o, i = e.touches;
                        return (!(!z() || !W()) || W()) && (o = I(e, t, d)), (!(!H() || !Y()) || Y()) && !1 !== o && (o = I(e, t, u)), X() && G() && !1 !== o ? o = I(e, t, h) : ge > T.longTapThreshold && pe < v && T.longTap && !1 !== o ? o = I(e, t, f) : !(1 !== Se && $ || !(isNaN(pe) || pe < T.threshold) || !j()) && !1 !== o && (o = I(e, t, p)), t === C && P(), t === y && (i && i.length || P()), o
                    }

                    function I(t, s, c) {
                        var g;
                        if (c == d) {
                            if (Ce.trigger("swipeStatus", [s, he || null, pe || 0, ge || 0, Se, xe, fe]), T.swipeStatus && !1 === (g = T.swipeStatus.call(Ce, t, s, he || null, pe || 0, ge || 0, Se, xe, fe))) return !1;
                            if (s == y && z()) {
                                if (clearTimeout(Pe), clearTimeout(Le), Ce.trigger("swipe", [he, pe, ge, Se, xe, fe]), T.swipe && !1 === (g = T.swipe.call(Ce, t, he, pe, ge, Se, xe, fe))) return !1;
                                switch (he) {
                                    case o:
                                        Ce.trigger("swipeLeft", [he, pe, ge, Se, xe, fe]), T.swipeLeft && (g = T.swipeLeft.call(Ce, t, he, pe, ge, Se, xe, fe));
                                        break;
                                    case i:
                                        Ce.trigger("swipeRight", [he, pe, ge, Se, xe, fe]), T.swipeRight && (g = T.swipeRight.call(Ce, t, he, pe, ge, Se, xe, fe));
                                        break;
                                    case a:
                                        Ce.trigger("swipeUp", [he, pe, ge, Se, xe, fe]), T.swipeUp && (g = T.swipeUp.call(Ce, t, he, pe, ge, Se, xe, fe));
                                        break;
                                    case n:
                                        Ce.trigger("swipeDown", [he, pe, ge, Se, xe, fe]), T.swipeDown && (g = T.swipeDown.call(Ce, t, he, pe, ge, Se, xe, fe))
                                }
                            }
                        }
                        if (c == u) {
                            if (Ce.trigger("pinchStatus", [s, ke || null, we || 0, ge || 0, Se, ve, xe]), T.pinchStatus && !1 === (g = T.pinchStatus.call(Ce, t, s, ke || null, we || 0, ge || 0, Se, ve, xe))) return !1;
                            if (s == y && H()) switch (ke) {
                                case r:
                                    Ce.trigger("pinchIn", [ke || null, we || 0, ge || 0, Se, ve, xe]), T.pinchIn && (g = T.pinchIn.call(Ce, t, ke || null, we || 0, ge || 0, Se, ve, xe));
                                    break;
                                case l:
                                    Ce.trigger("pinchOut", [ke || null, we || 0, ge || 0, Se, ve, xe]), T.pinchOut && (g = T.pinchOut.call(Ce, t, ke || null, we || 0, ge || 0, Se, ve, xe))
                            }
                        }
                        return c == p ? s !== C && s !== y || (clearTimeout(Pe), clearTimeout(Le), G() && !X() ? (Ee = ne(), Pe = setTimeout(e.proxy(function() {
                            Ee = null, Ce.trigger("tap", [t.target]), T.tap && (g = T.tap.call(Ce, t, t.target))
                        }, this), T.doubleTapThreshold)) : (Ee = null, Ce.trigger("tap", [t.target]), T.tap && (g = T.tap.call(Ce, t, t.target)))) : c == h ? s !== C && s !== y || (clearTimeout(Pe), clearTimeout(Le), Ee = null, Ce.trigger("doubletap", [t.target]), T.doubleTap && (g = T.doubleTap.call(Ce, t, t.target))) : c == f && (s !== C && s !== y || (clearTimeout(Pe), Ee = null, Ce.trigger("longtap", [t.target]), T.longTap && (g = T.longTap.call(Ce, t, t.target)))), g
                    }

                    function R() {
                        var e = !0;
                        return null !== T.threshold && (e = pe >= T.threshold), e
                    }

                    function O() {
                        var e = !1;
                        return null !== T.cancelThreshold && null !== he && (e = ee(he) - pe >= T.cancelThreshold), e
                    }

                    function N() {
                        return !(T.maxTimeThreshold && ge >= T.maxTimeThreshold)
                    }

                    function H() {
                        var e = q(),
                            t = U(),
                            o = null === T.pinchThreshold || we >= T.pinchThreshold;
                        return e && t && o
                    }

                    function Y() {
                        return !!(T.pinchStatus || T.pinchIn || T.pinchOut)
                    }

                    function z() {
                        var e = N(),
                            t = R(),
                            o = q(),
                            i = U(),
                            a = O(),
                            n = !a && i && o && t && e;
                        return n
                    }

                    function W() {
                        return !!(T.swipe || T.swipeStatus || T.swipeLeft || T.swipeRight || T.swipeUp || T.swipeDown)
                    }

                    function q() {
                        return Se === T.fingers || T.fingers === b || !$
                    }

                    function U() {
                        return 0 !== xe[0].end.x
                    }

                    function j() {
                        return !!T.tap
                    }

                    function G() {
                        return !!T.doubleTap
                    }

                    function X() {
                        if (null == Ee) return !1;
                        var e = ne();
                        return G() && e - Ee <= T.doubleTapThreshold
                    }

                    function V() {
                        _e = 0, Me = 0
                    }

                    function Q() {
                        var e = !1;
                        if (_e) {
                            var t = ne() - _e;
                            t <= T.fingerReleaseThreshold && (e = !0)
                        }
                        return e
                    }

                    function J(e) {
                        Ce && (!0 === e ? (Ce.bind(se, M), Ce.bind(ce, E), de && Ce.bind(de, L)) : (Ce.unbind(se, M, !1), Ce.unbind(ce, E, !1), de && Ce.unbind(de, L, !1)), Ce.data(A + "_intouch", !0 === e))
                    }

                    function Z(e, t) {
                        var o = {
                            start: {
                                x: 0,
                                y: 0
                            },
                            last: {
                                x: 0,
                                y: 0
                            },
                            end: {
                                x: 0,
                                y: 0
                            }
                        };
                        return o.start.x = o.last.x = o.end.x = t.pageX || t.clientX, o.start.y = o.last.y = o.end.y = t.pageY || t.clientY, xe[e] = o, o
                    }

                    function K(e) {
                        var t = void 0 !== e.identifier ? e.identifier : 0,
                            o = xe[t] || null;
                        return null === o && (o = Z(t, e)), o.last.x = o.end.x, o.last.y = o.end.y, o.end.x = e.pageX || e.clientX, o.end.y = e.pageY || e.clientY, o
                    }

                    function ee(e) {
                        if (ye[e]) return ye[e].distance
                    }

                    function te(e) {
                        return {
                            direction: e,
                            distance: 0
                        }
                    }

                    function oe() {
                        return Te - Ae
                    }

                    function ie(e, t) {
                        var o = Math.abs(e.x - t.x),
                            i = Math.abs(e.y - t.y);
                        return Math.round(Math.sqrt(o * o + i * i))
                    }

                    function ae(e, t) {
                        if (l = t, (r = e).x == l.x && r.y == l.y) return s;
                        var r, l, c, d, u, p, h, f, g = (d = t, u = (c = e).x - d.x, p = d.y - c.y, h = Math.atan2(p, u), (f = Math.round(180 * h / Math.PI)) < 0 && (f = 360 - Math.abs(f)), f);
                        return g <= 45 && g >= 0 ? o : g <= 360 && g >= 315 ? o : g >= 135 && g <= 225 ? i : g > 45 && g < 135 ? n : a
                    }

                    function ne() {
                        var e = new Date;
                        return e.getTime()
                    }
                    var T = e.extend({}, T),
                        re = $ || x || !T.fallbackToMouseEvents,
                        le = re ? x ? S ? "MSPointerDown" : "pointerdown" : "touchstart" : "mousedown",
                        se = re ? x ? S ? "MSPointerMove" : "pointermove" : "touchmove" : "mousemove",
                        ce = re ? x ? S ? "MSPointerUp" : "pointerup" : "touchend" : "mouseup",
                        de = re ? x ? "mouseleave" : null : "mouseleave",
                        ue = x ? S ? "MSPointerCancel" : "pointercancel" : "touchcancel",
                        pe = 0,
                        he = null,
                        fe = null,
                        ge = 0,
                        me = 0,
                        be = 0,
                        ve = 1,
                        we = 0,
                        ke = 0,
                        ye = null,
                        Ce = e(t),
                        $e = "start",
                        Se = 0,
                        xe = {},
                        Ae = 0,
                        Te = 0,
                        _e = 0,
                        Me = 0,
                        Ee = 0,
                        Pe = null,
                        Le = null;
                    try {
                        Ce.bind(le, _), Ce.bind(ue, P)
                    } catch (t) {
                        e.error("events not supported " + le + "," + ue + " on jQuery.swipe")
                    }
                    this.enable = function() {
                        return this.disable(), Ce.bind(le, _), Ce.bind(ue, P), Ce
                    }, this.disable = function() {
                        return B(), Ce
                    }, this.destroy = function() {
                        B(), Ce.data(A, null), Ce = null
                    }, this.option = function(t, o) {
                        if ("object" == typeof t) T = e.extend(T, t);
                        else if (void 0 !== T[t]) {
                            if (void 0 === o) return T[t];
                            T[t] = o
                        } else {
                            if (!t) return T;
                            e.error("Option " + t + " does not exist on jQuery.swipe.options")
                        }
                        return null
                    }
                }(this, t), T.data(A, _))
            })
        }
        var o = "left",
            i = "right",
            a = "up",
            n = "down",
            r = "in",
            l = "out",
            s = "none",
            c = "auto",
            d = "swipe",
            u = "pinch",
            p = "tap",
            h = "doubletap",
            f = "longtap",
            g = "horizontal",
            m = "vertical",
            b = "all",
            v = 10,
            w = "start",
            k = "move",
            y = "end",
            C = "cancel",
            $ = "ontouchstart" in window,
            S = window.navigator.msPointerEnabled && !window.navigator.pointerEnabled && !$,
            x = (window.navigator.pointerEnabled || window.navigator.msPointerEnabled) && !$,
            A = "TouchSwipe";
        e.fn.swipe = function(o) {
            var i = e(this),
                a = i.data(A);
            if (a && "string" == typeof o) {
                if (a[o]) return a[o].apply(a, Array.prototype.slice.call(arguments, 1));
                e.error("Method " + o + " does not exist on jQuery.swipe")
            } else if (a && "object" == typeof o) a.option.apply(a, arguments);
            else if (!(a || "object" != typeof o && o)) return t.apply(this, arguments);
            return i
        }
    })