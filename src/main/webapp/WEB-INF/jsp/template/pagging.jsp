<%--
  Created by IntelliJ IDEA.
  User: phuon
  Date: 27/04/2017
  Time: 8:57 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-12 ">
    <div id="pagination" class="">
        <%--<span id="PageList" class="clear"></span>--%>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
            <span id="PageList" class="page-node"></span>
        </div>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#pagging_product").Pagination();
            });
        </script>

        <%--<div class="col-lg-2 col-md-2 col-sm-3 hidden-xs">

        </div>
        <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12 text-center">


            <span class="page-node current">1</span>


            <a class="page-node" href="/collections/all?page=2">2</a>


            <a class="page-node" href="/collections/all?page=3">3</a>


            <span class="page-node ">…</span>


            <a class="page-node" href="/collections/all?page=19">19</a>


        </div>
        <div class="col-lg-2 col-md-2 col-sm-3 hidden-xs">

            <a class="pull-right next fa fa-angle-right"
               href="/collections/all?page=2"><span>Trang sau</span></a>

        </div>--%>


    </div>
        <%--<ul class="pagination"></ul>--%>

    <%--<script>
        var monkeyList = new List('pagging_product', {
            valueNames: ['col-md-4 col-sm-6 col-xs-12 pro-loop'],
            page: 3,
            pagination: true
        });
    </script>--%>
</div>
