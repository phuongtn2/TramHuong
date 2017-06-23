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
                    <%--<a onclick="goBack()" class="btn btn-success btn btn-xs"><i class="fa fa-backward"><spring:message
                            code="common.button.back"
                            text="default text"/></i></a>--%>
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
                            <%--<c:if test="${blogId!= null}">
                                <input type="hidden" class="form-control" name="blogId"
                                       value="${blogId}"/>
                            </c:if>--%>
                            <input type="text" class="form-control" name="title" max="1024"
                                   value="<c:if test="${post.title != null}">${post.title}</c:if>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label">Tag</label>
                        </div>
                        <div class="col-lg-6">
                            <select name="tagList" class="form-control select2" multiple="multiple" data-placeholder="Chọn Tag">
                                <c:forEach items="${tags}" var="t">
                                    <option <c:forEach items="${tagsP}" var="p"> <c:if test="${t.tag == p}"> selected="selected" </c:if> </c:forEach>>${t.tag}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="post.sub"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                            <c:if test="${post.id!= null}">
                               <%-- <div id="subContent_div" class="ui-widget-content" style="height: 25%;width: 100%;">--%>
                                    <textarea rows="1" style="width: 100%;"
                                              name="subContent" required maxlength="2048">${post.subContent}</textarea>
                                <%--</div>--%>
                            </c:if>
                            <c:if test="${post.id== null}">
                                <%--<div id="subContent_div" class="ui-widget-content" style="height: 25%;width: 100%;">--%>
                                    <textarea rows="1" style="width: 100%;"
                                              name="subContent" required maxlength="2048"></textarea>
                                <%--</div>--%>
                            </c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label"><spring:message code="post.content"
                                                                         text="default text"/></label>
                        </div>
                        <div class="col-lg-6">
                                <div class="ibox float-e-margins">
                                    <input type="hidden" required="required" name="content" id="content"/>
                                    <div class="ibox-content no-padding">
                                        <c:if test="${post.id!= null}">
                                        <div class="summernote">
                                            ${post.content}
                                        </div>
                                        </c:if>
                                        <c:if test="${post.id== null}">
                                            <div class="summernote">
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
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
                            <input type="text" class="form-control" name="url"
                                   value="<c:if test="${post.url != null}">${post.url}</c:if>"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label">Nguồn Bài Viết</label>
                        </div>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" name="source"
                                   value="<c:if test="${post.source != null}">${post.source}</c:if>"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3">
                            <label class="control-label">Bài Viết Nổi Bật</label>
                        </div>
                        <div class="col-lg-6">
                            <div class="i-checks"><label>
                                <input type="checkbox" name="sHigh"
                                       <c:if test="${post.isHigh==1}">checked=""</c:if> /></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 20px;">
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary" onclick="setValueContent();">
                                <i class="fa fa-check"></i><spring:message code="common.button.save"
                                                                           text="default text"/>
                            </button>
                            <button name="reset" class="btn btn-danger" type="reset">
                                <i class="fa fa-refresh"></i><spring:message code="common.button.refresh"
                                                                             text="default text"/>
                            </button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>





