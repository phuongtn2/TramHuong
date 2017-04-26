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
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${aui.fullName}</strong>
                             </span> <span class="text-muted text-xs block">Admin<b class="caret"></b></span> </span> </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="/admin/changepass">Thây Đổi Mật Khẩu</a></li>
                        <li class="divider"></li>
                        <li><a href="/admin/logout"><spring:message code="common.logout.title" text="default text"/></a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    B
                </div>
            </li>
            <li id="categories" class="active">
                <a href="/admin/categories"><i class="fa fa-th-large"></i> <span class="nav-label">Danh Mục</span> <span class="fa arrow"></span></a>
            </li>
            <li id="s_categories" class="active">
                <a href="/admin/s_categories"><i class="fa fa-th-large"></i> <span class="nav-label">Danh Mục Con</span> <span class="fa arrow"></span></a>
            </li>
            <li id="introduce">
                <a href="/admin/introduce"><i class="fa fa-th-large"></i> <span class="nav-label">Trang Giới Thiệu</span> <span class="fa arrow"></span></a>
            </li>

            <li id="orders">
                <a href="/admin/orders"><i class="fa fa-th-large"></i> <span class="nav-label">Đơn Hàng</span> <span class="fa arrow"></span></a>
            </li>
            <li id="banner">
                <a href="/admin/banners"><i class="fa fa-th-large"></i> <span class="nav-label">Banner</span> <span class="fa arrow"></span></a>
            </li>
        </ul>

    </div>
</nav>