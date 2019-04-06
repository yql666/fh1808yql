package com.fh.shop.backend.vo;

import java.io.Serializable;

public class LogVo implements Serializable {
    private static final long serialVersionUID = -8186966284925759022L;

    private Long id;
    private String userName; //用户名
    private String info; //做了什么事：执行了哪个类的哪个方法
    private  Integer status; //1:成功，0:失败
    private  String createTimeStr; //(创建时间)
    private  Long useTime; //(花了多长时间) 单位：毫秒]
    private String ipAdd;
    private String content;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getCreateTimeStr() {
        return createTimeStr;
    }

    public void setCreateTimeStr(String createTimeStr) {
        this.createTimeStr = createTimeStr;
    }

    public Long getUseTime() {
        return useTime;
    }

    public void setUseTime(Long useTime) {
        this.useTime = useTime;
    }

    public String getIpAdd() {
        return ipAdd;
    }

    public void setIpAdd(String ipAdd) {
        this.ipAdd = ipAdd;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
