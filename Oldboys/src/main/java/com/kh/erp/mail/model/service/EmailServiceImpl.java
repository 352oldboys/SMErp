//package com.kh.erp.mail.model.service;
//
//import java.util.List;
//import java.util.Map;
//
//import javax.inject.Inject;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.stereotype.Service;
//
//import com.kh.erp.mail.model.dao.EmailDAO;
//import com.kh.erp.mail.model.vo.Email;
//
//@Service("Emailservice")
//public class EmailServiceImpl implements EmailService {
//	 
//	
//		@Inject    
//	    EmailDAO emaildao; //dao를 사용하기 위해 의존성을 주입
//	    private JavaMailSender mailSender;
//	 
//	    
//	    
//	    @Override    //회원가입 메소드, Map과 dto를 갖이 넘김
//	    public void join(Map<String, Object>map,Email dto) {
//	        emaildao.join(map,dto);
//	 
//	    }
//	 
//	 
//	    @Override    //로그인 관련 메소드 (세션에 아이디와 비밀번호를 저장)
//	    public boolean loginCheck(Email dto, HttpSession session) {
//	        
//	        boolean result = emaildao.loginCheck(dto);
//	        if(result) {    //로그인 성공
//	            session.setAttribute("user_id", dto.getUserId());
//	            session.setAttribute("member_pass", dto.getMember_pass());
//	            System.out.println(session.getAttribute("user_id"));
//	            System.out.println(session.getAttribute("member_pass"));
//	        }
//	        
//	        return result;
//	    }
//	 
//	    //아이디 찾기
//	    @Override
//	    public String find_idCheck(Email dto) {
//	        String id = emaildao.find_idCheck(dto);
//	        
//	        return id;
//	    }
//	 
//	    //비밀번호 찾기
//	    @Override
//	    public String find_passCheck(Email dto) {
//	        String pass = emaildao.find_passCheck(dto);
//	        return pass;
//	    }
//	 
//	 
//	    @Override
//	    public void authentication(Email dto) {
//	        
//	        emaildao.authentication(dto);
//	    }
//	 
//	 
//	    @Override
//	    public void pass_change(Map<String, Object> map, Email dto) throws Exception {
//	        
//	        
//	        emaildao.pass_change(map,dto);
//	    }
//	 
//	 
//	    //이메일 중복 확인
//	    @Override
//	    public boolean email_check(String e_mail) throws Exception{
//	        
//	        boolean result = emaildao.email_check(e_mail);
//	        
//	        return result;
//	        
//	    }
//	 
//	    //아이디 중복 확인
//	    @Override
//	    public boolean join_id_check(String user_id) throws Exception {
//	    
//	        boolean result = emaildao.join_id_check(user_id);
//	        
//	        return result;
//	    }
//	 
//	 
//	    //자신의 프로필을 볼 수 있게 하는 메소드
//	    @Override
//	    public List<Email> member_profile(String user_id) throws Exception{
//	        
//	        return emaildao.member_profile(user_id);
//	    }
//	    
//	 
//	    
//}
//
