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
    <spring:url value="/resources/editor/css/simplemde.min.css" var="simplemde" />
    <link href="${bootsTrapCss}" rel="stylesheet" type="text/css"/>
    <link href="${awesomeFontCss}" rel="stylesheet" type="text/css"/>
    <link href="${animateCss}" rel="stylesheet" type="text/css"/>
    <link href="${styleCss}" rel="stylesheet" type="text/css"/>
    <link href="${simplemde}" rel="stylesheet" type="text/css"/>
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
<body onload="loadBookingService()">
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
    <spring:url value="/resources/js/plugins/jquery-ui/jquery-ui.min.js" var="uiMinJs" />
    <script src="${uiMinJs}"></script>
    <spring:url value="/resources/js/plugins/footable/footable.all.min.js" var="footableJs" />
    <script src="${footableJs}"></script>
    <spring:url value="/resources/editor/js/simplemde.min.js" var="simplemdeJs" />
    <script src="${simplemdeJs}"></script>
    <!-- Page-Level Scripts -->
    <script>
        $(document).ready(function() {

            $('.footable').footable();

            $('#birthday').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: true,
                calendarWeeks: true,
                autoclose: true
            });

            $('#startDay').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: true,
                calendarWeeks: true,
                autoclose: true
            });

            $('#endDay').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: true,
                calendarWeeks: true,
                autoclose: true
            });

            $('#serviceStart').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: true,
                calendarWeeks: true,
                autoclose: true
            });

            $('#serviceEnd').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: true,
                calendarWeeks: true,
                autoclose: true
            });

            $('#birthday').datepicker({
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

        function loadBookingService(){
            /*$.ajax({
                type: "GET",
                contentType: "application/json",
                url: "/notifications/NotifyListBookingServiceDto",
                dataType: 'json',
                timeout: 100000,
                success: function (data) {
                    console.log("SUCCESS: ", data);
                    display(data);
                },
                error: function (e) {
                    console.log("ERROR: ", e);
                    display(e);
                },
                done: function (e) {
                    console.log("DONE");
                }
            });
            function display(data) {
                var json = "<h4>Ajax Response</h4><pre>"
                        + JSON.stringify(data, null, 4) + "</pre>";
                var html = "";
                for(var i = 0; i< data.length; i ++){
                    var d = new Date(data[i].created);
                    var created = d.toLocaleDateString();
                    html = html + '<li class="divider"></li>' +
                    '<li>' +
                    '<div>' +
                    '<i class="fa fa-twitter fa-fw"></i>' + data[i].memo +
                            '<span class="pull-right text-muted small">' +  created + '</span>' +
                            '</div>' +
                            '</li>';
                }
                $('#NotifyListBookingServiceDto').html(html);
            }*/
        };
        new SimpleMDE({
            element: document.getElementById("introduce_id"),
            spellChecker: false
        });
    </script>
</body>
</html>
