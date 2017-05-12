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
            <div class="browse-tags">
                <span style="color: white">Sắp xếp theo:</span>
                <span class="custom-dropdown custom-dropdown--white">
                  <select class="sort-by custom-dropdown__select custom-dropdown__select--white">
                    <option value="manual">Sản phẩm nổi bật/Khuyến mãi</option>
                    <option value="price-ascending">Giá: Tăng dần</option>
                    <option value="price-descending">Giá: Giảm dần</option>
                    <option value="title-ascending">Tên: A-Z</option>
                    <option value="title-descending">Tên: Z-A</option>
                    <option value="created-ascending">Cũ nhất</option>
                    <option value="created-descending">Mới nhất</option>
                  </select>
                </span>
            </div>
        </div>
    </div>
</div>