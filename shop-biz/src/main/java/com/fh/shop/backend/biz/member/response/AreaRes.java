package com.fh.shop.backend.biz.member.response;

import java.util.List;

public class AreaRes {


    private int code;
    private String message;
    private List<Area> data;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<Area> getData() {
        return data;
    }

    public void setData(List<Area> data) {
        this.data = data;
    }

    public static class Area {


        private  Integer id;

        private Integer  pid;

        private String areaName;

        private Integer areaType;

        public Integer getPid() {
            return pid;
        }

        public void setPid(Integer pid) {
            this.pid = pid;
        }

        public String getAreaName() {
            return areaName;
        }

        public void setAreaName(String areaName) {
            this.areaName = areaName;
        }

        public Integer getAreaType() {
            return areaType;
        }

        public void setAreaType(Integer areaType) {
            this.areaType = areaType;
        }

        public Integer getId() {
            return id;
        }

        public void setId(Integer id) {
            this.id = id;
        }
    }

}
