<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="main-content">
    <!-- Sản phẩm trang chủ -->
    <div class="product-list clearfix">
        <div class="title-line">
            <h3>Sản phẩm nổi bật</h3>
        </div>
        <!--Product loop-->
        <div class="row content-product-list products-resize">
            <c:forEach items="${pHighlights}" var="pH">
                <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                    <div class="product-block product-resize">
                        <div class="product-img image-resize view view-third clearfix">
                            <c:if test="${pH.isEffete == 1}">
                                <div class="sold-out">Hết hàng</div>
                            </c:if>
                            <c:if test="${pH.isEffete == 0}">
                                <c:if test="${pH.isNew == 1}">
                                    <div class="sold-out">Sản phẩm mới</div>
                                </c:if>
                                <c:if test="${pH.isSale == 1}">
                                    <div class="sold-out">Sản khuyến mãi</div>
                                </c:if>
                            </c:if>
                            <a href="/product/${pH.id}">
                                <div class="mask">
                                    <img src="/resources/img/quick-look.png"
                                         data-handle="${pH.id}"/>
                                </div>
                                <img src="${pH.img}"/>
                            </a>
                        </div>
                        <div class="product-detail clearfix">
                            <!-- sử dụng pull-left -->
                            <p class="pro-price">${pH.priceDisplay}₫</p>
                            <p class="pro-price-del text-left"></p></h3>
                            <h3 class="pro-name"><a href="/product/${pH.id}">${pH.name}</a></h3>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row">
            <div class="col-lg-12 pull-center">
                <a class="btn btn-readmore" href="/collections/nhang-tram-huong" role="button">Xem
                    thêm </a>
            </div>
        </div>
    </div>
    <!--Product loop-->
    <div class="product-list clearfix ">
        <div class="title-line">
            <h3>Sản phẩm khuyến mãi</h3>
        </div>
        <div class="row content-product-list products-resize">


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/lo-xong-tram-truc-tiep-lxtt16d"
                           title="Lò Xông Trầm Trực Tiếp - LXTT16D">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/lo-xong-tram-truc-tiep-lxtt16d"
                                     alt="Lò Xông Trầm Trực Tiếp - LXTT16D"/>
                            </div>
                            <img alt="Lò Xông Trầm Trực Tiếp - LXTT16D"
                                 src="//hstatic.net/526/1000069526/1/2016/5-30/loxongtramtructiep_lxtt16d-750k_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-left -->
                        <p class="pro-price">750,000₫</p>
                        <p class="pro-price-del text-left"></p></h3>
                        <h3 class="pro-name"><a href="/products/lo-xong-tram-truc-tiep-lxtt16d"
                                                title="Lò Xông Trầm Trực Tiếp - LXTT16D">Lò Xông
                            Trầm Trực Tiếp - LXTT16D </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/lo-xong-tram-truc-tiep-lxtt16b"
                           title="Lò Xông Trầm Trực Tiếp - LXTT16B">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/lo-xong-tram-truc-tiep-lxtt16b"
                                     alt="Lò Xông Trầm Trực Tiếp - LXTT16B"/>
                            </div>
                            <img alt="Lò Xông Trầm Trực Tiếp - LXTT16B"
                                 src="//hstatic.net/526/1000069526/1/2016/5-30/loxongtramtructiep_lxtt16b-750k_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-right -->
                        <p class="pro-price">750,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/lo-xong-tram-truc-tiep-lxtt16b"
                                                title="Lò Xông Trầm Trực Tiếp - LXTT16B">Lò Xông
                            Trầm Trực Tiếp - LXTT16B </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng end -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/lo-xong-tram-truc-tiep-lxtt16c"
                           title="Lò Xông Trầm Trực Tiếp - LXTT16C">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/lo-xong-tram-truc-tiep-lxtt16c"
                                     alt="Lò Xông Trầm Trực Tiếp - LXTT16C"/>
                            </div>
                            <img alt="Lò Xông Trầm Trực Tiếp - LXTT16C"
                                 src="//hstatic.net/526/1000069526/1/2016/5-30/loxongtramtructiep_lxtt16c-750k_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-left -->
                        <p class="pro-price">750,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/lo-xong-tram-truc-tiep-lxtt16c"
                                                title="Lò Xông Trầm Trực Tiếp - LXTT16C">Lò Xông
                            Trầm Trực Tiếp - LXTT16C </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/lo-xong-tram-truc-tiep-lxtt15d"
                           title="Lò Xông Trầm Trực Tiếp - LXTT15D">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/lo-xong-tram-truc-tiep-lxtt15d"
                                     alt="Lò Xông Trầm Trực Tiếp - LXTT15D"/>
                            </div>
                            <img alt="Lò Xông Trầm Trực Tiếp - LXTT15D"
                                 src="//hstatic.net/526/1000069526/1/2016/5-30/loxongtramtructiep_lxtt15d1-950k_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-right -->
                        <p class="pro-price">950,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/lo-xong-tram-truc-tiep-lxtt15d"
                                                title="Lò Xông Trầm Trực Tiếp - LXTT15D">Lò Xông
                            Trầm Trực Tiếp - LXTT15D </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/lo-xong-tram-truc-tiep-lxtt15c"
                           title="Lò Xông Trầm Trực Tiếp - LXTT15C">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/lo-xong-tram-truc-tiep-lxtt15c"
                                     alt="Lò Xông Trầm Trực Tiếp - LXTT15C"/>
                            </div>
                            <img alt="Lò Xông Trầm Trực Tiếp - LXTT15C"
                                 src="//hstatic.net/526/1000069526/1/2016/5-30/loxongtramtructiep_lxtt15c-950k_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-left -->
                        <p class="pro-price">950,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/lo-xong-tram-truc-tiep-lxtt15c"
                                                title="Lò Xông Trầm Trực Tiếp - LXTT15C">Lò Xông
                            Trầm Trực Tiếp - LXTT15C </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng end -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/lo-xong-tram-truc-tiep-lxtt15b"
                           title="Lò Xông Trầm Trực Tiếp - LXTT15B">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/lo-xong-tram-truc-tiep-lxtt15b"
                                     alt="Lò Xông Trầm Trực Tiếp - LXTT15B"/>
                            </div>
                            <img alt="Lò Xông Trầm Trực Tiếp - LXTT15B"
                                 src="//hstatic.net/526/1000069526/1/2016/5-30/loxongtramtructiep_lxtt15b-950k_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-right -->
                        <p class="pro-price">950,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/lo-xong-tram-truc-tiep-lxtt15b"
                                                title="Lò Xông Trầm Trực Tiếp - LXTT15B">Lò Xông
                            Trầm Trực Tiếp - LXTT15B </a></h3>

                    </div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-lg-12 pull-center">


                <a class="btn btn-readmore" href="/collections/lo-xong-tram" role="button">Xem
                    thêm </a>


            </div>
        </div>
    </div>


    <div class="product-list clearfix ">
        <div class="title-line">
            <h3>Sản phẩm mới</h3>
        </div>
        <div class="row content-product-list products-resize">


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/de-cam-nhang-dcn32" title="Đế Cắm Nhang - DCN32">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/de-cam-nhang-dcn32"
                                     alt="Đế Cắm Nhang - DCN32"/>
                            </div>
                            <img alt="Đế Cắm Nhang - DCN32"
                                 src="//hstatic.net/526/1000069526/1/2016/5-30/dcn32-300k_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-left -->
                        <p class="pro-price">300,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/de-cam-nhang-dcn32"
                                                title="Đế Cắm Nhang - DCN32">Đế Cắm Nhang -
                            DCN32 </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/de-cam-nhang-dcn30" title="Đế Cắm Nhang - DCN30">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/de-cam-nhang-dcn30"
                                     alt="Đế Cắm Nhang - DCN30"/>
                            </div>
                            <img alt="Đế Cắm Nhang - DCN30"
                                 src="//hstatic.net/526/1000069526/1/2016/5-30/dcn30a-250k_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-right -->
                        <p class="pro-price">250,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/de-cam-nhang-dcn30"
                                                title="Đế Cắm Nhang - DCN30">Đế Cắm Nhang -
                            DCN30 </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng end -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/de-cam-nhang-dcn29" title="Đế Cắm Nhang - DCN29">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/de-cam-nhang-dcn29"
                                     alt="Đế Cắm Nhang - DCN29"/>
                            </div>
                            <img alt="Đế Cắm Nhang - DCN29"
                                 src="//hstatic.net/526/1000069526/1/2016/5-27/decamnhang_dcn29_km_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-left -->
                        <p class="pro-price">1,200,000₫</p>
                        <p class="pro-price-del text-left"></p></h3>
                        <h3 class="pro-name"><a href="/products/de-cam-nhang-dcn29"
                                                title="Đế Cắm Nhang - DCN29">Đế Cắm Nhang -
                            DCN29 </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/de-cam-nhang-dcn28" title="Đế Cắm Nhang - DCN28">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/de-cam-nhang-dcn28"
                                     alt="Đế Cắm Nhang - DCN28"/>
                            </div>
                            <img alt="Đế Cắm Nhang - DCN28"
                                 src="//hstatic.net/526/1000069526/1/2016/5-27/decamnhang_dcn28km_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-right -->
                        <p class="pro-price">1,200,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/de-cam-nhang-dcn28"
                                                title="Đế Cắm Nhang - DCN28">Đế Cắm Nhang -
                            DCN28 </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/de-cam-nhang-dcn27" title="Đế Cắm Nhang - DCN27">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/de-cam-nhang-dcn27"
                                     alt="Đế Cắm Nhang - DCN27"/>
                            </div>
                            <img alt="Đế Cắm Nhang - DCN27"
                                 src="//hstatic.net/526/1000069526/1/2016/5-27/decamnhang_dcn27km_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-left -->
                        <p class="pro-price">1,200,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/de-cam-nhang-dcn27"
                                                title="Đế Cắm Nhang - DCN27">Đế Cắm Nhang -
                            DCN27 </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng end -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <div class="sold-out">Hết hàng</div>


                        <a href="/products/de-cam-nhang-dcn23" title="Đế Cắm Nhang - DCN23">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/de-cam-nhang-dcn23"
                                     alt="Đế Cắm Nhang - DCN23"/>
                            </div>
                            <img alt="Đế Cắm Nhang - DCN23"
                                 src="//hstatic.net/526/1000069526/1/2016/5-27/decamnhang_dcn23_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-right -->
                        <p class="pro-price">220,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/de-cam-nhang-dcn23"
                                                title="Đế Cắm Nhang - DCN23">Đế Cắm Nhang -
                            DCN23 </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/de-cam-nhang-dcn22" title="Đế Cắm Nhang - DCN22">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/de-cam-nhang-dcn22"
                                     alt="Đế Cắm Nhang - DCN22"/>
                            </div>
                            <img alt="Đế Cắm Nhang - DCN22"
                                 src="//hstatic.net/526/1000069526/1/2016/5-27/decamnhang_dcn22_km_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-left -->
                        <p class="pro-price">1,200,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/de-cam-nhang-dcn22"
                                                title="Đế Cắm Nhang - DCN22">Đế Cắm Nhang -
                            DCN22 </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/de-cam-nhang-dcn16" title="Đế Cắm Nhang - DCN16">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/de-cam-nhang-dcn16"
                                     alt="Đế Cắm Nhang - DCN16"/>
                            </div>
                            <img alt="Đế Cắm Nhang - DCN16"
                                 src="//hstatic.net/526/1000069526/1/2016/5-27/decamnhang_dcn16_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-right -->
                        <p class="pro-price">250,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/de-cam-nhang-dcn16"
                                                title="Đế Cắm Nhang - DCN16">Đế Cắm Nhang -
                            DCN16 </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng end -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/de-cam-nhang-dcn15" title="Đế Cắm Nhang - DCN15">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/de-cam-nhang-dcn15"
                                     alt="Đế Cắm Nhang - DCN15"/>
                            </div>
                            <img alt="Đế Cắm Nhang - DCN15"
                                 src="//product.hstatic.net/1000069526/product/dcn15_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-left -->
                        <p class="pro-price">280,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/de-cam-nhang-dcn15"
                                                title="Đế Cắm Nhang - DCN15">Đế Cắm Nhang -
                            DCN15 </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/de-cam-nhang-dcn13" title="Đế Cắm Nhang - DCN13">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/de-cam-nhang-dcn13"
                                     alt="Đế Cắm Nhang - DCN13"/>
                            </div>
                            <img alt="Đế Cắm Nhang - DCN13"
                                 src="//hstatic.net/526/1000069526/1/2016/5-27/decamnhang_dcn_13_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-right -->
                        <p class="pro-price">240,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/de-cam-nhang-dcn13"
                                                title="Đế Cắm Nhang - DCN13">Đế Cắm Nhang -
                            DCN13 </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/de-cam-nhang-dcn12" title="Đế Cắm Nhang - DCN12">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/de-cam-nhang-dcn12"
                                     alt="Đế Cắm Nhang - DCN12"/>
                            </div>
                            <img alt="Đế Cắm Nhang - DCN12"
                                 src="//hstatic.net/526/1000069526/1/2016/5-27/decamnhang_dcn_12_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-left -->
                        <p class="pro-price">240,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/de-cam-nhang-dcn12"
                                                title="Đế Cắm Nhang - DCN12">Đế Cắm Nhang -
                            DCN12 </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng end -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <div class="sold-out">Hết hàng</div>


                        <a href="/products/de-cam-nhang-dcn11" title="Đế Cắm Nhang - DCN11">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/de-cam-nhang-dcn11"
                                     alt="Đế Cắm Nhang - DCN11"/>
                            </div>
                            <img alt="Đế Cắm Nhang - DCN11"
                                 src="//hstatic.net/526/1000069526/1/2016/5-27/decamnhang_dcn_11_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-right -->
                        <p class="pro-price">195,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/de-cam-nhang-dcn11"
                                                title="Đế Cắm Nhang - DCN11">Đế Cắm Nhang -
                            DCN11 </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <a href="/products/de-cam-nhang-dcn09" title="Đế Cắm Nhang - DCN09">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/de-cam-nhang-dcn09"
                                     alt="Đế Cắm Nhang - DCN09"/>
                            </div>
                            <img alt="Đế Cắm Nhang - DCN09"
                                 src="//hstatic.net/526/1000069526/1/2016/5-27/decamnhang_dcn_09_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-left -->
                        <p class="pro-price">195,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/de-cam-nhang-dcn09"
                                                title="Đế Cắm Nhang - DCN09">Đế Cắm Nhang -
                            DCN09 </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng  -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <div class="sold-out">Hết hàng</div>


                        <a href="/products/de-cam-nhang-dcn-pl" title="Đế Cắm Nhang - DCN PL">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/de-cam-nhang-dcn-pl"
                                     alt="Đế Cắm Nhang - DCN PL"/>
                            </div>
                            <img alt="Đế Cắm Nhang - DCN PL"
                                 src="//hstatic.net/526/1000069526/1/2016/5-27/decamnhang_dpl-80_4mau_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-right -->
                        <p class="pro-price">80,000₫</p>
                        <p class="pro-price-del text-left"></h3>
                        <h3 class="pro-name"><a href="/products/de-cam-nhang-dcn-pl"
                                                title="Đế Cắm Nhang - DCN PL">Đế Cắm Nhang - DCN
                            PL </a></h3>

                    </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 pro-loop"> <!--sử dụng end -->
                <div class="product-block product-resize">
                    <div class="product-img image-resize view view-third clearfix">


                        <div class="sold-out">Hết hàng</div>


                        <a href="/products/de-cam-nhang-dcn06" title="Đế Cắm Nhang - DCN06">
                            <div class="mask">
                                <img src="//hstatic.net/0/0/global/design/member/default/quick-look.png"
                                     data-handle="/products/de-cam-nhang-dcn06"
                                     alt="Đế Cắm Nhang - DCN06"/>
                            </div>
                            <img alt="Đế Cắm Nhang - DCN06"
                                 src="//hstatic.net/526/1000069526/1/2016/5-27/decamnhang_dcn_06_large.jpg"
                                 alt=""/>
                        </a>
                    </div>

                    <div class="product-detail clearfix">


                        <!-- sử dụng pull-left -->
                        <p class="pro-price">145,000₫</p>
                        <p class="pro-price-del text-left"></p></h3>
                        <h3 class="pro-name"><a href="/products/de-cam-nhang-dcn06"
                                                title="Đế Cắm Nhang - DCN06">Đế Cắm Nhang -
                            DCN06 </a></h3>

                    </div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-lg-12 pull-center">


            </div>
        </div>
    </div>


    <!-- End sản phẩm trang chủ -->
</div>