//package com.kh.erp.mail.model.service;
//
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpSession;
//
//import com.kh.erp.mail.model.vo.Email;
//
//public interface EmailService {
//
//
//	/**
//	 * 회원가입 관련
//	 * @param map
//	 * @param dto
//	 */
//    
//    public void join (Map<String, Object>map,Email dto); 
//    
//  /**
//   * 로그인 관련
//   * @param dto
//   * @param session
//   * @return
//   */
//    public boolean loginCheck(Email dto, HttpSession session);    
//    
//    
//    /**
//     * 아이디 찾기 관련
//     * @param dto
//     * @return
//     */
//    public String find_idCheck(Email dto);    
//    
//    /**
//     * 비밀번호 찾기 관련
//     * @param dto
//     * @return
//     */
//    public String find_passCheck(Email dto);    
//    
//    
//    /**
//     * 회원 인증관련 메소드
//     * @param dto
//     */
//    public void authentication(Email dto);       
//    
//    /**
//     * 비밀번호 변경
//     * @param map
//     * @param dto
//     * @throws Exception
//     */
//    public void pass_change(Map<String, Object> map, Email dto)throws Exception;    
//    
//    /**
//     * 이메일 중복확인을 하는 메소드
//     * @param e_mail
//     * @return
//     * @throws Exception
//     */
//    public boolean email_check(String e_mail) throws Exception;    
//    
//    /**
//     * 회원가입시 아이디를 체크하는 메소드
//     * @param user_id
//     * @return
//     * @throws Exception
//     */
//    public boolean join_id_check(String user_id) throws Exception;    
//    
//    /**
//     * 회원의 프로필을 볼 수 있는 메소드
//     * @param user_id
//     * @return
//     * @throws Exception
//     */
//    public List<Email> member_profile(String user_id) throws Exception;    
//    
//	
//}
