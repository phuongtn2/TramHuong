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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <spring:url value="/resources/img/favicon/favicon.png" var="fava"/>
    <link rel="shortcut icon" href="${fava}" type="image/png"/>
    <title>
        Nhang Hoạt Tính - Thanh toán đơn hàng
    </title>

    <spring:url value="/resources/css/checkout1.css" var="a" />
    <link href="${a}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/css/checkout2.css" var="b" />
    <link href="${b}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/css/bootstrap.3.3.1.css" var="cs4" />
    <link href="${cs4}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/css/plugins/dataTables/datatables.min.css" var="dataTablesCs" />
    <link href="${dataTablesCs}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/font-awesome/css/font-awesome.css" var="cs6" />
    <link href="${cs6}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/js/jquery-2.1.1.js" var="jqueryJs" />
    <script src="${jqueryJs}"></script>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>--%>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <spring:url value="/resources/js/jquery.validate.js" var="validateJs" />
    <script src="${validateJs}"></script>
    <spring:url value="/resources/js/libs-script.min.js" var="a22" />
    <script src="${a22}"></script>
    <spring:url value="/resources/js/main1.js" var="a122" />
    <script src="${a122}"></script>
    <spring:url value="/resources/js/plugins/dataTables/datatables.min.js" var="dataTablesJs" />
    <script src="${dataTablesJs}"></script>
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

            //check submit form checkout
            $("#purchase-form").submit(function () {
                var isvalid = $("#purchase-form").valid();
                   // && ($(".h-shipping").is(":visible") || $(".h-shipping").hasClass('hide-shipping'));
                if (isvalid) {
                    $("#Loading").show();
                    /*$(".summary").hide();*/
                    $('.btn-checkout').attr('disabled', 'disabled');
                    return true;
                } else {
                    if ($("#purchase-form").valid() == false) {
                        var modal = $('#notify-error');
                        modal.modal('show');
                        modal.find('#error-field').empty();
                        $(".form-group .formcontrol").each(function () {
                            if ($(this).attr('required') && ($(this).val() == "" || $(this).val() == null)) {
                                var field = this.placeholder;
                                if(field === undefined){
                                    field = "Tỉnh/Thành Phố";
                                }
                                modal.find('#error-field').append('<p class="color-red ">* Vui lòng nhập:' + field + '</p>');
                            }
                        });
                        return false;
                        /*$(".summary").show();*/
                        /*$('.listerror').html("");*/
                        //$(".drop_shipping, .h-shipping").hide();
                    } /*else {
                        $('.listerror').html('<div class="error">Không tìm thấy phương thức vận chuyển.</div>');
                        //$(".drop_shipping, .h-shipping").hide();
                    }*/
                }
                return isvalid;
            });
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
                        /*$(".summary").hide();*/
                        $('.btn-checkout').attr('disabled', 'disabled');
                        return true;
                    } else {
                        if ($("#purchase-form").valid() == false) {
                           /* $(".summary").show();
                            $('.listerror').html("");*/
                            //$(".drop_shipping, .h-shipping").hide();
                        } /*else {
                            $('.listerror').html('<div class="error">Không tìm thấy phương thức vận chuyển.</div>');
                            //$(".drop_shipping, .h-shipping").hide();
                        }*/
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

<body class="step1" style="background-color: #333300;">
    <tiles:insertAttribute name="body" />
    <div class="modal fade" id="term-shipping-modal" role="dialog" tabindex="-1" aria-hidden="false" style="z-index: 9999999;">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="background-color: #808000;">
                    <h4 class="modal-title text-center">Qui Định</h4>
                </div>
                <div class="modal-body">
                    <div class="shiping-ajax">
                        ${termS.content}
                    </div>
                </div>
                <div class="modal-header text-center" style="background-color: #808000;">
                    <%-- <button onclick="submit()" class="btn btn-primary" type="submit">Thêm</button>--%>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>

    </div>
    <div class="modal fade" id="term-payment-modal" role="dialog" tabindex="-1" aria-hidden="false" style="z-index: 9999999;">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="background-color: #808000;">
                    <h4 class="modal-title text-center">Qui Định</h4>
                </div>
                <div class="modal-body">
                    <div class="shiping-ajax">
                        ${termP.content}
                    </div>
                </div>
                <div class="modal-header text-center" style="background-color: #808000;">
                    <%-- <button onclick="submit()" class="btn btn-primary" type="submit">Thêm</button>--%>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>

    </div>
    <div class="modal fade" id="notify-error" role="dialog" tabindex="-1" aria-hidden="false" style="z-index: 9999999;">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="background-color: #808000;;">
                    <h4 class="modal-title text-center">Lỗi</h4>
                </div>
                <div class="modal-body">
                    <div id="error-field">
                    </div>
                </div>
                <div class="modal-header text-center" style="background-color: #808000;;">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    // Hiện ẩn hiện thông tin mô tả hình thức thanh toán
    $('.shiping-ajax-s').on('change', ".input-method-s", function () {
        if ($(this).is(":checked")) {
            var checkinput = $(this).parent(".lb-method-s");
            if (checkinput.next('.desc-s').is(":hidden") && checkinput.next('.desc-s').text().trim() != "") {
                $('.desc-s').slideUp();
                checkinput.next('.desc-s').slideDown().css('display', 'block');
            }
        }
        var id = document.querySelector('input[name="shippingType"]:checked').value;
        var cost = $('#shippingType-cost_' + id).val();
        var costMain = $('#shippingType-cost_main_' + id).val();
        $('#shippingCost').empty();
        $('#shippingCost').text(cost + 'đ');
        var data = {};
        data["cost"] = costMain;
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/setTotalPrice",
            data: JSON.stringify(data),
            dataType: 'json',
            timeout: 100000,
            async: false,
            success: function (res) {
                $('#totalPriceTemp').empty();
                $('#totalPriceTemp').text(res[0] + 'đ');
                $('#totalPriceMain').empty();
                $('#totalPriceMain').text(res[0] + 'đ');
            }
        });

    });
    $('.shiping-ajax-p').on('change', ".input-method-p", function () {
        if ($(this).is(":checked")) {
            var checkinput = $(this).parent(".lb-method-p");
            if (checkinput.next('.desc-p').is(":hidden") && checkinput.next('.desc-p').text().trim() != "") {
                $('.desc-p').slideUp();
                checkinput.next('.desc-p').slideDown().css('display', 'block');
            }
        }

    });
    //Hiện thông tin mô tả default
    $(".input-method-s:checked").parent(".lb-method-s").next('.desc-s').slideDown().css('display', 'block');
    $(".input-method-p:checked").parent(".lb-method-p").next('.desc-p').slideDown().css('display', 'block');
