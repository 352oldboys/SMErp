package com.kh.erp.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
import com.sun.java.swing.plaf.windows.resources.windows;

@SessionAttributes(value = { "member", "mList" })
@Controller
public class MemberController {

   private HashMap<String, Integer> diceMap = new HashMap();

   @Autowired
   private MemberService memberService;

   @Inject // 서비스를 호출하기 위해서 의존성을 주입
   JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성을 주입함.
   MemberService memberservice; // 서비스 를 호출하기 위해 의존성을 주입

   /* ========================== */

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
//      System.out.println(member);
      return "login/loginUpdate";
   }

   @RequestMapping("/member/insertMember.do")
   public String insetMember(@RequestParam(value = "status", required = false, defaultValue = "Y") String status,
         Member member, Model model) {
//      System.out.println("insertMember-member(centroller) : " + member);
//      System.out.println("insertMember-model(centroller) : " + model);

      String PlainPassword = member.getPassword();
//      System.out.println("비밀번호 암호화 전(centroller) : " + PlainPassword);

      String encryptPassword = bcryptPasswordEncoder.encode(PlainPassword);
//      System.out.println("비밀번호 암호화 후(centroller) : " + encryptPassword);

      member.setPassword(encryptPassword);
      member.setStatus(status);

      int result = memberService.insertMember(member);

      String loc = "/";
      String msg = "";

      if (result > 0)
         msg = "회원가입 성공";
      else
         msg = "회원가입 실패";

      model.addAttribute("loc", loc);
      model.addAttribute("msg", msg);

      return "common/msg";

   }

   @RequestMapping(value = "/member/checkMember.do", method = RequestMethod.POST)
   public ModelAndView Member(@RequestParam String userId, @RequestParam String password) {
      ModelAndView mav = new ModelAndView();

      try {
         Member m = memberService.selectOne(userId);
         System.out.println("아이디 유효성 체크(centroller) : " + userId);

         List<Member> mList = memberService.selectListMember(userId);

         String msg = "";
         String loc = "/index.do";

         if (m == null) {
            msg = "로그인 실패 [ 존재하지 않은 아이디입니다. ]";
            loc = "/";
         } else {
            if (bcryptPasswordEncoder.matches(password, m.getPassword())) {
               msg = "로그인 성공";
               mav.addObject("member", m);
               mav.addObject("mList", mList);
               System.out.println("m : " + m);
            } else {
               msg = "로그인 실패 [ 비밀번호가 틀렸습니다. ]";
               loc = "/";
            }
         }

         mav.addObject("loc", loc);
         mav.addObject("msg", msg);

         mav.setViewName("common/msg");
      } catch (Exception e) {
         throw new MemberException(e.getMessage());
      }

      return mav;

   }

   @RequestMapping("/member/checkIdDuplicate.do")
   @ResponseBody
   public Map<String, Object> responseBodyProcess(@RequestParam String userId) {
      Map<String, Object> map = new HashMap<String, Object>();
      boolean isUsable = memberService.checkIdDuplicate(userId) == 0 ? true : false;

      map.put("isUsable", isUsable);

      return map;
   }

   @RequestMapping("/member/memberLogout.do")
   public String MemberOut(SessionStatus status) {
      String msg = "";
      if (!status.isComplete())
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
//      System.out.println("update전 : " + member);
//      System.out.println("update전 : " + model);

      String PlainPassword = member.getPassword();
//      System.out.println("update-비밀번호 암호화 전 : " + PlainPassword);

      String encryptPassword = bcryptPasswordEncoder.encode(PlainPassword);
      System.out.println("update-비밀번호 암호화 후 : " + encryptPassword);

      member.setPassword(encryptPassword);
//      System.out.println("update후 : " + member);
//      System.out.println("update후 : " + model);

      int result = memberService.updateMember(member);

      String loc = "/";
      String msg = "";

      if (result > 0) {
         msg = "회원정보 수정 성공";

      } else {
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
         // System.out.println("result : " + result);

         if (result > 0)
            status.setComplete();

         String loc = "/";
         String msg = "";

         if (result > 0) {
            msg = "회원 탈퇴 성공!";

         } else {
            msg = "회원탈퇴 실패!";
            loc = "/member/deleteMember.do";
         }

         model.addAttribute("loc", loc);
         model.addAttribute("msg", msg);

      } catch (Exception e) {
         throw new MemberException(e.getMessage());
      }
      return "common/msg";
   }

   // Id 중복체크
   @RequestMapping("/member/idCheck.do")
   @ResponseBody
   public Map<String, Object> idCheck(@RequestParam String userId) {
      int result = 0;
      System.out.println("userId controller : " + userId);

      Map<String, Object> map = new HashMap<String, Object>();
      // System.out.println("controller map before :" + map); -> 값이 안들어가는게 정상

      result = memberService.idCheck(userId);
      map.put("result", result);
      System.out.println("controller result after : " + result);

      return map;
   }

   /* ========================== email ========================== */

   // 이메일로 아이디 & 비밀번호 찾기 팝업창으로 넘어가게 하는 곳
   @RequestMapping("/member/find.do")
   public String find() {

      return "login/popup";
   }

   // mailSending 코드
   @RequestMapping(value = "/member/auth.do", method = RequestMethod.POST)
   @ResponseBody
   public String mailSending(@RequestParam String email, HttpSession session) {

      Random ran = new Random();
      int dice = 0;
      dice = ran.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

      diceMap.put(email, dice);

      String setfrom = "towijin2100@gamil.com";
      String tomail = email; // 받는 사람 이메일
      // System.out.println(">>>>>>>>>>>>>>>>>>>>>>> :" + tomail);
      String title = "'SEMER' 회원가입 인증 이메일 입니다."; // 제목
      String content =

            System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

                  System.getProperty("line.separator") +

                  "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

                  + System.getProperty("line.separator") +

                  System.getProperty("line.separator") +

                  " 인증코드는 " + dice + " 입니다. "

                  + System.getProperty("line.separator") +

                  System.getProperty("line.separator") +

                  "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용

      try {
         MimeMessage message = mailSender.createMimeMessage();
         MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

         messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
         messageHelper.setTo(tomail); // 받는사람 이메일
         messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
         messageHelper.setText(content); // 메일 내용

         mailSender.send(message);
      } catch (Exception e) {
         System.out.println(e);
      }

      return "mv";
   }

   // 이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
   // 내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
   // 틀리면 다시 원래 페이지로 돌아오는 메소드
   @RequestMapping(value = "/member/join_injeung.do", method = RequestMethod.POST)
   @ResponseBody
   public Map<String, Object> join_injeung(@RequestParam int email_injeung, @RequestParam String email,
         HttpServletResponse response_equals) throws IOException {

      System.out.println("마지막 : email_injeung : " + email_injeung);

      System.out.println("마지막 : dice : " + diceMap.get(email));

      // 페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음

      Map<String, Object> map = new HashMap<String, Object>();

      map.put("email", email_injeung);

      // 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
      if (email_injeung == diceMap.get(email)) {

         map.put("succ", true);

         // 만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
         // 한번더 입력할 필요가 없게 한다.
         map.put("msg", "인증번호가 일치하였습니다. 회원가입창으로 이동합니다.");

         return map;

      } else {
         map.put("succ", false);

         map.put("msg", "인증번호가 일치하지 않습니다. 결과를 다시 확인해 보세요.");

         return map;

      }
   }

   // 이메일 아이디 인증
   @RequestMapping(value="/member/popup_id.do", method = RequestMethod.POST)
   public String popupIdFind(HttpServletRequest request, HttpServletResponse response, @RequestParam String name,
         @RequestParam String email, Member m, Model model) {
      System.out.println("controller Name : " + name);
      System.out.println("controller email : " + email);
      System.out.println("controller m : " + m);
      System.out.println("controller model : " + model);
      
      m = memberService.selectIdFind(name);

      System.out.println("pMember : " + m);

      String loc = "";
      String msg = "";
      int dice = 0;
      
      if(m != null) {
//         ======   ======   //
         
               Random ran = new Random();
               
               dice = ran.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

               diceMap.put(email, dice);

               String setfrom = "towijin2100@gamil.com";
               String tomail = email; // 받는 사람 이메일
               // System.out.println(">>>>>>>>>>>>>>>>>>>>>>> :" + tomail);
               String title = "'SEMER' 아이디 찾기 인증 이메일 입니다."; // 제목
               String content =

                     System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

                           System.getProperty("line.separator") +

                           "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

                           + System.getProperty("line.separator") +

                           System.getProperty("line.separator") +

                           " 인증코드는 " + dice + " 입니다. "

                           + System.getProperty("line.separator") +

                           System.getProperty("line.separator") +

                           "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용

               try {
                  MimeMessage message = mailSender.createMimeMessage();
                  MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

                  messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
                  messageHelper.setTo(tomail); // 받는사람 이메일
                  messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
                  messageHelper.setText(content); // 메일 내용

                  mailSender.send(message);
               } catch (Exception e) {
                  System.out.println(e);
               }
               
               //  ======   ======   //
               
               // 비밀번호 변경되지않음
               msg = "이메일이 전송되었습니다.";

               loc = "/member/checkIdFindgo.do";
            } else {

               msg = "회원정보가 없습니다.";

            }

            model.addAttribute("loc", loc).addAttribute("msg", msg).addAttribute("member", m)
                  .addAttribute("dice", dice);
      
      return "redirect:/member/checkIdFindgo.do";
      
      /* 이렇게 하면 안되는 이유 : 똑같은 이름이 있을 수도 있기 때문에
       * int result = memberService.deleteMember(m.getName(), m.getEmail());
       * 
       * String loc = ""; String msg = "";
       * 
       * if (result > 1) { msg = "해당 이메일로 사용자의 이메일을 보냈습니다."; loc = "";
       * 
       * } else { msg = "해당 사용자의 이메일이 없습니다. 다시 입력해주세요.";
       * 
       * }
       * 
       * model.addAttribute("loc", loc); model.addAttribute("msg", msg);
       * 
       * return "/login/checkIdFind";
       */
   }
   
   @RequestMapping("/member/checkIdFindgo.do")
   public String sendIdFind(@RequestParam int dice, Model model) {
      
      System.out.println("idFindDice : " + dice);
      
      model.addAttribute("dice", dice);
      
      return "/login/checkIdFind";
   }
   /*
    * @RequestMapping("/member/idFind.do") public String idFind(@RequestParam
    * String name, @RequestParam String email, Model model, HttpServletRequest req)
    * {
    *
    * if(? == true) { System.out.println("인증이 성공하였습니다");
    * 
    * 
    * } else { System.out.println("인증이 실패되었습니다.");
    * alert("인증이 실패되었습니다. /b 확인후 다시 입력하세요"); }
    * 
    * return "null"; }
    */

   @RequestMapping(value = "/member/popup_password.do", method = RequestMethod.POST)
   public String passwordFind(HttpServletRequest request, HttpServletResponse response, @RequestParam String userId,
         @RequestParam String email, Member m, Model model) {

      // Map<String,Object> hm = new HashMap<String,Object>();

      System.out.println("userId : " + userId);
      System.out.println("email : " + email);

      m = memberService.selectPasswordFind(userId);

      System.out.println("pMember : " + m);

      String loc = "";
      String msg = "";
      int dice = 0;

      if (m != null) {
         //   ======   ======   //
         
         Random ran = new Random();
         
         dice = ran.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

         System.out.println("dice : " + dice);
         
         diceMap.put(email, dice);

         String setfrom = "towijin2100@gamil.com";
         String tomail = email; // 받는 사람 이메일
         // System.out.println(">>>>>>>>>>>>>>>>>>>>>>> :" + tomail);
         String title = "'SEMER' 비밀번호 찾기 인증 이메일 입니다."; // 제목
         String content =

               System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

                     System.getProperty("line.separator") +

                     "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"

                     + System.getProperty("line.separator") +

                     System.getProperty("line.separator") +

                     " 인증코드는 " + dice + " 입니다. "

                     + System.getProperty("line.separator") +

                     System.getProperty("line.separator") +

                     "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용

         try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용

            mailSender.send(message);
         } catch (Exception e) {
            System.out.println(e);
         }
         
         //  ======   ======   //
         
         // 비밀번호 변경되지않음
         msg = "이메일이 전송되었습니다.";

         loc = "/login/checkPasswordFindGo.do";
      } else {

         msg = "회원정보가 없습니다.";

      }

      model.addAttribute("loc", loc).addAttribute("msg", msg).addAttribute("member", m)
            .addAttribute("dice", dice);

      return "redirect:/login/checkPasswordFindGo.do";
   }

   @RequestMapping("/login/checkPasswordFindGo.do")
   public String checkPasswordFindGo(Member m, Model model, @RequestParam int dice) {
      
      System.out.println("find_go_dice : " + dice);
      
      model.addAttribute("dice", dice);
      
      return "login/checkPasswordFind";
   }
    
   @RequestMapping("/member/checkPasswordFind.do")
   public String checkPasswordFind(Member m, Model model) {

      System.out.println("password M : " + m); // -> Member 값 확인 완료

      System.out.println("check-비밀번호 암호화 전 : " + m);

      String PlainPassword = m.getPassword();
      System.out.println("check-비밀번호 암호화 전 : " + PlainPassword);

      String encryptPassword = bcryptPasswordEncoder.encode(PlainPassword);
      System.out.println("check-비밀번호 암호화 후 : " + encryptPassword);

      m.setPassword(encryptPassword);
      System.out.println("update후 : " + m);
      System.out.println("update후 : " + model);

      int result = memberService.updatePassword(m);

      String loc = "/";
      String msg = "";

      if (result > 0) {
         msg = "회원정보 수정 성공"; 
         
      } else {
         msg = "회원 정보 수정 실패";
      }

      model.addAttribute("loc", loc);
      model.addAttribute("msg", msg);

      return "common/msg";
   }

}