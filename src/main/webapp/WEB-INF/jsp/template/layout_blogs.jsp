<%--
  Created by IntelliJ IDEA.
  User: phuong
  Date: 19/02/2017
  Time: 9:53 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!doctype html>
<!--[if lt IE 7]><html class="no-js ie6 oldie" lang="en"><![endif]-->
<!--[if IE 7]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if IE 8]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <spring:url value="/resources/img/favicon/favicon.png" var="fava"/>
    <link rel="shortcut icon" href="${fava}" type="image/png"/>
    <!--[if IE]>
    <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'/><![endif]-->
    <title>
        Nhang Hoạt Tính
    </title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=0' name='viewport'/>
    <link rel="canonical" href="${pageContext.request.contextPath}"/>
    <style>
        .activePageLink
        {
            background-color:#abd305;
        }
        .clear {
            clear:both
        }
    </style>
    <script>
        //<![CDATA[
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-43568928-1', 'auto');
        try {

            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                        (i[r].q = i[r].q || []).push(arguments)
                    }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-43568928-1', 'auto');
            ga('send', 'pageview');


        } catch (e) {
        }
        ;
        ga('send', 'pageview');

        //]]>
    </script>
    <%--<script>
        //<![CDATA[
        !function (f, b, e, v, n, t, s) {
            if (f.fbq)return;
            n = f.fbq = function () {
                n.callMethod ?
                    n.callMethod.apply(n, arguments) : n.queue.push(arguments)
            };
            if (!f._fbq) f._fbq = n;
            n.push = n;
            n.loaded = !0;
            n.version = '2.0';
            n.queue = [];
            t = b.createElement(e);
            t.async = !0;
            t.src = v;
            s = b.getElementsByTagName(e)[0];
            s.parentNode.insertBefore(t, s)
        }(window,
            document, 'script', '//connect.facebook.net/en_US/fbevents.js');
        // Insert Your Facebook Pixel ID below.
        fbq('init', '209722866128412');
        fbq('track', 'PageView');
        //]]>
    </script>
    <noscript><img height='1' width='1' style='display:none'
                   src='https://www.facebook.com/tr?id=209722866128412&amp;ev=PageView&amp;noscript=1'
    /></noscript>
    <script type='text/javascript'>
        //<![CDATA[
        if ((typeof Haravan) === 'undefined') {
            Haravan = {};
        }
        Haravan.culture = 'vi-VN';
        Haravan.shop = '${pageContext.request.contextPath}';
        Haravan.theme = {"name": "admin", "id": 1000151899, "role": "main"};
        Haravan.domain = '${pageContext.request.contextPath}';
        //]]>
    </script>
    <script>
        //<![CDATA[
        (function () {
            function asyncLoad() {
                var urls = ["/resources/js/noname.js"];
                for (var i = 0; i < urls.length; i++) {
                    var s = document.createElement('script');
                    s.type = 'text/javascript';
                    s.async = true;
                    s.src = urls[i];
                    var x = document.getElementsByTagName('script')[0];
                    x.parentNode.insertBefore(s, x);
                }
            }

            window.attachEvent ? window.attachEvent('onload', asyncLoad) : window.addEventListener('load', asyncLoad, false);
        })();
        //]]>
    </script>--%>

    <%-- <spring:url value="/resources/js/jquery.min.1.11.0.js" var="a" />
    <script src="${a}"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <%--<spring:url value="/resources/js/bootstrap.min.js" var="b" />
    <script src="${b}"></script>--%>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <spring:url value="/resources/js/option_selection.js" var="c" />
    <script src="${c}"></script>
    <spring:url value="/resources/js/api.jquery.js" var="d" />
    <script src="${d}"></script>
    <spring:url value="/resources/js/scripts.js" var="e" />
    <script src="${e}"></script>
    <spring:url value="/resources/js/modernizr.custom.js" var="f" />
    <script src="${f}"></script>
    <spring:url value="/resources/js/html5shiv.js" var="g" />
    <script src="${g}"></script>
    <spring:url value="/resources/js/jquery-migrate-1.2.0.min.js" var="h" />
    <script src="${h}"></script>
    <spring:url value="/resources/js/jquery.touchSwipe.min.js" var="i" />
    <script src="${i}"></script>
    <spring:url value="/resources/js/fixheightproductv2.js" var="k" />
    <script data-target=".product-resize" data-parent=".products-resize" data-img-box=".image-resize" src="${k}"></script>
    <spring:url value="/resources/js/haravan.plugin.1.0.js" var="l" />
    <script src="${l}"></script>
    <spring:url value="/resources/js/jquery.cookie.js" var="m" />
    <script src="${m}"></script>
    <spring:url value="/resources/js/jquery.fancybox.js" var="n" />
    <script src="${n}"></script>
    <spring:url value="/resources/js/jquery.flexslider.js" var="o" />
    <script src="${o}"></script>
    <spring:url value="/resources/js/owl.carousel.js" var="p" />
    <script src="${p}"></script>
    <spring:url value="/resources/js/classie.js" var="q" />
    <script src="${q}"></script>
    <spring:url value="/resources/js/mlpushmenu.js" var="a1" />
    <script src="${a1}"></script>
    <spring:url value="/resources/js/addthis_widget.js" var="a2" />
    <script src="${a2}"></script>
    <spring:url value="/resources/js/list.min.js" var="a3" />
    <script src="${a3}"></script>
    <spring:url value="/resources/js/libs-script.min.js" var="a22" />
    <script src="${a22}"></script>
    <spring:url value="/resources/js/main1.js" var="a122" />
    <script src="${a122}"></script>
    <%--<spring:url value="/resources/js/cart.js" var="a3" />
    <script src="${a3}"></script>--%>
    <!--------------CSS----------->
    <spring:url value="/resources/css/owl.carousel.css" var="cs1" />
    <link href="${cs1}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/css/page-contact-form.css" var="cs2" />
    <link href="${cs2}" rel="stylesheet" type="text/css"/>
    <%--<spring:url value="/resources/css/roboto.css" var="cs3" />
    <link href="${cs3}" rel="stylesheet" type="text/css"/>--%>

    <meta property="og:type" content="website"/>
    <meta property="og:title" content="Nhang Hoạt Tính"/>

    <meta property="og:image" content="/resource/img/logo.jpg"/>
    <meta property="og:image" content="/resource/img/logo.jpg"/>
    <meta property="og:url" content="${pageContext.request.contextPath}"/>
    <meta property="og:site_name" content="Nhang Hoạt Tính"/>
    <!-- Latest compiled and minified CSS -->
    <spring:url value="/resources/css/bootstrap.3.3.1.css" var="cs4" />
    <link href="${cs4}" rel="stylesheet" type="text/css"/>
    <!-- Theme haravan-->
    <spring:url value="/resources/css/haravantheme.1.0.css" var="cs5" />
    <link href="${cs5}" rel="stylesheet" type="text/css"/>
    <!-- Latest compiled and minified JavaScript -->
    <spring:url value="/resources/font-awesome/css/font-awesome.css" var="cs6" />
    <link href="${cs6}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/css/jquery.fancybox.css" var="cs7" />
    <link href="${cs7}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/css/flexslider.css" var="cs8" />
    <link href="${cs8}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/css/styles.css?v=108" var="cs9" />
    <link href="${cs9}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/css/sidebar.css" var="cs10" />
    <link href="${cs10}" rel="stylesheet" type="text/css"/>
    <%--<spring:url value="/resources/css/roboto.css" var="cs11" />
    <link href="${cs11}" rel="stylesheet" type="text/css"/>--%>
    <spring:url value="/resources/js/ptSlide.js" var="js12" />
    <script src='${js12}' type='text/javascript'></script>
    <spring:url value="/resources/css/ptSlide.css" var="cs12" />
    <link href='${cs12}' rel='stylesheet' type='text/css'  media='all'  />
    <spring:url value="/resources/css/style.3.1.css" var="cs31" />
    <link href="${cs31}" rel="stylesheet" type="text/css"/>

    <!-- Facebook Pixel Code -->
    <%--<script>
        !function (f, b, e, v, n, t, s) {
            if (f.fbq)return;
            n = f.fbq = function () {
                n.callMethod ?
                    n.callMethod.apply(n, arguments) : n.queue.push(arguments)
            };
            if (!f._fbq) f._fbq = n;
            n.push = n;
            n.loaded = !0;
            n.version = '2.0';
            n.queue = [];
            t = b.createElement(e);
            t.async = !0;
            t.src = v;
            s = b.getElementsByTagName(e)[0];
            s.parentNode.insertBefore(t, s)
        }(window,
            document, 'script', 'https://connect.facebook.net/en_US/fbevents.js');

        fbq('init', '1440058032900495');
        fbq('track', "PageView");
        //Theo dõi số lượt xem trang chính (ví dụ: trang sản phẩm, trang đích hoặc bài viết)


        //Theo dõi tìm kiếm trên trang web của bạn (ví dụ: tìm kiếm sản phẩm)


        //Theo dõi khi mặt hàng được thêm vào giỏ hàng (vì dụ: nhấp/trang đích trên nút Thêm vào giỏ hàng)


    </script>
    <noscript><img height="1" width="1" style="display:none"
                   src="https://www.facebook.com/tr?id=1440058032900495&ev=PageView&noscript=1"
    /></noscript>--%>
    <!-- End Facebook Pixel Code -->

    <!--Start of Zendesk Chat Script-->
    <%--<script type="text/javascript">
        window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
            d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
        _.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
            $.src="https://v2.zopim.com/?4p8ZFgO1mPLfKYsoJSABkYvwJ2NwKOTP";z.t=+new Date;$.
                type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
    </script>--%>
    <!--End of Zendesk Chat Script-->
    <style>
        ::-webkit-input-placeholder { /* WebKit browsers */
            color: rgb(240, 196, 129);
        }
        :-moz-placeholder { /* Mozilla Firefox 4 to 18 */
            color: rgb(240, 196, 129);
        }
        ::-moz-placeholder { /* Mozilla Firefox 19+ */
            color: rgb(240, 196, 129);
        }
        :-ms-input-placeholder { /* Internet Explorer 10+ */
            color: rgb(240, 196, 129);
        }
    </style>