</script>
<script>
    $(document).on("click", "#term-shipping", function (event) {
        event.preventDefault();
        var modal = $('#term-shipping-modal');
        modal.modal('show');
        return false;
    });
    $(document).on("click", "#term-payment", function (event) {
        event.preventDefault();
        var modal = $('#term-payment-modal');
        modal.modal('show');
        return false;
    });
    $(document).ready(function() {
        $('.dataTables-example').DataTable({
            "pageLength": 1000,
            "order": [],
            dom: '<"html5buttons"B>lTfgitp',
            buttons: [
                {
                    extend: 'print',
                    customize: function (win) {
                        $(win.document.body).addClass('white-bg');
                        $(win.document.body).css('font-size', '10px');

                        $(win.document.body).find('table')
                            .addClass('compact')
                            .css('font-size', 'inherit');
                    }
                }
            ]

        });
        $('#DataTables_Table_0_length').hide();
        $('#DataTables_Table_0_filter').hide();
        $('#DataTables_Table_0_info').hide();
        $('#DataTables_Table_0_paginate').hide();
    });

    /*$(document).on("click", "#choseShipping", function (event) {
        event.preventDefault();
        var modal = $('#chose-shipping-modal');
        modal.modal('show');
        return false;
    });
    function setPayment() {
        var id = document.querySelector('input[name="paymentType-modal"]:checked').value;
        $('#payment-modal').text($('#paymentName-modal_' + id).text());
        $('#paymentType').val(id);
    }
    function setShipping() {
        var id = document.querySelector('input[name="shippingType-modal"]:checked').value;
        $('#shipping-modal').text($('#shippingName-modal_' + id).text());
        $('#shippingType').val(id);
    }*/
</script>
</html>