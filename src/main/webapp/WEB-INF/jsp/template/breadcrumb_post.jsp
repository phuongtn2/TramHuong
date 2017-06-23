<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 25/04/2017
  Time: 10:43 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
    <div class="row">
        <div class="col-md-12 ">
            <ol class="breadcrumb breadcrumb-arrow hidden-sm hidden-xs">
                <li><a href="/" target="_self">Trang chủ</a></li>
                <c:forEach items="${tagsOfPost}" var="t">
                    <li><a href="/posts/${t}" target="_self">${t}</a></li>
                </c:forEach>
            </ol>
        </div>
    </div>
</div>