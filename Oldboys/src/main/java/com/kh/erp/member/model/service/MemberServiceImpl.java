package com.kh.erp.member.model.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.erp.member.model.dao.MemberDAO;
import com.kh.erp.member.model.vo.Member;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {

	@Inject 
	@Autowired
	MemberDAO memberdao;
	private JavaMailSender mailSender;
	
	
	@Override
	public int insertMember(Member m) {
		return memberdao.insertMember(m);
	}

	@Override
	public Member selectOne(String userId) {
		return memberdao.selectOne(userId);
	}

	@Override
	public int updateMember(Member m) {
		return memberdao.updateMember(m);
	}

	@Override
	public int deleteMember(String userId) {
		return memberdao.deleteMember(userId);
	}

	@Override
	public int checkIdDuplicate(String userId) {
		HashMap<String, Object > hmap = new HashMap<String, Object>();
		hmap.put("userId", userId);
		
		return memberdao.checkIdDuplicate(hmap);
	}
	
	@Override
	public List<Member> selectListMember(String userId) {
		return  memberdao.selectListMember(userId);
	}
	
	public int idCheck(String userId) {
		HashMap<String, Object> idMap = new HashMap<String, Object>(); 
	
		idMap.put("userId", userId);
		
		return memberdao.idCheck(idMap);
	}
	
	/* ========================== email ========================== */
	
    //아이디 찾기
    @Override
    public String find_idCheck(Member dto) {
        String id = memberdao.find_idCheck(dto);
        
        return id;
    }
 
    //비밀번호 찾기
    @Override
    public String find_passCheck(Member dto) {
        String pass = memberdao.find_passCheck(dto);
        return pass;
    }
    
    //이메일 중복 확인
    @Override
    public boolean email_check(String email) throws Exception{
        
        boolean result = memberdao.email_check(email);
        
        return result;
        
    }

	@Override
	public Member selectPasswordFind(String userId) {
		return memberdao.selectPasswordFind(userId);
	}

	@Override
	public int updatePassword(Member m) {
		return memberdao.updatePassword(m);
	}

	@Override
	public Member selectIdFind(String name) {
		return memberdao.selectIdFind(name);
	}


    
}
