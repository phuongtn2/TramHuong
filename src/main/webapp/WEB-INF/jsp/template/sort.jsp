<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 27/04/2017
  Time: 8:53 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-12">
    <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
            <h1 style="color: white">
                Tất cả sản phẩm
            </h1>
        </div>
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
            <form class="col-md-12" action="/sort" method="post" modelAttribute="sortDto" id="sortForm">
                <div class="browse-tags">
                    <span style="color: white">Sắp xếp theo:</span>
                    <input type="hidden" name="sort" value="${sortDto.sort}"/>
                    <input type="hidden" name="sortValue" value="${sortDto.sortValue}"/>
                    <span class="custom-dropdown custom-dropdown--white">
                      <select name="sortType" class="sort-by custom-dropdown__select custom-dropdown__select--white" onchange="submitSort();">
                          <option value="manual" <c:if test="${sortDto.sortType == 'manual'}">selected</c:if>>Sản phẩm nổi bật/Khuyến mãi</option>
                        <option value="price-ascending" <c:if test="${sortDto.sortType == 'price-ascending'}">selected</c:if>>Giá bán: Tăng dần</option>
                        <option value="price-descending" <c:if test="${sortDto.sortType == 'price-descending'}">selected</c:if>>Giá bán: Giảm dần</option>
                        <%--<option value="title-ascending" <c:if test="${sortDto.sortType == 'title-ascending'}">selected</c:if>>Tên: A-Z</option>
                        <option value="title-descending" <c:if test="${sortDto.sortType == 'title-descending'}">selected</c:if>>Tên: Z-A</option>
                        <option value="created-ascending" <c:if test="${sortDto.sortType == 'created-ascending'}">selected</c:if>>Cũ nhất</option>
                        <option value="created-descending" <c:if test="${sortDto.sortType == 'created-descending'}">selected</c:if>>Mới nhất</option>--%>
                      </select>
                    </span>
                </div>
            </form>
        </div>
    </div>
</div>