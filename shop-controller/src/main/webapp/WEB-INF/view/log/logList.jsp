<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-6">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">用户日志记录查询</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <td>
                                用户名
                            </td>
                            <td>
                                <div class="col-md-6">
                                    <input class="form-control" id="userName" type="text" placeholder="苹果"/>
                                </div>
                            </td>
                        <tr>
                        <tr>
                            <td>
                                状态
                            </td>
                            <td>
                                <div class="col-md-6">
                                    <font style="color: #0bae19"><h2>成功</h2></font>
                                    <input type="radio" class="form-control" name="status" value="1">
                                </div>
                                <div class="col-md-6">
                                    <font style="color:red"><h2>失败</h2></font><input type="radio" class="form-control"
                                                                                     name="status" value="0">
                                </div>
                            </td>
                        <tr>
                            <td>
                                创建时间
                            </td>
                            <td>
                                <div class="col-md-8">
                                    <div class="input-group">
                                        <input type="text" class="form_datetime input-sm form-control" id="minCreateTime">
                                        <span class="input-group-addon">
                                       	 	--
											</span>
                                        <input type="text" class="form_datetime input-sm form-control" id="maxCreateTime">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                消耗时间
                            </td>
                            <td>
                                <div class="col-md-8">
                                    <div class="input-group">
                                        <input type="text" class="input-sm form-control" id="minUseTime">
                                        <span class="input-group-addon">
                                        		--
											 </span>
                                        <input type="text" class="input-sm form-control" id="maxUseTime">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                操作
                            </td>
                            <td>
                                <div class="clearfix form-actions" style="text-align:center">

                                    <button class="btn btn-success" type="button" onclick="findLog()">
                                        <i class="glyphicon glyphicon-ok"></i>
                                        点击查询
                                    </button>
                                    <button class="btn btn-default" type="reset">
                                        <i class="glyphicon glyphicon-refresh"></i>
                                        重置
                                    </button>
                                </div>
                            </td>
                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-3">

        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">用户日志展示表</h3>
                </div>
                <div class="panel-body">
                    <table id="logTable" class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <td>
                                用户名
                            </td>
                            <td style="width:100px">
                                进入方法
                            </td>
                            <td>
                                状态
                            </td>
                            <td>
                                创建时间
                            </td>
                            <td>
                                花费时间
                            </td>
                            <td>
                                ip地址
                            </td>
                            <td>
                                内容
                            </td>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <td>
                                用户名
                            </td>
                            <td>
                                进入方法
                            </td>
                            <td>
                                状态
                            </td>
                            <td>
                                创建时间
                            </td>
                            <td>
                                花费时间
                            </td>
                            <td>
                                ip地址
                            </td>
                            <td>
                                内容
                            </td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/common/javaScript.jsp"></jsp:include>
<script type="text/javascript">
    $(function () {
        dataTable();
    })

    $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii', language: 'zh-CN',});
    var logTable;

    function dataTable() {
        logTable = $('#logTable').DataTable({
            pageLength: 3,　//初始化显示几条数据
            fixedHeader: true,　//这个是用来固定头部
            fixedColumns: { //这个是用来固定列的
                leftColumns: 0,
                rightColumns: 1
            },
            lengthMenu: [　//显示几条数据设置
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
                "url": "<%=request.getContextPath()%>/log/findLog.jhtml",
                "type": "POST",
                "dataSrc" : function (res){
                    res.draw=res.data.draw;
                    res.recordsTotal=res.data.recordsTotal;
                    res.recordsFiltered=res.data.recordsFiltered;
                    return res.data.data;
                }
            },
            "columns": [
                {"data": "userName"},
                {"data": "info"},
                {
                    "data": "status",
                    "render": function (status) {
                        return ('' + status + '' == 1 ? "成功" : "失败");
                    },
                },
                {"data": "createTimeStr"},
                {"data": "useTime"},
                {"data": "ipAdd"},
                {"data": "content"},
            ],

        });
    }

    function findLog() {
        var logInfo = {};
        logInfo.userName = $('#userName').val();
        logInfo.status = $("input[name='status']:checked").val();
        logInfo.minCreateTime = $('#minCreateTime').val();
        logInfo.maxCreateTime = $('#maxCreateTime').val();
        logInfo.minUseTime = $('#minUseTime').val();
        logInfo.maxUseTime = $('#maxUseTime').val();
        logTable.settings()[0].ajax.data = logInfo;
        logTable.ajax.reload();
    }


</script>
</body>
</html>