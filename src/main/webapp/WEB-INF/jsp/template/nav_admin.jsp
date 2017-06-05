<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<spring:url value="/resources/img/building.png" var="logo"/>
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="${logo}" />
                             </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${pageContext.request.getUserPrincipal().getName()}</strong>
                             </span> <span class="text-muted text-xs block">Admin<b class="caret"></b></span> </span> </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="/admin/change-password">Thây Đổi Mật Khẩu</a></li>
                        <li class="divider"></li>
                        <li><a href="/admin/logout"><spring:message code="common.logout.title" text="default text"/></a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    B
                </div>
            </li>
            <li id="account" class="active">
                <a href="/admin/accounts"><i class="fa fa-th-large"></i> <span class="nav-label">Quản Lý Accout</span> <span class="fa arrow"></span></a>
            </li>
            <li id="categories" class="active">
                <a href="/admin/categories"><i class="fa fa-th-large"></i> <span class="nav-label">Danh Mục</span> <span class="fa arrow"></span></a>
            </li>
            <li id="s_categories" class="active">
                <a href="/admin/s_categories"><i class="fa fa-th-large"></i> <span class="nav-label">Danh Mục Con</span> <span class="fa arrow"></span></a>
            </li>
            <li id="product" class="active">
                <a href="/admin/products"><i class="fa fa-th-large"></i> <span class="nav-label">Quản Lý Sản Phẩm</span> <span class="fa arrow"></span></a>
            </li>
            <li id="blogs" class="active">
                <a href="/admin/blogs"><i class="fa fa-th-large"></i> <span class="nav-label">Quản Lý Blog&Bài Viết</span> <span class="fa arrow"></span></a>
            </li>
            <li id="tags" class="active">
                <a href="/admin/tags"><i class="fa fa-th-large"></i> <span class="nav-label">Quản Lý Tag</span> <span class="fa arrow"></span></a>
            </li>
            <li id="about" class="active">
                <a href="/admin/about"><i class="fa fa-th-large"></i> <span class="nav-label">Thông Tin WebSite</span> <span class="fa arrow"></span></a>
            </li>
            <li id="payment" class="active">
                <a href="/admin/payments"><i class="fa fa-th-large"></i> <span class="nav-label">Thanh Toán</span> <span class="fa arrow"></span></a>
            </li>
            <li id="shipping" class="active">
                <a href="/admin/shippings"><i class="fa fa-th-large"></i> <span class="nav-label">Vận Chuyển</span> <span class="fa arrow"></span></a>
            </li>
            <li id="introduce" class="active">
                <a href="/admin/introduce"><i class="fa fa-th-large"></i> <span class="nav-label">Trang Giới Thiệu</span> <span class="fa arrow"></span></a>
            </li>

            <li id="orders" class="active">
                <a href="/admin/orders"><i class="fa fa-th-large"></i> <span class="nav-label">Đơn Hàng</span> <span class="fa arrow"></span></a>
            </li>
            <li id="mail" class="active">
                <a href="/admin/mails"><i class="fa fa-th-large"></i> <span class="nav-label">Email Template</span> <span class="fa arrow"></span></a>
            </li>
            <li id="rule" class="active">
                <a href="/admin/rule"><i class="fa fa-th-large"></i> <span class="nav-label">Qui Định Vận Chuyển&Mua Hàng</span> <span class="fa arrow"></span></a>
            </li>
            <li id="static" class="active">
                <a href="/admin/static"><i class="fa fa-th-large"></i> <span class="nav-label">Cách Mua Hàng | Cách Thanh Toán | Phương Thức Vận Chuyển</span> <span class="fa arrow"></span></a>
            </li>
        </ul>

    </div>
</nav>