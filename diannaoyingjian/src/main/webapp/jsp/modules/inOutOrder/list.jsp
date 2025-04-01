<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">


<head>
    <%@ include file="../../static/head.jsp" %>
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>

</style>
<body>






<div class="modal fade" id="inOutTableModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <%-- 模态框标题--%>
            <div class="modal-header">
                <h5 class="modal-title" id="modal-title">列表</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%-- 模态框内容 --%>
            <div class="modal-body">
                <div class="col-sm-12">
                    <label class="col-sm-10">
                        物资
                        <select id="goodsSelect" name="goodsSelect"
                                class="selectpicker form-control"  data-live-search="true"
                                title="请选择" data-header="请选择" data-size="5">
                        </select>
                    </label>
                    <input type="hidden" id="inOutGoodsFlag">
                    <label class="col-sm-1">
                        <button onclick="addinOut()" type="button" class="btn btn-success 修改">添加</button>
                    </label>
                </div>
                <label class="col-sm-5">
                    订单名:<input type="text" id="inOutOrderName" class="form-control" placeholder="订单名">
                </label>
                <%-- 添加物资 --%>
                <table id="inOutTable" class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th >物资名称</th>
                        <th >物资现有数量</th>
                        <th >单位</th>
                        <th >操作数量</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="inOutTableTbody">
                    </tbody>
                </table>
            </div>
            <%-- 模态框按钮 --%>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" onclick="submitInOutGoods()" class="btn btn-primary">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>



<div class="modal fade" id="inOutTableListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <%-- 模态框标题--%>
            <div class="modal-header">
                <h5 class="modal-title" id="modal-list-title">列表</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%-- 模态框内容 --%>
            <div class="modal-body">
                <%-- 查出当前宿舍的用户 --%>
                <table id="inOutTableList" class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th >物资名称</th>
                        <th >操作数量</th>
                        <th >单位</th>
                    </tr>
                    </thead>
                    <tbody id="inOutTableListTbody">
                    </tbody>
                </table>
            </div>
            <%-- 模态框按钮 --%>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <%--<button type="button" onclick="submitInOutGoods()" class="btn btn-primary">提交</button>--%>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">
                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">出入库订单管理</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">出入库订单管理</li>
                        <li class="breadcrumb-item active">出入库订单列表</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">出入库订单列表</h3>
                        <div class="table-responsive mb-3">
                            <div class="col-sm-12">
                                                                 
                                        <label>
                                            订单名
                                            <input type="text" id="orderNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="订单名" aria-controls="tableId">
                                        </label>
                                 
                                        <label>
                                            操作人姓名
                                            <input type="text" id="caozuoNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="操作人姓名" aria-controls="tableId">
                                        </label>
                                                                 
                                            <label>
                                                类型
                                                <select name="orderTypesSelectSearch" style="width: 100px;" id="orderTypesSelectSearch" class="form-control form-control-sm"
                                                        aria-controls="tableId">
                                                </select>
                                            </label>
                                 
                                        <label>
                                            出入库时间
                                            <input type="datetime-local" id="insertTimeStartSearch" style="width: 190px;" class="form-control " placeholder="开始" aria-controls="tableId">
                                        </label>
                                            -
                                        <label>
                                            <input type="datetime-local" id="insertTimeEndSearch" style="width: 190px;"  class="form-control" placeholder="结束" aria-controls="tableId">
                                        </label>
                                

                                <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                <button onclick="add()" type="button" class="btn btn-success 新增">添加</button>
                                <button onclick="inGoods()" type="button" class="btn btn-success 修改">入库</button>
                                <button onclick="outGoods()" type="button" class="btn btn-success 修改">出库</button>
                                <button onclick="graph()" type="button" class="btn btn-success 报表">报表</button>
                                <button onclick="deleteMore()" type="button" class="btn btn-danger 删除">批量删除</button>
                            </div>
                            <table id="tableId" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th class="no-sort" style="min-width: 35px;">
                                        <div class="custom-control custom-checkbox">
                                            <input class="custom-control-input" type="checkbox" id="select-all"
                                                   onclick="chooseAll()">
                                            <label class="custom-control-label" for="select-all"></label>
                                        </div>
                                    </th>

                                    <th >订单名</th>
                                    <th >操作人姓名</th>
                                    <th >类型</th>
                                    <th >出入库时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="thisTbody">
                                </tbody>
                            </table>
                            <div class="col-md-6 col-sm-3">
                                <div class="dataTables_length" id="tableId_length">

                                    <select name="tableId_length" aria-controls="tableId" id="selectPageSize"
                                            onchange="changePageSize()">
                                        <option value="10">10</option>
                                        <option value="25">25</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                    条 每页

                                </div>
                            </div>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-end">
                                    <li class="page-item" id="tableId_previous" onclick="pageNumChange('pre')">
                                        <a class="page-link" href="#" tabindex="-1">上一页</a>
                                    </li>

                                    <li class="page-item" id="tableId_next" onclick="pageNumChange('next')">
                                        <a class="page-link" href="#">下一页</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->

    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script language="javascript" type="text/javascript"
        src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>
