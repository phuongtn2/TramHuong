<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<nav id="navigation" class="navbar-main navbar navbar-default cl-pri">
    <!-- MENU MAIN -->
    <input id="active" name="active" type="hidden" value="${active}"/>
    <div class="container nav-wrapper check_nav">
        <div class="row">
            <div class="navbar-header">
                <div class="pull-right mobile-menu-icon-wrapper">
                    <ul class="mobile-menu-icon">
                        <li class="search">
                            <div class="btn-group">
                                <button type="button"
                                        class="btn btn-default dropdown-toggle icon-search"
                                        data-toggle="dropdown" aria-expanded="false">
                                </button>
                                <div class="dropdown-menu" role="menu">
                                    <div class="search-bar">
                                        <div class="">
                                            <form class="col-md-12" action="/search" method="post" modelAttribute="productName">
                                                <%--<input type="hidden" name="product" value="product"/>--%>
                                                <input type="text" name="productName" placeholder="Tiềm kiếm..."/>
                                                    <button type="submit" class="btn btn-info">
                                                        <span class=""></span> Search
                                                    </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li id="cart-target" class="cart">
                            <a href="/cart" class="cart ">
                                <span class="fa fa-shopping-cart"></span>
                                <span id="cart-count_mobile"><span id="cart-count_mobile_temp">${items}</span></span>
                            </a>
                        </li>
                        <%--<li class="user">
                            <a href="/account/login"class="fa fa-user"></a>
                        </li>--%>

                    </ul>
                </div>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav clearfix">
                    <li id="_1">
                        <a href="/" class=" current">
                            <span>Trang Chủ</span>
                        </a>
                    </li>
                    <li id="_2">
                        <a href="/introduce" class="">
                            Giới Thiệu
                        </a>
                    </li>
                    <li id="_4" class="dropdown">
                        <a href="#" title="Sản phẩm" class="">
                            <span>Sản phẩm</span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <c:forEach items="${mapping_categories}" var="m">
                                <li>
                                    <a href="/category/${m.categoryDto.id}">${m.categoryDto.name}</a>
                                    <c:if test="${m.subSize > 0}">
                                        <ul class="dropdown-menu drop-menu-2">
                                            <c:forEach items="${m.suCategories}" var="s">
                                                <li>
                                                    <a href="/sub-category/${s.id}">${s.name}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </c:if>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li id="_5">
                        <a href="/product/sales" title="Khuyến Mãi" class="">
                            <span>Khuyến Mãi</span>
                        </a>
                        <%--<ul class="dropdown-menu" role="menu">
                            <li>
                                <a href="/blogs/tin-khuyen-mai" title="Nhang Trầm Có Tăm">Nhang Trầm Có
                                    Tăm</a>
                            </li>
                        </ul>--%>
                    </li>
                    <li id="_3" class="dropdown">
                        <a href="#">Bài Viết</a>
                        <ul class="dropdown-menu" role="menu">
                            <c:forEach items="${blogs0}" var="b0">
                                <li>
                                    <a href="/blog/${b0.id}">
                                            ${b0.name}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                    <%--<li id="_6" class="dropdown">
                        <a href="#">THẾ GIỚI TÂM LINH</a>
                        <ul class="dropdown-menu" role="menu">
                            <c:forEach items="${blogs1}" var="b1">
                                <li>
                                    <a href="/blog/${b1.id}">${b1.name}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>--%>
                    <%--<li>
                        <a href="/pages/nhan-xet-cua-khach-hang" class="">
                            <span>NHẬN XÉT KH</span>
                        </a>
                    </li>--%>
                </ul>
            </div>
            <div class="hidden-xs pull-right right-menu">
                <ul class="nav navbar-nav pull-right">
                    <%--<li id="user-icon">
                        <ul>
                            <li><a class="reg" href="/account/register" title="Đăng ký">ĐĂNG KÝ</a></li>
                            <li>hay <a class="log" href="/account/login" title="Đăng nhập">Đăng nhập</a>
                            </li>
                        </ul>
                    </li>--%>

                    <!-- Card -->
                    <li class="">
                        <ul class="nodrop">
                            <li id="cart-target" class="toolbar-cart ">
                                <a href="/cart" title="Giỏ hàng" class="cart">
                                    <span class="fa fa-shopping-cart"></span>
                                    <span id="cart-count">
                                        <span id="cart-count-temp">${items}</span>
								    </span>
                                </a>
                            </li>
                        </ul>
                    </li> <!-- Card -->
                    <li class="" style="margin-left: 15px;">
                            <ul class="nodrop">
                                <li id="search-icon" class="drop-control">
                                    <div class="btn-group">
                                        <button type="button"
                                                class="btn btn-default dropdown-toggle icon-search"
                                                data-toggle="dropdown" aria-expanded="false">
                                        </button>
                                        <div class="dropdown-menu" role="menu">
                                            <div class="search-bar">
                                                <div class="">
                                                    <form class="col-md-12" action="/search" method="post" modelAttribute="productName">
                                                        <%--<input type="hidden" name="type" value="product"/>--%>
                                                        <input type="text" name="productName"
                                                               placeholder="Tìm kiếm..."/>
                                                        <button type="submit" class="btn btn-info">
                                                            <span class=""></span> Search
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>

                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div><!-- End container  -->
    <script>
        $(window).resize(function () {
            $('li.dropdown li.active').parents('.dropdown').addClass('active');
            if ($('.right-menu').width() + $('#navbar').width() > $('.check_nav.nav-wrapper').width() - 40) {
                $('.container-mp.nav-wrapper').addClass('responsive-menu');
            }
            else {
                $('.container-mp.nav-wrapper').removeClass('responsive-menu');
            }
        });
        $(document).on("click", "ul.mobile-menu-icon .dropdown-menu ,.drop-control .dropdown-menu, .drop-control .input-dropdown", function (e) {
            e.stopPropagation();
        });
        $(document).ready(function () {
            var id = $('#active').val();
            var listId = ["_1", "_2", "_3", "_4" , "_5", "_6"];
            for (i = 0; i <=  listId.length; i++) {
                if(id === listId[i]){
                    $('#'+listId[i]).addClass( "active" );
                }else{
                    $('#'+listId[i]).removeClass( "active" )
                }
            }
        });

    </script>
</nav>