</head>
<body style="background-color: #333300;" onload="onloadChat();">
<div class="zopim" __jx__id="___$_61 ___$_61"
     style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; padding: 0px; border: 0px; background: transparent; overflow: hidden; position: fixed; z-index: 16000002; height: 30px; right: 50px; bottom: 0px; width: 300px;">
    <script>
        window.fbAsyncInit = function() {
            FB.init({
                appId      : '1832292157092575',
                xfbml      : true,
                version    : 'v2.9'
            });
        };
        (function(d, s, id){
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {return;}
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
    <%--<div class="fb-send-to-messenger"
         messenger_app_id="1832292157092575"
         page_id="1484647908416608"
         data-ref="PASS_THROUGH_PARAM"
         color="blue"
         size="standard">
    </div>--%>
    <div class="fb-messengermessageus"
         messenger_app_id="1832292157092575"
         page_id="1484647908416608"
         color="blue"
         size="large">
    </div>
</div>
<div class="container-mp nav-wrapper">
    <!-- Begin: wrapper -->
    <div class="wrapper mp-pusher" id="mp-pusher">
        <button type="button" class="navbar-toggle btn-sidebar" id="trigger">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <tiles:insertAttribute name="nav_mobile"/>

        <script>
            new mlPushMenu(document.getElementById('mp-menu'), document.getElementById('trigger'), {
                type: 'cover'
            });
        </script>

        <div class="scroller">
            <div class="scroller-inner">
                <tiles:insertAttribute name="header"/>
                <tiles:insertAttribute name="nav"/>
                <section id="content" class="clearfix container">
                    <tiles:insertAttribute name="aside"/>
                    <tiles:insertAttribute name="breadcurmb_blog"/>
                    <div class="col-md-9 col-sm-12 col-xs-12">
                        <!-- Content-->
                        <tiles:insertAttribute name="content_blog"/>
                        <!-- Content-->
                        <tiles:insertAttribute name="pagging"/>
                    </div>
                </section>
                <tiles:insertAttribute name="footer"/>
            </div>
            <!--Scroll to Top-->
            <a href="#" class="scrollToTop">
                <i class="fa fa-chevron-up"></i>
            </a>
            <script>
                jQuery(document).ready(function () {
                    //Check to see if the window is top if not then display button
                    jQuery(window).scroll(function () {
                        if ($(this).scrollTop() > 100) {
                            $('.scrollToTop').fadeIn();
                        } else {
                            $('.scrollToTop').fadeOut();
                        }
                    });

                    //Click event to scroll to top
                    jQuery('.scrollToTop').click(function () {
                        $('html, body').animate({
                            scrollTop: 0
                        }, 600);
                        return false;
                    });

                });
            </script>

        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('.t-fix').removeClass('in');
    })
</script>

<!-- Google Code for Chuy&#7875;n &#273;&#7893;i &#273;&#7863;t h&agrave;ng Conversion Page -->
<%--<script type="text/javascript">
    /* <![CDATA[ */
    var google_conversion_id = 974485475;
    var google_conversion_language = "en";
    var google_conversion_format = "3";
    var google_conversion_color = "ffffff";
    var google_conversion_label = "9OvyCLjcrGgQ4-_V0AM";
    var google_conversion_value = 80000.00;
    var google_conversion_currency = "VND";
    var google_remarketing_only = false;
    /* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
    <div style="display:inline;">
        <img height="1" width="1" style="border-style:none;" alt=""
             src="//www.googleadservices.com/pagead/conversion/974485475/?value=80000.00&amp;currency_code=VND&amp;label=9OvyCLjcrGgQ4-_V0AM&amp;guid=ON&amp;script=0"/>
    </div>
</noscript>--%>


</body>

</html>

