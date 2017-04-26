<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<section class="main-content">
    <form:form modelAttribute="introduce" method="post" id="userForm">
        <h1><a id="h1_demo1" class="anchor" href="#h1_demo1" aria-hidden="true"><span
                class="octicon octicon-link"></span></a>Giới Thiệu</h1>
        <input type="hidden" id="id" name="id"
               value="<c:if test="${introduce.id!= null}">${introduce.id}</c:if>"/>
        <c:if test="${introduce.id!= null}">
            <textarea id="introduce_id" style="display: none;" name="content">
                ${introduce.content}
            </textarea>
        </c:if>
        <c:if test="${introduce.id== null}">
            <textarea id="introduce_id" style="display: none;" name="content">
                # Intro
                    Bắt đầu thây đổi trang giới thiệu của bạn !
            </textarea>
        </c:if>
        <input type="hidden" id="add" name="add">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addButton">
            <i class="fa fa-check"></i><spring:message code="common.button.save" text="default text"/>
        </button>
    </form:form>

</section>