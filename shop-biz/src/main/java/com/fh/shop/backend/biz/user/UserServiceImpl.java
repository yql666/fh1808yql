/**
 * <pre>项目名称:shop-admin
 * 文件名称:UserServiceImpl.java
 * 包名:com.fh.shop.backend.biz.user
 * 创建日期:2019年1月7日下午3:56:54
 * Copyright (c) 2019, xxxxxx@163.com All Rights Reserved.</pre>
 */
package com.fh.shop.backend.biz.user;

import com.fh.shop.backend.base.BaseService;
import com.fh.shop.backend.common.DataTableResponse;
import com.fh.shop.backend.common.ResponseEnum;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.mapper.user.IUserMapper;
import com.fh.shop.backend.po.user.User;
import com.fh.shop.backend.util.CosUtil;
import com.fh.shop.backend.util.MD5Util;
import com.fh.shop.backend.vo.UserVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * <pre>
 * 项目名称：shop-admin
 * 类名称：UserServiceImpl
 * 类描述：
 * 创建人：杨乾隆 710245665@qq.com
 * 创建时间：2019年1月7日 下午3:56:54
 * 修改人：杨乾隆 710245665@qq.com
 * 修改时间：2019年1月7日 下午3:56:54
 * 修改备注：
 * &#64;version
 * </pre>
 */
@Service
public class UserServiceImpl extends BaseService implements IUserService {

    @Autowired
    private IUserMapper userMapper;



    @Override
    public User findUser(User user) {
        return userMapper.findUser(user);
    }

    @Override
    public ServerResponse addUser(User user) {
        //判断用户前台账户密码验证码是否为空
        if (StringUtils.isEmpty(user.getUserName()) || StringUtils.isEmpty(user.getPassword())) {
            return ServerResponse.error(ResponseEnum.RESULT_USERNAMEORPWD_ERROR);
        }
        //为每位注册的用户增加盐值
        String toUUid = UUID.randomUUID().toString();
        //并将随机生成的盐值和密码进行拼接并进行二次加密
        String stringMD5 = MD5Util.getStringMD5(user.getPassword() + toUUid);
        user.setSalt(toUUid);
        user.setPassword(stringMD5);
        userMapper.addUser(user);
        return ServerResponse.success();
    }

    @Override
    public ServerResponse findUserName(User user) {
        try {
            if (user.getUserName().isEmpty()) {
                return ServerResponse.error(ResponseEnum.RESULT_USERNAME_ERROR);
            }
            User userNameBD = userMapper.findUser(user);
            if (userNameBD == null) {
                return ServerResponse.success("恭喜您可以注册");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ServerResponse.error();
        }
        return ServerResponse.error(ResponseEnum.RESULT_USERNAME_ISNOT);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public void updateUserStatus(User user) {
        userMapper.updateUserStatus(user);
    }

    @Override
    public void updateUserErrorCount(User user) {
        userMapper.updateUserErrorCount(user);
    }

    @Override
    public void updateUserLogCount(User user) {
        userMapper.updateUserLogCount(user);
    }

    @Override
    public void resetStatus(User user) {
        userMapper.resetStatus(user);
    }

    @Override
    public void updateErrorLogTime(User user) {
        userMapper.updateErrorLogTime(user);
    }

    @Override
    public void resetLogCount(User user) {
        userMapper.resetLogCount(user);
    }

    public DataTableResponse findUserDateTable(User user) {
        List<Integer> arrList = resultList(user.getIds());
        if(arrList.size()>0){
            user.setListArr(arrList);
        }
        //查询数据总条数
        Long pageListCount = userMapper.findPageCount(user);
        //查询数据返回list集合
        List<UserVo> userVoList = wrapperUser(user);
        //调用自定义方法将数据转换为DataTable格式
        DataTableResponse resultResponse = DataTableResponse.resultResponse(user.getDraw(), pageListCount, pageListCount, userVoList);
        return resultResponse;
    }

    @Override
    public void updateUserDept(User user) {
        List<Integer> arrList = resultList(user.getIds());
        if(arrList.size()>0){
            user.setListArr(arrList);
        }
        userMapper.updateUserDept(user);
    }

    @Override
    public List<User> findDeptList(List<Integer> idArr) {

        return userMapper.findDeptList(idArr);
    }

    private List<UserVo> wrapperUser(User user) {
        List<User> userList = userMapper.findUserList(user);
        List<UserVo> userVoList = new ArrayList<>();
        for (User userInfo : userList) {
            UserVo userVo = new UserVo();
            userVo.setId(userInfo.getId());
            userVo.setHeadPath(userInfo.getHeadPath());
            userVo.setUserName(userInfo.getUserName());
            userVo.setUserRealName(userInfo.getUserRealName());
            userVo.setDeptName(userInfo.getDepartment().getDeptName());
            userVo.setStatus(userInfo.getStatus());
            userVo.setSex(userInfo.getSex());
            userVo.setSelary(userInfo.getSelary());
            userVo.setBirthday(userInfo.getBirthday());
            userVoList.add(userVo);
        }
        return userVoList;
    }

    @Override
    public void deleteUser(Integer id) {
        userMapper.deleteUser(id);
        User user = userMapper.toUpdateUser(id);
        CosUtil.deleteFile(user.getHeadPath());
    }

    @Override
    public void deleteIds(String ids) {
        List<Integer> arrList = resultList(ids);
        if(arrList.size()>0){
            userMapper.deleteIds(arrList);
        }
    }

    @Override
    public User toUpdateUser(Integer id) {
        return userMapper.toUpdateUser(id);
    }

    @Override
    public void updateUserInfo(User user) {
        if(StringUtils.isNotEmpty(user.getHeadPath())){
            CosUtil.deleteFile(user.getToHeadPath());
        }else {
            user.setHeadPath(user.getToHeadPath());
        }
        userMapper.updateUserInfo(user);
    }

    @Override
    public void addUserDialog(User user) {
        //为每位注册的用户增加盐值
        String toUUid = UUID.randomUUID().toString();
        //并将随机生成的盐值和密码进行拼接并进行二次加密
        String stringMD5 = MD5Util.getStringMD5(user.getPassword() + toUUid);
        user.setSalt(toUUid);
        user.setPassword(stringMD5);
        userMapper.addUserDialog(user);
    }

    @Override
    public void deleteByPids(List<Integer> ids) {
        userMapper.deleteByPids(ids);
    }

}
