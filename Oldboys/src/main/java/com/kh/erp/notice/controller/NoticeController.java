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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.erp.common.util.Utils;


@Controller
public class NoticeController {
	
	@RequestMapping("/notice/noticeList")
	public String selectBoardList(
			@RequestParam(value="cPage", required=false, defaultValue="1")
			int cPage, Model model) {
		
		// 한 페이지 당 게시글 수
				int numPerPage = 10; // limit 역할
				
				// 1. 현재 페이지 게시글 목록 가져오기
				List<Map<String, String>> list
						= noticeService.selectBoardList(cPage, numPerPage);
				
				z/ 3. 페이지 HTML 생성
				String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "boardList.do");
				
				model.addAttribute("list", list)
					 .addAttribute("totalContents", totalContents)
					 .addAttribute("numPerPage", numPerPage)
					 .addAttribute("pageBar", pageBar);
				
				return "board/boardList";		
			}
	
	}

   }
