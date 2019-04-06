package com.fh.shop.backend.vo;


import java.io.Serializable;
import java.util.Date;

public class UserVo implements Serializable {

    private static final long serialVersionUID = -2525233306973254859L;


    private String headPath;

    private String userRealName;

    private Integer sex;

    private Date birthday;

    private String deptName;

    private String password;

    private Double selary;

    private Integer status;

    private Integer id;

    private String userName;

    public String getHeadPath() {
        return headPath;
    }

    public void setHeadPath(String headPath) {
        this.headPath = headPath;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserRealName() {
        return userRealName;
    }

    public void setUserRealName(String userRealName) {
        this.userRealName = userRealName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Double getSelary() {
        return selary;
    }

    public void setSelary(Double selary) {
        this.selary = selary;
    }
}
