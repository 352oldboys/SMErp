package com.kh.erp.qboard.controller;

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

import com.kh.erp.qboard.model.exception.QBoardException;
import com.kh.erp.qboard.model.service.QBoardService;
import com.kh.erp.qboard.model.vo.QBoard;
import com.kh.erp.qboard.model.vo.QBoardFile;
import com.kh.erp.qboardComment.model.service.QBoardCommentService;
import com.kh.erp.qboardComment.model.vo.QBoardComment;
import com.kh.erp.common.util.Utils;


@Controller
public class QBoardController {
		
	@Autowired
	QBoardCommentService qboardCommentService;
	@Autowired
	QBoardService qboardService;
	
	@RequestMapping("/qboard/qboardList.do")
	public String selectQBoardList(
				@RequestParam(value="cPage", required=false, defaultValue="1")
				int cPage, Model model) {
		
		// 한 페이지 당 게시글 수
				int numPerPage = 10; // limit 역할
				
				// 1. 현재 페이지 게시글 목록 가져오기
				List<Map<String, String>> list
						= qboardService.selectQBoardList(cPage, numPerPage);
				
				// 2. 페이지 계산을 위한 총 패이지 갯수
				int totalContents = qboardService.selectQBoardTotalContents();
				
				// 3. 페이지 HTML 생성
				String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "qboardList.do");
				
				model.addAttribute("list", list)
					 .addAttribute("totalContents", totalContents)
					 .addAttribute("numPerPage", numPerPage)
					 .addAttribute("pageBar", pageBar);
				
