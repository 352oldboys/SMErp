package com.kh.erp.member.model.service;

import java.util.List;

import com.kh.erp.member.model.vo.Member;

public interface MemberService {
	
	/**
	 * 아이디 생성
	 * @param m
	 * @return
	 */
	int insertMember(Member m);
	
	/**
	 * 아이디 검색
	 * @param userId
	 * @return
	 */
	Member selectOne(String userId);
	
	/**
	 * 아이디 수정
	 * @param m
	 * @return
	 */
	int updateMember(Member m);
	
	/**
	 * 아이디 삭제
	 * @param userId
	 * @return
	 */
	int deleteMember(String userId);

	/**
	 * 아이디 중복 확인
	 * @param userId
	 * @return
	 */
	int checkIdDuplicate(String userId);

	List<Member> selectListMember(String userId);

	
}
