package com.fh.shop.backend.mapper.dept;

import com.fh.shop.backend.po.dept.Department;

import java.util.List;

public interface IDeptMapper {

    Long findPageCount(Department department);

    List<Department> findDepartment(Department department);

    void addDept(Department department);

    void updateDept(Department department);

    void deleteIds(List<Integer> list);

    List<Department> findDeptZtree();


}
