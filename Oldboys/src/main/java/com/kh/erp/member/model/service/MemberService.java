package com.kh.erp.member.model.service;

import java.util.List;
import java.util.Map;

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
	
	/**
	 * 아이디 유효성 체크
	 * @param userId
	 * @return
	 */
	List<Member> selectListMember(String userId);
	
	int idCheck(String userId);  

	/*====================== Email ====================== */
	
	 /**
	  * 아이디 찾기 관련
	  * @param dto
	  * @return
	  */
	 public String find_idCheck(Member dto);   
	    
	 /**
	  * 비밀번호 찾기 관련
	  * @param dto
	  * @return
	  */
	 public String find_passCheck(Member dto);            
	    
	 /**
	  * 이메일 중복확인을 하는 메소드
	  * @param e_mail
	  * @return
	  * @throws Exception
	  */
	 public boolean email_check(String email) throws Exception;

	Member selectPasswordFind(String userId);

	int updatePassword(Member m);

	Member selectIdFind(String name);


	

	    
	 
}
