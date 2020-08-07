package com.kh.erp.member.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.erp.member.model.vo.Member;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member m) {
		return sqlSession.insert("MemberMapper.insertMember", m);
	}

	@Override
	public Member selectOne(String userId) {
		return sqlSession.selectOne("MemberMapper.selectOne",userId);
	}

	@Override
	public int updateMember(Member m) {
		return sqlSession.update("MemberMapper.updateMember", m);
	}

	@Override
	public int deleteMember(String userId) {
		return sqlSession.delete("MemberMapper.deleteMember", userId);
	}

	@Override
	public int checkIdDuplicate(HashMap<String, Object> hmap) {
		sqlSession.selectOne("MemberMapper.checkIdDuplicate", hmap);
		
		return (Integer)hmap.get("result");
	}

	@Override
	public List<Member> selectListMember(String userId) {
		
		return sqlSession.selectList("MemberMapper.selectListMember", userId);
	}
	
	public int idCheck(HashMap<String, Object> idMap) {
		
		sqlSession.selectOne("MemberMapper.idCheck", idMap);
		System.out.println("dao idMap : " + idMap);
		return (Integer)idMap.get("result");
	}
	
	/* ========================== email ========================== */
    
    //아이디 찾기 관련 메소드
    @Override
    public String find_idCheck(Member dto) {
        String id = sqlSession.selectOne("MemberMapper.id_check", dto);
        return id;
        
    }
    
    //비밀번호 찾기 관련 메소드
    @Override
    public String find_passCheck(Member dto) {
        String pass = sqlSession.selectOne("MemberMapper.find_pass_check", dto);
        return pass;
    }
    
    // 이메일체크
    @Override
    public boolean email_check(String email) throws Exception {
        String emailck = sqlSession.selectOne("MemberMapper.email_check", email);
    
        //조건식 ? true일때의 값 : false일때의 값
        return (emailck==null) ? true : false;
        
    }

	@Override
	public Member selectPasswordFind(String userId) {
		return sqlSession.selectOne("MemberMapper.selectOnePassword", userId);
	}

	@Override
	public int updatePassword(Member m) {
		return sqlSession.update("MemberMapper.updatePassword", m);
	}

	@Override
	public Member selectIdFind(String name) {
		return sqlSession.selectOne("MemberMapper.selectIdFind", name);
	}

	@Override
	public int insertSales(int userNo) {
	
		return sqlSession.insert("MemberMapper.insertSales", userNo);
	}


}
