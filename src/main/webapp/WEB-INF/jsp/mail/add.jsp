<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><spring:message code="mail.title" text="default text"/></h5>
                <div class="ibox-tools">
                    <a onclick="goBack()" class="btn btn-success btn btn-xs"><i class="fa fa-backward"><spring:message
                            code="common.button.back"
                            text="default text"/></i></a>
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <form:form modelAttribute="mail" action="/admin/mail/save" method="post" id="userForm"
                           class="new_order">
                    <input type="hidden" id="id" name="id"
                           value="<c:if test="${mail.id != null}">${mail.id}</c:if>"
                           class="form-control">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-3">
                                <label class="control-label"><spring:message code="mail.code"
                                                                             text="default text"/></label>
                            </div>
                            <div class="col-lg-6">
                                <c:if test="${mail.id != null}">
                                    <label class="control-label" style="color: red">${mail.code}</label>
                                </c:if>
                                <c:if test="${mail.id == null}">
                                    <input type="text" id="code" name="code" class="form-control" required>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-3">
                                <label class="control-label"><spring:message code="mail.header"
                                                                             text="default text"/></label>
                            </div>
                            <div class="col-lg-6">
                                <c:if test="${mail.id != null}">
                                    <textarea id="mail_header" style="display: none;"
                                              name="header">${mail.header}</textarea>
                                </c:if>
                                <c:if test="${mail.id == null}">
                                    <textarea id="mail_header" style="display: none;" name="header"></textarea>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-3">
                                <label class="control-label"><spring:message code="mail.footer"
                                                                             text="default text"/></label>
                            </div>
                            <div class="col-lg-6">
                                <c:if test="${mail.id != null}">
                                    <textarea id="mail_footer" style="display: none;"
                                              name="footer">${mail.footer}</textarea>
                                </c:if>
                                <c:if test="${mail.id == null}">
                                    <textarea id="mail_footer" style="display: none;" name="footer"></textarea>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group" style="margin-top: 20px;">
                            <div class="text-center">
                                <c:if test="${mail.id != null}">
                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                            data-target="#addButton">
                                        <i class="fa fa-edit"></i><spring:message code="common.button.update"
                                                                                  text="default text"/>
                                    </button>
                                </c:if>
                                <c:if test="${mail.id == null}">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fa fa-check"></i><spring:message code="common.button.add"
                                                                                   text="default text"/>
                                    </button>
                                    <button name="reset" class="btn btn-danger" type="reset">
                                        <i class="fa fa-refresh"></i><spring:message code="common.button.refresh"
                                                                                     text="default text"/>
                                    </button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
