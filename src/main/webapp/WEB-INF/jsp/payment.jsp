<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 27/04/2017
  Time: 2:58 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-9" id="layout-page">
		<span class="header-page clearfix">
			 <h1>Cách thanh toán</h1>
		</span>

    <div class="content-page">
        <table align="center" border="0" cellpadding="1" cellspacing="1" style="font-family: verdana; width: 650px;"
               data-mce-style="font-family: verdana; width: 650px;" class="mce-item-table">
            <tbody>
            <tr>
                <td><p style="text-align: justify;" data-mce-style="text-align: justify;"><span style="color: #ff0000;"
                                                                                                data-mce-style="color: #ff0000;"><strong><span
                        style="font-family: arial, helvetica, sans-serif;"
                        data-mce-style="font-family: arial, helvetica, sans-serif;">CÁCH THANH TOÁN</span></strong></span>
                </p>
                    <p style="text-align: justify;" data-mce-style="text-align: justify;"><span
                            style="font-family: arial, helvetica, sans-serif;"
                            data-mce-style="font-family: arial, helvetica, sans-serif;"><strong style="font-size: 14px;"
                                                                                                data-mce-style="font-size: 14px;">A. Giao hàng và thanh toán cùng lúc theo địa chỉ đặt hàng của quý khách.</strong></span>
                    </p>
                    <p style="text-align: justify;" data-mce-style="text-align: justify;"><span
                            style="font-family: arial, helvetica, sans-serif;"
                            data-mce-style="font-family: arial, helvetica, sans-serif;"><span style="font-size: 14px;"
                                                                                              data-mce-style="font-size: 14px;"><strong>B. Thanh toán chuyển khoản theo hệ thống các ngân hàng sau:</strong></span></span>
                    </p></td>
            </tr>
            </tbody>
        </table>
        <p style="text-align: justify;" data-mce-style="font-family: verdana; font-size: medium; text-align: justify;">
            <span style="font-family: verdana; font-size: medium;"
                  data-mce-style="font-family: verdana; font-size: medium;">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span
                face="verdana" size="3" data-mce-style="font-family: verdana; font-size: medium;"
                style="font-family: verdana; font-size: medium;"></span><span face="verdana" size="3"
                                                                              data-mce-style="font-family: verdana; font-size: medium;"
                                                                              style="font-family: verdana; font-size: medium;"><br><br></span>
        </p>
        <span class="desc">Cảm ơn quí khách đã tin tưởng sản phẩm của chúng tôi.
                        Quí khách chuyển khoản số tiền vào TK của chúng tôi.
                        Khi chuyển khoản, vui lòng điền vào dòng ghi chú : số đơn hàng.
                        <c:forEach items="${billings}" var="b">
                            ${b.description}
                            ${b.accountName}
                        </c:forEach>
                </span>
        <p style="font-family: verdana; font-size: medium; text-align: justify;"
           data-mce-style="font-family: verdana; font-size: medium; text-align: justify;">&nbsp;</p>
    </div>
</div>