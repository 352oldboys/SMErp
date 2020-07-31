//package com.kh.erp.mail.controller;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.Random;
//
//import javax.inject.Inject;
//import javax.mail.internet.MimeMessage;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.MimeMessageHelper;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.kh.erp.member.model.service.MemberService;
//
//@Controller("EmailController")
//public class EmailController {
//
//	@Inject
//	JavaMailSender mailSender;
//	MemberService memberservice;
//	
//	@RequestMapping(value = "/member/auth.do", method = RequestMethod.POST)
//	public ModelAndView mailSending(HttpServletRequest request, String email, HttpServletResponse response_email) throws Exception {
//		
//		Random ran = new Random();
//		int check = ran.nextInt(20000) + 5926; //이메일 받는 인증코드 부분
//		
//		String setfrom = "관리자의 이메일";
//		String tomail = request.getParameter("e_mail"); //받는 사람 이메일
//		String title = "안녕하세요 'SMERP' 회원가입 인증이메일입니다. ";// 제목
//		String content = 
//	            
//	            System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
//	            
//	            System.getProperty("line.separator")+
//	                    
//	            "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
//	            
//	            +System.getProperty("line.separator")+
//	            
//	            System.getProperty("line.separator")+
//	    
//	            " 인증번호는 " + ran + " 입니다. "
//	            
//	            +System.getProperty("line.separator")+
//	            
//	            System.getProperty("line.separator")+
//	            
//	            "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용;
//			
//			try {
//				MimeMessage message = mailSender .createMimeMessage();
//				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
//				
//				messageHelper.setFrom(setfrom);
//				messageHelper.setTo(tomail);
//				messageHelper.setSubject(title);
//				messageHelper.setText(content);
//			
//				mailSender.send(message);;
//			}catch(Exception e) {
//				System.out.println(e);
//			}
//			
//			ModelAndView mv = new ModelAndView();
//			mv.setViewName(""); //뷰를 보내야하는 곳
//			mv.addObject("ran", ran);
//			
//			System.out.println("ran : " + ran);
//			
//			response_email.setContentType("text/html; charset=UTF-8");
//			PrintWriter out_email = response_email.getWriter();
//			out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
//			out_email.flush();
//			
//		return mv;
//	}
//	
//	@RequestMapping(value="/member/email.do")
//	public String email() {
//		return "member/email";
//	}
//
//	@RequestMapping(value = "/member/join_injeung.do{ran}", method = RequestMethod.POST)
//	public ModelAndView join_injeung(String email_injeung, @PathVariable String ran, HttpServletResponse response_equals) throws Exception {
//		
//		System.out.println("마지막 : email_injeung : " + email_injeung );
//		System.out.println("마지막 : ran : " + ran);
//		
//		ModelAndView mv = new ModelAndView();
//		
//		mv.setViewName("/member/join.do");
//		mv.addObject("e_mail", email_injeung);
//		
//		if(email_injeung.equals(ran)) {
//			
//			mv.setViewName("/member/join");
//			mv.addObject("e_mail", email_injeung);
//			
//			response_equals.setContentType("text.html; charset=UTF-8");
//			PrintWriter out_equals = response_equals.getWriter();
//			out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
//			out_equals.flush();
//			
//			return mv;
//		
//		}else if(email_injeung != ran) {
//			
//            ModelAndView mv2 = new ModelAndView(); 
//            
//            mv2.setViewName("member/email_injeung");
//            
//            response_equals.setContentType("text/html; charset=UTF-8");
//            PrintWriter out_equals = response_equals.getWriter();
//            out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
//            out_equals.flush();
//            
//            return mv2;
//			
//		}
//		
//		return mv;
//	}
//}
