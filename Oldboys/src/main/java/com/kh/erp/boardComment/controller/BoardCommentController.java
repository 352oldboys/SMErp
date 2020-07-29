package com.kh.erp.boardComment.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.erp.board.model.vo.BoardFile;
import com.kh.erp.boardComment.model.service.BoardCommentService;
import com.kh.erp.boardComment.model.vo.BoardComment;

@SessionAttributes(value= {"member"})
@Controller
public class BoardCommentController {
	
	@Autowired
	BoardCommentService boardCommentService;
	
	@RequestMapping("/boardComment/insertBoardComment.do")
	public String insertBoardComment(@RequestParam int bNo, @RequestParam int userNo, @RequestParam String ccontent, @RequestParam int refcno, BoardComment boardcomment, Model model) {
		System.out.println("/boardComment/boardComment.do가 호출되었습니다.");
		System.out.println("넘어온 bNo의 값은 : "+bNo+" userNo : "+userNo);
		System.out.println("넘어온 ccontent의 값은 : "+ccontent);
		System.out.println("boardComment 확인 : "+boardcomment);
		System.out.println("refcno :" + refcno);

		int result = boardCommentService.insertBoardComment(boardcomment);
		
		System.out.println("결과확인 : " + result);
		
	
		/*
		 * List<BoardComment> bclist = boardCommentService.selectBoardCommentList(bNo);
		 * 
		 * model.addAttribute("bclist",bclist);
		 * 
		 * 
		 * System.out.println(bclist);
		 */
		 
		
		String loc = "/board/boardView.do?no="+bNo;
		String msg = "";
		
		if( result > 0) {
			msg = "댓글이 등록되었습니다!!";
			
		} else {
			msg = "댓글이 등록되지 않았습니다 관리자에게 문의하세요!!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "/common/msg";
//		"board/boardView";
	}
	
	
	@RequestMapping("/boardComment/boardCommentDelete.do")
	public String boardCommentDelete(@RequestParam int bNo, @RequestParam int cno, HttpSession session, Model model) {
		System.out.println("boardCommentDelete.do로 진입 성공");
		System.out.println("bNo : "+bNo+" cno : "+cno);
		
		int result = boardCommentService.deleteBoardComment(cno);
		
		String loc = "/board/boardView.do?no="+bNo;
		String msg = "";
		
		if(result >0) {
			msg = "댓글 삭제 성공!!";
		}else {
			msg = "댓글 삭제 실패ㅠㅠ";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "/common/msg";
	}
	
	@RequestMapping("/boardComment/boardCommentView.do")
	public String boardCommentView(BoardComment boardcomment, Model model,
																	@RequestParam int no) {
		
		
		
		return "redirect:/board/boardView.do";
	}
}
