<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 26/04/2017
  Time: 5:03 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<div class="main-content">
    <!-- Begin: Nội dung blog -->
    <ul id="pagging_product">
        <c:set var="count" value="0" scope="page"/>
        <c:forEach items="${posts}" var="p">
            <c:set var="count" value="${count + 1}" scope="page"/>
            <c:if test="${count == 1}">
                <li>
            </c:if>
            <div class="news-content">
                <%--<div class="col-md-2 hidden-xs hidden-sm">
                    <!--Begin:ngày giờ đăng bài viết  -->
                    <div class="author-date">
                        <div class="date-post">
                            <div>
                                <i class="icon-time"></i>
                                <p style="color: white">
                                    ${p.dateDisplay}
                                </p>
                            </div>
                        </div>
                    </div>
                    <!--End:ngày giờ đăng bài viết  -->
                    <!--Begin: số bình luận  -->
                    <div class="article-count">
                        <div class="count-comment">

                        </div>
                    </div>

                    <!--End: số đăng bình luận   -->
                </div>
                <!-- mobile -->

                <div class="col-xs-12 col-sm-12 hidden-lg hidden-md">
                    <!-- Begin: Nội dung bài viết -->
                    <h2 class="title-article"><a
                            href="/blogs/post/${p.id}" style="color: white">${p.title}</a></h2>
                    <div class="body-content">
                        <div class="info-more">
                            <div><i class="icon-info icon-hot clearfix"></i> <a href="#" style="color: cornsilk">${b.name}</a></div>
                            <div><i class="icon-time"></i>
                                <p style="color: white">
                                    ${p.dateDisplay}
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- End: Nội dung bài viết -->
                </div>--%>
                <div class="col-md-5 col-xs-12 col-sm-12 img-article">
                    <img
                            src="${p.img}"
                            class="img-responsive">
                </div>


                <div class=" col-md-5  hidden-xs hidden-sm">
                    <!-- Begin: Nội dung bài viết -->
                    <h2 class="title-article"><a
                            href="/blogs/post/${p.id}" style="color: white">${p.title}</a></h2>
                    <div class="body-content">
                        <div class="info-more">
                            <div><i class="icon-info icon-hot clearfix"></i> <a href="#" style="color: cornsilk">${b.name}</a></div>
                        </div>
                        <p style="color: white">${p.subContent}</p>
                    </div>
                    <!-- End: Nội dung bài viết -->
                    <a class="readmore clear-fix"
                       href="/blogs/post/${p.id}"
                       role="button" style="color: red">Xem tiếp <span class="fa fa-angle-double-right"></span></a>
                </div>


                <div class="col-xs-12 hidden-lg hidden-md">
                    <p class="text-mobi-blog">${p.subContent}</p>

                    <a class="readmore clear-fix"
                       href="/blogs/post/${p.id}"
                       role="button" style="color: red">Xem tiếp <span class="fa fa-angle-double-right"></span></a>

                </div>
            </div>
            <hr class="line-blog">
            <c:if test="${count == 10}">
                </li>
                <c:set var="count" value="0" scope="page"/>
            </c:if>
        </c:forEach>
    </ul>
    <!-- End: Nội dung blog -->

</div>
