package com.kh.erp.member.model.dao;

import java.util.HashMap;
import java.util.List;

import com.kh.erp.member.model.vo.Member;

public interface MemberDAO {

	public int insertMember(Member m);
	
	public Member selectOne(String userId);
	
	public int updateMember(Member m);
	
	public int deleteMember(String userId);
	
	public int checkIdDuplicate(HashMap<String, Object> hmap);

	public List<Member> selectListMember(String userId);
	
}
