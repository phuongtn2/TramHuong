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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<!--[if lt IE 7]><html class="no-js ie6 oldie" lang="en"><![endif]-->
<!--[if IE 7]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if IE 8]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="pragma" content="no-cache">
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
    <spring:url value="/resources/css/style.3.1.css" var="cs31" />
    <link href="${cs31}" rel="stylesheet" type="text/css"/>
</head>
<body style="background-color: #333300;" onload="onloadChat();">
<div class="zopim" __jx__id="___$_61 ___$_61"
     style="margin-top: 0px; margin-right: 0px; margin-bottom: 0px; padding: 0px; border: 0px; background: transparent; overflow: hidden; position: fixed; z-index: 16000002; height: 30px; right: 50px; bottom: 0px; width: 120px;">
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
         page_id="1382882181793393"
         data-ref="PASS_THROUGH_PARAM"
         color="blue"
         size="standard">
    </div>--%>
    <div class="fb-messengermessageus"
         messenger_app_id="1832292157092575"
         page_id="1382882181793393"
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
                    <%--<tiles:insertAttribute name="row_content"/>--%>
                    <tiles:insertAttribute name="aside"/>
                    <div id="collection">
                        <div class="col-md-9 col-sm-12 col-xs-12">
                            <div class="row">
                                <div class="main-content">
                                    <tiles:insertAttribute name="breadcurmb"/>
                                    <tiles:insertAttribute name="sort"/>
                                    <tiles:insertAttribute name="content"/>
                                    <c:if test="${productList != null && productList.size() > 0}">
                                        <tiles:insertAttribute name="pagging"/>
                                    </c:if>
                                </div>
                            </div>
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
                        <%--<form method="post" action="/cart/add">--%>
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
                                    <p class="p-price"></p>
                                    <p class="p-price-sale"></p>
                                    <del></del>
                                </div>
                            </div>
                            <div class="p-option-wrapper selector-wrapper">
                            </div>
                            <div class="form-input ">
                                <label>Số lượng</label>
                                <input id="quantity" name="count" type="number" min="1" value="1"/>
                                <input id="productId" name="productId" type="hidden" class="fill-product-id"/>
                            </div>

                            <div class="form-input" style="width: 100%">
                                <button type="button"
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
                        <%--</form>--%>
                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="checkCart-Error" role="dialog" tabindex="-1" aria-hidden="false" style="z-index: 9999999;">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="background-color: #808000;">
                <h4 class="modal-title text-center">Lỗi</h4>
            </div>
            <div class="modal-body text-center">
                <p style="color: red;">Số lượng sản phẩm nhập không hợp lệ</p>
                <p>Số lượng sản phẩm không được để trống và phải lớn hơn 0</p>
            </div>
            <div class="modal-header text-center" style="background-color: #808000;">
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="checkCart-Error-99" role="dialog" tabindex="-1" aria-hidden="false" style="z-index: 9999999;">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="background-color: #808000;">
                <h4 class="modal-title text-center">Xác nhận</h4>
            </div>
            <div class="modal-body text-center">
                <p style="color: red;" id="confirm-message"></p>
                <p>Bạn có chắc chắn không?.</p>
            </div>
            <div class="modal-header text-center" style="background-color: #808000;">
                <button onclick="accept();"  class="btn btn-primary" type="button" data-dismiss="modal" style="background-color: #337ab7;">Có</button>
                <button onclick="revertValue();" type="button" class="btn btn-default" data-dismiss="modal">Không</button>
            </div>
        </div>
    </div>
