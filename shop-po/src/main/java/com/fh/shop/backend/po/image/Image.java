package com.fh.shop.backend.po.image;

import java.io.Serializable;

public class Image implements Serializable {
    private static final long serialVersionUID = 6875344704566921676L;

    private Integer id;

    private String imgPath;

    private Integer productId;


    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

}
