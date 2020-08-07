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

	List<Member> selectListMember(String userId);
	
	public int idCheck(HashMap<String, Object> idMap);

/* ========================== email ========================== */
	
	public String find_idCheck(Member dto);

	public String find_passCheck(Member dto);

	public boolean email_check(String email) throws Exception;

	public Member selectPasswordFind(String userId);

	public int updatePassword(Member m);

	public Member selectIdFind(String name);


	

	
}
