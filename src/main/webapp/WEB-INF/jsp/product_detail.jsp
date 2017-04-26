<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 25/04/2017
  Time: 10:39 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div id="wrapper-detail">
    <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div id="surround">
                <a class="slide-prev slide-nav" href="javascript:">
                    <i class="fa fa-arrow-circle-o-left fa-2"></i>
                </a>
                <a class="slide-next slide-nav" href="javascript:">
                    <i class="fa fa-arrow-circle-o-right fa-2"></i>
                </a>
                <img class="product-image-feature" src="${product.img}">
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="product-title">
                <h1>${product.name}</h1>
                <span id="pro_sku">${product.code}</span>
            </div>
            <div class="product-price" id="price-preview">
                <span>${product.priceDisplay}₫</span>
            </div>
            <form:form id="add-item-form" modelAttribute="cart" class="variants clearfix">
                <%--<div class="select clearfix" style="display:none">
                    <select id="product-select" name="id" style="display:none">
                        <option value="1012335205">Default Title - 300,000₫</option>
                    </select>
                </div>--%>
                <div class="select-wrapper ">
                    <label>Số lượng</label>
                    <input id="quantity" type="number" name="count" min="1" value="1" class="tc item-quantity">
                    <input name="productId" type="hidden" class="fill-product-id" value="${product.id}"/>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-12 col-sm-6 col-xs-12">
                        <c:if test="${product.isEffete == 0}">
                            <button type="submit" id="add-to-cart" class=" btn-detail addtocart btn-color-add btn-min-width btn-mgt"
                                    name="addToCart">
                                Thêm vào giỏ
                            </button>
                        </c:if>
                        <c:if test="${product.isEffete == 1}">
                            <button type="submit" id="add-to-cart" class=" btn-detail addtocart btn-color-add btn-min-width btn-mgt"
                                    name="addToCart" disabled>
                                Thêm vào giỏ
                            </button>
                        </c:if>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-6 col-xs-12">
                        <c:if test="${product.isEffete == 0}">
                            <button type="submit" id="buy-now" class=" btn-detail btn-color-buy btn-min-width btn-mgt" name="buyNow">
                                Mua ngay
                            </button>
                        </c:if>
                        <c:if test="${product.isEffete == 1}">
                            <button type="submit" id="buy-now" class=" btn-detail btn-color-buy btn-min-width btn-mgt" disabled name="checkout">
                                Mua ngay
                            </button>
                        </c:if>
                    </div>
                </div>
            </form:form>

            <div class="pt20">
                <!-- Begin tags -->
                <!-- End tags -->
            </div>
            <div class="pt20">
                <!-- Begin social icons -->
                <div class="addthis_toolbox addthis_default_style ">
                    <a class="addthis_button_facebook_like at300b" fb:like:layout="button_count">
                        <div class="fb-like fb_iframe_widget" data-layout="button_count" data-show_faces="false"
                             data-share="false" data-action="like" data-width="90" data-height="25"
                             data-font="arial"
                             data-href="${pageContext.request.contextPath}"
                             data-send="false" style="height: 25px;" fb-xfbml-state="rendered"
                             fb-iframe-plugin-query="action=like&amp;app_id=&amp;container_width=68&amp;font=arial&amp;height=25&amp;href=http%3A%2F%2Ftramhuongkyanh.com%2Fproducts%2Flo-xong-tram-dung-dien-lx100&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;send=false&amp;share=false&amp;show_faces=false&amp;width=90">
                                <span style="vertical-align: bottom; width: 68px; height: 20px;"><iframe
                                        name="fd05ca4354b12c" width="90px" height="25px" frameborder="0"
                                        allowtransparency="true" allowfullscreen="true" scrolling="no"
                                        title="fb:like Facebook Social Plugin"
                                        src="https://www.facebook.com/v2.0/plugins/like.php?action=like&amp;app_id=&amp;channel=http%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2F96nq-xsaNcg.js%3Fversion%3D42%23cb%3Df326ddd1e6a80f8%26domain%3Dtramhuongkyanh.com%26origin%3Dhttp%253A%252F%252Ftramhuongkyanh.com%252Ffe394b654e88d4%26relation%3Dparent.parent&amp;container_width=68&amp;font=arial&amp;height=25&amp;href=http%3A%2F%2Ftramhuongkyanh.com%2Fproducts%2Flo-xong-tram-dung-dien-lx100&amp;layout=button_count&amp;locale=vi_VN&amp;sdk=joey&amp;send=false&amp;share=false&amp;show_faces=false&amp;width=90"
                                        style="border: none; visibility: visible; width: 68px; height: 20px;"
                                        class=""></iframe></span></div>
                    </a>

                    <a class="addthis_button_tweet at300b">
                        <div class="tweet_iframe_widget" style="width: 62px; height: 25px;"><span><iframe
                                id="twitter-widget-0" scrolling="no" frameborder="0" allowtransparency="true"
                                class="twitter-share-button twitter-share-button-rendered twitter-tweet-button"
                                title="Twitter Tweet Button"
                                src="http://platform.twitter.com/widgets/tweet_button.5c39137502ea1894df4434ae5ed041c5.en.html#dnt=false&amp;id=twitter-widget-0&amp;lang=en&amp;original_referer=http%3A%2F%2Ftramhuongkyanh.com%2Fproducts%2Flo-xong-tram-dung-dien-lx100&amp;size=m&amp;text=L%C3%B2%20X%C3%B4ng%20Tr%E1%BA%A7m%20D%C3%B9ng%20%C4%90i%E1%BB%87n%20-%20LX100&amp;time=1493091682957&amp;type=share&amp;url=http%3A%2F%2Ftramhuongkyanh.com%2Fproducts%2Flo-xong-tram-dung-dien-lx100%23.WP7FYfela3M.twitter"
                                style="position: static; visibility: visible; width: 60px; height: 20px;"
                                data-url="${pageContext.request.contextPath}#.WP7FYfela3M.twitter"></iframe></span>
                        </div>
                    </a>
                    <a class="addthis_button_pinterest_pinit at300b">
                        <div class="pin_it_iframe_widget" style="height: 25px;"><span><span
                                class="at_PinItButton"></span></span></div>
                    </a>

                    <a class="addthis_counter addthis_pill_style" href="#" style="display: inline-block;"><a
                            class="atc_s addthis_button_compact">Share<span></span></a><a
                            class="addthis_button_expanded" target="_blank" title="More" href="#"></a></a>
                    <div class="atclear"></div>
                </div>
                <!--<script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>-->
                <script async="" type="text/javascript"
                        src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4d89903e1583a34e"></script>
                <!-- AddThis Button END -->

                <!-- End social icons -->
            </div>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top:20px;">
            <div role="tabpanel" class="product-comment">
                <!-- Nav tabs -->
                <ul class="nav visible-lg visible-md" role="tablist">
                    <li role="presentation" class="active"><a data-spy="scroll" data-target="#mota" href="#mota"
                                                              aria-controls="mota" role="tab">Mô tả sản phẩm</a>
                    </li>
                    <li role="presentation">
                        <a data-spy="scroll" href="#binhluan" aria-controls="binhluan" role="tab">Bình luận</a>
                    </li>
                    <li role="presentation">
                        <a data-spy="scroll" href="#like" aria-controls="like" role="tab">Sản phẩm khác</a>
                    </li>
                </ul>
                <!-- Tab panes -->

                <div id="mota">

                    <div class="title-bl visible-xs visible-sm">
                        <h2>Mô tả</h2>
                    </div>

                    <div class="container-fluid product-description-wrapper">

                        <p style="font-family: verdana; font-size: medium; text-align: justify;"
                           data-mce-style="font-family: verdana; font-size: medium; text-align: justify;"><strong
                                style="text-align: start;" data-mce-style="text-align: start;"></strong>
                            <label style="white-space: pre;">${product.description}</label>
                        </p>

                    </div>
                </div>

                <div id="binhluan">
                    <div class="title-bl">
                        <h2>Bình luận</h2>
                    </div>
                    <div class="container-fluid">
                        <div id="fb-root" class=" fb_reset">
                            <div style="position: absolute; top: -10000px; height: 0px; width: 0px;">
                                <div>
                                    <iframe name="fb_xdm_frame_http" frameborder="0" allowtransparency="true"
                                            allowfullscreen="true" scrolling="no" id="fb_xdm_frame_http"
                                            aria-hidden="true" title="Facebook Cross Domain Communication Frame"
                                            tabindex="-1"
                                            src="http://staticxx.facebook.com/connect/xd_arbiter/r/96nq-xsaNcg.js?version=42#channel=fe394b654e88d4&amp;origin=http%3A%2F%2Ftramhuongkyanh.com"
                                            style="border: none;"></iframe>
                                    <iframe name="fb_xdm_frame_https" frameborder="0" allowtransparency="true"
                                            allowfullscreen="true" scrolling="no" id="fb_xdm_frame_https"
                                            aria-hidden="true" title="Facebook Cross Domain Communication Frame"
                                            tabindex="-1"
                                            src="https://staticxx.facebook.com/connect/xd_arbiter/r/96nq-xsaNcg.js?version=42#channel=fe394b654e88d4&amp;origin=http%3A%2F%2Ftramhuongkyanh.com"
                                            style="border: none;"></iframe>
                                </div>
                            </div>
                            <div style="position: absolute; top: -10000px; height: 0px; width: 0px;">
                                <div></div>
                            </div>
                        </div>
                        <div class="fb-comments fb_iframe_widget fb_iframe_widget_fluid"
                             data-href="${pageContext.request.contextPath}"
                             data-numposts="5" width="100%" data-colorscheme="light" fb-xfbml-state="rendered"><span
                                style="height: 176px;"><iframe id="f319695ae68ec78" name="f10a124622e4184"
                                                               scrolling="no" title="Facebook Social Plugin"
                                                               class="fb_ltr fb_iframe_widget_lift"
                                                               src="https://www.facebook.com/plugins/comments.php?api_key=&amp;channel_url=http%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2F96nq-xsaNcg.js%3Fversion%3D42%23cb%3Df28eadbf75dd1f8%26domain%3Dtramhuongkyanh.com%26origin%3Dhttp%253A%252F%252Ftramhuongkyanh.com%252Ffe394b654e88d4%26relation%3Dparent.parent&amp;colorscheme=light&amp;href=http%3A%2F%2Ftramhuongkyanh.com%2Fproducts%2Flo-xong-tram-dung-dien-lx100&amp;locale=vi_VN&amp;numposts=5&amp;sdk=joey&amp;skin=light&amp;version=v2.0&amp;width=100%25"
                                                               style="border: none; overflow: hidden; height: 176px; width: 100%;"></iframe></span>
                        </div>
                        <!-- script comment fb -->
                        <script type="text/javascript">(function (d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) return;
                            js = d.createElement(s);
                            js.id = id;
                            js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.0";
                            fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));
                        </script>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="col-md-12 list-like">
    <div id="like">
        <div class="title-like">
            <h2>Sản phẩm khác</h2>
        </div>
        <div class="row product-list ">
            <div class="content-product-list">
                <c:forEach items="${relations}" var="r">
                    <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                        <div class="product-block product-resize fixheight" style="height: 345px;">
                            <div class="product-img image-resize view view-third clearfix" style="height: 255px;">
                                <c:if test="${r.isEffete == 1}">
                                    <div class="sold-out">Hết hàng</div>
                                </c:if>
                                <c:if test="${r.isEffete == 0}">
                                    <c:if test="${r.isNew == 1}">
                                        <div class="sold-out">Sản phẩm mới</div>
                                    </c:if>
                                    <c:if test="${r.isSale == 1}">
                                        <div class="sold-out">Sản khuyến mãi</div>
                                    </c:if>
                                </c:if>
                                <a href="/product/${r.id}">
                                    <div class="mask">
                                        <img src="/resources/img/quick-look.png"
                                             data-handle="${r.id}">
                                    </div>
                                    <img src="${r.img}">
                                </a>
                            </div>
                            <div class="product-detail clearfix">
                                <!-- sử dụng pull-left -->
                                <p class="pro-price">${r.priceDisplay}₫</p>
                                <p class="pro-price-del text-left">
                                </p>
                                <h3 class="pro-name"><a
                                        href="/product/${r.id}">${r.name} </a></h3>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <script>
            var add_to_wishlist = function () {
                if (typeof(Storage) !== "undefined") {
                    if (localStorage.recently_viewed) {

                        if (localStorage.recently_viewed.indexOf('1st-birthday-princess-basic-party-kit-18-guests') == -1)
                            localStorage.recently_viewed = '1st-birthday-princess-basic-party-kit-18-guests_' + localStorage.recently_viewed;

                    } else
                        localStorage.recently_viewed = '1st-birthday-princess-basic-party-kit-18-guests';
                }
                else {
                    console.log('Your Browser does not support storage!');
                }
            }
        </script>
    </div>
