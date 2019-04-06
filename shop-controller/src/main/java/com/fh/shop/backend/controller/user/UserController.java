package com.fh.shop.backend.controller.user;

import com.fh.shop.backend.annotation.LogAnnotation;
import com.fh.shop.backend.base.BaseController;
import com.fh.shop.backend.biz.user.IUserService;
import com.fh.shop.backend.common.DataTableResponse;
import com.fh.shop.backend.common.ResponseEnum;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.po.user.User;
import com.fh.shop.backend.util.*;
import com.google.gson.Gson;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.fh.shop.backend.util.SystemContent.LOG_USER;

/**
 * <pre>
 * 项目名称：shop-admin
 * 类名称：UserController
 * 类描述：
 * 创建人：杨乾隆 710245665@qq.com
 * 创建时间：2019年1月7日 下午3:55:29
 * 修改人：杨乾隆 710245665@qq.com
 * 修改时间：2019年1月7日 下午3:55:29
 * 修改备注：
 * &#64;version
 * </pre>
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Resource(name = "userService")
    private IUserService userService;

    @RequestMapping("toArea")
    public String toArea() {
        return "/area/areaList";
    }

    /**
     * <pre>
     * findUser(登录验证)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2019年1月8日 上午9:52:34
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2019年1月8日 上午9:52:34
     * 修改备注：
     * &#64;param user
     * &#64;param resp
     * &#64;param req
     * </pre>
     */
    @RequestMapping("findUser")
    @ResponseBody
    @LogAnnotation("登录方法")
    public ServerResponse findUser(User user, HttpServletRequest request) {
        Date date = new Date();
        String fh_id = CookieUtil.requestCookie(request, SystemContent.COOKIE_KEY);
        Date newDate = DateUtils.resultDate(DateUtils.resultStrDate(date, DateUtils.Y_M_D), DateUtils.Y_M_D);
        //判断用户账户密码或验证码是否为空
        if (StringUtils.isEmpty(user.getUserName()) || StringUtils.isEmpty(user.getPassword()) || StringUtils.isEmpty(user.getImgCode())) {
            return ServerResponse.error(ResponseEnum.RESULT_USERNAMEORPWD_ISNOT);
        }
        //将获取前台生成的验证码
        //String imgCode = (String) request.getSession().getAttribute(SystemContent.IMAGE_IMAGECODE);
        String imgCode = RedisUtil.get(SystemContent.LOGIN_CODE + fh_id);
        //将前台传入的验证码与后台随机生成的进行比较
        if (!user.getImgCode().equals(imgCode)) {
            return ServerResponse.error(ResponseEnum.RESULT_IMAGECODE_ERROR);
        }
        //获取当前用户
        User DBuser = userService.findUser(user);
        //判断用户如果不存在则返回账户不存在异常
        if (DBuser == null) {
            return ServerResponse.error(ResponseEnum.RESULT_USERNAMEORPWD_ERROR);
        }
        //判断用户状态如果当前状态为锁定状态则返回用户被锁定
        if (DBuser.getStatus() == SystemContent.LOG_USER_LOCK) {
            return ServerResponse.error(ResponseEnum.RESULT_LOG_USER_LOCK);
        }
        String md5Password = MD5Util.getStringMD5(user.getPassword() + DBuser.getSalt());
        //判断密码是否正确
        if (!md5Password.equals(DBuser.getPassword())) {
            //如果为第一次错误登录
            if (DBuser.getErrorLogTime() == null) {
                user.setErrorLogTime(new Date());
                userService.updateErrorLogTime(user);
                //否则为第二次登录
            } else {
                Date errorLogTime = DateUtils.resultDate(DateUtils.resultStrDate(DBuser.getErrorLogTime(), DateUtils.Y_M_D_H_M_S), DateUtils.Y_M_D_H_M_S);
                //判断是否为当天错误次数
                if (errorLogTime.after(newDate)) {
                    //判断错误次数如果为2则证明这是第三次错误，令其账户状态为锁定状态
                    if (DBuser.getErrorCount() == (SystemContent.LOG_USER_LOCK - 1)) {
                        user.setStatus(SystemContent.LOG_USER_LOCK);
                        userService.updateUserStatus(user);
                    }
                    user.setErrorLogTime(new Date());
                    userService.updateUserErrorCount(user);
                    //不是当天登录的错误次数则清零
                } else {
                    user.setErrorLogTime(new Date());
                    userService.updateErrorLogTime(user);
                }
            }
            return ServerResponse.error(ResponseEnum.RESULT_USERNAMEORPWD_ERROR);
        }

        //request.getSession().setAttribute(SystemContent.LOG_USER, DBuser);
        //安全问题把密码盐值隐藏
        DBuser.setSalt("");
        DBuser.setPassword("");
        Gson gson = new Gson();
        String toJson = gson.toJson(DBuser);
        //将用户信息存入redis缓存中
        RedisUtil.set(SystemContent.USER_KEY + fh_id, toJson);
        RedisUtil.expire(SystemContent.USER_KEY + fh_id, 30 * 60);
        //
        RedisUtil.del(SystemContent.LOGIN_CODE + fh_id);
        //判断是否为首次登录
        if (DBuser.getLoginTime() == null) {
            user.setStatus(SystemContent.LOG_USER_SUCCESS);
            user.setLoginTime(date);
            userService.updateUser(user);
            return ServerResponse.success();
        }
        Date loginTime = DateUtils.resultDate(DateUtils.resultStrDate(DBuser.getLoginTime(), DateUtils.Y_M_D_H_M_S), DateUtils.Y_M_D_H_M_S);
        //如果为同一天登录则登录次数+1
        if (loginTime.after(newDate)) {
            userService.updateUserLogCount(user);
        } else {
            //否则为第二天登录  清0
            userService.resetLogCount(user);
            DBuser = userService.findUser(user);
            request.getSession().setAttribute(SystemContent.LOG_USER, DBuser);
        }
        user.setStatus(SystemContent.LOG_USER_SUCCESS);
        user.setLoginTime(date);
        userService.updateUser(user);
        return ServerResponse.success();
    }


    //dataTable方法进行展示
    @RequestMapping("findUserList")
    @ResponseBody
    public ServerResponse findUserList(User user,
                                       HttpServletRequest request
    ) {
        //将前台传送后台的数据进行转换添加给当前对象
        resultUser(user, request);
        //获取后台转换后的dataTable数据集合
        DataTableResponse userDateTable = userService.findUserDateTable(user);
        return ServerResponse.success(userDateTable);
    }

    private void resultUser(User user, HttpServletRequest request) {
        String column = request.getParameter(SystemContent.MAP_ORDER_COLUMN);
        if (StringUtils.isNotEmpty(column)) {
            String data = request.getParameter(getStateKey(column));
            String dir = request.getParameter(SystemContent.MAP_ORDER_DIR);
            user.setProperty(data);
            user.setSort(dir);
        }
    }

    @RequestMapping("toUser")
    public String toUser() {
        return "/user/userList";
    }

    @RequestMapping("toAddUser")
    public String toAddUser() {
        return "/user/addUser";
    }


    /**
     * <pre>
     * addUser(增加账户)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2019年1月8日 上午9:53:05
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2019年1月8日 上午9:53:05
     * 修改备注：
     * &#64;param user
     * &#64;param resp
     * </pre>
     */
    @RequestMapping("addUser")
    @ResponseBody
    @LogAnnotation("添加方法")
    public ServerResponse addUser(User user, HttpServletRequest request) {
        ServerResponse resultAddUser = userService.addUser(user);
        request.getSession().setAttribute(LOG_USER, user);
        return resultAddUser;
    }

    @RequestMapping("addUserDialog")
    @ResponseBody
    public ServerResponse addUserDialog(User user) {
        userService.addUserDialog(user);
        return ServerResponse.success();
    }

    /**
     * <pre>
     * findUserName(验证账号是否存在)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2019年1月8日 上午9:53:32
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2019年1月8日 上午9:53:32
     * 修改备注：
     * &#64;param user
     * &#64;param resp
     * </pre>
     */
    @RequestMapping("findUserName")
    public @ResponseBody
    ServerResponse findUserName(User user) {
        ServerResponse resultUserName = userService.findUserName(user);
        return resultUserName;
    }

    @RequestMapping("deleteUser")
    public @ResponseBody
    ServerResponse deleteUser(Integer id) {
        userService.deleteUser(id);
        return ServerResponse.success();
    }

    @RequestMapping("deleteIds")
    public @ResponseBody
    ServerResponse deleteIds(String ids) {
        userService.deleteIds(ids);
        return ServerResponse.success();
    }


    @RequestMapping("toUpdateUser")
    public @ResponseBody
    ServerResponse toUpdateUser(Integer id) {
        User userInfo = userService.toUpdateUser(id);
        userInfo.setBirthdayStr(DateUtils.resultStrDate(userInfo.getBirthday(), DateUtils.Y_M_D));
        return ServerResponse.success(userInfo);
    }


    @RequestMapping("updateUserInfo")
    public @ResponseBody
    ServerResponse updateUserInfo(User user) {
        userService.updateUserInfo(user);
        return ServerResponse.success();
    }


    //将用户解锁
    @RequestMapping("resetStatus")
    @ResponseBody
    public ServerResponse resetStatus(User user, Integer flag) {
        if (flag == 1) {
            user.setStatus(SystemContent.LOG_USER_SUCCESS);
        } else {
            user.setStatus(SystemContent.LOG_USER_LOCK);
        }
        userService.resetStatus(user);
        return ServerResponse.success();
    }

    @RequestMapping("updateUserDept")
    @ResponseBody
    public ServerResponse updateUserDept(User user) {
        userService.updateUserDept(user);
        return ServerResponse.success();
    }

    /**
     * <pre>
     * logOff(退出方法)
     * 创建人：杨乾隆 710245665@qq.com
     * 创建时间：2019年1月9日 下午2:15:56
     * 修改人：杨乾隆 710245665@qq.com
     * 修改时间：2019年1月9日 下午2:15:56
     * 修改备注：
     * &#64;param req
     * &#64;param resp
     * </pre>
     */
    @RequestMapping("logOff")
    @LogAnnotation("退出方法")
    public String logOff(HttpServletRequest req, HttpServletResponse resp) {
        String fh_id = CookieUtil.requestCookie(req, SystemContent.COOKIE_KEY);
        if(StringUtils.isNotEmpty(fh_id)){
            RedisUtil.del(SystemContent.USER_KEY + fh_id);
            CookieUtil.deleteCookie(resp,SystemContent.COOKIE_KEY,SystemContent.LOGIN_URL);
            req.getSession().invalidate();
        }
        return "redirect:/login.jsp";
    }

    //导出excel
    @RequestMapping("excelDept")
    public void excelDept(String cellIds, String sheetName, HttpServletResponse response) {
        String[] cellIdList = cellIds.split(";");
        String[] sheetNameArr = sheetName.split(",");
        XSSFWorkbook workbook = new XSSFWorkbook();
        String[] title = {"用户姓名", "性别", "生日", "部门", "薪资"};
        for (int j = 0; j < cellIdList.length; j++) {
            List<Integer> cellList = new ArrayList<>();
            String sheets = sheetNameArr[j];
            XSSFSheet sheet = workbook.createSheet(sheets);
            XSSFRow row = sheet.createRow(0);
            for (int a = 0; a < title.length; a++) {
                row.createCell(a).setCellValue(title[a]);
            }
            String[] idArr = cellIdList[j].split(",");
            for (int i = 0; i < idArr.length; i++) {
                cellList.add(Integer.valueOf(idArr[i]));
            }
            BuildDeptTable(workbook, cellList, sheet);
        }
        FileUtil.excelDownload(workbook, response);
    }

    private void BuildDeptTable(XSSFWorkbook workbook, List<Integer> cellList, XSSFSheet sheet) {
        XSSFCellStyle formatDate = workbook.createCellStyle();
        formatDate.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy"));
        List<User> userList = userService.findDeptList(cellList);
        for (int q = 0; q < userList.size(); q++) {
            User user = userList.get(q);
            XSSFRow deptRow = sheet.createRow(q + 1);
            deptRow.createCell(0).setCellValue(user.getUserRealName());
            deptRow.createCell(1).setCellValue((user.getSex() == 1 ? "男" : "女"));
            XSSFCell deptBirthday = deptRow.createCell(2);
            deptBirthday.setCellValue(user.getBirthday());
            deptBirthday.setCellStyle(formatDate);
            deptRow.createCell(3).setCellValue(user.getDepartment().getDeptName());
            deptRow.createCell(4).setCellValue(user.getSelary());
        }
    }
}
