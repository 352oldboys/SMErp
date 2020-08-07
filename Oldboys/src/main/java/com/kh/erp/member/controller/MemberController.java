package com.kh.erp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.erp.finance.integrated.model.service.IntegrateService;
import com.kh.erp.finance.integrated.model.vo.Integrate;
import com.kh.erp.finance.integrated.model.vo.Total;
import com.kh.erp.finance.purchase.model.service.PurchaseService;
import com.kh.erp.finance.purchase.model.vo.Purchase;
import com.kh.erp.finance.sales.model.service.SalesService;
import com.kh.erp.finance.sales.model.vo.Sales;
import com.kh.erp.member.model.exception.MemberException;
import com.kh.erp.member.model.service.MemberService;
import com.kh.erp.member.model.vo.Member;

@SessionAttributes(value={"member", "mList"})
@Controller
public class MemberController {
	
	@Autowired
	private  MemberService memberService;
	
    @Inject    //서비스를 호출하기 위해서 의존성을 주입
    JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
    MemberService memberservice; //서비스 를 호출하기 위해 의존성을 주입
	
	/* ========================== */
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	SalesService salesService;
	
	@Autowired
	PurchaseService purchaseService;
	
	@Autowired
	IntegrateService integrateService;
	
	@RequestMapping("/member/backlogin.do")
	public String backlogin() {
		return "redirect:/";
	}
	
	@RequestMapping("/index.do")
	public String index(Model model, @RequestParam int userNo) {
		
		List<Purchase> pList = purchaseService.selectList(userNo);
		List<Sales> sList = salesService.selectSalList(userNo);
		List<Integrate> iList = integrateService.selectTotalList(userNo);
		List<Total> tList = integrateService.selectToList(userNo);
		System.out.println("i  : "+ iList);
		System.out.println("t : " + tList);
		
		
		model.addAttribute("pList", pList);
		model.addAttribute("sList", sList);		
		model.addAttribute("iList", iList);
		model.addAttribute("tList", tList);
		
		
		return "index";
	}
	
	@RequestMapping("/member/login.do")
	public String moveLogin() {
		return "login/loginForm";
	}
	@RequestMapping("/member/updateMember.do")
	public String memberUpdate(Member member) {
//		System.out.println(member);
		return "login/loginUpdate";
	}
	
	@RequestMapping("/member/insertMember.do")
	public String insetMember(
			@RequestParam(value="status", required=false, defaultValue="Y")
			String status, Member member, Model model) {
//		System.out.println("insertMember-member(centroller) : " + member);
//		System.out.println("insertMember-model(centroller) : " + model);
		
		String PlainPassword = member.getPassword();
//		System.out.println("비밀번호 암호화 전(centroller) : " + PlainPassword);
		
		String encryptPassword = bcryptPasswordEncoder.encode(PlainPassword);
//		System.out.println("비밀번호 암호화 후(centroller) : " + encryptPassword);
		
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
			@RequestParam String userId, @RequestParam String password ) {
	ModelAndView mav = new ModelAndView();
	
	try {
		
		Member m = memberService.selectOne(userId);
		
//		System.out.println("아이디 유효성 체크(centroller) : " + userId);
		
		List<Member> mList = memberService.selectListMember(userId);
		
		String msg="";
		String loc = "/finance/integrated.do?userNo=" + m.getUserNo();
		
		if(m == null) {
			msg = "로그인 실패 [ 존재하지 않은 아이디입니다. ]";
			loc = "/";
		}else {
			if(bcryptPasswordEncoder.matches(password,m.getPassword())) {
				msg = "로그인 성공";
				mav.addObject("member", m);
				mav.addObject("mList", mList);
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
		String msg="";
		if(!status.isComplete())
			status.setComplete();
		
		msg = "로그아웃되었습니다 오늘도 좋은 하루되세요!";
		
		return "redirect:/";
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
	
	/* ========================== email ========================== */
	
	// mailSending 코드
    @RequestMapping( value="/member/auth.do" , method=RequestMethod.POST )
    @ResponseBody
    public String mailSending(@RequestParam String email) {

        Random ran = new Random();
        int dice = ran.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "towijin2100@gamil.com";
        String tomail = email; // 받는 사람 이메일
        // System.out.println(">>>>>>>>>>>>>>>>>>>>>>> :" + tomail);
        String title = "회원가입 인증 이메일 입니다."; // 제목
        String content =
        		
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 인증번호는 " + dice + " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        ModelAndView mv = new ModelAndView();
        mv.addObject("dice" + dice);
        
        System.out.println("mv" + mv);
        
        return "mv";
    }
    
  //이메일 인증 페이지 맵핑 메소드
    @RequestMapping("/member/email.do")
    public String email() {
        return "member/email";
    }
    
    //이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
    //내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
    //틀리면 다시 원래 페이지로 돌아오는 메소드
    @RequestMapping(value = "/member/join_injeung.do{dice}", method = RequestMethod.POST)
    public ModelAndView join_injeung(@RequestParam String email_injeung, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
 
        System.out.println("마지막 : email_injeung : " + email_injeung);
        
        System.out.println("마지막 : dice : " + dice);
        
        //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
         
        ModelAndView mv = new ModelAndView();
        
        mv.setViewName("/member/join.do");
        
        mv.addObject("email",email_injeung);
            
            //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
        if (email_injeung.equals(dice)) {    
        
            mv.setViewName("/member/loginFrom");
            
            mv.addObject("email",email_injeung);
            
            //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
            //한번더 입력할 필요가 없게 한다.
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
            out_equals.flush();
    
            return mv;
         
        }else if (email_injeung != dice) {
        	
        	ModelAndView mv2 = new ModelAndView(); 
            
            mv2.setViewName("/member/email_injeung");
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
            out_equals.flush();
            
    
            return mv2;
        	
        }
        
        return mv;
    }
    
}
