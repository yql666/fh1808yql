package com.fh.shop.backend.biz.member;

import com.alibaba.fastjson.JSON;
import com.fh.shop.backend.biz.member.response.AreaRes;
import com.fh.shop.backend.biz.member.response.Member;
import com.fh.shop.backend.common.ServerResponse;
import com.fh.shop.backend.util.HttpClientUtil;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements IMemberService {

    @Value(value = "${member_url}")
    private String member_url;

    @Value(value = "${memberUpdate_url}")
    private String memberUpdate_url;

    @Value(value = "${area_url}")
    private String area_utl;


    public ServerResponse findMemberList(Member member) {
        String result = HttpClientUtil.postResult(member_url,JSON.toJSONString(member));
        Gson gson = new Gson();
        ServerResponse memberResponse = gson.fromJson(result, ServerResponse.class);
        return memberResponse;
    }

    public AreaRes findAreaApi() {
        String result  = HttpClientUtil.postResult(area_utl);
        Gson gson = new Gson();
        AreaRes areaRes = gson.fromJson(result, AreaRes.class);
        return areaRes;
    }

    public ServerResponse updateMember(Member member) {
        String result = HttpClientUtil.postResult(memberUpdate_url,JSON.toJSONString(member));
        Gson gson = new Gson();
        ServerResponse memberResponse = gson.fromJson(result, ServerResponse.class);
        return memberResponse;
    }

}
