package com.erp.app.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erp.app.dto.NoticeDTO;
import com.erp.app.service.NoticeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	
	@RequestMapping("/notice")
	public String notice(NoticeDTO notice, @RequestParam(defaultValue="1") int curPage, Model model) {
		
		notice.setCurPage(curPage);	
		notice.setPrev(curPage - 1);
		notice.setNext(curPage + 1);
		int listCnt = noticeService.selectNoticeCnt(notice);
		List<NoticeDTO> list = noticeService.selectNotice(notice); 
		model.addAttribute("list", list);
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("notice", notice);
		return "notice";
	}
	
	//상세페이지
	@RequestMapping("/noticeView")
	public String noticeView(int no, Model model) {

		NoticeDTO noticeList=noticeService.selectNoticeView(no);
		noticeService.updateCountView(noticeList);
		noticeList.setView_count(noticeList.getView_count()+1);
		List<NoticeDTO> noticeReqList=noticeService.selectnoticeReqView(no);
		
		model.addAttribute("noticeView", noticeList);
		model.addAttribute("noticeReqView", noticeReqList);
		
		return "noticeView";
	}
	
	//공지사항 댓글 추가
	@RequestMapping("/noticeReqSend")
	@ResponseBody
	public List<NoticeDTO> noticeReqSend(NoticeDTO notice, Model model) {
		//System.out.println("noticeReq_cont"+ notice.getReq_contents());
		System.out.println("noticeReq_cont_Req_no"+ notice.getReply_no());
		System.out.println("noticeReq_cont_no"+ notice.getNo());
		noticeService.insertNoticeReq(notice);
		//List<NoticeDTO> noticeReqList=noticeService.selectnoticeReqView(notice.getNo());
		
		/*
		NoticeDTO noticeList=noticeService.selectNoticeView(no);
		noticeService.updateCountView(noticeList);
		noticeList.setView_count(noticeList.getView_count()+1);
		List<NoticeDTO> noticeReqList=noticeService.selectnoticeReqView(no);
		
		model.addAttribute("noticeView", noticeList);
		model.addAttribute("noticeReqView", noticeReqList);*/
		
		return noticeService.selectnoticeReqView(notice.getNo());
	}
	//공지사항 댓글 삭제	
	@RequestMapping("/noticeReqDelete")
	@ResponseBody
	public String noticeReqDelete(NoticeDTO notice, Model model) {
		System.out.println("noticeReq_cont_ReqNo"+ notice.getReply_no());
		//System.out.println("noticeReq_cont_Req_no"+ notice.getReply_no());
		noticeService.deleteNoticeReq(notice);
		//List<NoticeDTO> noticeReqList=noticeService.selectnoticeReqView(notice.getNo());
		
		
		return "noticeReqDelete";
	}
	
	//공지사항 글 삭제	
	@RequestMapping("/noticeDelete")
	public String noticeDelete(NoticeDTO notice, Model model) {
		//notice.setNo(no);
		//notice.setMember_no(member_no);
		
		System.out.println("noticeReq_cont_ReqNo"+ notice.getReply_no());
		//System.out.println("noticeReq_cont_Req_no"+ notice.getReply_no());
		noticeService.deleteNoticeReq(notice);
		//List<NoticeDTO> noticeReqList=noticeService.selectnoticeReqView(notice.getNo());
		
		
		return "noticeReqDelete";
	}
	
	//공지사항 글 수정시 화면
	@RequestMapping("/noticeEdit")
	public String noticeEdit(NoticeDTO notice, Model model) {
		System.out.println("noticeEdit_cont:"+notice.getRw());
		NoticeDTO noticeList=noticeService.selectNoticeView(notice.getNo());	
		if(notice.getRw()=="write") {
			noticeList.setRw(notice.getRw());			
		}
		model.addAttribute("noticeView", noticeList);
		return "noticeEdit";
	}
	
	//다중파일업로드
	@RequestMapping("/multiplePhotoUpload")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         //String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         String dftFilePath = "C:\\Users\\ljj\\git\\sod_study\\erp_app\\src\\main\\webapp\\resources";
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "resource" + File.separator + "photo_upload" + File.separator;
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// 서버에 파일쓰기 ///////////////// 
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+"/resources/photo_upload/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	//공지사항 글 save
	@RequestMapping("/noticeSave")
	public String noticeSave(NoticeDTO notice, Model model) {
		//System.out.println("write_cont:"+notice );
		System.out.println("write_cont: subject:"+notice.getSubject()+"contents:"+notice.getContents() );
		System.out.println("write_cont: member_no:"+notice.getMember_no()+"no:"+notice.getNo() );

		noticeService.updateNoticeSave(notice);
		NoticeDTO noticeList=noticeService.selectNoticeView(notice.getNo());
		model.addAttribute("noticeView", noticeList);
		
		return "redirect:/noticeView?no="+notice.getNo();
		

	}
}
