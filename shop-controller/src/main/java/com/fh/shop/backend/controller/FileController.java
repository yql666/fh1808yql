package com.fh.shop.backend.controller;

import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.util.CosUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


@RestController
@RequestMapping(value = "file")
public class FileController {


    @RequestMapping(value = "/uploadFile" , method = RequestMethod.POST)
    public ServerResponse uploadFile(@RequestParam("uploadImgFile") MultipartFile uploadImgFile){
        return CosUtil.uploadFile(uploadImgFile);
    }
    @RequestMapping(value = "/uploadFiles" , method = RequestMethod.POST)
    public ServerResponse uploadFiles(@RequestParam("uploadImgFiles") MultipartFile uploadImgFile){
        return CosUtil.uploadFile(uploadImgFile);
    }

    @RequestMapping(value = "downloadFile" , method ={RequestMethod.GET,RequestMethod.POST} )
    public ServerResponse downloadFile(String fileName){
        CosUtil.downloadFile(fileName);
        return ServerResponse.success();
    }

    @RequestMapping(value = "deleteFile" , method ={RequestMethod.GET,RequestMethod.POST} )
    public ServerResponse deleteFile(String fileName){
            CosUtil.deleteFile(fileName);
        return ServerResponse.success();
    }
}
