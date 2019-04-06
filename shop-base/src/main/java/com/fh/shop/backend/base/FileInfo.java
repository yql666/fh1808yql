package com.fh.shop.backend.base;

import java.io.InputStream;
import java.io.Serializable;

public class FileInfo implements Serializable {

    private static final long serialVersionUID = -3917289230224694376L;

    private InputStream is;

    private  String  fileName;

    public InputStream getIs() {
        return is;
    }

    public void setIs(InputStream is) {
        this.is = is;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}