</script><script type="text/javascript" charset="utf-8"
                 src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>

<script>
    <%@ include file="../../utils/menu.jsp"%>
            <%@ include file="../../static/setMenu.js"%>
            <%@ include file="../../utils/baseUrl.jsp"%>
            <%@ include file="../../static/getRoleButtons.js"%>
            <%@ include file="../../static/crossBtnControl.js"%>
    var tableName = "inOutOrder";
    var pageType = "list";
    var searchForm = {key: ""};
    var pageIndex = 1;
    var pageSize = 10;
    var totalPage = 0;
    var dataList = [];
    var sortColumn = '';
    var sortOrder = '';
    var ids = [];
    var id = null;//查看详情中的订单id
    var caozuoTypes = null; //当前订单的操作类型是已操作还是未操作
    var checkAll = false;


    var orderTypesOptions = [];

    function init() {
        // 满足条件渲染提醒接口
    }

    // 改变每页记录条数
    function changePageSize() {
        var selection = document.getElementById('selectPageSize');
        var index = selection.selectedIndex;
        pageSize = selection.options[index].value;
        getDataList();
    }



    // 查询
    function search() {
        searchForm = {key: ""};

        <!-- 级联表的级联字典表 -->
    <!-- 本表的查询条件 -->
         
        //订单名
        var orderNameSearchInput = $('#orderNameSearch');
        if( orderNameSearchInput != null){
            if (orderNameSearchInput.val() != null && orderNameSearchInput.val() != '') {
                searchForm.orderName = $('#orderNameSearch').val();
            }
        }
     
        //操作人姓名
        var caozuoNameSearchInput = $('#caozuoNameSearch');
        if( caozuoNameSearchInput != null){
            if (caozuoNameSearchInput.val() != null && caozuoNameSearchInput.val() != '') {
                searchForm.caozuoName = $('#caozuoNameSearch').val();
            }
        }
         
            //类型
        var orderTypesSelectSearchInput = document.getElementById("orderTypesSelectSearch");
        if(orderTypesSelectSearchInput != null){
            var orderTypesIndex = orderTypesSelectSearchInput.selectedIndex;
            if( orderTypesIndex  != 0){
                searchForm.orderTypes= document.getElementById("orderTypesSelectSearch").options[orderTypesIndex].value;
            }
        }
     
        var insertTimeStartSearch = $('#insertTimeStartSearch');
        if( insertTimeStartSearch != null){
            if (insertTimeStartSearch.val() != null && insertTimeStartSearch.val() != '') {
                searchForm.insertTimeStart = $('#insertTimeStartSearch').val();
            }
        }
        var insertTimeEndSearch = $('#insertTimeEndSearch');
        if( insertTimeEndSearch != null){
            if (insertTimeEndSearch.val() != null && insertTimeEndSearch.val() != '') {
                searchForm.insertTimeEnd = $('#insertTimeEndSearch').val();
            }
        }
            getDataList();
    }

    // 获取数据列表
    function getDataList() {
        http("inOutOrder/page", "GET", {
            page: pageIndex,
            limit: pageSize,
            sort: sortColumn,
            order: sortOrder,
            //本表的
            orderName: searchForm.orderName,
            caozuoName: searchForm.caozuoName,
            orderTypes: searchForm.orderTypes,
            insertTimeStart: searchForm.insertTimeStart,
            insertTimeEnd: searchForm.insertTimeEnd,

            //级联表的

    }, (res) => {
            if(res.code == 0)
            {
                clear();
                $("#thisTbody").html("");
                dataList = res.data.list;
                totalPage = res.data.totalPage;
                //var tbody = document.getElementById('tbMain');
                for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据  
                    var trow = setDataRow(dataList[i], i); //定义一个方法,返回tr数据 
                    $('#thisTbody').append(trow);
                }
                pagination(); //渲染翻页组件
                getRoleButtons();// 权限按钮控制
            }
        })
        ;
    }

    // 渲染表格数据
    function setDataRow(item, number) {
        //创建行 
        var row = document.createElement('tr');
        row.setAttribute('class', 'useOnce');
        //创建勾选框
        var checkbox = document.createElement('td');
        var checkboxDiv = document.createElement('div');
        checkboxDiv.setAttribute("class", "custom-control custom-checkbox");
        var checkboxInput = document.createElement('input');
        checkboxInput.setAttribute("class", "custom-control-input");
        checkboxInput.setAttribute("type", "checkbox");
        checkboxInput.setAttribute('name', 'chk');
        checkboxInput.setAttribute('value', item.id);
        checkboxInput.setAttribute("id", number);
        checkboxDiv.appendChild(checkboxInput);
        var checkboxLabel = document.createElement('label');
        checkboxLabel.setAttribute("class", "custom-control-label");
        checkboxLabel.setAttribute("for", number);
        checkboxDiv.appendChild(checkboxLabel);
        checkbox.appendChild(checkboxDiv);
        row.appendChild(checkbox)



        //订单名
        var orderNameCell = document.createElement('td');
        orderNameCell.innerHTML = item.orderName;
        row.appendChild(orderNameCell);


        //操作人姓名
        var caozuoNameCell = document.createElement('td');
        caozuoNameCell.innerHTML = item.caozuoName;
        row.appendChild(caozuoNameCell);

        //类型
        var orderTypesCell = document.createElement('td');
        orderTypesCell.innerHTML = item.orderValue;
        row.appendChild(orderTypesCell);


        //出入库时间
        var insertTimeCell = document.createElement('td');
        insertTimeCell.innerHTML = item.insertTime;
        row.appendChild(insertTimeCell);



        //每行按钮
        var btnGroup = document.createElement('td');

        //详情按钮
        var detailBtn = document.createElement('button');
        var detailAttr = "detail(" + item.id + ')';
        detailBtn.setAttribute("type", "button");
        detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
        detailBtn.setAttribute("onclick", detailAttr);
        detailBtn.innerHTML = "查看"
        btnGroup.appendChild(detailBtn)
        var detailListBtn = document.createElement('button');
        var detailListAttr = "detailList(" + item.id + ','+item.orderTypes+')';
        detailListBtn.setAttribute("type", "button");
        detailListBtn.setAttribute("class", "btn btn-info btn-sm 查看");
        detailListBtn.setAttribute("onclick", detailListAttr);
        detailListBtn.innerHTML = "查看详情"
        btnGroup.appendChild(detailListBtn)
        // //修改按钮
        // var editBtn = document.createElement('button');
        // var editAttr = 'edit(' + item.id + ')';
        // editBtn.setAttribute("type", "button");
        // editBtn.setAttribute("class", "btn btn-warning btn-sm 修改");
        // editBtn.setAttribute("onclick", editAttr);
        // editBtn.innerHTML = "修改"
        // btnGroup.appendChild(editBtn)
        //删除按钮
        var deleteBtn = document.createElement('button');
        var deleteAttr = 'remove(' + item.id + ')';
        deleteBtn.setAttribute("type", "button");
        deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
        deleteBtn.setAttribute("onclick", deleteAttr);
        deleteBtn.innerHTML = "删除"
        btnGroup.appendChild(deleteBtn)

        row.appendChild(btnGroup)
        return row;
    }


    // 翻页
    function pageNumChange(val) {
        if (val == 'pre') {
            pageIndex--;
        } else if (val == 'next') {
            pageIndex++;
        } else {
            pageIndex = val;
        }
        getDataList();
    }

    // 下载
    function download(url) {
        window.open(url);
    }

    // 渲染翻页组件
    function pagination() {
        var beginIndex = pageIndex;
        var endIndex = pageIndex;
        var point = 4;
        //计算页码
        for (var i = 0; i < 3; i++) {
            if (endIndex == totalPage) {
                break;
            }
            endIndex++;
            point--;
        }
        for (var i = 0; i < 3; i++) {
            if (beginIndex == 1) {
                break;
            }
            beginIndex--;
            point--;
        }
        if (point > 0) {
            while (point > 0) {
                if (endIndex == totalPage) {
                    break;
                }
                endIndex++;
                point--;
            }
            while (point > 0) {
                if (beginIndex == 1) {
                    break;
                }
                beginIndex--;
                point--
            }
        }
        // 是否显示 前一页 按钮
        if (pageIndex > 1) {
            $('#tableId_previous').show();
        } else {
            $('#tableId_previous').hide();
        }
        // 渲染页码按钮
        for (var i = beginIndex; i <= endIndex; i++) {
            var pageNum = document.createElement('li');
            pageNum.setAttribute('onclick', "pageNumChange(" + i + ")");
            if (pageIndex == i) {
                pageNum.setAttribute('class', 'paginate_button page-item active useOnce');
            } else {
                pageNum.setAttribute('class', 'paginate_button page-item useOnce');
            }
            var pageHref = document.createElement('a');
            pageHref.setAttribute('class', 'page-link');
            pageHref.setAttribute('href', '#');
            pageHref.setAttribute('aria-controls', 'tableId');
            pageHref.setAttribute('data-dt-idx', i);
            pageHref.setAttribute('tabindex', 0);
            pageHref.innerHTML = i;
            pageNum.appendChild(pageHref);
            $('#tableId_next').before(pageNum);
        }
        // 是否显示 下一页 按钮
        if (pageIndex < totalPage) {
            $('#tableId_next').show();
            $('#tableId_next a').attr('data-dt-idx', endIndex + 1);
        } else {
            $('#tableId_next').hide();
        }
        var pageNumInfo = "当前第 " + pageIndex + " 页，共 " + totalPage + " 页";
        $('#tableId_info').html(pageNumInfo);
    }

    // 跳转到指定页
    function toThatPage() {
        //var index = document.getElementById('pageIndexInput').value;
        if (index < 0 || index > totalPage) {
            alert('请输入正确的页码');
        } else {
            pageNumChange(index);
        }
    }

    // 全选/全不选
    function chooseAll() {
        checkAll = !checkAll;
        var boxs = document.getElementsByName("chk");
        for (var i = 0; i < boxs.length; i++) {
            boxs[i].checked = checkAll;
        }
    }

    // 批量删除
    function deleteMore() {
        ids = []
        var boxs = document.getElementsByName("chk");
        for (var i = 0; i < boxs.length; i++) {
            if (boxs[i].checked) {
                ids.push(boxs[i].value)
            }
        }
        if (ids.length == 0) {
            alert('请勾选要删除的记录');
        } else {
            remove(ids);
        }
    }

    // 删除
    function remove(id) {
        var mymessage = confirm("删除订单记录会级联删除订单详情记录，真的要删除吗？");
        if (mymessage == true) {
            var paramArray = [];
            if (id == ids) {
                paramArray = id;
            } else {
                paramArray.push(id);
            }
            httpJson("inOutOrder/delete", "POST", paramArray, (res) => {
                if(res.code == 0
        )
            {
                getDataList();
                alert('删除成功');
            }
        })
            ;
        }
        else {
            alert("已取消操作");
        }
    }

    // 用户登出
    <%@ include file="../../static/logout.jsp"%>

    //修改
    function edit(id) {
        window.sessionStorage.setItem('updateId', id)
        window.location.href = "add-or-update.jsp"
    }

    //清除会重复渲染的节点
    function clear() {
        var elements = document.getElementsByClassName('useOnce');
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    //添加
    function add() {
        window.sessionStorage.setItem("addinOutOrder", "addinOutOrder");
        window.location.href = "add-or-update.jsp"
    }

    //报表
    function graph() {
        window.location.href = "graph.jsp"
    }

    // 查看详情
    function detail(id) {
        window.sessionStorage.setItem("updateId", id);
        window.location.href = "info.jsp";
    }

    //填充级联表搜索下拉框

    //填充本表搜索下拉框
         
     
         
        function orderTypesSelectSearch() {
            var orderTypesSelectSearch = document.getElementById('orderTypesSelectSearch');
            if(orderTypesSelectSearch != null) {
                orderTypesSelectSearch.add(new Option('-请选择-',''));
                if (orderTypesOptions != null && orderTypesOptions.length > 0){
                    for (var i = 0; i < orderTypesOptions.length; i++) {
                            orderTypesSelectSearch.add(new Option(orderTypesOptions[i].indexName,orderTypesOptions[i].codeIndex));
                    }
                }
            }
        }
     
    
    //查询级联表搜索条件所有列表

    //查询当前表搜索条件所有列表
        function orderTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=order_types", "GET", {}, (res) => {
                if(res.code == 0){
                    orderTypesOptions = res.data.list;
                }
            });
        }




    // 新增出库 新增入库

    //出库
    function outGoods() {
        document.getElementById("modal-title").innerHTML = "出库列表";
        $("#inOutGoodsFlag").val(1);
        $('#inOutTableModal').modal('show');
    }
    //入库
    function inGoods() {
        document.getElementById("modal-title").innerHTML = "入库列表";
        $("#inOutGoodsFlag").val(2);
        $('#inOutTableModal').modal('show');

    }

    $('#inOutTableModal').on('show.bs.modal', function () {
        goodsSelect();
        initializationgoodsSelect();
        $(".selectpicker" ).selectpicker('refresh');
    })
    $('#inOutTableModal').on('hide.bs.modal', function () {
        $("#modal-title").val("")
        $("#inOutGoodsFlag").val(0);
        $("#inOutTableTbody").html("");
        $("#goodsSelect").empty();
        $(".selectpicker" ).selectpicker('refresh');
    })
    function goodsSelect() {
        //填充下拉框选项
        http("goods/page?page=1&limit=100&sort=&order=&flagStart=1&flagEnd=1", "GET", {}, (res) => {
            if(res.code == 0){
            goodsOptions = res.data.list;
        }
    });
    }
    function initializationgoodsSelect() {
        var goodsSelect = document.getElementById('goodsSelect');
        if(goodsSelect != null && goodsOptions != null  && goodsOptions.length > 0 ) {
            for (var i = 0; i < goodsOptions.length; i++) {
                goodsSelect.add(new Option("物资名:"+goodsOptions[i].goodsName, goodsOptions[i].id));
            }
        }
    }


    function addinOut() {
        var id = document.getElementById("goodsSelect").options[document.getElementById("goodsSelect").selectedIndex].value;//获取当前选择项的值.
        if(id ==null || id=="" || id<=0){
            alert("请选择物资");
            return;
        }
        if( $("#rowId"+id).val() == null ){
            http("goods/info/"+id, "GET", {}, (res) => {
                if(res.code == 0){
                var span =  setInOutGoodsDataRow(res.data);
                $('#inOutTableTbody').append(span);
            }else{
                alert("添加商品失败,请联系管理员查看详情");
                return;
            }
        });
        }else{
            alert("您已经添加过此物资");
        }
    }

    // 添加物资到待提交列表
    function setInOutGoodsDataRow(item) {
        //创建行 
        var row = document.createElement('tr');
        row.setAttribute("id","rowId"+item.id);
        //物资名称
        var goodsNameCell = document.createElement('td');
        goodsNameCell.innerHTML = item.goodsName;
        row.appendChild(goodsNameCell);


        //现有物资数量
        var goodsNumberCell = document.createElement('td');
        goodsNumberCell.setAttribute("id","td"+item.id);
        goodsNumberCell.innerHTML = item.goodsNumber;
        row.appendChild(goodsNumberCell);


        //单位
        var danweiCell = document.createElement('td');
        danweiCell.innerHTML = item.danwei;
        row.appendChild(danweiCell);

        //操作数量
        var inputCell = document.createElement('td');
        var input = document.createElement("input");
        input.setAttribute("type","input") ;
        input.setAttribute("id","inputId"+item.id) ;
        input.setAttribute("name","inputNumber") ;
        input.setAttribute("class","form-control") ;
        input.setAttribute("onchange","chickgoodsNumber(this"+","+item.id+")") ;
        inputCell.appendChild(input)
        row.appendChild(inputCell);

        //每行按钮
        var btnGroup = document.createElement('td');
        //删除按钮
        var deleteBtn = document.createElement('button');
        // var deleteAttr = 'removeInOutGoods(' + item.id + ')';
        deleteBtn.setAttribute("type", "button");
        deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
        deleteBtn.setAttribute("onclick","removeInOutGoods("+item.id+")");
        deleteBtn.innerHTML = "删除"
        btnGroup.appendChild(deleteBtn)

        row.appendChild(btnGroup)
        return row;
    }

    function chickgoodsNumber(e,id){
        var this_val = e.value || 0;
        if(this_val == 0){
            e.value = "";
            alert("数量为0无意义");
            return false;
        }
        var reg=/^[1-9][0-9]*$/;
        if(!reg.test(this_val)){
            e.value = "";
            alert("只能输入正整数数字");
            return false;
        }
        var tdid = "#td"+id;
        var number = $(tdid).text();
        if(number==null || number==""){
            alert("库存不正确,请进入物资中修改该商品库存");
            return false;
        }
        var flag = $("#inOutGoodsFlag").val();
        if(flag!="2"){
            if((parseInt(number)-parseInt(this_val))<0){
                e.value = "";
                alert("出库数量不能大于库存数量");
                return false;
            }
        }

    }
    function removeInOutGoods(id) {
        var rowId = "#rowId"+ id;
        $(rowId).remove();
    }

    //入库和出库操作
    function submitInOutGoods() {
        let data = {};
        var inOutOrderName = $("#inOutOrderName").val();
        if(inOutOrderName ==null || inOutOrderName == "" || inOutOrderName=="null"){
            alert("请输入要生成的订单名");
            return false;
        }
        var elementsByName = document.getElementsByName("inputNumber");
        var flag=false;
        let map = {};
        for (var i = 0; i < elementsByName.length; i++) { //遍历一下表格数据  
            var value = elementsByName[i].value;
            if(value ==null || value =="" ||  value =="null"){
                flag=true;
            }else{
                var id = parseInt(elementsByName[i].id.replace("inputId",""));
                map[id]=parseInt(value);
            }
        }
        if(flag){
            alert("数量中有空或者为0情况");
            return false;
        }

        var flag = parseInt($("#inOutGoodsFlag").val());
        var urlParam=null;
        var msg=null;
        if(flag==1){
            urlParam="outOrder";
            msg="出库成功";
        }else if(flag==2){
            urlParam="inOrder";
            msg="入库成功";
        }else{
            alert("未知错误,请联系管理员");
            return false;
        }
        if(map == null || Object.keys(map).length==0){
            alert("您没有添加物资");
            return false;
        }
        httpJson("inOutOrder/" + urlParam, "POST", {
            map:map,
            orderName:inOutOrderName,
        }, (res) => {
            if(res.code == 0){
                alert(msg);
                $('#inOutTableModal').modal('hide');
                getDataList();
            }else{
                alert(res.msg);
            }
        });
    }




    // 查看入库出入详情

    //
    function detailList(orderId,orderTypes) {
        id=orderId;
        if(orderTypes==1){
            document.getElementById("modal-list-title").innerHTML = "出库列表";
        }else if(orderTypes==2){
            document.getElementById("modal-list-title").innerHTML = "入库列表";
        }else{
            alert("未知错误,联系管理员");
            return false;
        }
        $('#inOutTableListModal').modal('show');
    }


    $('#inOutTableListModal').on('show.bs.modal', function () {
        http("inOutOrderList/page", "GET", {
            page: 1,
            limit: 100,
            sort: sortColumn,
            order: sortOrder,
            //本表的
            inOutOrderId: id,
        }, (res) => {
            if(res.code == 0){
                var list = res.data.list;
                for (var i = 0; i < list.length; i++) { //遍历一下表格数据  
                    var trow = setInOutGoodsListDataRow(list[i]); //定义一个方法,返回tr数据 
                    $('#inOutTableListTbody').append(trow);
                }
            }else{
               alert("查不到该订单的详情");
            }
        });
    })

    $('#inOutTableListModal').on('hide.bs.modal', function () {
        $("#modal-list-title").val("");
        $("#inOutTableListTbody").html("");
    })

    // 添加当前订单中物资到查看列表
    function setInOutGoodsListDataRow(item) {
        //创建行 
        var row = document.createElement('tr');
        // row.setAttribute("id","rowId"+item.id);
        //物资名称
        var goodsNameCell = document.createElement('td');
        goodsNameCell.innerHTML = item.goodsName;
        row.appendChild(goodsNameCell);


        //操作数量
        var orderNumberCell = document.createElement('td');
        orderNumberCell.setAttribute("id","td"+item.id);
        orderNumberCell.innerHTML = item.orderNumber;
        row.appendChild(orderNumberCell);


        //单位
        var danweiCell = document.createElement('td');
        danweiCell.innerHTML = item.danwei;
        row.appendChild(danweiCell);
        return row;
    }
    $('#inOutTableListModal').on('hide.bs.modal', function () {
        $("#modal-list-title").val("");
        $("#inOutTableListTbody").html("");
    })



    $(document).ready(function () {
        //激活翻页按钮
        $('#tableId_previous').attr('class', 'paginate_button page-item previous')
        $('#tableId_next').attr('class', 'paginate_button page-item next')
        //隐藏原生搜索框
        $('#tableId_filter').hide()
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        setMenu();
        init();

        //查询级联表的搜索下拉框

        //查询当前表的搜索下拉框
        orderTypesSelect();
        getDataList();

        //级联表的下拉框赋值

        //当前表的下拉框赋值
                         
             
                         
            orderTypesSelectSearch();
             
            
    <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>

</html>