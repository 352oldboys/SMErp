package com.kh.erp.notice.controller;

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

import com.kh.erp.common.util.Utils;
import com.kh.erp.notice.model.service.NoticeService;
import com.kh.erp.notice.model.exception.NoticeException;
import com.kh.erp.notice.model.vo.Attachment;
import com.kh.erp.notice.model.vo.Notice;


@Controller
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/notice/noticeList")
	public String selectBoardList(
			@RequestParam(value="cPage", required=false, defaultValue="1")
			int cPage, Model model) {
		
		// 한 페이지 당 게시글 수
				int numPerPage = 10; // limit 역할
				
				
				// 1. 현재 페이지 게시글 목록 가져오기
				List<Map<String, String>> list
						= noticeService.selectNoticeList(cPage, numPerPage);
				
				// 2. 페이지 계산을 위한 총 패이지 갯수
				int totalContents = noticeService.selectNoticeTotalContents();
				
				// 3. 페이지 HTML 생성
				String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "noticeList.do");
				
				model.addAttribute("list", list)
					 .addAttribute("totalContents", totalContents)
					 .addAttribute("numPerPage", numPerPage)
					 .addAttribute("pageBar", pageBar);
				
				return "notice/noticeList";		
			}
			
			@RequestMapping("/notice/noticeForm.do")
			public void noticeForm() {
				// view 이름이 지정되지 않았을 경우,
				// viewNameTranslator 객체가 url의 경로를 통해,
				// view가 받을 이름을 유추하여 지어낸다.
				// /board/boardForm.do --> /board/boardForm.jsp
				// 간편하지만, 실제 개발 시에는 명확한 값전달이
				// 우선시 되기 때문에 권장하지는 않는다.
				// return "board/boardForm";
			}
			
			@RequestMapping("/notice/noticeFormEnd.do")
			public String insertNotice(Notice notice,  Model model, HttpSession session,
					@RequestParam(value="upFile", required = false) MultipartFile[] upFile) {
				
				// 1. 파일을 저장할 경로 생성
				String saveDir = session.getServletContext().getRealPath("/resources/nupload/notice");
				
				List<Attachment> attachList = new ArrayList<Attachment>();
				
				// 2. 폴더 유무 확인 후 생성
				File dir = new File(saveDir);
				
				System.out.println("폴더가 있나요? " + dir.exists());
				
				if(dir.exists() == false) dir.mkdirs();
				
				// 3. 파일 업로드 시작 (MultipartFile 사용 시 )
				for(MultipartFile f : upFile) {
					if(!f.isEmpty()) {
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
						
						Attachment at = new Attachment();
						at.setOriginalFileName(originName);
						at.setRenamedFileName(renamedName);
						
						attachList.add(at);
					}
				}
				
				int result;
				
				try {
					
					result = noticeService.insertNotice(notice, attachList);
					
				} catch(Exception e) {
					
					throw new NoticeException("게시글 등록 오류!");
					
				}
				
				String loc = "/notice/noticeList.do";
				String msg = "";
				
				if(result > 0) {
					msg = "게시글 등록 성공!";
					loc = "/notice/noticeView.do?no="+notice.getnNo();
					
				} else {
					msg = "게시글 등록 실패!";
				}
				
				model.addAttribute("loc", loc).addAttribute("msg", msg);
				
				return "common/msg";
			}
			
			@RequestMapping("/notice/noticeView.do")
			public String selectOne(@RequestParam int no, Model model) {
				Notice n = noticeService.selectOneNotice(no);
				
				List<Attachment> list = noticeService.selectAttachmentList(no);
				
				model.addAttribute("notice", n)
				     .addAttribute("attachmentList", list);
				
				return "notice/noticeView";
			}
			
			@RequestMapping("/notice/noticeUpdateView.do")
			public String boardUpdateView(@RequestParam int nNo, Model model) {
				
				model.addAttribute("notice", noticeService.selectOneNotice(nNo))
				     .addAttribute("attachmentList", noticeService.selectAttachmentList(nNo));
				
				return "notice/noticeUpdateView";
			}

			@RequestMapping("/notice/noticeUpdate.do")
			public String boardUpdate(Notice notice, 
					      @RequestParam(value="upFile", required=false) MultipartFile[] upFiles,
					      HttpSession session, Model model) {
				
				int nNo = notice.getnNo();
				
				// 원본 게시글 내용 수정
				Notice originBoard = noticeService.selectOneNotice(nNo);
				
				originBoard.setnTitle(notice.getnTitle());
				originBoard.setnContent(notice.getnContent());
				
				// 1. 파일을 저장할 경로 생성
				String saveDir = session.getServletContext().getRealPath("/resources/nupload/notice");
				
				List<Attachment> attachList = noticeService.selectAttachmentList(nNo);
				if(attachList == null) attachList = new ArrayList<Attachment>();
				
				// 2. 폴더 유무 확인 후 생성
				File dir = new File(saveDir);
				
				System.out.println("폴더가 있나요? " + dir.exists());
				
				if(dir.exists() == false) dir.mkdirs();
				
				// 3. 파일 업로드 시작 (MultipartFile 사용 시 )
				int idx = 0;
				for(MultipartFile f : upFiles) {
					Attachment at = null;
					if(!f.isEmpty()) {
						// 원본 파일 삭제
						if(attachList.size() > idx) {
							boolean delelteFile = new File(saveDir+"/"+attachList.get(idx).getRenamedFileName()).delete();
						
							System.out.println("원본파일 삭제 여부 : " + delelteFile);
							
							at = attachList.get(idx);
						} else {
							at = new Attachment();
							at.setnNo(nNo);
							
							attachList.add(at);
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
						
						at.setOriginalFileName(originName);
						at.setRenamedFileName(renamedName);
						
						attachList.set(idx, at);
					}
					
					idx++;
				}
				
				int result = noticeService.updateNotice(notice, attachList);
				String loc = "/notice/noticeList.do";
				String msg = "";
				
				if(result > 0) {
					msg = "게시글 수정 성공!";
					
				} else {
					msg = "게시글 수정 실패!";
				}
				
				model.addAttribute("loc", loc).addAttribute("msg", msg);
				
				return "common/msg";
				
			}
			
			@RequestMapping("/notice/noticeDelete.do")
			public String noticeDelete(@RequestParam int nNo, HttpSession session, Model model) {
				
				List<Attachment> delList = noticeService.selectAttachmentList(nNo);
				String saveDir = session.getServletContext().getRealPath("/resources/nupload/notice");
				
				// 첨부 파일 삭제
				for(Attachment at : delList) new File(saveDir + "/" + at.getRenamedFileName()).delete();
				
				int result = noticeService.deleteNotice(nNo);
				
				String loc = "/notice/noticeList.do";
				String msg = "";
				
				if(result > 0) {
					msg = "게시글 삭제 성공!";
					
				} else {
					msg = "게시글 삭제 실패!";
				}
				
				model.addAttribute("loc", loc).addAttribute("msg", msg);
				
				return "common/msg";
				
			}
			
			@RequestMapping("/notice/fileDelete.do")
			@ResponseBody
			public boolean fileDelete(@RequestParam int attNo, @RequestParam String rName,
					                  HttpSession session) {
				
				String saveDir = session.getServletContext().getRealPath("/resources/nupload/notice");
				
				boolean check = noticeService.deleteFile(attNo) != 0 ? true : false;
				
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
			@RequestMapping("/notice/fileDownload.do")
			   public void fileDownload(@RequestParam String oName,
			                        						  @RequestParam String rName,
			                        						  HttpServletRequest request,
			                        						  HttpServletResponse response){
			      
			      //파일저장디렉토리
			      String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/nupload/notice");   
			   
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
			               "attachment; filename=\"" + resFilename + "\"");

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









