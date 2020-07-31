package com.kh.erp.qboardComment.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.erp.qboardComment.model.vo.QBoardComment;
import com.kh.erp.qboardComment.model.service.QBoardCommentService;


@SessionAttributes(value= {"member"})
@Controller
public class QBoardCommentController {

	@Autowired
	QBoardCommentService qboardCommentService;
	
	@RequestMapping("/qboardComment/insertQBoardComment.do")
	public String insertQBoardComment(@RequestParam int qNo, @RequestParam int userNo, @RequestParam String qcontent, @RequestParam int refcno, QBoardComment qboardcomment, Model model) {
		
		int result = qboardCommentService.insertQBoardComment(qboardcomment);
		
		System.out.println("결과확인 : " + result);
		
		String loc = "/qboard/qboardView.do?no="+qNo;
		String msg = "";
		
		if( result > 0) {
			msg = "댓글이 등록되었습니다!!";
			
		} else {
			msg = "댓글이 등록되지 않았습니다 관리자에게 문의하세요!!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "/common/msg";
	}
//		"board/boardView";
		@RequestMapping("/qboardComment/qboardCommentDelete.do")
		public String qboardCommentDelete(@RequestParam int qNo, @RequestParam int qcno, HttpSession session, Model model) {
			
			int result = qboardCommentService.deleteQBoardComment(qcno);
			
			String loc = "/board/boardView.do?no="+qNo;
			String msg = "";
			
			if(result >0) {
				msg = "댓글 삭제 성공!!";
			}else {
				msg = "댓글 삭제 실패ㅠㅠ";
			}
			
			model.addAttribute("loc", loc).addAttribute("msg", msg);
			
			return "/common/msg";
		}
		
		@RequestMapping("/qboardComment/qboardCommentView.do")
		public String qboardCommentView(QBoardComment qboardcomment, Model model,
																		@RequestParam int no) {
			
			
			
			return "redirect:/qboard/qboardView.do";
		}
	}



