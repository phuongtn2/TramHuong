<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<section class="main-content">
    <form:form modelAttribute="rule" method="post" action="/admin/add-rule">
        <h1><a id="h1_demo1" class="anchor" href="#h1_demo1" aria-hidden="true"><span
                class="octicon octicon-link"></span></a>Qui Định Vận Chuyển&Mua Hàng</h1>
        <input type="hidden" id="id" name="id"
               value="<c:if test="${rule.id!= null}">${rule.id}</c:if>"/>
            <div class="form-group">
                <%--<div class="col-lg-3">
                    <label class="control-label"><spring:message code="post.content"
                                                                 text="default text"/></label>
                </div>--%>
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <input type="hidden" required="required" name="content" id="content"/>
                        <div class="ibox-content no-padding">
                            <c:if test="${rule.id!= null}">
                                <div class="summernote">
                                        ${rule.content}
                                </div>
                            </c:if>
                            <c:if test="${rule.id== null}">
                                <div class="summernote">
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" onclick="setValueContent();">
                    <i class="fa fa-check"></i><spring:message code="common.button.save" text="default text"/>
                </button>
            </div>

    </form:form>

</section>