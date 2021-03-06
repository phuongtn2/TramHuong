<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 19/02/2017
  Time: 9:53 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Admin</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <spring:url value="/resources/css/bootstrap.min.css" var="bootsTrapCss"/>
    <spring:url value="/resources/font-awesome/css/font-awesome.css" var="awesomeFontCss" />
    <spring:url value="/resources/css/animate.css" var="animateCss" />
    <spring:url value="/resources/css/style.css" var="styleCss" />
    <spring:url value="/resources/editor/css/simplemde.min.css" var="isCheckCss" />
    <spring:url value="/resources/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" var="checkBoxCss" />
    <spring:url value="/resources/css/plugins/iCheck/custom.css" var="simplemde" />
    <spring:url value="/resources/css/plugins/datapicker/datepicker3.css" var="dateCss" />
    <spring:url value="/resources/css/plugins/footable/footable.core.css" var="footCss" />
    <link href="${dateCss}" rel="stylesheet">
    <spring:url value="/resources/css/resized.css" var="resizedCss" />
    <link href="${resizedCss}" rel="stylesheet">
    <spring:url value="/resources/css/plugins/summernote/summernote.css" var="summernote" />
    <spring:url value="/resources/css/plugins/summernote/summernote-bs3.css" var="summernote3" />
    <link href="${summernote}" rel="stylesheet">
    <link href="${summernote3}" rel="stylesheet">
    <link href="${bootsTrapCss}" rel="stylesheet" type="text/css"/>
    <link href="${awesomeFontCss}" rel="stylesheet" type="text/css"/>
    <link href="${animateCss}" rel="stylesheet" type="text/css"/>
    <link href="${styleCss}" rel="stylesheet" type="text/css"/>
    <link href="${simplemde}" rel="stylesheet" type="text/css"/>
    <link href="${checkBoxCss}" rel="stylesheet">
    <link href="${isCheckCss}" rel="stylesheet">
    <link href="${footCss}" rel="stylesheet">
    <spring:url value="/resources/css/checkout_admin.css" var="checkCss" />
    <link href="${checkCss}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/css/plugins/select2/select2.min.css" var="selectCSS" />
    <link href="${selectCSS}" rel="stylesheet" type="text/css"/>
    <spring:url value="/resources/css/dist/photoswipe.css?v=4.1.1-1.0.4" var="d1" />
    <spring:url value="/resources/css/dist/default-skin/default-skin.css" var="d2" />
    <spring:url value="/resources/css/dist/photoswipe.min.js" var="d3" />
    <spring:url value="/resources/css/dist/photoswipe-ui-default.min.js" var="d4" />
    <link href="${d1}" rel="stylesheet" />
    <link href="${d2}" rel="stylesheet" />
    <script src="${d3}"></script>
    <script src="${d4}"></script>
    <script>
        function change(id) {
            var listId = ["news", "complaint", "request", "building" , "service", "user"
                , "history", "asset", "complaint_history", "complaintUL", "complaintLi"];
            for (i = 0; i <=  listId.length; i++) {
                if(id === listId[i]){
                    $('#'+listId[i]).addClass( "active" );
                }else{
                    $('#'+listId[i]).removeClass( "active" )
                }
            }
        }
    </script>
