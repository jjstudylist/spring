package com.erp.app.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.app.dao.NoticeDao;
import com.erp.app.dto.NoticeDTO;

@Service
public class NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	@Autowired
	private HttpServletRequest request;

	//공지사항 전체 글 select
	public List<NoticeDTO> selectNotice(NoticeDTO notice) {
		//System.out.println("cnt_serv"+notice.getCurPage());
		return noticeDao.selectNotice(notice);
	}
	
	//공지사항 전체 글 수 
	public int selectNoticeCnt(NoticeDTO notice) {
		return noticeDao.selectNoticeCnt(notice);
	}
	
	//상세 조회 페이지
	public NoticeDTO selectNoticeView(int no) {
		return noticeDao.selectNoticeView(no);
	}
	
	//조회수 업데이트
	public int updateCountView(NoticeDTO noticeView) {
		return noticeDao.updateCountView(noticeView);
	}
	

	//상세 조회 페이지 댓글 목록
	public List<NoticeDTO> selectnoticeReqView(int no) {
		return noticeDao.selectnoticeReqView(no);
	}
	
	//상세 페이지 댓글 추가
	public int insertNoticeReq(NoticeDTO notice) {
		return noticeDao.insertNoticeReq(notice);
	}
	
	//상세 페이지 댓글 삭제
	public int deleteNoticeReq(NoticeDTO notice) {
		return noticeDao.deleteNoticeReq(notice);
	}
	
	//공지사항 글 저장
	public int updateNoticeSave(NoticeDTO notice) {
		return noticeDao.updateNoticeSave(notice);
	}
	
}
