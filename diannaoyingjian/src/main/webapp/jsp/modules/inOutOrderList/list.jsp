<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">


<head>
    <%@ include file="../../static/head.jsp" %>
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
</head>
<style>

</style>
<body>
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
                    <h3 class="block-title">出入库订单详情管理</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">出入库订单详情管理</li>
                        <li class="breadcrumb-item active">出入库订单详情列表</li>
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
                        <h3 class="widget-title">出入库订单详情列表</h3>
                        <div class="table-responsive mb-3">
                            <div class="col-sm-12">
                                                                                                                                 
                                            <label>
                                                数量
                                                <input type="text" id="orderNumberStartSearch" style="width: 100px;" onchange="orderNumberChickValue(this)"   class="form-control " placeholder="开始" aria-controls="tableId">
                                            </label>
                                                -
                                            <label>
                                                <input type="text" id="orderNumberEndSearch" style="width: 100px;" onchange="orderNumberChickValue(this)"     class="form-control" placeholder="结束" aria-controls="tableId">
                                            </label>
                                
                                                                                         
                                        <label>
                                            物品名字
                                            <input type="text" id="goodsNameSearch"  style="width: 120px;" class="form-control form-control-sm"
                                                   placeholder="物品名字" aria-controls="tableId">
                                        </label>
                                             
                                        <label>
                                            物品种类
                                            <select name="goodsTypesSelectSearch"  style="width: 150px;" id="goodsTypesSelectSearch" class="form-control form-control-sm"
                                                    aria-controls="tableId">
                                            </select>
                                        </label>
                                             
                                            <label>
                                                物资数量
                                                <input type="text" id="goodsNumberStartSearch" style="width: 100px;" onchange="goodsNumberChickValue(this)"   class="form-control " placeholder="开始" aria-controls="tableId">
                                            </label>
                                            -
                                            <label>
                                                <input type="text" id="goodsNumberEndSearch" style="width: 100px;" onchange="goodsNumberChickValue(this)"     class="form-control" placeholder="结束" aria-controls="tableId">
                                            </label>
                                                                                                                                                                                                                                                                         
                                        <label>
                                            订单名
                                            <input type="text" id="orderNameSearch"  style="width: 120px;" class="form-control form-control-sm"
                                                   placeholder="订单名" aria-controls="tableId">
                                        </label>
                                             
                                        <label>
                                            操作人姓名
                                            <input type="text" id="caozuoNameSearch"  style="width: 120px;" class="form-control form-control-sm"
                                                   placeholder="操作人姓名" aria-controls="tableId">
                                        </label>
                                                                                         
                                        <label>
                                            类型
                                            <select name="orderTypesSelectSearch"  style="width: 150px;" id="orderTypesSelectSearch" class="form-control form-control-sm"
                                                    aria-controls="tableId">
                                            </select>
                                        </label>
                                             

                                <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                <br/>
                                <button onclick="add()" type="button" class="btn btn-success 新增">添加</button>
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

                                    <th >物品名字</th>
                                    <th >物品种类</th>
                                    <th >物品图片</th>
                                    <th >订单名</th>
                                    <th >操作人姓名</th>
                                    <th >类型</th>
                                    <th >出入库时间</th>
                                    <th >操作数量</th>
                                    <th >单位</th>
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

