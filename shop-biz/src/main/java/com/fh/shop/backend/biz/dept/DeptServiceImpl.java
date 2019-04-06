package com.fh.shop.backend.biz.dept;

import com.fh.shop.backend.base.BaseService;
import com.fh.shop.backend.biz.user.IUserService;
import com.fh.shop.backend.common.DataTableResponse;
import com.fh.shop.backend.mapper.dept.IDeptMapper;
import com.fh.shop.backend.po.dept.Department;
import com.fh.shop.backend.util.CacheManager;
import com.fh.shop.backend.vo.DeptVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DeptServiceImpl extends BaseService implements IDeptService {

    @Autowired
    private IDeptMapper deptMapper;
    @Autowired
    private IUserService userService;

    public DataTableResponse findDataTable(Department department) {
        //查询总条数
        Long pageCount = deptMapper.findPageCount(department);
        //po转换vo
        List<DeptVo> deptVo = reversalDeptVo(department);
        //转换为dataTable格式的json数据
        DataTableResponse resultResponse = DataTableResponse.resultResponse(department.getDraw(), pageCount, pageCount, deptVo);
        return resultResponse;
    }

    private List<DeptVo> reversalDeptVo(Department department) {
        List<Department> departmentList = deptMapper.findDepartment(department);
        List<DeptVo> deptVo=new ArrayList<>();
        for (Department departments : departmentList) {
            DeptVo deptInfo=new DeptVo();
            deptInfo.setId(departments.getId());
            deptInfo.setDeptName(departments.getDeptName());
            deptInfo.setParentId(departments.getParentId());
            deptInfo.setRemark(departments.getRemark());
            deptVo.add(deptInfo);
        }
        return deptVo;
    }

    @Override
    public void addDept(Department department) {
        deptMapper.addDept(department);
        CacheManager.getInstance().remove(DEPT_LIST);
    }

    @Override
    public void updateDept(Department department) {
        deptMapper.updateDept(department);
        CacheManager.getInstance().remove(DEPT_LIST);
    }

    @Override
    public List<DeptVo> findDeptZtree() {
        CacheManager instance = CacheManager.getInstance();
        Object deptList = instance.getObj(DEPT_LIST);
        if(deptList !=null ){
            return (List<DeptVo>) deptList;
        }
        List<DeptVo> deptVoList = wrapperDeptVo();
        instance.putObj(DEPT_LIST,deptVoList);
        return deptVoList;
    }

    private List<DeptVo> wrapperDeptVo() {
        List<Department> deptZtree = deptMapper.findDeptZtree();
        List<DeptVo> deptVo=new ArrayList<>();
        for (Department departments : deptZtree) {
            DeptVo deptInfo=new DeptVo();
            deptInfo.setId(departments.getId());
            deptInfo.setDeptName(departments.getDeptName());
            deptInfo.setParentId(departments.getParentId());
            deptInfo.setRemark(departments.getRemark());
            deptVo.add(deptInfo);
        }
        return deptVo;
    }

    @Override
    public void deleteIds(List<Integer> ids) {
        deptMapper.deleteIds(ids);
        userService.deleteByPids(ids);
        CacheManager.getInstance().remove(DEPT_LIST);
    }
}
