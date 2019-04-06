package com.fh.shop.backend.controller.member;

import com.fh.shop.backend.biz.member.IMemberService;
import com.fh.shop.backend.biz.member.response.AreaRes;
import com.fh.shop.backend.biz.member.response.Member;
import com.fh.shop.backend.common.ServerResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/member")
public class MemberController {

    @Resource
    private IMemberService memberService;

    @RequestMapping(value = "findMemberList" , method = {RequestMethod.GET,RequestMethod.POST})
    public ServerResponse findMemberList(Member member){
        ServerResponse memberList = memberService.findMemberList(member);
        return memberList;
    }

    @RequestMapping(value = "findAreaApi" , method = {RequestMethod.GET,RequestMethod.POST})
    public Object findAreaApi(){
        AreaRes areaApi = memberService.findAreaApi();
        return areaApi;
    }
    @RequestMapping(value = "updateMember" , method = {RequestMethod.GET,RequestMethod.POST})
    public ServerResponse updateMember(Member member){
        return memberService.updateMember(member);
    }


}
