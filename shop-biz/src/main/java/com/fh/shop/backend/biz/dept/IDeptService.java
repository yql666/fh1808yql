package com.fh.shop.backend.biz.dept;

import com.fh.shop.backend.common.DataTableResponse;
import com.fh.shop.backend.po.dept.Department;
import com.fh.shop.backend.vo.DeptVo;

import java.util.List;

public interface IDeptService {

    void addDept(Department department);

    void updateDept(Department department);

    List<DeptVo> findDeptZtree();

    void deleteIds(List<Integer> ids);

    DataTableResponse findDataTable(Department department);
}