</div>
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
            window.location = "/product/" + purl;
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
                modal.find('.p-title').html(product.name);
                modal.find('.p-option-wrapper').html(p_select_data);
                $('.image-zoom').html(p_zoom);
                modal.find('.p-url').attr('href', "/product/" + product.id);
                if (product.code.length < 1)
                    $('.p-option-wrapper').hide();
                else
                    $('.p-option-wrapper').show();
                modal.find('.p-option-wrapper').prepend('<label>' + product.code + '</label>');
                modal.find('.p-price').text('');
                modal.find('.p-price-sale').text('');
                if(product.isSale == 1) {
                    modal.find('.p-price').prepend('Giá bán: ' + '<strike>' + product.priceDisplay + 'đ</strike>');
                    modal.find('.p-price-sale').text('Giá khuyến mãi: ' + product.salePriceDisplay + "đ");
                }else{
                    modal.find('.p-price').text('Giá bán: ' + product.priceDisplay + "đ");
                }
                modal.find('.fill-product-id').val(product.id);
                $(".modal-footer .btn-readmore").attr('href', "/product/" + product.id);
                callBack(product, null);
                if (product.img.length == 0) {
                    modal.find('.p-product-image-feature').attr('src', '/resources/img/no_img.gif');
                }
                else {
                    $('#p-sliderproduct').remove();
                    $('.image-zoom').append("<div id='p-sliderproduct'>");
                    $('#p-sliderproduct').append("<ul id='owId' class='owl-carousel'>");
                    elem = $('<li class="item">').append('<a href="#" data-image="" data-zoom-image=""><img id="main_img"/></a>');
                    elem.find('a').attr('data-image', Haravan.resizeImage(product.img, 'medium'));
                    elem.find('a').attr('data-zoom-image', product.img);
                    elem.find('#main_img').attr('data-image', Haravan.resizeImage(product.img, 'medium'));
                    elem.find('#main_img').attr('data-zoom-image', product.img);
                    elem.find('#main_img').attr('src', product.img);
                    modal.find('#owId').append(elem);
                    if(product.img1 != null){
                        elem1 = $('<li class="item">').append('<a href="#" data-image="" data-zoom-image=""><img id="img1" /></a>');
                        elem1.find('a').attr('data-image', Haravan.resizeImage(product.img1, 'medium'));
                        elem1.find('a').attr('data-zoom-image', product.img1);
                        elem1.find('#img1').attr('data-image', Haravan.resizeImage(product.img1, 'medium'));
                        elem1.find('#img1').attr('data-zoom-image', product.img1);
                        elem1.find('#img1').attr('src', product.img1);
                        modal.find('#owId').append(elem1);
                    }
                    if(product.img2 != null){
                        elem2 = $('<li class="item">').append('<a href="#" data-image="" data-zoom-image=""><img id="img2" /></a>');
                        elem2.find('a').attr('data-image', Haravan.resizeImage(product.img2, 'medium'));
                        elem2.find('a').attr('data-zoom-image', product.img2);
                        elem2.find('#img2').attr('data-image', Haravan.resizeImage(product.img2, 'medium'));
                        elem2.find('#img2').attr('data-zoom-image', product.img2);
                        elem2.find('#img2').attr('src', product.img2);
                        modal.find('#owId').append(elem2);
                    }
                    var owl = $('#owId');
                    owl.owlCarousel({
                        items: 3,
                        navigation: true,
                        navigationText: ['owl-prev', 'owl-next']
                    });
                    $('#p-sliderproduct #owId').first().children('.item').addClass('active');
                    modal.find('.p-product-image-feature').attr('src', product.img);
                    $(".modal-footer .btn-readmore").attr('href', "/product/" + product.id);
                }

            }
        });
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
    function submitSort(){
        document.getElementById("sortForm").submit();
    };
    function submit(name){
        $('#operator-cart').attr('name', name);
        document.getElementById("cartformpage").submit();
    };
    function accept(){
        var name = localStorage.getItem('type-99');
        if(name != 'addCart'){
            $('#operator-cart').attr('name', name);
            document.getElementById("cartformpage").submit();
        }else{
            addCartSuccess();
        }
        return;
    };
    function revertValue() {
        var retrievedObject = localStorage.getItem('id-99');
        var oValue = localStorage.getItem('o-99');
        $(retrievedObject).val(oValue);
        localStorage.clear();
    }

    function checkAddCartOrByNow(){
        var quickModal = $('#quick-view-modal');
        var modal = $('#checkCart-Error');
        var modal_99 = $('#checkCart-Error-99');

        var valueCount = quickModal.find('#quantity').val();
        if(valueCount == null || valueCount <= 0){
            modal.modal('show');
            return false;
        }
        if(valueCount > 99){
            modal_99.find('#confirm-message').empty();
            var productName = quickModal.find('.p-title').text();
            modal_99.find('#confirm-message').append('<span>Số lượng đặt mua của sản phẩm [' + productName + '] là: ' + valueCount + '.</span>');
            localStorage.setItem('id-99', '#quantity');
            localStorage.setItem('o-99', 1);
            localStorage.setItem('type-99', 'addCart');
            modal_99.modal('show');
            return false;
        }
        return true;
    }

    function addCartSuccess() {
        var data = {};
        data["count"] = $('#quantity').val();
        data["productId"] = $('#productId').val();
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/cart/add",
            data: JSON.stringify(data),
            dataType: 'json',
            timeout: 100000,
            async: false,
            success: function (count) {
                //$('#cart-count').text(count);
                $("#cart-count-mobile").empty();
                $("#cart-count").empty();
                $("#cart-count-mobile").append('<span id="#cart-count-mobile-temp">' + count + '</span>');
                $("#cart-count").append('<span id="#cart-count-temp">' + count + '</span>');
                modal = $('#quick-view-modal');
                modal.modal('hide');
            }
        });
    }
    $(document).on("click", ".btn-addcart", function (event) {
        var flg = checkAddCartOrByNow();
        if(flg === true){
            addCartSuccess();
        }
        return false;
    });

    $(document).ready(function () {
        if (!!window.performance && window.performance.navigation.type === 2) {
            // value 2 means "The page was accessed by navigating into the history"
            console.log('Reloading');
            window.location.reload(); // reload whole page

        }
        $('.t-fix').removeClass('in');
        function change(id) {
            var listId = ["_1", "_2", "_3" , "_5", "_6"];
            for (i = 0; i <=  listId.length; i++) {
                if(id === listId[i]){
                    $('#'+listId[i]).addClass( "active" );
                }else{
                    $('#'+listId[i]).removeClass( "active" );
                }
                if(id === "_3"){
                    $('#nav_blog_post').addClass( "current active" );
                }else{
                    $('#nav_blog_post').removeClass( "current active" );
                }
            }
            return;
        }
    });
</script>
</body>

</html>

