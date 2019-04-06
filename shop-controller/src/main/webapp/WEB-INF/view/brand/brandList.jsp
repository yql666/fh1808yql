<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>品牌查询</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">商品列表查询</div>
                <div class="panel-heading">
                    <div style="text-align:center;">
                        <button type="button" class="btn btn-success">
                            <span class="glyphicon glyphicon-plus"></span>
                            <a href="<%=request.getContextPath()%>/brand/toAdd.jhtml">点击增加</a>
                        </button>
                        <button type="button" class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span>
                            <a href="javascript:deleteIds()">批量删除</a>
                        </button>
                    </div>

                </div>
                <div class="panel-body">
                    <form>
                        <table class="table table-striped table-bordered">
                            <tr>
                                <td>品牌名称</td>
                                <td>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="brandName">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>录入时间</td>
                                <td>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="date" class="input-sm form-control" id="minentryTime"/>
                                            <span class="input-group-addon">
                                        --
									</span>
                                            <input type="date" class="input-sm form-control" id="maxentryTime"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>修改时间</td>
                                <td>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="date" class="input-sm form-control" id="minupdateTime"/>
                                            <span class="input-group-addon">
                                        --
									</span>
                                            <input type="date" class="input-sm form-control" id="maxupdateTime"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2">
                                    <div class="col-sm-10">
                                        <button type="button" onclick="dataTable()" class="btn btn-success">
                                            <span class="glyphicon glyphicon-ok"></span>
                                            点击查询
                                        </button>
                                        <button type="reset" class="btn btn-info">
                                            <span class="glyphicon glyphicon-refresh"></span>
                                            重置
                                        </button>
                                    </div>
                                </th>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="panel panel-success">
                <div class="panel-heading">商品列表展示</div>
                <div class="panel-body">
                    <table class="table table-striped table-bordered" id="brandTable">
                        <thead>
                        <tr>
                            <th><input type="checkbox" id="checkAll">全/<input type="checkbox" id="reCheck">反</th>
                            <th>商品品牌</th>
                            <th>录入时间</th>
                            <th>修改时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>全反</th>
                            <th>商品品牌</th>
                            <th>录入时间</th>
                            <th>修改时间</th>
                            <th>操作</th>
                        </tr>
                        </tfoot>

                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>


<jsp:include page="/WEB-INF/common/javaScript.jsp"></jsp:include>
<script type="text/javascript">
    $(function () {
        allAndRe();
        dataTable();
        clickChecked("brandTable");
    })

    var brandTable

    function dataTable() {
        brandTable = $("#brandTable").DataTable(
            {
                "order": [],
                pageLength: 3,
                fixedHeader: true,
                fixedColumns: {
                    leftColumns: 0,
                    rightColumns: 1
                },
                lengthMenu: [
                    [3, 30, 45, -1],
                    ['3 条', '30 条', '45 条', '全部']
                ],
                language: {
                    url: "/datatable/Chinese.json"
                },
                "searching": false,
                "processing": true,
                "serverSide": true,
                "ajax": {
                    "url": "<%=request.getContextPath()%>/brand/findBrand.jhtml",
                    "type": "POST",
                    "dataSrc" : function (res){
                        res.draw=res.data.draw;
                        res.recordsTotal=res.data.recordsTotal;
                        res.recordsFiltered=res.data.recordsFiltered;
                        return res.data.data;
                    }
                },
                "columns": [
                    {
                        "sClass": "text-center",
                        "data": "id",
                        "orderable": false,
                        "render": function (id) {
                            return '<input type="checkbox"  name="checkList"   value="' + id + '" />';
                        },
                        "bSortable": false,  //是否可以排序
                        'width': '5%'
                    },
                    {"data": "brandName","orderable": false},
                    {"data": "entryTime",
                        "render": function (data) {
                            //时间格式化
                            var date = new Date(data);
                            return date.toLocaleString();
                        }
                        },
                    {"data": "updateTime",
                        "render": function (data) {
                            //时间格式化
                            var date = new Date(data);
                            return date.toLocaleString();
                        }
                        },
                    {
                        "data": "id",
                        "orderable": false,
                        "render": function (id) {
                            return '<div class="btn-group"><button class="btn btn-xs btn-info ">'
                                + '<span class="glyphicon glyphicon-pencil"></span>'
                                + '<a href="javascript:toUpdate(' + id + ')">修改</a></button><button class="btn btn-xs btn-danger">'
                                + '<span class="glyphicon glyphicon-remove"></span>'
                                + '<a href="javascript:deleteBrand(' + id + ')">删除</a></button>' +
                                '</div>';
                        },
                    },
                ],
                "drawCallback": function () {
                    $("#brandTable tbody tr input[type='checkbox']").each(function () {
                        if (isExist(this.value)) {
                            this.checked = true
                            $(this).closest("tr").css("background", "gainsboro")
                        }
                    })
                },
            }
        )
    }
    function findBrand() {
        var brandInfo = {};
        brandInfo.productName = $('#brandName').val();
        brandInfo.minPrice = $('#minentryTime').val();
        brandInfo.maxPrice = $('#maxentryTime').val();
        brandInfo.minInsertTime = $('#minupdateTime').val();
        brandInfo.maxInsertTime = $('#maxupdateTime').val();
        brandTable.settings()[0].ajax.data = brandInfo;
        brandTable.ajax.reload();
    }

    function deleteBrand(id) {
        bootbox.confirm({
            title: "提示信息",
            message: "您确认要删除吗?",
            size: "small",
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-ok"></span>确认',
                    className: 'btn-success'
                },
                cancel: {
                    label: '<span class="glyphicon glyphicon-remove"></span>取消',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result) {
                    $.ajax({
                        url: "<%=request.getContextPath()%>/brand/deleteBrand.jhtml",
                        data: {
                            "id": id
                        },
                        dataType: "json",
                        type: "post",
                        success: function (data) {
                            if (data.code == 200) {
                                findBrand();
                            } else {
                                bootbox.alert({
                                    title: "提示信息",
                                    message: "删除失败",
                                    size: "small",
                                });
                            }
                        }
                    })
                }
            }
        })

    }

    function toUpdate(obj) {
        location.href = "<%=request.getContextPath()%>/brand/toUpdate.jhtml?id=" + obj;
    }

    function deleteIds() {
        var v_ids = "";
        $("input[name='checkList']:checkbox:checked").each(function () {
            v_ids += "," + this.value;
        })
        v_ids = v_ids.substring(1);
        if (v_ids.length > 0) {
            bootbox.confirm({
                title: "提示信息",
                message: "您确认要删除吗?",
                size: "small",
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-ok"></span>确认',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                    if (result) {
                        $.ajax({
                            url: "<%=request.getContextPath()%>/brand/deleteIds.jhtml",
                            type: "post",
                            dataType: "json",
                            data: {
                                "ids": v_ids
                            },
                            success: function (data) {
                                if (data.code == 200) {
                                    findBrand();
                                } else {
                                    bootbox.alert({
                                        title: "提示信息",
                                        message: "删除失败",
                                        size: "small",
                                    });
                                }

                            }
                        })
                    }
                }
            })

        } else {
            bootbox.alert({
                title: "提示信息",
                message: "至少选择一个",
                size: "small",
            });
        }
    }
</script>
</body>
</html>