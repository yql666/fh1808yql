<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/ztree/css/zTreeStyle/zTreeStyle.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        省市县
                        <div class="btn-group">
                            <button type="button" class="btn btn-success" onclick="addArea()">
                                <span class="glyphicon glyphicon-plus"></span>
                                点击添加
                            </button>
                            <button class="btn btn-primary btn-info " onclick="updateArea()">
                                <span class="glyphicon glyphicon-pencil"></span>
                                修改
                            </button>
                            <button class="btn btn-primary btn-danger" onclick="delArea()">
                                <span class="glyphicon glyphicon-remove"></span>
                                删除
                            </button>
                        </div>
                    </div>
                    <div class="panel-body">
                        <ul id="areaZtree" class="ztree"></ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6"></div>
        <div class="col-md-3"></div>
    </div>
</div>
<div class="container-fluid" id="addAreaDiv" style="display: none">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">省市县增加</div>
                <div class="panel-body">
                    <form>
                        <table class="table table-striped table-bordered">
                            <tr>
                                <th>
                                    地区名称:
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control" id="areaName" placeholder="请输入..."/>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
<div class="container-fluid" id="updateAreaDiv" style="display: none">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">省市县修改</div>
                <div class="panel-body">
                    <form>
                        <table class="table table-striped table-bordered">
                            <tr>
                                <th>
                                    地区名称:
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control" id="toAreaName" placeholder="请输入..."/>
                                        <input type="hidden" id="toId"/>
                                        <input type="hidden" id="toPid"/>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>

<jsp:include page="/WEB-INF/common/javaScript.jsp"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ztree/js/jquery.ztree.excheck.js"></script>
<script>

    $(function () {
        findAreaZtree();
    })

    function addArea() {
        var treeObj = $.fn.zTree.getZTreeObj("areaZtree");
        var checked = treeObj.getSelectedNodes();
        if (checked.length == 1) {
            var v_areaDialog = bootbox.dialog({
                title: '提示信息！！',
                message: $("#addAreaDiv").html(),
                size: 'large',
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-plus"></span>点击添加',
                        className: 'btn-success',
                        callback: function (result) {
                            if (result) {
                                $.ajax({
                                    url: "<%=request.getContextPath()%>/area/addArea.jhtml",
                                    type: "post",
                                    data: {
                                        "pid": checked[0].id,
                                        "areaName": $("#areaName", v_areaDialog).val(),
                                    },
                                    success: function (result) {
                                        if (result.code == 200) {
                                            var area = {};
                                            area.areaName = $("#areaName", v_areaDialog).val();
                                            area.id = result.data
                                            treeObj.addNodes(checked[0], area);
                                        } else {
                                            bootbox.alert({
                                                title: "提示信息",
                                                message: "<span class=\"glyphicon glyphicon-info-sign\"></span>添加失败",
                                                size: "small",
                                            });
                                        }
                                    },
                                })
                            }
                        }
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger',
                    },
                },
            })
        } else {
            bootbox.alert({
                title: "提示信息",
                message: "请选择一个",
                size: "small",
            });
        }
    }

    function updateArea() {
        var treeObj = $.fn.zTree.getZTreeObj("areaZtree");
        var checked = treeObj.getSelectedNodes();
        if (checked.length == 1) {
            $("#toAreaName").attr("value", checked[0].areaName);
            var v_areaDialog = bootbox.dialog({
                title: '提示信息！！',
                message: $("#updateAreaDiv").html(),
                size: 'large',
                buttons: {
                    confirm: {
                        label: '<span class="glyphicon glyphicon-plus"></span>点击修改',
                        className: 'btn-success',
                        callback: function (result) {
                            if (result) {
                                $.ajax({
                                    url: "<%=request.getContextPath()%>/area/updateArea.jhtml",
                                    type: "post",
                                    data: {
                                        "id": checked[0].id,
                                        "areaName": $("#toAreaName", v_areaDialog).val(),
                                    },
                                    success: function (result) {
                                        if (result.code == 200) {
                                            checked[0].areaName = $("#toAreaName", v_areaDialog).val();
                                            checked[0].id = checked[0].id;
                                            treeObj.updateNode(checked[0]);
                                        } else {
                                            bootbox.alert({
                                                title: "提示信息",
                                                message: "<span class=\"glyphicon glyphicon-info-sign\"></span>添加失败",
                                                size: "small",
                                            });
                                        }
                                    },
                                })
                            }
                        }
                    },
                    cancel: {
                        label: '<span class="glyphicon glyphicon-remove"></span>取消',
                        className: 'btn-danger',
                    },
                },
            })
        } else {
            bootbox.alert({
                title: "提示信息",
                message: "请选择一个",
                size: "small",
            });
        }
    }

    var nodesIds = [];

    function delArea() {
        var treeObj = $.fn.zTree.getZTreeObj("areaZtree");
        var checked = treeObj.getSelectedNodes();
        console.log(checked[0])
        if (checked.length > 0) {
            var nodes = treeObj.transformToArray(checked);
            for (var i = 0; i < nodes.length; i++) {
                if (!resTrue(nodes[i].id)) {
                    nodesIds.push(nodes[i].id)
                }
            }
            bootbox.confirm({
                title: '提示信息！！',
                message: "提示信息",
                size: 'small',
                buttons: {
                    confirm: {
                        label: '确定',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: '取消',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                    if (result) {
                        $.ajax({
                            url: "/area/deleteIds.jhtml",
                            type: "post",
                            data: {
                                "ids": nodesIds
                            },
                            success: function (data) {
                                if (data.code == 200) {
                                    for (var i = 0; i < nodes.length; i++) {
                                        treeObj.removeNode(nodes[i]);
                                    }
                                } else {
                                    bootbox.alert({
                                        title: "提示信息",
                                        message: "删除失败",
                                        size: "small",
                                    });
                                }
                            },
                        })

                    }
                }
            });
        } else {
            bootbox.alert({
                title: "提示信息",
                message: "请选择一个",
                size: "small",
            });

        }

    }

    function resTrue(id) {
        for (var i = 0; i < nodesIds.length; i++) {
            if (nodesIds[i] == id) {
                return true;
            }
        }
    }

    function findAreaZtree() {
        var setting = {
            data: {
                simpleData: {
                    enable: true,
                    pIdKey: "pid"
                },
                key: {
                    name: "areaName"
                }
            }
        };
        $.ajax({
            url: "<%=request.getContextPath()%>/area/findAreaZtree.jhtml",
            type: "post",
            success: function (result) {
                if (result.code == 200) {
                    $.fn.zTree.init($("#areaZtree"), setting, result.data);
                }
            }
        })

    }

</script>
</body>
</html>