</head>
<body>
    <div id="wrapper">
        <tiles:insertAttribute name="navbar" />
        <tiles:insertAttribute name="notify" />
        <div id="page-wrapper" class="gray-bg">
            <div class="wrapper wrapper-content animated fadeInRight">
                <tiles:insertAttribute name="body" />
            </div>
            <tiles:insertAttribute name="footer" />
        </div>
    </div>
    <!-- Mainly scripts -->
    <spring:url value="/resources/js/jquery-2.1.1.js" var="jqueryJs" />
    <spring:url value="/resources/js/bootstrap.min.js" var="bootstrapJs" />
    <script src="${jqueryJs}"></script>
    <spring:url value="/resources/js/jquery-ui.js" var="rezie" />
    <script src="${rezie}"></script>
    <script src="${bootstrapJs}"></script>

    <spring:url value="/resources/js/plugins/metisMenu/jquery.metisMenu.js" var="metisMenuJs" />
    <spring:url value="/resources/js/plugins/slimscroll/jquery.slimscroll.min.js" var="slimscrollJs" />
    <script src="${metisMenuJs}"></script>
    <script src="${slimscrollJs}"></script>
    <!-- Flot -->
    <spring:url value="/resources/js/plugins/flot/jquery.flot.js" var="flotJs" />
    <spring:url value="/resources/js/plugins/flot/jquery.flot.tooltip.min.js" var="tooltipJs" />
    <spring:url value="/resources/js/plugins/flot/jquery.flot.spline.js" var="splineJs" />
    <spring:url value="/resources/js/plugins/flot/jquery.flot.resize.js" var="resizeJs" />
    <spring:url value="/resources/js/plugins/flot/jquery.flot.pie.js" var="pieJs" />
    <script src="${flotJs}"></script>
    <script src="${tooltipJs}"></script>
    <script src="${splineJs}"></script>
    <script src="${resizeJs}"></script>
    <script src="${pieJs}"></script>
    <!-- Peity -->
    <spring:url value="/resources/js/plugins/peity/jquery.peity.min.js" var="peityJs" />
    <script src="${peityJs}"></script>

    <!-- Custom and plugin javascript -->
    <spring:url value="/resources/js/inspinia.js" var="inspiniaJs" />
    <spring:url value="/resources/js/plugins/pace/pace.min.js" var="paceJs" />
    <script src="${inspiniaJs}"></script>
    <script src="${paceJs}"></script>

    <!-- jQuery UI -->
    <%--<spring:url value="/resources/js/plugins/jquery-ui/jquery-ui.min.js" var="uiMinJs" />
    <script src="${uiMinJs}"></script>--%>
    <spring:url value="/resources/js/plugins/footable/footable.all.min.js" var="footableJs" />
    <script src="${footableJs}"></script>
    <spring:url value="/resources/js/plugins/iCheck/icheck.min.js" var="isCheckJs" />
    <script src="${isCheckJs}"></script>
    <spring:url value="/resources/editor/js/simplemde.min.js" var="simplemdeJs" />
    <script src="${simplemdeJs}"></script>
    <spring:url value="/resources/js/plugins/datapicker/bootstrap-datepicker.js" var="datePickerJs" />
    <script src="${datePickerJs}"></script>
    <spring:url value="/resources/js/plugins/select2/select2.full.min.js" var="select2" />
    <script src="${select2}"></script>
    <spring:url value="/resources/js/plugins/summernote/summernote.min.js" var="summernoteJs" />
    <script src="${summernoteJs}"></script>
    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function() {
            $('.summernote').summernote();
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green'
            });
            $(".select2").select2();

            $('.footable').footable();

            $('#created').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: true,
                calendarWeeks: true,
                autoclose: true
            });
            $('#orderDate').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: true,
                calendarWeeks: true,
                autoclose: true
            });
        });

        function goBack() {
            window.history.back();
        };

        new SimpleMDE({
            element: document.getElementById("introduce_id"),
            spellChecker: false
        });
        /*new SimpleMDE({
            element: document.getElementById("product_description"),
            spellChecker: false
        });*/
        /*new SimpleMDE({
            element: document.getElementById("mail_header"),
            spellChecker: false
        });
        new SimpleMDE({
            element: document.getElementById("mail_footer"),
            spellChecker: false
        });*/
        /*new SimpleMDE({
            element: document.getElementById("post_content"),
            spellChecker: false
        });*/
       /* new SimpleMDE({
            element: document.getElementById("post_sub_content"),
            spellChecker: false
        });*/
        $( function() {
            $( "#product_description_div" ).resizable();
            $("#subContent_div").resizable();
            $("#content_div").resizable();
            $("#mail_header").resizable();
            $("#mail_footer").resizable();
        } );
        function setValueContent() {
            var aHTML = $('.summernote').code();
            $('#content').val(aHTML);
        }
    </script>

    <%--<script>
        $(document).ready(function() {
            $.ajax({
                type: "GET",
                contentType: "application/json",
                url: "/chart",
                dataType: 'json',
                timeout: 100000,
                async: false,
                success: function (chartData) {
                    var doughnutData = [
                    ];

                    for(var i=0 ; i < chartData.length ;i ++ ){
                        var object = {value: chartData[i]["value"], color: "#a3e1d4",highlight: "#1ab394",label: chartData[i]["label"]};
                        doughnutData.push(object);
                    }

                    var doughnutOptions = {
                        segmentShowStroke: true,
                        segmentStrokeColor: "#fff",
                        segmentStrokeWidth: 2,
                        percentageInnerCutout: 45, // This is 0 for Pie charts
                        animationSteps: 100,
                        animationEasing: "easeOutBounce",
                        animateRotate: true,
                        animateScale: false
                    };

                    var ctx = document.getElementById("doughnutChart").getContext("2d");
                    var DoughnutChart = new Chart(ctx).Doughnut(doughnutData, doughnutOptions);
                }
            });
        });

    </script>--%>
</body>
</html>
