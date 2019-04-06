/**
 * <pre>项目名称:shop-admin
 * 文件名称:User.java
 * 包名:com.fh.shop.backend.po.user
 * 创建日期:2019年1月7日下午3:52:53
 * Copyright (c) 2019, xxxxxx@163.com All Rights Reserved.</pre>
 */
package com.fh.shop.backend.po.user;

import com.fh.shop.backend.po.Page;
import com.fh.shop.backend.po.dept.Department;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <pre>项目名称：shop-admin    
 * 类名称：User    
 * 类描述：    
 * 创建人：杨乾隆 710245665@qq.com    
 * 创建时间：2019年1月7日 下午3:52:53    
 * 修改人：杨乾隆 710245665@qq.com     
 * 修改时间：2019年1月7日 下午3:52:53    
 * 修改备注：       
 * @version </pre>    
 */
public class User extends Page implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String userName;

    private String userRealName;

    private String password;

    private String imgCode;

    private String salt;

    private List<Integer> listArr;

    private String headPath;

    private String toHeadPath;

    public String getToHeadPath() {
        return toHeadPath;
    }

    public void setToHeadPath(String toHeadPath) {
        this.toHeadPath = toHeadPath;
    }

    public String getHeadPath() {
        return headPath;
    }

    public void setHeadPath(String headPath) {
        this.headPath = headPath;
    }

    public List<Integer> getListArr() {
        return listArr;
    }

    public void setListArr(List<Integer> listArr) {
        this.listArr = listArr;
    }

    private Integer loginCount;

    private Date loginTime;

    private Date errorLogTime;

    private Integer status;

    private Integer errorCount;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;

    private String birthdayStr;

    private String ids;

    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }

    public String getBirthdayStr() {
        return birthdayStr;
    }

    public void setBirthdayStr(String birthdayStr) {
        this.birthdayStr = birthdayStr;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date minBirthday;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date maxBirthday;

    private Department department = new Department();

    private Integer sex;

    private Double selary;

    private Double minSelary;

    private Double maxSelary;


    public Date getMinBirthday() {
        return minBirthday;
    }

    public void setMinBirthday(Date minBirthday) {
        this.minBirthday = minBirthday;
    }

    public Date getMaxBirthday() {
        return maxBirthday;
    }

    public void setMaxBirthday(Date maxBirthday) {
        this.maxBirthday = maxBirthday;
    }

    public Double getMinSelary() {
        return minSelary;
    }

    public void setMinSelary(Double minSelary) {
        this.minSelary = minSelary;
    }

    public Double getMaxSelary() {
        return maxSelary;
    }

    public void setMaxSelary(Double maxSelary) {
        this.maxSelary = maxSelary;
    }

    public String getUserRealName() {
        return userRealName;
    }

    public void setUserRealName(String userRealName) {
        this.userRealName = userRealName;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
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

    public Date getErrorLogTime() {
        return errorLogTime;
    }

    public void setErrorLogTime(Date errorLogTime) {
        this.errorLogTime = errorLogTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getErrorCount() {
        return errorCount;
    }

    public void setErrorCount(Integer errorCount) {
        this.errorCount = errorCount;
    }

    public Integer getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(Integer loginCount) {
        this.loginCount = loginCount;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getImgCode() {
        return imgCode;
    }

    public void setImgCode(String imgCode) {
        this.imgCode = imgCode;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "User [id=" + id + ", userName=" + userName + ", password=" + password + "]";
    }


}
