package com.fh.shop.backend.biz.member;

import com.fh.shop.backend.biz.member.response.AreaRes;
import com.fh.shop.backend.biz.member.response.Member;
import com.fh.shop.backend.common.ServerResponse;

public interface IMemberService {


    ServerResponse findMemberList(Member member);

    AreaRes findAreaApi();

    ServerResponse updateMember(Member member);
}
