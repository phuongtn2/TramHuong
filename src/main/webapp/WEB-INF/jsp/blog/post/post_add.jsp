<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="row">
    <div class="col-lg-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5><spring:message code="post.title" text="default text"/></h5>
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
                <form:form accept-charset="UTF-8" action="/admin/post/save" method="post" modelAttribute="post" id="userForm" class="form-horizontal new_order" enctype="multipart/form-data">
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="post.name"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <c:if test="${post.id != null}">
                            <input type="hidden" class="form-control" name="id"
                                   value="${post.id}"/>
                            </c:if>
                            <c:if test="${post.id ==null}">
                                <input type="hidden" class="form-control" name="id"
                                       value=""/>
                            </c:if>
                            <c:if test="${blogId!= null}">
                                <input type="hidden" class="form-control" name="blogId"
                                       value="${blogId}"/>
                            </c:if>
                            <input type="text" class="form-control" name="title"
                                   value="<c:if test="${post.title != null}">${post.title}</c:if> " required/>
                        </div>
                    </div>
                    <c:if test="${blogId == null}">
                        <div class="form-group">
                            <div class="col-lg-3">
                                <label class="control-label"><spring:message code="blog.name"
                                                                             text="default text"/></label>
                            </div>
                            <div class="col-lg-6">
                                <select id="blogId" name="blogId" class="form-control m-b" required>
                                    <c:forEach items="${blogs}" var="b">
                                        <option
                                                <c:if test="${b.id==post.blogId}">selected</c:if>
                                                value="${b.id}">${b.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="post.sub"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <c:if test="${post.id!= null}">
                                <textarea id="post_sub_content" style="display: none;" name="subContent">${post.subContent}</textarea>
                            </c:if>
                            <c:if test="${post.id== null}">
                                <textarea id="post_sub_content" style="display: none;" name="subContent"></textarea>
                            </c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="post.content"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <c:if test="${post.id!= null}">
                                <textarea id="post_content" style="display: none;" name="content">${post.content}</textarea>
                            </c:if>
                            <c:if test="${post.id== null}">
                                <textarea id="post_content" style="display: none;" name="content"></textarea>
                            </c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="common.status.title"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <select id="status" name="status" class="form-control m-b" required>
                                <option
                                        <c:if test="${post.status==1}">selected</c:if> value="1">
                                    <spring:message code="common.active" text="default text"/></option>
                                <option
                                        <c:if test="${post.status==0}">selected</c:if> value="0">
                                    <spring:message code="common.deactive" text="default text"/></option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="product.img"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <c:if test="${post.img != null}"><img src="${post.img}"
                                                                     style="width: 40px; height: 40px;"></c:if>
                            <input type="file" class="form-control" name="file"  <c:if test="${post.img == null}">required</c:if>/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="post.url"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" name="code"
                                   value="<c:if test="${post.url != null}">${post.url}</c:if> "/>
                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 20px;">
                        <div class="text-center">
                            <c:if test="${post.id != null}">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fa fa-edit"></i><spring:message code="common.button.update"
                                                                              text="default text"/>
                                </button>
                            </c:if>
                            <c:if test="${post.id == null}">
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
                </form:form>
            </div>
        </div>
    </div>
</div>