<script>
    <%@ include file="../../utils/menu.jsp"%>
            <%@ include file="../../static/setMenu.js"%>
            <%@ include file="../../utils/baseUrl.jsp"%>
            <%@ include file="../../static/getRoleButtons.js"%>
            <%@ include file="../../static/crossBtnControl.js"%>
    var tableName = "inOutOrderList";
    var pageType = "list";
    var searchForm = {key: ""};
    var pageIndex = 1;
    var pageSize = 10;
    var totalPage = 0;
    var dataList = [];
    var sortColumn = '';
    var sortOrder = '';
    var ids = [];
    var checkAll = false;

     var goodsTypesOptions = [];
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
                                         
                        //物品名字
        var goodsNameSearchInput = $('#goodsNameSearch');
        if( goodsNameSearchInput != null){
            if (goodsNameSearchInput.val() != null && goodsNameSearchInput.val() != '') {
                searchForm.goodsName = $('#goodsNameSearch').val();
            }
        }
                     
        var goodsTypesSelectSearchInput = document.getElementById("goodsTypesSelectSearch");
        if(goodsTypesSelectSearchInput != null){
            var goodsTypesIndex = goodsTypesSelectSearchInput.selectedIndex;
            if( goodsTypesIndex  != 0){
                searchForm.goodsTypes = document.getElementById("goodsTypesSelectSearch").options[goodsTypesIndex].value;
            }
        }
                     
                            //物资数量
        var goodsNumberStartSearchInput = $('#goodsNumberStartSearch');
        if(goodsNumberStartSearchInput != null){
            var goodsNumberStartSearchValue = goodsNumberStartSearchInput.val();
            if( goodsNumberStartSearchValue  != 0){
                searchForm.goodsNumberStart = goodsNumberStartSearchValue;
            }
        }
        var goodsNumberEndSearchInput = $('#goodsNumberEndSearch');
        if(goodsNumberEndSearchInput != null){
            var goodsNumberEndSearchValue = goodsNumberEndSearchInput.val();
            if( goodsNumberEndSearchValue  != 0){
                searchForm.goodsNumberEnd = goodsNumberEndSearchValue;
            }
        }
                                                                                                                         
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
                                         
        var orderTypesSelectSearchInput = document.getElementById("orderTypesSelectSearch");
        if(orderTypesSelectSearchInput != null){
            var orderTypesIndex = orderTypesSelectSearchInput.selectedIndex;
            if( orderTypesIndex  != 0){
                searchForm.orderTypes = document.getElementById("orderTypesSelectSearch").options[orderTypesIndex].value;
            }
        }
                     
    <!-- 本表的查询条件 -->
                 
            //数量
        var orderNumberStartSearchInput = $('#orderNumberStartSearch');
        if(orderNumberStartSearchInput != null){
            var orderNumberStartSearchValue = orderNumberStartSearchInput.val();
            if( orderNumberStartSearchValue  != 0){
                searchForm.orderNumberStart = orderNumberStartSearchValue;
            }
        }
        var orderNumberEndSearchInput = $('#orderNumberEndSearch');
        if(orderNumberEndSearchInput != null){
            var orderNumberEndSearchValue = orderNumberEndSearchInput.val();
            if( orderNumberEndSearchValue  != 0){
                searchForm.orderNumberEnd = orderNumberEndSearchValue;
            }
        }
            getDataList();
    }

    // 获取数据列表
    function getDataList() {
        http("inOutOrderList/page", "GET", {
            page: pageIndex,
            limit: pageSize,
            sort: sortColumn,
            order: sortOrder,
            //本表的
            orderNumberStart: searchForm.orderNumberStart,
            orderNumberEnd: searchForm.orderNumberEnd,

            //级联表的
                        goodsName: searchForm.goodsName,
                        goodsTypes: searchForm.goodsTypes,
            goodsNumberStart: searchForm.goodsNumberStart,
                                goodsNumberEnd: searchForm.goodsNumberEnd,

                        orderName: searchForm.orderName,
                        caozuoName: searchForm.caozuoName,
                        orderTypes: searchForm.orderTypes,
            insertTimeStart: searchForm.insertTimeStart,
                                insertTimeEnd: searchForm.insertTimeEnd,


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


                //物品名字
        var goodsNameCell = document.createElement('td');
        goodsNameCell.innerHTML = item.goodsName;
        row.appendChild(goodsNameCell);

                    //物品种类
        var goodsTypesCell = document.createElement('td');
        goodsTypesCell.innerHTML = item.goodsValue;
        row.appendChild(goodsTypesCell);



            //物品图片
        var goodsPhotoCell = document.createElement('td');
        var goodsPhotoImg = document.createElement('img');
        var goodsPhotoImgValue = item.goodsPhoto;
        if(goodsPhotoImgValue !=null && goodsPhotoImgValue !='' && goodsPhotoImgValue !='null'){
                goodsPhotoImg.setAttribute('src', goodsPhotoImgValue);
                goodsPhotoImg.setAttribute('height', 100);
                goodsPhotoImg.setAttribute('width', 100);
                goodsPhotoCell.appendChild(goodsPhotoImg);
        }else{
                goodsPhotoCell.innerHTML = "暂无图片";
        }
        row.appendChild(goodsPhotoCell);


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



        //数量
        var orderNumberCell = document.createElement('td');
        orderNumberCell.innerHTML = item.orderNumber;
        row.appendChild(orderNumberCell);


        //单位
        var danweiCell = document.createElement('td');
        danweiCell.innerHTML = item.danwei;
        row.appendChild(danweiCell);
            //只能查看不能修改和删除
        return row;
    }


        // 整数
        function orderNumberChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

        // 整数
        function orderNumberChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

        // 整数
        function orderNumberChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

        // 整数
        function orderNumberChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

        // 整数
        function orderNumberChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

        // 整数
        function orderNumberChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

        // 整数
        function orderNumberChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

        // 整数
        function orderNumberChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

        // 整数
        function orderNumberChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

        // 整数
        function orderNumberChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

        // 整数
        function orderNumberChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

        // 整数
        function orderNumberChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

        // 整数
        function orderNumberChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

        // 整数
        function orderNumberChickValue(e){
            var this_val = e.value || 0;
            /*if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }*/
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

        //整数
        function orderNumberChickValue(e){
            var this_val = e.value || 0;
            if(this_val == 0){
                e.value = "";
                alert("0不允许输入");
                return false;
            }
            var reg=/^[0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
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
        var mymessage = confirm("真的要删除吗？");
        if (mymessage == true) {
            var paramArray = [];
            if (id == ids) {
                paramArray = id;
            } else {
                paramArray.push(id);
            }
            httpJson("inOutOrderList/delete", "POST", paramArray, (res) => {
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
        window.sessionStorage.setItem("addinOutOrderList", "addinOutOrderList");
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
                                         
                     
        function goodsTypesSelectSearch() {
            var goodsTypesSelectSearch = document.getElementById('goodsTypesSelectSearch');
            if(goodsTypesSelectSearch != null) {
                goodsTypesSelectSearch.add(new Option('-请选择-',''));
                if (goodsTypesOptions != null && goodsTypesOptions.length > 0){
                    for (var i = 0; i < goodsTypesOptions.length; i++) {
                            goodsTypesSelectSearch.add(new Option(goodsTypesOptions[i].indexName, goodsTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                     
                                                                                                                         
                     
                                         
        function orderTypesSelectSearch() {
            var orderTypesSelectSearch = document.getElementById('orderTypesSelectSearch');
            if(orderTypesSelectSearch != null) {
                orderTypesSelectSearch.add(new Option('-请选择-',''));
                if (orderTypesOptions != null && orderTypesOptions.length > 0){
                    for (var i = 0; i < orderTypesOptions.length; i++) {
                            orderTypesSelectSearch.add(new Option(orderTypesOptions[i].indexName, orderTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                     

    //填充本表搜索下拉框
                 
    
    //查询级联表搜索条件所有列表
        function goodsTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=goods_types", "GET", {}, (res) => {
                if(res.code == 0){
                    goodsTypesOptions = res.data.list;
                }
            });
        }
        function orderTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=order_types", "GET", {}, (res) => {
                if(res.code == 0){
                    orderTypesOptions = res.data.list;
                }
            });
        }

    //查询当前表搜索条件所有列表


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
        goodsTypesSelect();
        orderTypesSelect();

        //查询当前表的搜索下拉框
        getDataList();

        //级联表的下拉框赋值
                                                 
                         
    goodsTypesSelectSearch();
                         
                                                                                                                                                 
                         
                                                 
    orderTypesSelectSearch();
                         

        //当前表的下拉框赋值
                                                 
            
    <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>

</html>