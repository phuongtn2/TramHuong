<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 26/04/2017
  Time: 5:04 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="col-md-3 clearfix">
    <!-- Begin sidebar blog -->
    <div class="sidebar">
        <!-- Begin: Danh mục tin tức -->
        <div class="news-menu list-group">
            <span class="list-group-item active">Danh mục blog</span>
            <ul class="nav sidebar" id="menu-blog">
                <li class=" first">
                    <a href="/">
                        <span>Trang Chủ</span>
                    </a>
                </li>
                <li class=" ">
                    <a href="/introduce">
                        <span>Giới thiệu</span>
                    </a>
                </li>
                <li class="item has-sub  ">
                    <a href="http://tramhuongkyanh.com/blogs/tram-huong">
                        <span class="lbl">Bài Viết Sản Phẩm</span>
                        <span data-toggle="collapse" data-parent="#cssmenu" href="#sub-item-3"
                              class="sign">
						<img src="//hstatic.net/0/0/global/design/theme-default/arrow-down.png">
					</span>
                    </a>
                    <ul class="nav children collapse" id="sub-item-3">
                        <li class="first">
                            <a href="http://tramhuongkyanh.com/blogs/tram-huong" title="Trầm Hương">
                                <span>Trầm Hương</span>
                            </a>
                        </li>
                        <li class="">
                            <a href="http://tramhuongkyanh.com/blogs/nhang-tram-huong"
                               title="Nhang Trầm Hương">
                                <span>Nhang Trầm Hương</span>
                            </a>
                        </li>
                        <li class="">
                            <a href="http://tramhuongkyanh.com/blogs/lo-xong-tram-huong-dung-dien"
                               title="Lò Xông Trầm Dùng Điện">
                                <span>Lò Xông Trầm Dùng Điện</span>
                            </a>
                        </li>
                        <li class="">
                            <a href="http://tramhuongkyanh.com/blogs/lo-xong-tram-huong-xe-o-to"
                               title="Lò Xông Trầm Dùng cho xe ÔTô">
                                <span>Lò Xông Trầm Dùng cho xe ÔTô</span>
                            </a>
                        </li>
                        <li class="">
                            <a href="http://tramhuongkyanh.com/blogs/tuong-phat-bang-tram-huong"
                               title="Tượng Phật Bằng Trầm Hương">
                                <span>Tượng Phật Bằng Trầm Hương</span>
                            </a>
                        </li>
                        <li class="last">
                            <a href="/blogs/thong-tin-chung-ve-san-pham"
                               title="Thông Tin Chung Về Sản Phẩm">
                                <span>Thông Tin Chung Về Sản Phẩm</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="item has-sub  ">
                    <a href="/collections/all">
                        <span class="lbl">Sản phẩm</span>
                        <span data-toggle="collapse" data-parent="#cssmenu" href="#sub-item-4"
                              class="sign">
						<img src="//hstatic.net/0/0/global/design/theme-default/arrow-down.png">
					</span>
                    </a>
                    <ul class="nav children collapse" id="sub-item-4">
                        <li class="has-sub first">
                            <a href="/collections/nhang-tram-huong" title="Nhang trầm hương">
                                <span>Nhang trầm hương</span>
                                <span class="sign drop-down-1">
								<img src="//hstatic.net/0/0/global/design/theme-default/arrow-down.png">
							</span>
                            </a>
                            <ul class="nav children collapse lve2-blog">

                                <li class="even">
                                    <a href="/collections/nhang-tram-huong-co-tam"
                                       title="Nhang trầm hương có tăm">
                                        <span>Nhang trầm hương có tăm</span>
                                    </a>
                                </li>

                                <li class="odd">
                                    <a href="/collections/nhang-tram-huong-co-tam-size-lon-1"
                                       title="Nhang trầm hương có tăm size lớn">
                                        <span>Nhang trầm hương có tăm size lớn</span>
                                    </a>
                                </li>

                                <li class="even">
                                    <a href="/collections/nhang-tram-huong-khong-tam"
                                       title="Nhang trầm hương không tăm">
                                        <span>Nhang trầm hương không tăm</span>
                                    </a>
                                </li>

                                <li class="odd">
                                    <a href="/collections/nhang-thap" title="Nhang tháp">
                                        <span>Nhang tháp</span>
                                    </a>
                                </li>

                            </ul>
                        </li>
                        <li class="has-sub ">
                            <a href="/collections/tram-huong-mieng" title="Trầm hương miếng">
                                <span>Trầm hương miếng</span>
                                <span class="sign drop-down-1">
								<img src="//hstatic.net/0/0/global/design/theme-default/arrow-down.png">
							</span>
                            </a>
                            <ul class="nav children collapse lve2-blog">

                                <li class="even">
                                    <a href="/collections/tram-huong-mieng"
                                       title="Trầm hương miếng">
                                        <span>Trầm hương miếng</span>
                                    </a>
                                </li>

                            </ul>
                        </li>


                        <li class="">
                            <a href="/collections/tram-huong-bot" title="Trầm hương bột">
                                <span>Trầm hương bột</span>
                            </a>
                        </li>


                        <li class="has-sub ">
                            <a href="/collections/lo-xong-tram" title="Lò xông trầm">
                                <span>Lò xông trầm</span>
                                <span class="sign drop-down-1">
								<img src="//hstatic.net/0/0/global/design/theme-default/arrow-down.png">
							</span>
                            </a>
                            <ul class="nav children collapse lve2-blog">

                                <li class="odd">
                                    <a href="/collections/lo-xong-tram-dung-dien"
                                       title="Lò xông trầm dùng điện">
                                        <span>Lò xông trầm dùng điện</span>
                                    </a>
                                </li>

                                <li class="even">
                                    <a href="/collections/lo-xong-tram-dung-trong-xe-hoi"
                                       title="Lò xông trầm dùng trong xe hơi">
                                        <span>Lò xông trầm dùng trong xe hơi</span>
                                    </a>
                                </li>

                                <li class="odd">
                                    <a href="/collections/lo-xong-tram-dung-truc-tiep"
                                       title="Lò xông trầm dùng trực tiếp">
                                        <span>Lò xông trầm dùng trực tiếp</span>
                                    </a>
                                </li>

                            </ul>
                        </li>


                        <li class="has-sub ">
                            <a href="/collections/de-cam-nhang-tram" title="Đế cắm nhang trầm">
                                <span>Đế cắm nhang trầm</span>
                                <span class="sign drop-down-1">
								<img src="//hstatic.net/0/0/global/design/theme-default/arrow-down.png">
							</span>
                            </a>
                            <ul class="nav children collapse lve2-blog">

                                <li class="even">
                                    <a href="/collections/de-cam-nhang-tram"
                                       title="Đế cắm nhang trầm">
                                        <span>Đế cắm nhang trầm</span>
                                    </a>
                                </li>

                            </ul>
                        </li>


                        <li class="has-sub ">
                            <a href="/collections/vong-tay-tram-huong" title="Vòng tay trầm hương">
                                <span>Vòng tay trầm hương</span>
                                <span class="sign drop-down-1">
								<img src="//hstatic.net/0/0/global/design/theme-default/arrow-down.png">
							</span>
                            </a>
                            <ul class="nav children collapse lve2-blog">

                                <li class="odd">
                                    <a href="/collections/vong-tay-tram-huong-chim-nuoc"
                                       title="Vòng Tay Trầm Hương chìm nước">
                                        <span>Vòng Tay Trầm Hương chìm nước</span>
                                    </a>
                                </li>

                                <li class="even">
                                    <a href="/collections/vong-tay-tram-huong-khong-chim-nuoc"
                                       title="Vòng tay Trầm Hương không chìm nước">
                                        <span>Vòng tay Trầm Hương không chìm nước</span>
                                    </a>
                                </li>

                            </ul>
                        </li>


                        <li class="has-sub ">
                            <a href="/collections/tinh-dau-tram-huong" title="Tinh dầu trầm hương">
                                <span>Tinh dầu trầm hương</span>
                                <span class="sign drop-down-1">
								<img src="//hstatic.net/0/0/global/design/theme-default/arrow-down.png">
							</span>
                            </a>
                            <ul class="nav children collapse lve2-blog">

                                <li class="odd">
                                    <a href="/products/tinh-dau-tram-huong"
                                       title="Tinh dầu trầm hương">
                                        <span>Tinh dầu trầm hương</span>
                                    </a>
                                </li>

                            </ul>
                        </li>


                        <li class="has-sub ">
                            <a href="/collections/tuong-phat" title="Tượng Phật">
                                <span>Tượng Phật</span>
                                <span class="sign drop-down-1">
								<img src="//hstatic.net/0/0/global/design/theme-default/arrow-down.png">
							</span>
                            </a>
                            <ul class="nav children collapse lve2-blog">

                                <li class="even">
                                    <a href="/collections/tuong-phat-tuong-phat-xe-hoi"
                                       title="Tượng Phật xe hơi">
                                        <span>Tượng Phật xe hơi</span>
                                    </a>
                                </li>

                                <li class="odd">
                                    <a href="/collections/tuong-phat-tuong-phat-tram-huong"
                                       title="Tượng Phật trầm hương">
                                        <span>Tượng Phật trầm hương</span>
                                    </a>
                                </li>

                            </ul>
                        </li>


                        <li class="has-sub ">
                            <a href="/collections/mat-day-chuyen-tram-huong-chim-nuoc"
                               title="Mặt Dây Chuyền Trầm Hương Chìm Nước">
                                <span>Mặt Dây Chuyền Trầm Hương Chìm Nước</span>
                                <span class="sign drop-down-1">
								<img src="//hstatic.net/0/0/global/design/theme-default/arrow-down.png">
							</span>
                            </a>
                            <ul class="nav children collapse lve2-blog">

                                <li class="even">
                                    <a href="/collections/mat-day-chuyen-tram-huong-chim-nuoc"
                                       title="Mặt dây chuyền trầm hương chìm nước">
                                        <span>Mặt dây chuyền trầm hương chìm nước</span>
                                    </a>
                                </li>

                            </ul>
                        </li>


                        <li class="has-sub ">
                            <a href="/collections/vong-tay-vang-18k-tram-huong-chim-nuoc"
                               title="Vòng tay vàng 18K trầm hương chìm nước">
                                <span>Vòng tay vàng 18K trầm hương chìm nước</span>
                                <span class="sign drop-down-1">
								<img src="//hstatic.net/0/0/global/design/theme-default/arrow-down.png">
							</span>
                            </a>
                            <ul class="nav children collapse lve2-blog">

                                <li class="odd">
                                    <a href="/collections/vong-tay-vang-18k-tram-huong-chim-nuoc"
                                       title="Vòng tay vàng 18K chìm nước">
                                        <span>Vòng tay vàng 18K chìm nước</span>
                                    </a>
                                </li>

                            </ul>
                        </li>


                        <li class="has-sub last">
                            <a href="/collections/chuoi-hat-tram-huong-108-hat"
                               title="Chuỗi hạt trầm hương 108 hạt">
                                <span>Chuỗi hạt trầm hương 108 hạt</span>
                                <span class="sign drop-down-1">
								<img src="//hstatic.net/0/0/global/design/theme-default/arrow-down.png">
							</span>
                            </a>
                            <ul class="nav children collapse lve2-blog">

                                <li class="even">
                                    <a href="/products/chuoi-hat-tram-huong-c108-04"
                                       title="Chuỗi hạt trầm hượng C108-04">
                                        <span>Chuỗi hạt trầm hượng C108-04</span>
                                    </a>
                                </li>

                                <li class="odd">
                                    <a href="/products/chuoi-hat-tram-huong-c108-03"
                                       title="Chuỗi hạt trầm hượng C108-03">
                                        <span>Chuỗi hạt trầm hượng C108-03</span>
                                    </a>
                                </li>

                                <li class="even">
                                    <a href="/products/chuoi-hat-tram-huong-c108-02"
                                       title="Chuỗi hạt trầm hượng C108-02">
                                        <span>Chuỗi hạt trầm hượng C108-02</span>
                                    </a>
                                </li>

                                <li class="odd">
                                    <a href="/products/chuoi-hat-tram-huong-c108-01"
                                       title="Chuỗi hạt trầm hượng C108-01">
                                        <span>Chuỗi hạt trầm hượng C108-01</span>
                                    </a>
                                </li>

                            </ul>
                        </li>


                    </ul>
                </li>


                <li class="item has-sub  ">
                    <a href="/blogs/tin-khuyen-mai">
                        <span class="lbl">KHUYẾN MÃI</span>
                        <span data-toggle="collapse" data-parent="#cssmenu" href="#sub-item-5"
                              class="sign">
						<img src="//hstatic.net/0/0/global/design/theme-default/arrow-down.png">
					</span>
                    </a>
                    <ul class="nav children collapse" id="sub-item-5">


                        <li class="firstlast">
                            <a href="/blogs/tin-khuyen-mai" title="Nhang Trầm Có Tăm">
                                <span>Nhang Trầm Có Tăm</span>
                            </a>
                        </li>


                    </ul>
                </li>


                <li class="item has-sub  ">
                    <a href="/pages/tim-hieu-ve-tam-linh">
                        <span class="lbl">THẾ GIỚI TÂM LINH</span>
                        <span data-toggle="collapse" data-parent="#cssmenu" href="#sub-item-6"
                              class="sign">
						<img src="//hstatic.net/0/0/global/design/theme-default/arrow-down.png">
					</span>
                    </a>
                    <ul class="nav children collapse" id="sub-item-6">


                        <li class="first">
                            <a href="/blogs/the-gioi-tam-linh" title="Tìm hiểu về tâm linh">
                                <span>Tìm hiểu về tâm linh</span>
                            </a>
                        </li>


                        <li class="">
                            <a href="/blogs/nhac-thien-thu-gian" title="Nhạc Thiền Thư Giãn">
                                <span>Nhạc Thiền Thư Giãn</span>
                            </a>
                        </li>


                        <li class="last">
                            <a href="http://tramhuongkyanh2.myharavan.com/blogs/danh-ngon-cuoc-song"
                               title="Danh Ngôn Cuộc Sống">
                                <span>Danh Ngôn Cuộc Sống</span>
                            </a>
                        </li>


                    </ul>
                </li>


                <li class=" last">
                    <a href="/pages/nhan-xet-cua-khach-hang">
                        <span>NHẬN XÉT KH</span>
                    </a>
                </li>


            </ul>
            <script>
                $(document).ready(function () {
                    //$('ul li:has(ul)').addClass('hassub');
                    $('#menu-blog ul ul li:odd').addClass('odd');
                    $('#menu-blog ul ul li:even').addClass('even');
                    $('#menu-blog > ul > li > a').click(function () {
                        $('#menu-blog li').removeClass('active');
                        $(this).closest('li').addClass('active');
                        var checkElement = $(this).nextS();
                        if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                            $(this).closest('li').removeClass('active');
                            checkElement.slideUp('normal');
                        }
                        if ((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                            $('#menu-blog ul ul:visible').slideUp('normal');
                            checkElement.slideDown('normal');
                        }
                        if ($(this).closest('li').find('ul').children().length == 0) {
                            return true;
                        } else {
                            return false;
                        }
                    });

                    $('.drop-down-1').click(function (e) {
                        if ($(this).parents('li').hasClass('has-sub')) {
                            e.preventDefault();
                            if ($(this).hasClass('open-nav')) {
                                $(this).removeClass('open-nav');
                                $(this).parents('li').children('ul.lve2-blog').slideUp('normal').removeClass('in');
                            } else {
                                $(this).addClass('open-nav');
                                $(this).parents('li').children('ul.lve2-blog').slideDown('normal').addClass('in');
                            }
                        } else {

                        }
                    });

                });

                $(".news-menu  ul.navs li.active").parents('ul.children').addClass("in");
            </script>
        </div>
        <!-- End: Danh mục tin tức -->


        <!--Begin: Bài viết mới nhất-->
        <div class="news-latest list-group">
		<span class="list-group-item active">
			Bài viết mới nhất
		</span>


            <div class="article">

                <div class="col-ld-3 col-md-3 col-sm-4 col-xs-4">
                    <a href="/blogs/tram-huong/cong-dung-tram-huong-chua-benh-trong-y-hoc"><img
                            src="//file.hstatic.net/1000069526/file/cong-dung-tram-huong_grande.jpg"
                            alt="CÔNG DỤNG TRẦM HƯƠNG CHỮA BỆNH TRONG Y HỌC"></a>
                </div>

                <div class="post-content  col-lg-9 col-md-9 col-sm-8 col-xs-8 ">
                    <a href="/blogs/tram-huong/cong-dung-tram-huong-chua-benh-trong-y-hoc">CÔNG DỤNG
                        TRẦM HƯƠNG CHỮA BỆNH TRONG Y HỌC</a><span class="date"> <i
                        class="time-date"></i>04/03/2017</span>
                </div>
            </div>


            <div class="article">

                <div class="col-ld-3 col-md-3 col-sm-4 col-xs-4">
                    <a href="/blogs/tram-huong/1000132746-xong-nha-bang-tram-huong-dip-le-tet"><img
                            src="//hstatic.net/526/1000069526/10/2016/4-26/tramhuongkyanh_1_52f6d238-5b9d-4422-4940-762137ab16cf.jpg"
                            alt="Xông nhà bằng trầm hương dịp lễ tết"></a>
                </div>

                <div class="post-content  col-lg-9 col-md-9 col-sm-8 col-xs-8 ">
                    <a href="/blogs/tram-huong/1000132746-xong-nha-bang-tram-huong-dip-le-tet">Xông
                        nhà bằng trầm hương dịp lễ tết</a><span class="date"> <i
                        class="time-date"></i>14/05/2016</span>
                </div>
            </div>


            <div class="article">

                <div class="col-ld-3 col-md-3 col-sm-4 col-xs-4">
                    <a href="/blogs/tram-huong/1000132681-xong-nha-moi-cung-ve-nha-moi-bang-tram-huong"><img
                            src="//hstatic.net/526/1000069526/10/2016/5-25/tramhuongkyanh_3.jpg"
                            alt="Xông nhà mới, cúng về nhà mới bằng trầm hương"></a>
                </div>

                <div class="post-content  col-lg-9 col-md-9 col-sm-8 col-xs-8 ">
                    <a href="/blogs/tram-huong/1000132681-xong-nha-moi-cung-ve-nha-moi-bang-tram-huong">Xông
                        nhà mới, cúng về nhà mới bằng trầm hương</a><span class="date"> <i
                        class="time-date"></i>14/05/2016</span>
                </div>
            </div>


            <div class="article">

                <div class="col-ld-3 col-md-3 col-sm-4 col-xs-4">
                    <a href="/blogs/tram-huong/1000132680-tram-huong-tu-nhien-tram-huong-vuon-trong"><img
                            src="//hstatic.net/526/1000069526/10/2016/4-26/tramhuongkyanh_1_99c3b5d0-53bc-44e2-5f3e-8763a616d9f0.jpg"
                            alt="Trầm hương tự nhiên - Trầm hương vườn trồng"></a>
                </div>

                <div class="post-content  col-lg-9 col-md-9 col-sm-8 col-xs-8 ">
                    <a href="/blogs/tram-huong/1000132680-tram-huong-tu-nhien-tram-huong-vuon-trong">Trầm
                        hương tự nhiên - Trầm hương vườn trồng</a><span class="date"> <i
                        class="time-date"></i>14/05/2016</span>
                </div>
            </div>


        </div>
        <!--End: Bài viết mới nhất-->


    </div>
    <!-- End sidebar blog -->
</div>
