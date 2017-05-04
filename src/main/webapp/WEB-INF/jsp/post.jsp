<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 04/05/2017
  Time: 6:45 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-12 articles clearfix" id="layout-page">
    <span class="header-page clearfix">
        <h1>${post.title}</h1>
    </span>

    <div class="content-page row">
        <div class="col-md-2">
            <!--Begin:ngày giờ đăng bài viết  -->
            <div class="author-date">
                <ul class="date-post">
                    <li>
                        <i class="icon-time"></i>
                        <p>
                            ${post.dateDisplay}
                        </p>
                    </li>
                </ul>
            </div>
            <!--End:ngày giờ đăng bài viết  -->

            <!--Begin: số bình luận  -->

            <!--End: số đăng bình luận   -->
        </div>

        <div class="col-md-10 article-content">

            <div class="body-content">
                <p style="text-align: justify;" data-mce-style="text-align: justify;">
                    <span style="font-size: 15pt;" data-mce-style="font-size: 15pt;">
                        ${post.content}
                    </span>
                </p>
            </div>

        </div>

    </div>

</div>
