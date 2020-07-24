package com.kh.erp.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.erp.member.model.dao.MemberDAO;
import com.kh.erp.member.model.vo.Member;

@Service("memberService")
public class memberServiceImpl implements MemberService {

	@Autowired
	MemberDAO MemberDAO;
	
	@Override
	public int insertMember(Member m) {
		return MemberDAO.insertMember(m);
	}

	@Override
	public Member selectOne(String userId) {
		return MemberDAO.selectOne(userId);
	}

	@Override
	public int updateMember(Member m) {
		return MemberDAO.updateMember(m);
	}

	@Override
	public int deleteMember(String userId) {
		return MemberDAO.deleteMember(userId);
	}

	@Override
	public int checkIdDuplicate(String userId) {
		HashMap<String, Object > hmap = new HashMap<String, Object>();
		hmap.put("userId", userId);
		
		return MemberDAO.checkIdDuplicate(hmap);
	}

}
