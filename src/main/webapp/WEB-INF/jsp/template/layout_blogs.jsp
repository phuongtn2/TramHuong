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
<!--Start of Zopim Live Chat Script-->
<script type="text/javascript">
    window.$zopim || (function (d, s) {
        var z = $zopim = function (c) {
            z._.push(c)
        }, $ = z.s =
            d.createElement(s), e = d.getElementsByTagName(s)[0];
        z.set = function (o) {
            z.set._.push(o)
        };
        z._ = [];
        z.set._ = [];
        $.async = !0;
        $.setAttribute('charset', 'utf-8');
        $.src = '//v2.zopim.com/?3r0c8iLwFsSWMgqlT4cVZwnrnH3HOlGY';
        z.t = +new Date;
        $.type = 'text/javascript';
        e.parentNode.insertBefore($, e)
    })(document, 'script');
</script>
<!--End of Zopim Live Chat Script-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <spring:url value="/resources/img/favicon/favicon.png" var="fava"/>
    <link rel="shortcut icon" href="${fava}" type="image/png"/>
    <!--[if IE]>
    <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'/><![endif]-->
    <title>
        Trầm Hương Tuấn Anh
    </title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=0' name='viewport'/>
    <link rel="canonical" href="http://localhost:8080/"/>
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
    <script>
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
    </script>

    <spring:url value="/resources/js/jquery.min.1.11.0.js" var="a" />
    <script src="${a}"></script>
    <spring:url value="/resources/js/bootstrap.min.js" var="b" />
    <script src="${b}"></script>
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
    <%--<spring:url value="/resources/js/cart.js" var="a3" />
    <script src="${a3}"></script>--%>
    <!--------------CSS----------->
    <spring:url value="/resources/css/owl.carousel.css" var="cs1" />
    <link href="${cs1}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/css/page-contact-form.css" var="cs2" />
    <link href="${cs2}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/css/roboto.css" var="cs3" />
    <link href="${cs3}" rel="stylesheet" type="text/css"/>

    <meta property="og:type" content="website"/>
    <meta property="og:title" content="Trầm Hương Tuấn Anh"/>

    <meta property="og:image" content="/resource/img/logo.png"/>
    <meta property="og:image" content="/resource/img/logo.png"/>
    <meta property="og:url" content="${pageContext.request.contextPath}"/>
    <meta property="og:site_name" content="Trầm Hương Tuấn Anh"/>
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
    <spring:url value="/resources/css/roboto.css" var="cs11" />
    <link href="${cs11}" rel="stylesheet" type="text/css"/>

    <!-- Facebook Pixel Code -->
    <script>
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
    /></noscript>
    <!-- End Facebook Pixel Code -->

</head>
<body><!--Start of Zopim Live Chat Script-->
<script type="text/javascript">
    window.$zopim || (function (d, s) {
        var z = $zopim = function (c) {
            z._.push(c)
        }, $ = z.s =
            d.createElement(s), e = d.getElementsByTagName(s)[0];
        z.set = function (o) {
            z.set._.push(o)
        };
        z._ = [];
        z.set._ = [];
        $.async = !0;
        $.setAttribute("charset", "utf-8");
        $.src = "//v2.zopim.com/?3mtUKq5VDHP1CzXIisq9l4FLLQtts154";
        z.t = +new Date;
        $.type = "text/javascript";
        e.parentNode.insertBefore($, e)
    })(document, "script");
</script>
<!--End of Zopim Live Chat Script--><!--Start of Zopim Live Chat Script-->
<script type="text/javascript">
    window.$zopim || (function (d, s) {
        var z = $zopim = function (c) {
            z._.push(c)
        }, $ = z.s =
            d.createElement(s), e = d.getElementsByTagName(s)[0];
        z.set = function (o) {
            z.set._.push(o)
        };
        z._ = [];
        z.set._ = [];
        $.async = !0;
        $.setAttribute('charset', 'utf-8');
        $.src = '//v2.zopim.com/?3kdUpEdbuPEdAdo9359jp8x3240c0AWg';
        z.t = +new Date;
        $.type = 'text/javascript';
        e.parentNode.insertBefore($, e)
    })(document, 'script');
