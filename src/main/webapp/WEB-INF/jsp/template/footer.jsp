<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<footer>
    <div class="footer-top">
        <div class="container">
            <div class="row">

                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="footer-static-title">
                        <h4>THÔNG TIN</h4>
                    </div>
                    <div class="footer-static-content">
                        <p>
                            <span color="#4b4f56" face="helvetica, arial, sans-serif"
                                 style="color: #f0c481; font-family: helvetica, arial, sans-serif;"
                                 data-mce-style="color: #f0c481; font-family: helvetica, arial, sans-serif;">
                                <span
                                style="font-size: 12px; line-height: 15.3599996566772px; white-space: pre-wrap;"
                                data-mce-style="font-size: 12px; line-height: 15.3599996566772px; white-space: pre-wrap;">${about.description}<br><br>Địa chỉ: ${about.address}</span>
                            </span>
                        </p>
                        <p>
                            <span color="#4b4f56" face="helvetica, arial, sans-serif"
                                 style="color: #f0c481; font-family: helvetica, arial, sans-serif;"
                                 data-mce-style="color: #f0c481; font-family: helvetica, arial, sans-serif;">
                                <span
                                style="font-size: 12px; line-height: 15.3599996566772px; white-space: pre-wrap;"
                                data-mce-style="font-size: 12px; line-height: 15.3599996566772px; white-space: pre-wrap;">Điện thoai: ${about.tel}</span>
                            </span>
                        </p>
                        <p>
                            <span color="#4b4f56" face="helvetica, arial, sans-serif"
                                 style="color: #f0c481; font-family: helvetica, arial, sans-serif;"
                                 data-mce-style="color: #f0c481; font-family: helvetica, arial, sans-serif;">
                                <span
                                style="font-size: 12px; line-height: 15.3599996566772px; white-space: pre-wrap;"
                                data-mce-style="font-size: 12px; line-height: 15.3599996566772px; white-space: pre-wrap;">Hotline : ${about.hotLine}<br></span>
                            </span>
                            <span
                                color="#4b4f56" face="helvetica, arial, sans-serif"
                                style="color: #f0c481; font-family: helvetica, arial, sans-serif;"
                                data-mce-style="color: #f0c481; font-family: helvetica, arial, sans-serif;">
                                <span
                                style="font-size: 12px; line-height: 15.3599996566772px; white-space: pre-wrap;"
                                data-mce-style="font-size: 12px; line-height: 15.3599996566772px; white-space: pre-wrap;">Email : ${about.email}</span>
                            </span>
                            <span
                                color="#4b4f56" face="helvetica, arial, sans-serif"
                                style="color: #f0c481; font-family: helvetica, arial, sans-serif;"
                                data-mce-style="color: #f0c481; font-family: helvetica, arial, sans-serif;">
                                <span
                                style="font-size: 12px; line-height: 15.3599996566772px; white-space: pre-wrap;"
                                data-mce-style="font-size: 12px; line-height: 15.3599996566772px; white-space: pre-wrap;">m</span>
                            </span>
                        </p>
                    </div>
                </div>


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="footer-static-title">
                        <h4>Hỏi đáp</h4>
                    </div>
                    <div class="footer-static-content">
                        <div class="contact-add">
                             <span style="color: rgb(240, 196, 129);" data-mce-style="color: #f0c481;">
                                 <a
                                                    href="/page/buy"
                                                    data-mce-href="/page/buy"
                                                    style="color: rgb(240, 196, 129);" data-mce-style="color: #f0c481;">Cách mua hàng</a>
                             </span>
                            <br
                                style="color: #4b4f56; font-family: helvetica, arial, sans-serif; font-size: 12px; line-height: 15.3599996566772px; white-space: pre-wrap; background-color: #fefefe;"
                                data-mce-style="color: #4b4f56; font-family: helvetica, arial, sans-serif; font-size: 12px; line-height: 15.3599996566772px; white-space: pre-wrap; background-color: #fefefe;">
                            <span
                                style="color: rgb(240, 196, 129);" data-mce-style="color: #f0c481;"><a
                                href="/page/payment"
                                target="_blank"
                                data-mce-href="/page/payment"
                                style="color: rgb(240, 196, 129);" data-mce-style="color: #f0c481;">Cách thanh toán&nbsp;</a>
                            </span><br
                                style="color: #4b4f56; font-family: helvetica, arial, sans-serif; font-size: 12px; line-height: 15.3599996566772px; white-space: pre-wrap; background-color: #fefefe;"
                                data-mce-style="color: #4b4f56; font-family: helvetica, arial, sans-serif; font-size: 12px; line-height: 15.3599996566772px; white-space: pre-wrap; background-color: #fefefe;">
                            <span
                                style="color: rgb(240, 196, 129);" data-mce-style="color: #f0c481;"><a
                                href="/page/shipping"
                                data-mce-href="/page/shipping"
                                style="color: rgb(240, 196, 129);" data-mce-style="color: #f0c481;">Phương thức vận chuyển<br></a>
                            </span><br>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="footer-static-title">
                        <h4>Thế giới tâm linh</h4>
                    </div>
                    <div class="footer-static-content">
                        <div class="contact-add">
                            <span style="color: rgb(255, 204, 0);" data-mce-style="color: #ffcc00;">
                                <c:set var="count" value="0" scope="page" />
                                <c:forEach items="${blogs0}" var="b0">
                                    <c:set var="count" value="${count + 1}" scope="page"/>
                                    <c:if test="${count == 1}">
                                        <span style="color: rgb(240, 196, 129);" data-mce-style="color: #f0c481;">
                                            <a data-mce-href="/blog/${b0.id}"
                                               href="/blog/${b0.id}" style="color: rgb(240, 196, 129);"
                                               data-mce-style="color: #f0c481;">${b0.name}</a>
                                        </span>
                                    </c:if>
                                    <c:if test="${count > 1}">
                                        <span style="color: rgb(240, 196, 129);" data-mce-style="color: #f0c481;"><br>
                                            <a data-mce-href="/blog/${b0.id}"
                                               href="/blog/${b0.id}" style="color: rgb(240, 196, 129);"
                                               data-mce-style="color: #f0c481;">${b0.name}</a>
                                        </span>
                                    </c:if>
                                </c:forEach>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-sms-12">
                    <div class="footer-static-title">
                        <h4>Kết nối với chúng tôi</h4>
                    </div>
                    <div class="footer-static-content">
                        <!-- Facebook widget -->
                        <div class="footer-static-content">
                            <div class="fb-page" data-href="${about.facebookLink}"
                                 data-height="300" data-small-header="false"
                                 data-adapt-container-width="true" data-hide-cover="false"
                                 data-show-facepile="true" data-show-posts="false"></div>
                        </div>
                        <div style="clear:both;">
                        </div>
                        <!-- #Facebook widget -->
                        <script>
                            (function (d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0];
                                if (d.getElementById(id)) return;
                                js = d.createElement(s);
                                js.id = id;
                                js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=263266547210244&version=v2.5";
                                fjs.parentNode.insertBefore(js, fjs);
                            }(document, 'script', 'facebook-jssdk'));
                        </script>

                    </div>
                </div>

                <a href="http://www.dmca.com/Protection/Status.aspx?ID=569a2092-f740-40e3-a46b-a718b2d6f0bf"
                   title="DMCA.com Protection Status" class="dmca-badge"> <img
                        src="//images.dmca.com/Badges/dmca_protected_sml_120m.png?ID=569a2092-f740-40e3-a46b-a718b2d6f0bf"
                        alt="DMCA.com Protection Status"></a>
                <script src="//images.dmca.com/Badges/DMCABadgeHelper.min.js"></script>
            </div>
        </div>

    </div>
    <div class="footer-bottom">
        <div class="container copyright">
            <p>Copyright &copy; 2017 PhuongTN2 <a target="_blank"
                                                          href="/"></a>
            </p>
        </div>
    </div>

</footer>