</div>

<script>
    $(".product-thumb img").click(function () {
        $(".product-thumb").removeClass('active');
        $(this).parents('li').addClass('active');
        $(".product-image-feature").attr("src", $(this).attr("data-image"));
        $(".product-image-feature").attr("data-zoom-image", $(this).attr("data-zoom-image"));
    });

    $(".product-thumb").first().addClass('active');

</script>
<script>
    /*$(document).ready(function () {
        $('#add-to-cart').click(function () {
            var params = {
                type: 'POST',
                url: '/cart/add.js',
                async: false,
                data: jQuery('#add-item-form-2').serialize(),
                dataType: 'json',
                success: function (line_item) {
                    if ((typeof callback) === 'function') {
                        callback(line_item);
                    } else {

                        getCartAjax();
                        $('#myCart').modal('show');
                        $('.modal-backdrop').css({'height': $(document).height(), 'z-index': '99'});
                    }
                },
                error: function (XMLHttpRequest, textStatus) {
                    Haravan.onError(XMLHttpRequest, textStatus);
                }
            };
            jQuery.ajax(params);
        });
        $('#buy-now').click(function (e) {
            e.preventDefault();
            var params = {
                type: 'POST',
                url: '/cart/add.js',
                async: false,
                data: jQuery('#add-item-form').serialize(),
                dataType: 'json',
                success: function (line_item) {
                    window.location = '/checkout';
                },
                error: function (XMLHttpRequest, textStatus) {
                    Haravan.onError(XMLHttpRequest, textStatus);
                }
            };
            jQuery.ajax(params);
        });
    });*/