</script>
<!--End of Zopim Live Chat Script-->
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
                <%--<tiles:insertAttribute name="header"/>--%>
                <tiles:insertAttribute name="nav"/>
                <section id="content" class="clearfix container">
                    <div id="blog">
                        <tiles:insertAttribute name="breadcurmb_blog"/>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="main-content row">
                                <!-- Begin content -->
                                <div class="blog-content col-md-12">
                                    <div class="row">
                                        <tiles:insertAttribute name="content_blog"/>
                                        <tiles:insertAttribute name="nav_blog"/>
                                    </div>
                                </div>
                            </div>
                            <!-- End content -->
                        </div>
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
<%--<div id="myCart" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="exampleModalLabel">
                    Bạn có <b></b> sản phẩm trong giỏ hàng
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <a aria-hidden="true"></a>
                </button>
            </div>
            <form action="/cart" method="post" id="cartform">
                <div class="modal-body">
                    <table style="width:100%;" id="cart-table">
                        <tr>
                            <th></th>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Giá tiền</th>
                            <th></th>
                        </tr>
                        <tr class="line-item original">
                            <td class="item-image"></td>
                            <td class="item-title">
                                <a></a>
                            </td>
                            <td class="item-quantity"></td>
                            <td class="item-price"></td>
                            <td class="item-delete"></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="modal-note">
                                <textarea placeholder="Viết ghi chú" id="note" name="note" rows="5"></textarea>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="total-price-modal">
                                Tổng cộng : <span class="item-total"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top:10px;">
                        <div class="col-lg-6">
                            <div class="comeback">
                                <a href="/collections/all">
                                    <img src="/resources/img/icon-tieptuc.png"/>Tiếp tục mua hàng
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-6 text-right">
                            <div class="buttons btn-modal-cart">
                                <button type="submit" class="button-default" id="checkout" name="checkout">
                                    Đặt hàng
                                </button>
                            </div>
                            <div class="buttons btn-modal-cart">
                                <button type="submit" class="button-default" id="update-cart-modal" name="">
                                    Cập nhật
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>--%>
<!-- Quick view -->
<div class="modal fade hidden-xs" id="quick-view-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="false">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="p-title   modal-title " id="">Tên sản phẩm</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <a aria-hidden="true"></a>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <form method="post" action="/cart/add">
                            <div class="col-lg-5 col-md-6">
                                <div class="image-zoom row">
                                    <img class="p-product-image-feature" src="">
                                    <div id="p-sliderproduct" class="flexslider">
                                        <ul class="slides"></ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-6 pull-right">
                                <div class="form-input">
                                    <div class="product-price">
                                        <span class="p-price"></span>
                                        <del></del>
                                    </div>
                                </div>
                                <div class="p-option-wrapper selector-wrapper">
                                </div>
                                <div class="form-input ">
                                    <label>Số lượng</label>
                                    <input name="count" type="number" min="1" value="1"/>
                                    <input name="productId" type="hidden" class="fill-product-id"/>
                                </div>

                                <div class="form-input" style="width: 100%">
                                    <button type="submit"
                                            class="btn-detail  btn-color-add btn-min-width btn-mgt btn-addcart">Thêm vào
                                        giỏ
                                    </button>
                                    <button disabled
                                            class="btn-detail addtocart btn-color-add btn-min-width btn-mgt btn-soldout">
                                        Hết hàng
                                    </button>
                                    <div class="qv-readmore">
                                        <span> hoặc </span><a class="read-more p-url" href="" role="button">Xem chi
                                        tiết</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-6 pull-right">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
    var callBack = function (product, selector) {
        if (product) {
            modal = $('#quick-view-modal');
            /*if (variant.compare_at_price > 0)
             modal.find('del').html(Haravan.formatMoney(variant.compare_at_price, "{{amount}}₫"));
             else
             modal.find('del').html('');*/
            if (product.isEffete == 0) {
                modal.find('.btn-addcart').css('display', 'block');
                modal.find('.btn-soldout').css('display', 'none');
            }
            else {
                modal.find('.btn-addcart').css('display', 'none');
                modal.find('.btn-soldout').css('display', 'block');
            }
        }
        else {
            modal.find('.btn-addcart').css('display', 'none');
            modal.find('.btn-soldout').css('display', 'block');
        }
    };
    var p_select_data = $('.p-option-wrapper').html();
    var p_zoom = $('.image-zoom').html();
    var quickViewProduct = function (purl) {
        if ($(window).width() < 680) {
            window.location = purl;
            return false;
        }
        modal = $('#quick-view-modal');
        modal.modal('show');
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/product_quitView/" + purl,
            dataType: 'json',
            timeout: 100000,
            async: false,
            success: function (product) {
                /*$.each(product.options, function (i, v) {
                 product.options[i] = v.name;
                 });*/
                modal.find('.p-title').html(product.name);
                modal.find('.p-option-wrapper').html(p_select_data);
                $('.image-zoom').html(p_zoom);
                modal.find('.p-url').attr('href', "/product/" + product.id);
                //$.each(product.variants, function (i, v) {
                //modal.find('select#p-select').append("<option value='" + product.id + "'>" + product.name + ' - ' + product.price + "đ</option>");
                //});
                if (product.code.length < 1)
                    $('.p-option-wrapper').hide();
                else
                    $('.p-option-wrapper').show();

                /* if (product.length == 1 && product.name.indexOf('Default') != -1) {
                 callBack(product, null);
                 }*/
                //else {
                //new Haravan.OptionSelectors("p-select", {product: product, onVariantSelected: callBack});
                //if (product.options.length == 1 && product.options[0].indexOf('Tiêu đề') == -1)
                modal.find('.p-option-wrapper').prepend('<label>' + product.code + '</label>');
                modal.find('.p-price').text(product.priceDisplay + "đ");
                modal.find('.fill-product-id').val(product.id);
                $(".modal-footer .btn-readmore").attr('href', "/product/" + product.id);
                /*$('.p-option-wrapper select:not(#p-select)').each(function () {
                 $(this).wrap('<span class="custom-dropdown custom-dropdown--white"></span>');
                 $(this).addClass("custom-dropdown__select custom-dropdown__select--white");
                 });*/
                callBack(product, null);
                //}
                if (product.img.length == 0) {
                    modal.find('.p-product-image-feature').attr('src', '/resources/img/no_img.gif');
                }
                else {
                    $('#p-sliderproduct').remove();
                    $('.image-zoom').append("<div id='p-sliderproduct'>");
                    $('#p-sliderproduct').append("<ul class='owl-carousel'>");
                    elem = $('<li class="item">').append('<a href="#" data-image="" data-zoom-image=""><img /></a>');
                    elem.find('a').attr('data-image', Haravan.resizeImage(product.img, 'medium'));
                    elem.find('a').attr('data-zoom-image', product.img);
                    elem.find('img').attr('data-image', Haravan.resizeImage(product.img, 'medium'));
                    elem.find('img').attr('data-zoom-image', product.img);
                    elem.find('img').attr('src', product.img);
                    modal.find('.owl-carousel').append(elem);
                    if(product.img1 != null){
                        elem1 = $('<li class="item">').append('<a href="#" data-image="" data-zoom-image=""><img /></a>');
                        elem1.find('a').attr('data-image', Haravan.resizeImage(product.img1, 'medium'));
                        elem1.find('a').attr('data-zoom-image', product.img1);
                        elem1.find('img').attr('data-image', Haravan.resizeImage(product.img1, 'medium'));
                        elem1.find('img').attr('data-zoom-image', product.img1);
                        elem1.find('img').attr('src', product.img1);
                        modal.find('.owl-carousel').append(elem1);
                    }
                    if(product.img2 != null){
                        elem2 = $('<li class="item">').append('<a href="#" data-image="" data-zoom-image=""><img /></a>');
                        elem2.find('a').attr('data-image', Haravan.resizeImage(product.img2, 'medium'));
                        elem2.find('a').attr('data-zoom-image', product.img2);
                        elem2.find('img').attr('data-image', Haravan.resizeImage(product.img2, 'medium'));
                        elem2.find('img').attr('data-zoom-image', product.img2);
                        elem2.find('img').attr('src', product.img2);
                        modal.find('.owl-carousel').append(elem2);
                    }
                    /*$.each(product.images, function (i, v) {
                     elem = $('<li class="item">').append('<a href="#" data-image="" data-zoom-image=""><img /></a>');
                     elem.find('a').attr('data-image', Haravan.resizeImage(v, 'medium'));
                     elem.find('a').attr('data-zoom-image', v);
                     elem.find('img').attr('data-image', Haravan.resizeImage(v, 'medium'));
                     elem.find('img').attr('data-zoom-image', v);
                     elem.find('img').attr('src', Haravan.resizeImage(v, 'small'));
                     modal.find('.owl-carousel').append(elem);
                     });*/
                    var owl = $('.owl-carousel');
                    owl.owlCarousel({
                        items: 3,
                        navigation: true,
                        navigationText: ['owl-prev', 'owl-next']
                    });
                    $('#p-sliderproduct .owl-carousel .owl-item').first().children('.item').addClass('active');
                    modal.find('.p-product-image-feature').attr('src', product.img);
                    $(".modal-footer .btn-readmore").attr('href', "/product/" + product.id);
                }

            }
        });

        //$('.modal-backdrop').css('opacity', '0');
        return false;
    };
    $('#quick-view-modal').on('click', '.item img', function (event) {
        event.preventDefault();
        modal = $('#quick-view-modal');
        modal.find('.p-product-image-feature').attr('src', $(this).attr('data-zoom-image'));
        modal.find('.item').removeClass('active');
        $(this).parents('li').addClass('active');
        return false;
    });

    $(document).on("click", ".mask img", function (event) {
        event.preventDefault();
        quickViewProduct($(this).attr('data-handle'));
    });

</script>
<!-- Quick view -->
<script>
    $(document).ready(function () {
        $('.t-fix').removeClass('in');
    })
</script>

<!-- Google Code for Chuy&#7875;n &#273;&#7893;i &#273;&#7863;t h&agrave;ng Conversion Page -->
<script type="text/javascript">
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
</noscript>


</body>

</html>

