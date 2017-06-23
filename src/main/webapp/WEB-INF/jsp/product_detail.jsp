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
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" id="main-sliderproduct">
            <c:if test="${product.isEffete == 1}">
                <div class="sold-out">Hết hàng</div>
            </c:if>
            <c:if test="${product.isEffete == 0}">
                <c:if test="${product.isNew == 1}">
                    <div class="sold-out">Sản phẩm mới</div>
                </c:if>
                <c:if test="${product.isSale == 1}">
                    <div class="sold-out">Sản khuyến mãi</div>
                </c:if>
            </c:if>
            <div id="surround">
                <a class="slide-prev slide-nav" href="javascript:">
                    <i class="fa fa-arrow-circle-o-left fa-2"></i>
                </a>
                <a class="slide-next slide-nav" href="javascript:">
                    <i class="fa fa-arrow-circle-o-right fa-2"></i>
                </a>
                <img id="product_detail" class="product-image-feature-detail" src="${product.img}" data-handle="${product.id}">
            </div>
            <div class="col-lg-5 col-md-6">
                <div class="image-zoom-detail row">
                    <div id="p-sliderproduct-detail" class="flexslider">
                        <ul class="slides"></ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="product-title">
                <h1>${product.name}</h1>
                <span id="pro_sku">${product.code}</span>
            </div>
            <div class="product-price" id="price-preview">
                <c:if test="${product.isSale == 0}">
                    <span class="pro-price">Giá bán: ${product.priceDisplay}₫</span>
                </c:if>
                <c:if test="${product.isSale == 1}">
                    <p class="pro-price">Giá bán: <strike>${product.priceDisplay}₫</strike></p>
                    <p class="pro-price">Giá khuyến mãi: ${product.salePriceDisplay}₫</p>
                </c:if>
            </div>
            <form:form id="add-item-form" class="variants clearfix">
                <div class="select-wrapper ">
                    <label>Số lượng</label>
                    <input id="quantity-detail" type="number" name="count" min="1" value="1" class="tc item-quantity">
                    <input id="productId-detail" name="productId" type="hidden" class="fill-product-id" value="${product.id}"/>
                    <input id="productName_detail" type="hidden" class="fill-product-id" value="${product.name}"/>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-12 col-sm-6 col-xs-12">
                        <c:if test="${product.isEffete == 0}">
                            <button type="button" id="add-to-cart-detail" class="btn-detail addtocart btn-color-add btn-min-width btn-mgt">
                                Thêm vào giỏ
                            </button>
                        </c:if>
                        <c:if test="${product.isEffete == 1}">
                            <button type="button" class="btn-color-add btn-min-width btn-mgt" disabled>
                                Thêm vào giỏ
                            </button>
                        </c:if>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-6 col-xs-12">
                        <c:if test="${product.isEffete == 0}">
                            <button type="submit" id="buy-now" class="btn-detail btn-color-buy btn-min-width btn-mgt" name="buyNow">
                                Mua ngay
                            </button>
                        </c:if>
                        <c:if test="${product.isEffete == 1}">
                            <button type="button" class="btn-detail btn-color-buy btn-min-width btn-mgt" disabled name="checkout">
                                Mua ngay
                            </button>
                        </c:if>
                    </div>
                </div>
            </form:form>

            <div class="pt20">
                <!-- Begin tags -->
                <div class="tag-wrapper">
                    <label>
                        Tags:
                    </label>
                    <ul class="tags">
                        <c:forEach items="${tagsOf}" var="t">
                            <li class="active">
                                <a href="/searchByTag/${t}">${t}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <!-- End tags -->
            </div>
            <div class="pt20">
                <!-- Begin social icons -->
                <div class="addthis_toolbox addthis_default_style ">
                    <div class="fb-root"></div>
                    <div class="fb-like" data-href="${pageContext.request.contextPath}" style="padding-bottom: 10px;"
                         data-layout="button_count" data-action="like" data-size="small" data-show-faces="true"
                         data-share="true"></div>
                    <script type="text/javascript">(function(d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) return;
                        js = d.createElement(s); js.id = id;
                        js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.9";
                        fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));
                    </script>

                    <%--<a class="addthis_button_tweet at300b">
                        <div class="tweet_iframe_widget" style="width: 62px; height: 25px;"><span><iframe
                                id="twitter-widget-0" scrolling="no" frameborder="0" allowtransparency="true"
                                class="twitter-share-button twitter-share-button-rendered twitter-tweet-button"
                                title="Twitter Tweet Button"
                                src="http://platform.twitter.com/widgets/tweet_button.5c39137502ea1894df4434ae5ed041c5.en.html#dnt=false&amp;id=twitter-widget-0&amp;lang=en&amp;original_referer=${pageContext.request.contextPath}.WP7FYfela3M.twitter"
                                style="position: static; visibility: visible; width: 60px; height: 20px;"
                                data-url="${pageContext.request.contextPath}#.WP7FYfela3M.twitter"></iframe></span>
                        </div>
                    </a>
                    <a class="addthis_button_pinterest_pinit at300b">
                        <div class="pin_it_iframe_widget" style="height: 25px;"><span><span
                                class="at_PinItButton"></span></span></div>
                    </a>--%>

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
                            ${product.description}
                        </p>

                    </div>
                </div>

                <div id="binhluan">
                    <div class="title-bl">
                        <h2>Bình luận</h2>
                    </div>
                    <div class="container-fluid">
                        <div id="fb-root"></div>
                        <div class="fb-comments" data-href="${pageContext.request.contextPath}" data-numposts="5" width="100%" data-colorscheme="light"></div>
                        <!-- script comment fb -->
                        <script type="text/javascript">(function(d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) return;
                            js = d.createElement(s); js.id = id;
                            js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.9";
                            fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));
                        </script>
                        <div style="position: absolute; top: -10000px; height: 0px; width: 0px;">
                            <div></div>
                        </div>
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
                                <c:if test="${r.isSale == 0}">
                                    <p class="pro-price">Giá bán: ${r.priceDisplay}₫</p>
                                </c:if>
                                <c:if test="${r.isSale == 1}">
                                    <p class="pro-price">Giá bán: <strike>${r.priceDisplay}₫</strike></p>
                                    <p class="pro-price">Giá khuyến mãi: ${r.salePriceDisplay}₫</p>
                                </c:if>
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
    </div>
