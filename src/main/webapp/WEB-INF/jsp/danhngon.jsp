<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 04/05/2017
  Time: 2:55 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="articles clearfix" id="layout-page">
                <span class="header-page">
                    <h1>Danh Ngôn Cuộc Sống</h1>
                </span>
    <!-- Begin: Nội dung blog -->
    <div class="quotations clearfix">
        <ul id="pagging_product">
            <c:set var="count" value="0" scope="page" />
            <c:forEach items="${posts}" var="p">
                <c:set var="count" value="${count + 1}" scope="page"/>
                <c:if test="${count == 1}">
                    <li>
                </c:if>
                <div class="col-md-4 col-sm-6 col-xs-6 items">
                    <a href="${p.img}"
                       rel="prettyPhoto[gallery2]" title="">
                        <img src="${p.img}"
                             class="img-responsive">
                    </a>
                </div>
                <c:if test="${count == 18}">
                    </li>
                    <c:set var="count" value="0" scope="page"/>
                </c:if>
            </c:forEach>
        </ul>
    </div>

<script>
        $(document).ready(function () {
            $("a[rel^='prettyPhoto']").prettyPhoto({

                social_tools: '<div data-layout="button_count" data-mobile-iframe="true"></div>'

            });
        });
    </script>
    <!-- End: Nội dung blog -->
</div>
