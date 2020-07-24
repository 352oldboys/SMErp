package com.kh.erp.board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.erp.board.model.exception.BoardException;
import com.kh.erp.board.model.service.BoardService;
import com.kh.erp.board.model.vo.BoardFile;
import com.kh.erp.board.model.vo.Board;
import com.kh.erp.common.util.Utils;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/board/boardList.do")
	public String selectBoardList(
				@RequestParam(value="cPage", required=false, defaultValue="1")
				int cPage, Model model) {
		
		// 한 페이지 당 게시글 수
		int numPerPage = 10; // limit 역할
		
		// 1. 현재 페이지 게시글 목록 가져오기
		List<Map<String, String>> list
				= boardService.selectBoardList(cPage, numPerPage);
		
		// 2. 페이지 계산을 위한 총 패이지 갯수
		int totalContents = boardService.selectBoardTotalContents();
		
		// 3. 페이지 HTML 생성
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "boardList.do");
		
		model.addAttribute("list", list)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", numPerPage)
			 .addAttribute("pageBar", pageBar);
		
		return "board/boardList";		
	}
	
	@RequestMapping("/board/boardForm.do")
	public void boardForm() {

	}
	
	@RequestMapping("/board/boardFormEnd.do")
	public String insertBoard(Board board,  Model model, HttpSession session,
			@RequestParam(value="upFile", required = false) MultipartFile[] upFile) {
		
		String saveDir = session.getServletContext().getRealPath("/resources/upload/board");
		
		List<BoardFile> fileList = new ArrayList<BoardFile>();
		
		File dir = new File(saveDir);
		
		System.out.println("폴더가 있나요? " + dir.exists());
		
		if(dir.exists() == false) dir.mkdirs();
		
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
		
				String originName = f.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf(".")+1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
				
				int rndNum = (int)(Math.random() * 1000);
				
				String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
				
				try {
					f.transferTo(new File(saveDir + "/" + renamedName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				BoardFile bf = new BoardFile();
				bf.setOriginalFileName(originName);
				bf.setRenamedFileName(renamedName);
				
				fileList.add(bf);
			}
		}
		
	    /***** MultipartHttpServletRequest/getFileNames를 이용한 파일 업로드 처리 로직  끝 *****/
		
		int result;
		
		try {
			
			result = boardService.insertBoard(board, fileList);
			
		} catch(Exception e) {
			
			throw new BoardException("게시글 등록 오류!");
			
		}
		
		String loc = "/board/boardList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 등록 성공!";
			loc = "/board/boardView.do?no="+board.getbNo();
			
		} else {
			msg = "게시글 등록 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/board/boardView.do")
	public String selectOne(@RequestParam int no, Model model) {
		Board b = boardService.selectOneBoard(no);
		
		List<BoardFile> list = boardService.selectBoardFileList(no);
		
		model.addAttribute("board", b)
		     .addAttribute("boardfileList", list);
		
		return "board/boardView";
	}
	
	@RequestMapping("/board/boardUpdateView.do")
	public String boardUpdateView(@RequestParam int bNo, Model model) {
		
		model.addAttribute("board", boardService.selectOneBoard(bNo))
		     .addAttribute("boardfileList", boardService.selectBoardFileList(bNo));
		
		return "board/boardUpdateView";
	}

	@RequestMapping("/board/boardUpdate.do")
	public String boardUpdate(Board board, 
			      @RequestParam(value="upFile", required=false) MultipartFile[] upFiles,
			      HttpSession session, Model model) {
		
		int bNo = board.getbNo();
		
		// 원본 게시글 내용 수정
		Board originBoard = boardService.selectOneBoard(bNo);
		
		originBoard.setbTitle(board.getbTitle());
		originBoard.setbContent(board.getbContent());
		
		// 1. 파일을 저장할 경로 생성
		String saveDir = session.getServletContext().getRealPath("/resources/upload/board");
		
		List<BoardFile> fileList = boardService.selectBoardFileList(bNo);
		if(fileList == null) fileList = new ArrayList<BoardFile>();
		
		// 2. 폴더 유무 확인 후 생성
		File dir = new File(saveDir);
		
		System.out.println("폴더가 있나요? " + dir.exists());
		
		if(dir.exists() == false) dir.mkdirs();
		
		// 3. 파일 업로드 시작 (MultipartFile 사용 시 )
		int idx = 0;
		for(MultipartFile f : upFiles) {
			BoardFile bf = null;
			if(!f.isEmpty()) {
				// 원본 파일 삭제
				if(fileList.size() > idx) {
					boolean delelteFile = new File(saveDir+"/"+fileList.get(idx).getRenamedFileName()).delete();
				
					System.out.println("원본파일 삭제 여부 : " + delelteFile);
					
					bf = fileList.get(idx);
				} else {
					bf = new BoardFile();
					bf.setbNo(bNo);
					
					fileList.add(bf);
				}
				// 원본 이름 가져오기
				String originName = f.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf(".")+1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
				
				int rndNum = (int)(Math.random() * 1000);
				
				// 서버에서 저장 후 관리할 파일 명
				String renamedName = sdf.format(new Date()) + "_" + rndNum + "." + ext;
				
				// 실제 파일을 지정한 파일명으로 변환하며 데이터를 저장한다.
				try {
					f.transferTo(new File(saveDir + "/" + renamedName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				bf.setOriginalFileName(originName);
				bf.setRenamedFileName(renamedName);
				
				fileList.set(idx, bf);
			}
			
			idx++;
		}
		
		int result = boardService.updateBoard(board, fileList);
		String loc = "/board/boardList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 수정 성공!";
			
		} else {
			msg = "게시글 수정 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
		
	}
	
	@RequestMapping("/board/boardDelete.do")
	public String boardDelete(@RequestParam int bNo, HttpSession session, Model model) {
		
		List<BoardFile> delList = boardService.selectBoardFileList(bNo);
		String saveDir = session.getServletContext().getRealPath("/resources/upload/board");
		
		// 첨부 파일 삭제
		for(BoardFile at : delList) new File(saveDir + "/" + at.getRenamedFileName()).delete();
		
		int result = boardService.deleteBoard(bNo);
		
		String loc = "/board/boardList.do";
		String msg = "";
		
		if(result > 0) {
			msg = "게시글 삭제 성공!";
			
		} else {
			msg = "게시글 삭제 실패!";
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "common/msg";
		
		
	}
	
	@RequestMapping("/board/fileDelete.do")
	@ResponseBody
	public boolean fileDelete(@RequestParam int bfNo, @RequestParam String rName,
			                  HttpSession session) {
		
		String saveDir = session.getServletContext().getRealPath("/resources/upload/board");
		
		boolean check = boardService.deleteFile(bfNo) != 0 ? true : false;
		
		if(check == true) {
			new File(saveDir + "/" + rName).delete();
		}
		
		return check;
	}
	
	// HTML5 기준 특정 url만 있으면 태그의 download 속성으로
	// 파일을 다운로드 받는 것이 가능하다
	// 하지만, HTML5가 아닌 문서도 호환이 가능해야 하기 때문에,
	// download 기능을 직접 구현하는 경우도 발생하낟.
	// 따라서, 직접IO스트림을 통해 파일을 다운로드하는 로직도 학습해보자!
	@RequestMapping("/board/fileDownload.do")
	   public void fileDownload(@RequestParam String oName,
	                        						  @RequestParam String rName,
	                        						  HttpServletRequest request,
	                        						  HttpServletResponse response){
	      
	      //파일저장디렉토리
	      String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/board");   
	   
	      BufferedInputStream bis = null;
	      ServletOutputStream sos = null;
	          
	      try {
	         sos = response.getOutputStream();
	         File savedFile = new File(saveDirectory + "/" + rName);
	         response.setContentType("application/octet-stream; charset=utf-8");

	         // 한글 파일 명 처리 : 브라우져에 따른 인코딩 처리 선택
	         String resFilename = "";
	         boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1 
	                    || request.getHeader("user-agent").indexOf("Trident") != -1;
	         System.out.println("isMSIE="+isMSIE);
	         if(isMSIE){
	            // ie는 utf-8 인코딩을 명시적으로 선언 해줘야 한다. 
	            // 또한 공백을 의미하는 ' '기호가 +로 변하기 때문에, 이를 %20로 치환해준다.
	            // 그럼 진짜 '+'기호는...?? ==> '+'기호는 그에 맞는 유니코드로 치환되기 때문에 상관 X
	            resFilename = URLEncoder.encode(oName, "UTF-8");
	            System.out.println("ie : "+resFilename);//ie : %eb%82%98%eb%8a%94+%ec%a0%84%ec%84%a4%ec%9d%b4%eb%8b%a4.txt
	                           
	            resFilename = resFilename.replaceAll("\\+", "%20");
	            System.out.println("ie : "+resFilename);//ie : %eb%82%98%eb%8a%94%20%ec%a0%84%ec%84%a4%ec%9d%b4%eb%8b%a4.txt
	         } else {
	            // 다른 웹 브라우저 중 ISO-8859-1(EUC-KR)로 되어 있는 경우 인코딩 진행
	            resFilename = new String(oName.getBytes("UTF-8"),"ISO-8859-1");
	            System.out.println("not ie : "+resFilename);
	            
	         }
	         response.addHeader("Content-Disposition",
	               "boardfile; filename=\"" + resFilename + "\"");

	         //파일크기지정
	         response.setContentLength((int)savedFile.length());

	         FileInputStream fis = new FileInputStream(savedFile);
	         bis = new BufferedInputStream(fis);
	         int read = 0;

	         while ((read = bis.read()) != -1) {
	            sos.write(read);
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         
	         try {
	            sos.close();
	            bis.close();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	         
	      }

	   }
	
}