				return "qboard/qboardList";		
	}
	
	@RequestMapping("/qboard/qboardForm.do")
	public void qboardForm() {
		
	
	}
		@RequestMapping("/qboard/qboardFormEnd.do")
		public String insertQBoard(QBoard qboard,  Model model, HttpSession session,
				@RequestParam(value="upFile", required = false) MultipartFile[] upFile) {
			
			String saveDir = session.getServletContext().getRealPath("/resources/upload/qboard");
			
			List<QBoardFile> fileList = new ArrayList<QBoardFile>();
			
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
					
					QBoardFile qf = new QBoardFile();
					qf.setOriginalFileName(originName);
					qf.setRenamedFileName(renamedName);
					
					fileList.add(qf);
				}
			}
				/***** MultipartHttpServletRequest/getFileNames를 이용한 파일 업로드 처리 로직  끝 *****/
				
				int result;
				
				try {
					
					result = qboardService.insertQBoard(qboard, fileList);
					
				} catch(Exception e) {
					
					throw new QBoardException("게시글 등록 오류!");
					
				}
				
				String loc = "/qboard/qboardList.do";
				String msg = "";
				
				if(result > 0) {
					msg = "게시글 등록 성공!";
					loc = "/qboard/qboardView.do?no="+qboard.getqNo();
					
				} else {
					msg = "게시글 등록 실패!";
				}
				
				model.addAttribute("loc", loc).addAttribute("msg", msg);
				
				return "common/msg";
				
			}
			@RequestMapping("/qboard/qboardView.do")
			public String selectOne(@RequestParam int no, Model model) {
				
				QBoard q = qboardService.selectOneQBoard(no);
				
				List<QBoardFile> list = qboardService.selectQBoardFileList(no);
				model.addAttribute("qboard", q)
				     .addAttribute("qboardfileList", list);
				
				List<QBoardComment> qclist = qboardCommentService.selectQBoardCommentList(no);
				 
				  model.addAttribute("qclist",qclist);
					
					return "qboard/qboardView";
			}
			@RequestMapping("/qboard/qboardUpdateView.do")
			public String qboardUpdateView(@RequestParam int qNo, Model model) {
				
				model.addAttribute("qboard", qboardService.selectOneQBoard(qNo))
				     .addAttribute("qboardfileList", qboardService.selectQBoardFileList(qNo));
				
				return "qboard/qboardUpdateView";
			}
			@RequestMapping("/qboard/qboardUpdate.do")
			public String qboardUpdate(QBoard qboard, 
					      @RequestParam(value="upFile", required=false) MultipartFile[] upFiles,
					      HttpSession session, Model model) {
				
				int qNo = qboard.getqNo();
				
				// 원본 게시글 내용 수정
				QBoard originBoard = qboardService.selectOneQBoard(qNo);
				
				originBoard.setqTitle(qboard.getqTitle());
				originBoard.setqContent(qboard.getqContent());
				
				// 1. 파일을 저장할 경로 생성
				String saveDir = session.getServletContext().getRealPath("/resources/upload/board");
				
				List<QBoardFile> fileList = qboardService.selectQBoardFileList(qNo);
				if(fileList == null) fileList = new ArrayList<QBoardFile>();
				
				// 2. 폴더 유무 확인 후 생성
				File dir = new File(saveDir);
				
				System.out.println("폴더가 있나요? " + dir.exists());
				
				if(dir.exists() == false) dir.mkdirs();
				
				// 3. 파일 업로드 시작 (MultipartFile 사용 시 )
				int idx = 0;
				for(MultipartFile f : upFiles) {
					QBoardFile qf = null;
					if(!f.isEmpty()) {
						// 원본 파일 삭제
						if(fileList.size() > idx) {
							boolean delelteFile = new File(saveDir+"/"+fileList.get(idx).getRenamedFileName()).delete();
						
							System.out.println("원본파일 삭제 여부 : " + delelteFile);
							
							qf = fileList.get(idx);
						} else {
							qf = new QBoardFile();
							qf.setqNo(qNo);
							
							fileList.add(qf);
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
						
						qf.setOriginalFileName(originName);
						qf.setRenamedFileName(renamedName);
						
						fileList.set(idx, qf);
					}
					
					idx++;
				}
				
				int result = qboardService.updateQBoard(qboard, fileList);
				String loc = "/qboard/qboardList.do";
				String msg = "";
				
				if(result > 0) {
					msg = "게시글 수정 성공!";
					
				} else {
					msg = "게시글 수정 실패!";
				}
				
				model.addAttribute("loc", loc).addAttribute("msg", msg);
				
				return "common/msg";
				
			}
			@RequestMapping("/qboard/qboardDelete.do")
			public String qboardDelete(@RequestParam int qNo, HttpSession session, Model model) {
				
				List<QBoardFile> delList = qboardService.selectQBoardFileList(qNo);
				String saveDir = session.getServletContext().getRealPath("/resources/upload/qboard");
				
				// 첨부 파일 삭제
				for(QBoardFile at : delList) new File(saveDir + "/" + at.getRenamedFileName()).delete();
				
				int result = qboardService.deleteQBoard(qNo);
				
				String loc = "/qboard/qboardList.do";
				String msg = "";
				
				if(result > 0) {
					msg = "게시글 삭제 성공!";
					
				} else {
					msg = "게시글 삭제 실패!";
				}
				
				model.addAttribute("loc", loc).addAttribute("msg", msg);
				
				return "common/msg";
				
				
			}
			@RequestMapping("/qboard/fileDelete.do")
			@ResponseBody
			public boolean fileDelete(@RequestParam int qfNo, @RequestParam String rName,
					                  HttpSession session) {
				
				String saveDir = session.getServletContext().getRealPath("/resources/upload/qboard");
				
				boolean check = qboardService.deleteFile(qfNo) != 0 ? true : false;
				
				if(check == true) {
					new File(saveDir + "/" + rName).delete();
				}
				
				return check;
			}
			@RequestMapping("/qboard/fileDownload.do")
			   public void fileDownload(@RequestParam String oName,
			                        						  @RequestParam String rName,
			                        						  HttpServletRequest request,
			                        						  HttpServletResponse response){
			      
			      //파일저장디렉토리
			      String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/qboard");   
			   
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
			               "qboardfile; filename=\"" + resFilename + "\"");

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
	
	
	
	
	
	