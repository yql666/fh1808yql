package com.fh.shop.backend.controller.dept;

import com.fh.shop.backend.annotation.LogAnnotation;
import com.fh.shop.backend.base.BaseController;
import com.fh.shop.backend.biz.dept.IDeptService;
import com.fh.shop.backend.common.DataTableResponse;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.dept.Department;
import com.fh.shop.backend.vo.DeptVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;


@RestController
@RequestMapping("/dept")
public class DeptController extends BaseController {

    @Resource
    private IDeptService deptService;

    @RequestMapping("findDept")
    public ServerResponse findDept(Department department) {
        //调用自定义response对象响应前台
        DataTableResponse resultResponse = deptService.findDataTable(department);
        return ServerResponse.success(resultResponse);
    }

    //展示ztree方法
    @RequestMapping("findDeptZtree")
    public ServerResponse findDeptZtree() {
        //展示ztree树
        List<DeptVo> departmentList = deptService.findDeptZtree();
        return ServerResponse.success(departmentList);
    }

    //增加部门方法
    @RequestMapping("addDept")
    @LogAnnotation("增加方法")
    public ServerResponse addDept(Department department) {
        deptService.addDept(department);
        return ServerResponse.success(department.getId());
    }

    //修改相关部门方法
    @RequestMapping("updateDept")
    @LogAnnotation("修改方法")
    public ServerResponse updateDept(Department department) {
        deptService.updateDept(department);
        return ServerResponse.success();
    }

    @RequestMapping("deleteIds")
    @LogAnnotation("批量删除方法")
    public ServerResponse deleteIds(@RequestParam("ids[]") List<Integer> ids) {
        deptService.deleteIds(ids);
        return ServerResponse.success();
    }

}