</div>

<script>
    $(document).ready(function () {
        $('a[data-spy=scroll]').click(function () {
            event.preventDefault();
            $('body').animate({scrollTop: ($($(this).attr('href')).offset().top - 20) + 'px'}, 500);
        })
    });
    // The following piece of code can be ignored.
    $(function () {
        $(window).resize(function () {
            $('#info').text("Page width: " + $(this).width());
        });
        $(window).trigger('resize');
    });
    /*jQuery(document).ready(function ($) {
        debugger
    });*/
</script>

<script>
    $(document).ready(function () {
        var purl = $('#product_detail').attr('data-handle');
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/product_quitView/" + purl,
            dataType: 'json',
            timeout: 100000,
            async: false,
            success: function (product) {
                if (product.id > 0) {
                    $('.image-zoom-detail').html();
                    $('#p-sliderproduct-detail').remove();
                    $('.image-zoom-detail').append("<div id='p-sliderproduct-detail'>");
                    $('#p-sliderproduct-detail').append("<ul id='owl-carousel-detail' class='owl-carousel'>");
                    elem = $('<li class="item-detail">').append('<a id="main" href="#" data-image="" data-zoom-image=""><img id="main1" /></a>');
                    elem.find('#main').attr('data-image', Haravan.resizeImage(product.img, 'medium'));
                    elem.find('#main').attr('data-zoom-image', product.img);
                    elem.find('#main1').attr('data-image', Haravan.resizeImage(product.img, 'medium'));
                    elem.find('#main1').attr('data-zoom-image', product.img);
                    elem.find('#main1').attr('src', product.img);
                    $('#p-sliderproduct-detail').find('#owl-carousel-detail').append(elem);
                    if(product.img1 != null){
                        elem1 = $('<li class="item-detail">').append('<a id="www0" href="#" data-image="" data-zoom-image=""><img id="zzz0"/></a>');
                        elem1.find('#www0').attr('data-image', Haravan.resizeImage(product.img1, 'medium'));
                        elem1.find('#www0').attr('data-zoom-image', product.img1);
                        elem1.find('#zzz0').attr('data-image', Haravan.resizeImage(product.img1, 'medium'));
                        elem1.find('#zzz0').attr('data-zoom-image', product.img1);
                        elem1.find('#zzz0').attr('src', product.img1);
                        $('#p-sliderproduct-detail').find('#owl-carousel-detail').append(elem1);
                    }
                    if(product.img2 != null){
                        elem2 = $('<li class="item-detail">').append('<a id="www" href="#" data-image="" data-zoom-image=""><img id="zzz" /></a>');
                        elem2.find('#www').attr('data-image', Haravan.resizeImage(product.img2, 'medium'));
                        elem2.find('#www').attr('data-zoom-image', product.img2);
                        elem2.find('#zzz').attr('data-image', Haravan.resizeImage(product.img2, 'medium'));
                        elem2.find('#zzz').attr('data-zoom-image', product.img2);
                        elem2.find('#zzz').attr('src', product.img2);
                        $('#p-sliderproduct-detail').find('#owl-carousel-detail').append(elem2);
                    }
                    var owl = $('#owl-carousel-detail');
                    owl.owlCarousel({
                        items: 3,
                        navigation: true,
                        navigationText: ['owl-prev', 'owl-next']
                    });
                    $('#p-sliderproduct-detail #owl-carousel-detail .owl-item').first().children('.item-detail').addClass('active');
                    /*$('#p-sliderproduct').find('.p-product-image-feature').attr('src', product.img);*/
                    //$(".modal-footer .btn-readmore").attr('href', "/product/" + product.id);
                }

            }
        });
    });

    $('#main-sliderproduct').on('click', '.item-detail img', function (event) {
        event.preventDefault();
        modal = $('#main-sliderproduct');
        modal.find('.product-image-feature-detail').attr('src', $(this).attr('data-zoom-image'));
        modal.find('.item-detail').removeClass('active');
        $(this).parents('li').addClass('active');
        return false;
    });
</script>
