package com.kh.erp.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.erp.member.model.exception.MemberException;
import com.kh.erp.member.model.service.MemberService;
import com.kh.erp.member.model.vo.Member;

@SessionAttributes(value={"member"})
@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/member/backlogin.do")
	public String backlogin() {
		return "redirect:/";
	}
	
	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/member/login.do")
	public String moveLogin() {
		return "login/loginForm";
	}
	@RequestMapping("/member/updateMember.do")
	public String memberUpdate(Member member) {
		System.out.println(member);
		return "login/loginUpdate";
	}
	
	@RequestMapping("/member/insertMember.do")
	public String insetMember(
			@RequestParam(value="status", required=false, defaultValue="Y")
			String status, Member member, Model model) {
//		System.out.println("insertMember-member : " + member);
//		System.out.println("insertMember-model : " + model);
		
		String PlainPassword = member.getPassword();
//		System.out.println("비밀번호 암호화 전 : " + PlainPassword);
		
		String encryptPassword = bcryptPasswordEncoder.encode(PlainPassword);
//		System.out.println("비밀번호 암호화 후 : " + encryptPassword);
		
		member.setPassword(encryptPassword);
		member.setStatus(status);
		
		int result = memberService.insertMember(member);
		
		String loc = "/";
		String msg = "";
		
		if(result > 0) msg = "회원가입 성공";
		else msg = "회원가입 실패";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	@RequestMapping(value="/member/checkMember.do", method=RequestMethod.POST)
	public ModelAndView Member(
			@RequestParam String userId, @RequestParam String password) {
	ModelAndView mav = new ModelAndView();
	
	try {
		Member m = memberService.selectOne(userId);
		System.out.println("selectOne userId : " + userId);
		
		String msg="";
		String loc = "/index.do";
		
		if(m == null) {
			msg = "로그인 실패 [ 존재하지 않은 아이디입니다. ]";
			loc = "/";
		}else {
			if(bcryptPasswordEncoder.matches(password,m.getPassword())) {
				msg = "로그인 성공";
				mav.addObject("member", m);
				System.out.println("m : " + m);
			}else{
				msg = "로그인 실패 [ 비밀번호가 틀렸습니다. ]";
				loc = "/";
			}
		}
		
		mav.addObject("loc", loc);
		mav.addObject("msg", msg);
		
		mav.setViewName("common/msg");
		}catch(Exception e) {
			throw new MemberException(e.getMessage());	
	    }
	
	return mav;
	
	}
	
	@RequestMapping("/member/checkIdDuplicate.do")
	@ResponseBody
	public Map<String, Object> responseBodyProcess(@RequestParam String userId){
		Map<String, Object>map = new HashMap<String, Object>();
		boolean isUsable = memberService.checkIdDuplicate(userId) == 0 ? true : false;
		
		map.put("isUsable", isUsable);
		
		return map;
	}
	
	@RequestMapping("/member/memberLogout.do")
	public String MemberOut(SessionStatus status) {
		if(!status.isComplete())
			status.setComplete();
		
		return "/";
	}
	
	@RequestMapping("/member/memberView.do")
	public String loginView(@RequestParam String userId, Model model) {      
	     model.addAttribute("member", memberService.selectOne(userId));
	      
	     return "redirect:/views/index";
	}
	
	@RequestMapping("/member/memberUpdate.do")
	public String updateMember(Member member, Model model) {
//		System.out.println("update전 : " + member);
//		System.out.println("update전 : " + model);
		
		String PlainPassword = member.getPassword();
//		System.out.println("update-비밀번호 암호화 전 : " + PlainPassword);
		
		String encryptPassword = bcryptPasswordEncoder.encode(PlainPassword);
//		System.out.println("update-비밀번호 암호화 후 : " + encryptPassword);
		
		member.setPassword(encryptPassword);
//		System.out.println("update후 : " + member);
//		System.out.println("update후 : " + model);

		int result = memberService.updateMember(member);
		
		String loc = "/";
		String msg = "";
		
		if(result>0) {
			msg = "회원정보 수정 성공";
			
		}else {
			msg = "회원 정보 수정 실패";
			loc = "/member/updateMember.do";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";
	}
	
	@RequestMapping("/member/memberDelete.do")
	public String deleteMember(SessionStatus status, Model model, Member member) throws Exception {
		try {
			int result = memberService.deleteMember(member.getUserId());
			//System.out.println("result : " + result);
			
			if(result > 0) status.setComplete();
			
			String loc= "/";
			String msg= "";
			
			if(result > 0) {msg = "회원 탈퇴 성공!";
			
			}else {
				msg = "회원탈퇴 실패!";
				loc = "/member/deleteMember.do";
			}
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
			
		}catch(Exception e){
			throw new MemberException(e.getMessage());	
		}
		return "common/msg";
	}
	
}
