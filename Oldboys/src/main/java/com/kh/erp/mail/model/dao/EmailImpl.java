package com.kh.erp.mail.model.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.kh.erp.mail.model.vo.Email;

public class EmailImpl implements EmailDAO {

    @Inject
    SqlSession sqlSession;
    
    
    //회원가입 관련 메소드
    @Override
    public void join(Map<String, Object>map, Email dto) {
 
        map.get("user_id");
        map.get("member_pass");
        map.get("e_mail");
        
        sqlSession.insert("Emailmapper.insertUser",map);        
    }
    
    
    //로그인관련 메소드
    @Override
    public boolean loginCheck(Email dto) {
        String name
            =sqlSession.selectOne("Emailmapper.login_check", dto);
        
        //조건식 ? true일때의 값 : false일때의 값
        return (name==null) ? false : true;
    }
 
    
    //아이디 찾기 관련 메소드
    @Override
    public String find_idCheck(Email dto) {
        String id = sqlSession.selectOne("Emailmapper.find_id_check", dto);
        return id;
        
    }
 
    
    //비밀번호 찾기 관련 메소드
    @Override
    public String find_passCheck(Email dto) {
        String pass = sqlSession.selectOne("Emailmapper.find_pass_check", dto);
        return pass;
    }
 
    
    //회원 인증 관련 메소드
    //버튼을 클릭한 회원의 정보를 회원 테이블에 저장해서 사용할 수 있게 함
    @Override
    public void authentication(Email dto) {
        
        sqlSession.insert("Emailmapper.authentication", dto);
        
    }
 
 
    @Override
    public void pass_change(Map<String, Object> map, Email dto)throws Exception{
        
        map.get("member_pass");
        map.get("e_mail");
 
        sqlSession.update("Emailmapper.pass_change", map);
    }
 
 
    @Override
    public boolean email_check(String e_mail) throws Exception {
        String email
        =sqlSession.selectOne("Emailmapper.email_check", e_mail);
    
        //조건식 ? true일때의 값 : false일때의 값
        return (email==null) ? true : false;
        
    }
 
 
    @Override
    public boolean join_id_check(String user_id) throws Exception {
        String user_id1
        =sqlSession.selectOne("Emailmapper.join_id_check", user_id);
    
        //조건식 ? true일때의 값 : false일때의 값
        return (user_id1==null) ? true : false;
    }
 
    
    //회원의 프로필 정보를 리턴한다.
    @Override
    public List<Email> member_profile(String user_id) throws Exception {
        
        return sqlSession.selectList("Emailmapper.member_profile", user_id);
    }
    
}