</script>
<script>
    $(document).ready(function () {
        $('a[data-spy=scroll]').click(function () {
            event.preventDefault();
            $('body').animate({scrollTop: ($($(this).attr('href')).offset().top - 20) + 'px'}, 500);
        })
    });


    /*function deleteCart(variant_id) {
        var params = {
            type: 'POST',
            url: '/cart/change.js',
            data: 'quantity=0&id=' + variant_id,
            dataType: 'json',
            success: function (cart) {
                if ((typeof callback) === 'function') {
                    callback(cart);
                } else {

                    getCartAjax();
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                Haravan.onError(XMLHttpRequest, textStatus);
            }
        };
        jQuery.ajax(params);
    }*/
    // The following piece of code can be ignored.
    $(function () {
        $(window).resize(function () {
            $('#info').text("Page width: " + $(this).width());
        });
        $(window).trigger('resize');
    });


    /*var selectCallback = function (variant, selector) {
        if (variant && variant.available) {
            if (variant.featured_image != null) {
                $(".product-thumb").removeClass('active');
                $(".product-thumb img[data-image='" + Haravan.resizeImage(variant.featured_image.src, 'master') + "']").click().parents('li').addClass('active');
            }
            if (variant.sku != null) {
                jQuery('#pro_sku').html('SKU: ' + variant.sku);
            }
            jQuery('#add-to-cart').removeAttr('disabled').removeClass('disabled').html("Thêm vào giỏ");
            ;
            jQuery('#buy-now').removeAttr('disabled').removeClass('disabled').html("Mua ngay").show();

            if (variant.price < variant.compare_at_price) {
                jQuery('#price-preview').html("<span>" + Haravan.formatMoney(variant.price, "{{amount}}₫") + "</span><del>" + Haravan.formatMoney(variant.compare_at_price, "{{amount}}₫") + "</del>");
                var pro_sold = variant.price;
                var pro_comp = variant.compare_at_price / 100;
                var sale = 100 - (pro_sold / pro_comp);
                var kq_sale = Math.round(sale);
                jQuery('#surround .product-sale span').html("<label class='sale-lb'>Sale</label> " + kq_sale + '%');
            } else {
                jQuery('#price-preview').html("<span>" + Haravan.formatMoney(variant.price, "{{amount}}₫" + "</span>"));
            }

        } else {
            jQuery('#add-to-cart').addClass('disabled').attr('disabled', 'disabled').html("Hết hàng");
            jQuery('#buy-now').addClass('disabled').attr('disabled', 'disabled').html("Hết hàng").hide();
            var message = variant ? "Hết hàng" : "Không có hàng";
            jQuery('#price-preview').text(message);
        }
    };*/


    jQuery(document).ready(function ($) {
        debugger
    });
</script>
<script>
    $(document).ready(function () {
        if ($(".slides .product-thumb").length > 4) {
            $('#sliderproduct').flexslider({
                animation: "slide",
                controlNav: false,
                animationLoop: false,
                slideshow: false,
                itemWidth: 95,
                itemMargin: 10,
            });
        }
        if ($(window).width() > 960) {
            jQuery(".product-image-feature").elevateZoom({
                gallery: 'sliderproduct',
                scrollZoom: true
            });
        } else {

        }
        jQuery('.slide-next').click(function () {
            if ($(".product-thumb.active").prev().length > 0) {
                $(".product-thumb.active").prev().find('img').click();
            }
            else {
                $(".product-thumb:last img").click();
            }
        });
        jQuery('.slide-prev').click(function () {
            if ($(".product-thumb.active").next().length > 0) {
                $(".product-thumb.active").next().find('img').click();
            }
            else {
                $(".product-thumb:first img").click();
            }
        });
    });
</script>