<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 24/04/2017
  Time: 8:42 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <spring:url value="/resources/img/favicon/favicon.png" var="fava"/>
    <link rel="shortcut icon" href="${fava}" type="image/png"/>
    <title>
        Trầm Hương Tuấn Anh - Thanh toán đơn hàng
    </title>

    <spring:url value="/resources/css/checkout1.css" var="a" />
    <link href="${a}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/css/checkout2.css" var="b" />
    <link href="${b}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/js/jquery-2.1.1.js" var="jqueryJs" />
    <script src="${jqueryJs}"></script>
    <spring:url value="/resources/js/jquery.validate.js" var="validateJs" />
    <script src="${validateJs}"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2, user-scalable=no">

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
        Haravan.theme = {"name": "Admin", "id": 1000151899, "role": "main"};
        Haravan.domain = '${pageContext.request.contextPath}';
        //]]>
    </script>

    <script type="text/javascript">
        var parseQueryString = function () {

            var str = window.location.search;
            var objURL = {};

            str.replace(
                new RegExp("([^?=&]+)(=([^&]*))?", "g"),

                function ($0, $1, $2, $3) {
                    if ($3 != undefined && $3 != null)
                        objURL[$1] = decodeURIComponent($3);
                    else
                        objURL[$1] = $3;
                });
            return objURL;
        };
        var params = parseQueryString();
        var flag = true;
        $(document).ready(function () {

            // submit function
           /* var submitFormStep1 = function () {
                var fvaild = true;
                var $this = $(this);

                if ($(this).attr('required') && ($(this).val() == "" || $(this).val() == null)) {
                    fvaild = false;
                    $(this).valid();
                }
                if (fvaild) {
                    $(".form-group .formcontrol").each(function () {
                        if ($(this).attr('required') && ($(this).val() == "" || $(this).val() == null)) {
                            fvaild = false;
                        }
                    });
                }
                if (fvaild) {

                    $(".summary").hide();
                    $('.listerror').html('');

                    /!*$.ajax({
                        type: "POST",
                        url: $("#purchase-form").attr("action"),
                        data: $("#purchase-form").serialize(), // serializes the form's elements.
                        success: function (data) {
                            if (data.pm_changed) {
                                if (data.pm != null && data.pm != undefined && data.pm != "") {
                                    var ajaxdata = $.parseJSON(data.pm);
                                    $(".shiping-ajax").html('');
                                    $(ajaxdata).each(function () {
                                        var instr = $(this)[0].instruction != null ? $(this)[0].instruction : '';
                                        $(".shiping-ajax").append('<label class="lb-method"> <input class="input-method" type="radio"  name="gateway" value="' + $(this)[0].id + '"> <span class="label-radio"> ' + $(this)[0].name + '</span> </label><span class="desc" >' + instr + '</span>');
                                    });
                                    $(".shiping-ajax input:first").attr("checked", "checked").change();
                                }
                            }

                            /!*if (data.orderid == undefined) {
                                $("#purchase-form").attr("action", "/checkout/create_order");
                                $("#discount-apply").val("/checkout/create_order");
                            }
                            else {

                                $("#purchase-form").attr("action", "/orders/" + data.orderid + "/pay");
                                $("#discount-apply").val("/orders/" + data.orderid + "/apply_discount");

                                $("#ab_number_fn").val(data.orderid);
                                $("#ab_number").val(data.orderid);
                            }*!/

                            /!*if (data.error) {
                                if (data.message != undefined && data.message != "") {
                                    $('.listerror').html('<div class="error">' + data.message + '</div>');
                                    $(".drop_shipping, .h-shipping").hide();

                                    return false;
                                }
                            }*!/

                            /!*var json = $.parseJSON(data.data);

                            $(".drop_shipping").html("");
                            $(json).each(function () {

                                if ($(this)[0].shipping_district_rates && $(this)[0].shipping_district_rates.length > 0 && $('#shipping_district') && ($('#shipping_district').val() != "" && $('#shipping_district').val() != null)) {
                                    for (var i = 0; i < $(this)[0].shipping_district_rates.length; i++) {
                                        var _districtRate = $(this)[0].shipping_district_rates[i];
                                        var _provinceId = $('#billing_address_province').val();
                                        var _districtId = $('#shipping_district').val();
                                        if (_districtRate.province_id == _provinceId && _districtRate.district_id == _districtId) {
                                            $(".drop_shipping").append("<option value='" + $(this)[0].id + "'>" + $(this)[0].name + " - " + _districtRate.final_rate + "</option>");
                                        }
                                    }
                                }
                                else {
                                    $(".drop_shipping").append("<option value='" + $(this)[0].id + "'>" + $(this)[0].name + " - " + $(this)[0].shipping_price + "</option>");
                                }

                            });*!/

                            /!*if ($(".drop_shipping option").length > 0) {
                                $(".drop_shipping").change();
                                $(".drop_shipping, .h-shipping").show();

                                if ($.inArray($this[0], $("#billing_address_province,#order_email,#shipping_district")) >= 0 && $this.attr('required')) {
                                    removeCoupon();
                                }
                            } else {
                                $(".drop_shipping, .h-shipping").hide();
                            }*!/
                        }
                    });*!/
                } else {
                    $(".summary").show();
                    //$(".drop_shipping, .h-shipping").hide();
                }
            };*/

           /* if (params["provinceId"] != undefined) {
                $("#billing_address_province").val(params["provinceId"]);
            }*/
            if (params["description"] != undefined) {
                $("#billing_note").val(params["description"]);
            }

            $("#purchase-form").validate({
                errorPlacement: function () {
                    return false;
                },
                rules: {
                    'tel': {
                        minlength: 8,
                        maxlength: 11,
                        number: true
                    }
                }
            });
            //Lấy thông tin browWWserWW
            /*$.ajax({
                type: 'POST',
                url: '/browser-info?w=' + $(window).width() + '&h=' + $(window).height(),
                success: function () {
                }
            });*/
            $("#Loading").hide();
            //Hiện loading khi ajax
            $(document).ajaxStart(function () {
                $('.overlay').show();
                $("#Loading").show();
            }).ajaxStop(function () {
                $("#Loading").hide();
                $('.overlay').hide();
            });
            //Hien mo tả field form


            // Hiện ẩn hiện thông tin mô tả hình thức thanh toán
            $('.shiping-ajax').on('change', ".input-method", function () {
                if ($(this).is(":checked")) {
                    var checkinput = $(this).parent(".lb-method");
                    if (checkinput.next('.desc').is(":hidden") && checkinput.next('.desc').text().trim() != "") {
                        $('.desc').slideUp();
                        checkinput.next('.desc').slideDown().css('display', 'block');
                    }
                }
            });
            //Hiện thông tin mô tả default
            $(".input-method:checked").parent(".lb-method").next('.desc').slideDown().css('display', 'block');

            // Lấy phương thức vẩn chuyển sau khi thay đổi hình thức thanh toán
            /*$(".drop_shipping").change(function () {
                var $this = $(this);
                if ($this.val() == null || $('#billing_address_province').val() == null)
                    return;
                $.ajax({
                    type: "GET",
                    url: '/checkout/get_shipping?id=' + $('#ab_number_fn').val() + '&shipping_rate=' + $this.val() + '&province_id=' + $('#billing_address_province').val() + '&district_id=' + $('#shipping_district').val(),
                    success: function (data) {
                        $(".shiping-price label").html(data.sp_price);
                        $(".total-checkout span").html(data.tt_price);


                        if (data.error) {
                            $('.listerror').html('<div class="error">Không tìm thấy phương thức vận chuyển.</div>');
                            //$(".drop_shipping, .h-shipping").hide();
                        }
                    }
                });
            });*/

            //check submit form checkout
            $("#purchase-form").submit(function () {
                var isvalid = $("#purchase-form").valid();
                   // && ($(".h-shipping").is(":visible") || $(".h-shipping").hasClass('hide-shipping'));
                if (isvalid) {
                    $("#Loading").show();
                    $(".summary").hide();
                    $('.btn-checkout').attr('disabled', 'disabled');
                    return true;
                } else {
                    if ($("#purchase-form").valid() == false) {
                        $(".summary").show();
                        $('.listerror').html("");
                        //$(".drop_shipping, .h-shipping").hide();
                    } else {
                        $('.listerror').html('<div class="error">Không tìm thấy phương thức vận chuyển.</div>');
                        //$(".drop_shipping, .h-shipping").hide();
                    }
                }
                return isvalid;
            });

            /*window.districtid = '';
            function getOrderHistory(control) {
                var $this = control;
                $.ajax({
                    type: "POST",
                    url: '/checkout/get_address',
                    async: false,
                    data: {id: control.val()}, // serializes the form's elements.
                    success: function (data) {
                        $('#billing_address_full_name').val(data.last_name + ' ' + data.first_name);
                        $('#order_email').val('');
                        $('#billing_address_phone').val(data.phone);
                        $('#billing_address_address1').val(data.address1);
                        $('#billing_address_province').val(data.provinceid);
                        getListDistrict(data.provinceid);
                        $('#shipping_district').val(data.districtid);
                        // $("#billing_address_province").change();
                    }
                });
            }

            $("#billing_address_customer").change(function () {
                getOrderHistory($(this));
            });*/


            /*var getListDistrict = function (province_id) {
                $.ajax({
                    type: "POST",
                    url: '/checkout/getlistdistrict',
                    async: false,
                    data: {province_id: province_id},
                    success: function (result) {
                        if (result != null && result.length > 0) {
                            var html = "";
                            html += '<option value="" selected>' + 'Vui lòng chọn quận/huyện.' + '</option>';
                            for (var i = 0; i < result.length; i++) {
                                html += "<option value=\"" + result[i].id + "\">" + result[i].name + "</option>\n";
                            }
                            $('#shipping_district').html(html);
                            $('#shipping_district_container').removeClass('hidden');
                        } else {
                            $('#shipping_district_container').addClass('hidden');
                            $('#shipping_district').html("");
                        }
                        if (window.districtid && window.districtid != 0) {
                            $('#shipping_district').val(window.districtid);
                        }

                    }
                });
            };
            getListDistrict($('#billing_address_province').val());
            $('#billing_address_province').change(function () {
                getListDistrict($(this).val());
            });*/


            //Nếu form hợp lệ thì khởi tạo đơn hàng bước 1
            /*$(".form-group .formcontrol").change(function () {
                submitFormStep1();
            });*/

            //Mở form nhập coupon
            /*$('.btn-coupon').click(function () {
                $(".use-coupon").show();
                $('.couponcode').focus();
                $('.continue-coupon').hide();
                $('.cancel-coupon').hide();
                $('.btn-submit-coupon').show();
                $(this).hide();
                return false;
            });*/
            //Nếu k nhập mã coopon thì đóng form lại
            /*$('.couponcode').focusout(function () {
                if ($(this).val() == "") {
                    $(".use-coupon").hide();
                    $(".btn-coupon ").show();
                }
            });
            $('.continue-coupon').on("click", function () {
                $('#morecoupon').val(true);
                $('.btn-submit-coupon').click();
                flag = true;
            });
            $('.cancel-coupon').on("click", function () {
                $(".use-coupon").hide();
                $(".btn-coupon ").show();
                flag = true;
            });*/
            //Check và tạo coupon
            /*$('.btn-submit-coupon').click(function () {
                if ($("#purchase-form").valid() == false) {
                    $(".summary").show();
                    $('.listerror').html("");
                    //$(".drop_shipping, .h-shipping").hide();
                }
                else {
                    $this = $(this);
                    var couponcode = $('.couponcode').val();
                    $('.couponcode').removeClass("error");
                    $('.couponcode').nextAll("span").remove();
                    if (couponcode != "") {
                        var url = $('#discount-apply').val();
                        if (url == "" && $("#order_id").val() != "" && $("#order_id").val() != 0) {

                            url = "/orders/" + $("#order_id").val() + "/apply_discount";

                        }

                        if (flag && url != "") {
                            $this.attr('disabled', 'disabled');

                            /!*$.ajax({
                                type: "POST",
                                url: url,
                                data: $("#purchase-form").serialize(),
                                beforeSend: function () {
                                },
                                success: function (data) {

                                    if (data.haspromote && data.showbut == true) {
                                        $('.couponcode').next('.coupon-error').remove();
                                        $('.couponcode').after('<span class="error coupon-error">' + data.message + '</span>');
                                        $('.btn-submit-coupon').hide();
                                        $('.continue-coupon,.use-coupon').show();
                                        $('.cancel-coupon').show();
                                    }
                                    else {
                                        if (!data.error) {
                                            flag = false;
                                            $('.couponcode').removeClass("error");
                                            $(".coupon").show();
                                            $(".coupon span").text("Mã giảm giá giảm");
                                            $(".coupon label").html(" - " + data.saving);
                                            $(".use-coupon").hide();

                                            if ($('#morecoupon').val() == "true") {
                                                if (data.allowcoupon) {
                                                    var refresh_html = '';

                                                    refresh_html += '<div class="list_item cart-item"><span>1 x</span><span> Nhang Trầm Hương Kh&#244;ng Tăm NC02</span>'
                                                        + '<span class="price">410,000₫</span>'
                                                        + '<p class="variant-title">NC02</p></div>'

                                                    $('.total-price').html('Tạm tính   <label> 410,000₫</label>');
                                                    $('.cart-items').html(refresh_html);
                                                } else {
                                                    var refresh_html = '';

                                                    refresh_html += '<div class="list_item cart-item"><span>1 x</span><span> Nhang Trầm Hương Kh&#244;ng Tăm NC02</span>'
                                                        + '<span class="price">410,000₫</span>'
                                                        + '<p class="variant-title">NC02</p></div>'

                                                    $('.total-price').html('Tạm tính   <label> 410,000₫</label>');
                                                    $('.cart-items').html(refresh_html);
                                                }
                                            }
                                        } else {
                                            $('.couponcode').next('.coupon-error').remove();
                                            $('.couponcode').after("<span class='error coupon-error'>" + data.message + "</span>");
                                            $('.use-coupon').show();
                                        }
                                    }
                                    //Tổng tiền đơn hàng sau khi ap dụng discount() khi chưa đầy đủ thông tin info validate= false
                                    $(".total-checkout span").html(data.tt_price);
                                    $(".drop_shipping").change();
                                    submitFormStep1();
                                    $("#Loading").hide();
                                }
                            });*!/
                            $this.removeAttr('disabled');
                        } else {
                            $('html, body').animate({
                                scrollTop: 100
                            }, 800);
                            $this.removeAttr('disabled');
                            var isvalid = $("#purchase-form").valid();
                            if (!isvalid) {
                                $(".summary").show();
                            }
                            else {
                                $(".summary").hide();
                            }
                        }
                    }
                }

                return false;
            });*/


            /*function removeCoupon(isremove) {

                flag = true;
                if ($(".coupon").is(":visible") == false) {
                    if (params["couponcode"] != undefined && params["couponcode"] != "" && isremove == undefined) {
                        $(".couponcode").val(params["couponcode"]);
                        $(".btn-coupon").hide();
                        $('.btn-submit-coupon').click();
                    }
                    return false;
                }
                $(".remove-coupon").prev("span").text("");
                $(".remove-coupon").parent(".coupon").hide();
                $(".btn-coupon").show();
                var url = "/checkout/remove_coupon?id=" + $('#ab_number_fn').val();
                $.ajax({
                    type: "POST",
                    url: url,
                    beforeSend: function () {
                    },
                    success: function (data) {
                        if (data.tt_price && data.tt_price != "") {

                            $(".total-checkout span").html(data.tt_price);
                        } else {
                            $(".drop_shipping").change();
                        }
                        var refresh_html = '';

                        refresh_html += ' <div class="list_item cart-item"><span>1 x</span><span> Nhang Trầm Hương Kh&#244;ng Tăm NC02</span>'
                            + '<span class="price">410,000₫</span>'
                            + '<p class="variant-title">NC02</p></div>'

                        $('.total-price').html('Tạm tính   <label> 410,000₫</label>');
                        $('.cart-items').html(refresh_html);
                        $('#morecoupon').val(false);

                        if (params["couponcode"] != undefined && params["couponcode"] != "" && isremove == undefined) {
                            $(".couponcode").val(params["couponcode"]);
                            $(".btn-coupon").hide();
                            $('.btn-submit-coupon').click();
                        }
                        submitFormStep1();
                    }
                });
            }*/

            //tạo coupon khi co orderid

            /*if ($("#order_id").val() != "" && $("#order_id").val() != 0 && params["couponcode"] != undefined && params["couponcode"] != "") {

                if ($(".new_order").valid() == false) {
                    removeCoupon();
                }

            }*/
            //XÓa coupon
            /*$(".remove-coupon").click(function () {
                removeCoupon(true);
                return false;
            });*/
            //Khi enter thì tạo coupon
            /*$('.couponcode').keydown(function (e) {
                var key = e.charCode || e.keyCode || 0;
                if (key == 13) {
                    $(".btn-submit-coupon").click();
                    return false;
                }
            });*/
            //style css cho dropbox

            if ($('.btn-checkout').css('position') == 'fixed') {
                $('.btn-checkout').width($(".total-checkout").outerWidth());
                $(window).resize(function () {
                    $('.btn-checkout').width($(".total-checkout").outerWidth());
                });
            }

            ////Nếu thay đổi nơi giao hàng thì trigger xóa coupon
            //$("#billing_address_province,#order_email,#shipping_district").change(function () {
            //  $(".remove-coupon").click();
            // });
            ////trigger nếu đã điền đầy đủ form thì lấy danh sách vận chuyển
            //var checkform = true;
            $(".form-group .formcontrol").each(function () {
                if ($(this).attr('required') && ($(this).val() == "" || $(this).val() == null)) {
                    //checkform = false;
                    var isvalid = $("#purchase-form").valid();
                    // && ($(".h-shipping").is(":visible") || $(".h-shipping").hasClass('hide-shipping'));
                    if (isvalid) {
                        $(".summary").hide();
                        $('.btn-checkout').attr('disabled', 'disabled');
                        return true;
                    } else {
                        if ($("#purchase-form").valid() == false) {
                            $(".summary").show();
                            $('.listerror').html("");
                            //$(".drop_shipping, .h-shipping").hide();
                        } else {
                            $('.listerror').html('<div class="error">Không tìm thấy phương thức vận chuyển.</div>');
                            //$(".drop_shipping, .h-shipping").hide();
                        }
                    }
                    return isvalid;
                }
            });
            /*if (checkform) {
                $("#billing_address_province").change();
                $("#shipping_district").change();
                $("#shipping_ward").change();
            }*/

        })
    </script>
</head>

<body class="step1">
    <tiles:insertAttribute name="body" />
</body>
</html>