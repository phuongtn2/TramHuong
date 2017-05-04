<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 04/05/2017
  Time: 2:11 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="articles clearfix" id="layout-page">
                <span class="header-page">
                    <h1>Nhạc thiền thư giãn</h1>
                </span>

    <!-- Begin: Nội dung blog -->

    <div class="video1st">
        <p><span contenteditable="false" data-mce-object="iframe" class="mce-preview-object mce-object-iframe"
                 data-mce-p-allowfullscreen="allowfullscreen" data-mce-p-frameborder="0"
                 data-mce-p-src="${postFirst.url}"><iframe
                src="${postFirst.url}" allowfullscreen="allowfullscreen" width="560"
                height="315" frameborder="0"></iframe><span class="mce-shim"></span></span></p>
    </div>

    <ul id="pagging_product">
        <c:set var="count" value="0" scope="page" />
        <c:forEach items="${posts}" var="p">
            <c:set var="count" value="${count + 1}" scope="page"/>
            <c:if test="${count == 1}">
                <li>
            </c:if>
            <div class="itemVideo col-xs-6 col-sm-3 col-md-3">
                <a href="${p.url}" class="imgVideo">
                    <div>
                        <div><img src="${p.img}"
                                  data-mce-src="${p.img}"></div>
                    </div>
                </a>
                <h5><a href="${p.url}">${p.title}</a></h5>
            </div>
            <c:if test="${count == 30}">
                </li>
                <c:set var="count" value="0" scope="page"/>
            </c:if>
        </c:forEach>
    </ul>
    <!-- End: Nội dung blog -->
    <script>
        $(document).ready(function () {
            $(".itemVideo a").click(function () {
                event.preventDefault();

                var url = $(this).attr("href");
                var iframe = "<iframe width='560' height='315' src=" + url + " frameborder='0' allowfullscreen='allowfullscreen' data-mce-src=" + url + "></iframe>"
                $('.video1st').html(iframe);
            });
        });
    </script>
</div>