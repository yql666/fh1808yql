package com.fh.shop.backend.po.dept;

import com.fh.shop.backend.po.Page;

import java.io.Serializable;

public class Department extends Page implements Serializable {
    private static final long serialVersionUID = 8764461652267426984L;

    private Integer id;

    private Integer parentId;

    private  String  deptName;

    private  String  remark; //注意

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
