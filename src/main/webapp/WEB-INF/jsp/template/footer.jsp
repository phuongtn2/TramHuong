<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<footer>
    <div class="footer-top">
        <div class="container">
            <div class="row">

                <div class="col-md-6 col-sm-6 col-xs-12">
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


                <div class="col-md-6 col-sm-6 col-xs-12">
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
               <%-- <div class="col-md-4 col-sm-6 col-sms-12">
                    <div class="footer-static-title">
                        <h4>Kết nối với chúng tôi</h4>
                    </div>
                    <div class="footer-static-content">
                        <div>
                            <aside id="mc4wp_form_widget-4" class="widget widget_mc4wp_form_widget" style="margin-top: 5px;">
                                <script type="text/javascript">(function () {
                                    if (!window.mc4wp) {
                                        window.mc4wp = {
                                            listeners: [],
                                            forms: {
                                                on: function (event, callback) {
                                                    window.mc4wp.listeners.push({
                                                        event: event,
                                                        callback: callback
                                                    });
                                                }
                                            }
                                        }
                                    }
                                })();
                                </script><!-- MailChimp for WordPress v4.1.2 - https://wordpress.org/plugins/mailchimp-for-wp/ -->
                                <form id="mc4wp-form-1" class="mc4wp-form mc4wp-form-42097 mc4wp-form-basic" method="post" data-id="42097" data-name="Default sign-up form">
                                    <div class="mc4wp-form-fields">
                                        <div style="text-align:center;"><p>
                                            &lt;%&ndash;<label>Name:</label>&ndash;%&gt;
                                            <input type="text" name="NAME" required="true" placeholder="Your name">
                                        </p>
                                            <p>
                                                &lt;%&ndash;<label for="mc4wp_email">Email address: </label>&ndash;%&gt;
                                                <input type="email" id="mc4wp_email" name="EMAIL" placeholder="Your email address" required="true">
                                            </p>

                                            <p>
                                                <input type="button" value="Sign up" style="color: rgb(240, 196, 129);">
                                            </p></div>
                                        <div style="display: none;"><input type="text" name="_mc4wp_honeypot" value="" tabindex="-1" autocomplete="off"></div>
                                        <input type="hidden" name="_mc4wp_timestamp" value="1494376244"><input type="hidden" name="_mc4wp_form_id" value="42097"><input type="hidden" name="_mc4wp_form_element_id" value="mc4wp-form-1"></div>
                                    <div class="mc4wp-response"></div>
                                </form><!-- / MailChimp for WordPress Plugin --></aside>
                            <aside id="penci_social_widget-2" class="widget penci_social_widget">
                                <div class="widget-social">
                                    <a href="https://www.facebook.com/pg/NhangThanHoatTinh" target="_blank"><i class="fa fa-facebook"></i><span>Facebook</span></a>

                                    <a href="https://www.facebook.com/pg/NhangThanHoatTinh" target="_blank"><i class="fa fa-twitter"></i><span>Twitter</span></a>

                                    <a href="https://www.facebook.com/pg/NhangThanHoatTinh" target="_blank"><i class="fa fa-instagram"></i><span>Instagram</span></a>

                                    <a href="https://www.facebook.com/pg/NhangThanHoatTinh" target="_blank"><i class="fa fa-pinterest"></i><span>Pinterest</span></a>

                                    <a href="mailto:thu.thuanthanhtien@gmail.com"><i class="fa fa-envelope-o"></i><span>Email</span></a>

                                    <a href="https://www.facebook.com/pg/NhangThanHoatTinh" target="_blank"><i class="fa fa-snapchat-ghost"></i><span>Snapchat</span></a>
                                </div>
                            </aside>
                        </div>
                        &lt;%&ndash;<img src="/resources/img/footer.jpg" width="100%" height="100%"/>&ndash;%&gt;
                        <!-- Facebook widget -->

                        &lt;%&ndash;<div id="fb-root"><iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Ftngocphuong&tabs=timeline&width=0&height=0&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId=1832292157092575"
                                                  width="0" height="0" style="border:none;overflow:hidden" scrolling="no" frameborder="0"
                                                  allowTransparency="true"></iframe></div>
                        <script>(function(d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) return;
                            js = d.createElement(s); js.id = id;
                            js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.9&appId=1832292157092575";
                            fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));</script>&ndash;%&gt;
                        <div style="clear:both;">
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>

    </div>
    <div class="footer-bottom">
        <div class="container copyright">
            <p>Copyright &copy; 2017 NhangHoatTinh <a target="_blank"
                                                          href="/"></a>
            </p>
        </div>
    </div>

</footer>
<script>
    function setLocal(id) {
        localStorage.setItem("id_click", id);
        return;
    }
    $(document).ready(function () {
        var id = localStorage.getItem("id_click");
        $('#nav_' + id).addClass( "current active" );
        $('#nav_blog_' + id).addClass( "current active" );
        $('#aside_' + id).addClass( "current active" );
    });
</script>